# Maintainer: Tiago Silva <tiagolsilva14 at gmail dot com>
#
# Before each release:
#  - tag v$pkgver upstream and push the tag
#  - run `updpkgsums` to fill sha256sums
#  - regenerate .SRCINFO: makepkg --printsrcinfo > .SRCINFO
pkgname=mcu-studio
pkgver=1.2.0
pkgrel=1
pkgdesc="Repair damaged JPEGs by editing their DCT coefficients directly, with an MCU-level editor"
arch=('x86_64')
_repo_url="https://github.com/TheGameratorT/mcu-studio"
url="$_repo_url"
license=('GPL-3.0-only')
# jpegrepair is vendored and built into the app, so it is not a runtime
# dependency; libjpeg-turbo provides the system libjpeg the app links.
depends=('qt6-base' 'libjpeg-turbo')
makedepends=('cmake' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::$_repo_url/archive/v$pkgver.tar.gz")
sha256sums=('1c3c251030057b757a0c13080dbf92e18cf4c3e686e798fa287ced31961bef8f')
_srcdir="$pkgname-$pkgver"

build() {
    cmake -B build -S "$_srcdir" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
