# Maintainer: strandzen <strandzen@gmail.com>
# SPDX-License-Identifier: CC0-1.0

pkgname=kwiklook
pkgver=0.9.0
pkgrel=1
pkgdesc='Quick previews of files from Dolphin'
arch=('x86_64')
url='https://github.com/strandzen/KwikLook'
license=('GPL-2.0-or-later' 'GPL-3.0-or-later')  # the Dolphin integration: GPL-3.0-or-later
depends=(
  'dolphin'
  'gcc-libs'
  'glibc'
  'kconfig'
  'kcrash'
  'kcoreaddons'
  'kfilemetadata'
  'ki18n'
  'kio'
  'kirigami'
  'kirigami-addons'
  'kservice'
  'kwindowsystem'
  'libarchive'  # kwiklook-archive: what's inside archives
  'purpose'
  'qt6-base'
  'qt6-declarative'
  'qt6-multimedia'
  'qt6-multimedia-ffmpeg'  # its playback backend
  'qt6-svg'  # SVG pictures
  'qt6-webengine'  # QtQuick.Pdf
  'qqc2-desktop-style'  # the KDE look for its controls
  'syntax-highlighting'
  'libseccomp'  # kwiklook-sandbox
)
optdepends=(
  'libreoffice: previews of office documents'
  'kimageformats: camera RAW photos, AVIF, HEIC, JPEG XL and more'
  'kcontacts: contacts (.vcf) shown as cards'
  'kcalendarcore: calendar files (.ics) shown as cards'
)
makedepends=('cmake' 'extra-cmake-modules' 'kcontacts' 'kcalendarcore')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# After pushing a new tag: updpkgsums, then makepkg --printsrcinfo > .SRCINFO
sha256sums=('3d71efeb3498f3417594a2d08b06acc3a8976d5b6939416e42a10c297011ebbc')

build() {
  cmake -B build -S "KwikLook-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
