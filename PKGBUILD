# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=libcrossguid-git
pkgver=0.2.1.r1.g71c709e
pkgrel=1
pkgdesc="Lightweight cross platform C++ GUID/UUID library"
arch=('i686' 'x86_64')
url="https://github.com/graeme-hill/crossguid"
license=('MIT')
makedepends=('git' 'cmake')
provides=('libcrossguid')
conflicts=('libcrossguid')
source=('libcrossguid::git+https://github.com/graeme-hill/crossguid.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/libcrossguid
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/libcrossguid
  cmake .
  make

}

check(){
  cd "$srcdir"/libcrossguid
  ./xgtest
}

package() {
  cd "$srcdir"/libcrossguid
  install -D -m644 libxg.a "${pkgdir}/usr/lib/libxg.a"
  install -D -m644 Guid.hpp "${pkgdir}/usr/include/Guid.hpp"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
