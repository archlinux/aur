# Maintainer: joji.doi+git@gmail.com
# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2024-2026 do-i and thumbgrid contributors
# PKGBUILD for thumbgrid-bin: installs the prebuilt full-featured package
# (Qt6 / Exiv2 / OpenCV / mpv) already built and uploaded to the GitHub
# release by .github/workflows/arch-package.yml. No local compilation.
#
# pkgver and sha256sums are bumped by CI on every tag push (see
# .github/workflows/arch-package.yml) before pushing to the AUR repo; the
# values below are simply the last release published at edit time.

pkgname=thumbgrid-bin
pkgver=2026.7.12
pkgrel=1
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
source=("thumbgrid-$pkgver-x86_64.pkg.tar.zst::https://github.com/do-i/thumbgrid/releases/download/v$pkgver/thumbgrid-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('972d187abea7df9109d4c98916896ad73e2718759216d622dadd455f4dafc977')

package() {
  # The download is itself a complete pacman package; unpack it as-is and
  # drop the upstream package's own metadata so makepkg can generate ours.
  bsdtar -xf "$srcdir/thumbgrid-$pkgver-x86_64.pkg.tar.zst" -C "$pkgdir" \
    --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
