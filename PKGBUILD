# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=boost-sml-git
pkgver=v1.0.1.r314.gdd2464f
pkgrel=1
pkgdesc="Your scalable C++14 header State Machine Library with no dependencies"
arch=('i686' 'x86_64')
url="http://boost-experimental.github.io/sml/index.html"
license=('Boost')
depends=(gcc-libs)
makedepends=('make')

source=("${pkgname}::git+https://github.com/boost-experimental/sml.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p ${pkgdir}/usr/include/
  cp -r ${srcdir}/${pkgname}/include/* ${pkgdir}/usr/include/
  chmod 755 ${pkgdir}/usr/include/
}
