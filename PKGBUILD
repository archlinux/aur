# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ttl2c
pkgname="${_pkgname}-git"
pkgver=1.0.0.r3.d832ab8
pkgrel=1
epoch=1
pkgdesc="Turtle to header conversion utility for LV2 Plugin developers "
arch=('i686' 'x86_64')
url="https://github.com/lvtk/ttl2c"
license=('GPL3')
depends=('boost-libs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/lvtk/ttl2c.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  echo $(git describe --tags).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"

  export LDFLAGS="-lboost_system"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
