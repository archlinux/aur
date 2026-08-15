# Maintainer: joji.doi+git@gmail.com
# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2024-2026 do-i and thumbgrid contributors
# PKGBUILD template for thumbgrid-bin: installs the prebuilt full-featured
# package (Qt6 / Exiv2 / OpenCV / mpv) uploaded to the GitHub release by
# .github/workflows/arch-package.yml. No local compilation.
#
# scripts/publish-aur.sh replaces the @...@ fields in a temporary AUR clone,
# generates .SRCINFO there, and pushes both concrete files to AUR. Release
# versions and checksums deliberately do not live in this source repository.

pkgname=thumbgrid-bin
pkgver=2026.8.1
pkgrel=1
# pkgrel of the upstream thumbgrid release asset being repackaged.
_srcrel=1
pkgdesc="Qt image viewer (fork of easymodo/qimgv), prebuilt binary release (exiv2/opencv/mpv)"
arch=('x86_64')
url="https://github.com/do-i/thumbgrid"
license=('GPL-3.0-only')
depends=(
  'qt6-base'
  'qt6-svg'
  'qt6-imageformats'
  'exiv2'
  'opencv'
  'mpv'
)
provides=('thumbgrid')
conflicts=('thumbgrid')
options=('!strip' '!debug')
source=("thumbgrid-$pkgver-$_srcrel-x86_64.pkg.tar.zst::https://github.com/do-i/thumbgrid/releases/download/v$pkgver/thumbgrid-$pkgver-$_srcrel-x86_64.pkg.tar.zst")
sha256sums=('a41217b0506e9cb5a78318cdf35ff949d9ff84aa9249b8e7a3c78e23cf227a23')

package() {
  # The download is itself a complete pacman package; unpack it as-is and
  # drop the upstream package's own metadata so makepkg can generate ours.
  bsdtar -xf "$srcdir/thumbgrid-$pkgver-$_srcrel-x86_64.pkg.tar.zst" -C "$pkgdir" \
    --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
