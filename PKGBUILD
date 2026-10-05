# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=charls
pkgname="${_pkgname}"-git
pkgver=2.4.1.r181.g5eb2dde
pkgrel=1
pkgdesc='A C++ JPEG-LS library implementation'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/team-charls/charls'
license=('BSD-3-Clause')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/team-charls/charls.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --always | sed 's/-/.r/;s/-/./'
}

build() {
  rm -Rf build && mkdir -p build
  cd build
  cmake ../${_pkgname} -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -D -m644 ../${_pkgname}/LICENSE.md "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
