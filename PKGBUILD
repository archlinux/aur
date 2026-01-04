# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
# Maintainer: ROllerozxa <temporaryemail4meh [gee mail]>
# Contributor: Ivy Foster <ivy.foster@gmail.com>

_pkgname='libutf8proc'
pkgname='libutf8proc-git'
pkgver=2.11.3.r0.ge5e7992
pkgrel=1
pkgdesc="C library for processing UTF-8 encoded Unicode strings"
arch=('i686' 'x86_64')
url="https://github.com/JuliaStrings/utf8proc"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake' 'ninja')
provides=('libutf8proc')
conflicts=('libutf8proc')
source=("git+https://github.com/JuliaStrings/utf8proc.git")
sha256sums=('SKIP')

pkgver() {
	cd utf8proc
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release -GNinja \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    -S utf8proc
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm64 utf8proc/README.md  "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm64 utf8proc/LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE.md"
}
