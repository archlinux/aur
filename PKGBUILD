# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ttl2c
pkgname="${_pkgname}-git"
pkgver=1.0.0.r3.d832ab8
pkgrel=2
epoch=1
pkgdesc="Turtle to header conversion utility for LV2 Plugin developers "
arch=('i686' 'x86_64')
url="https://github.com/lvtk/ttl2c"
license=('GPL3')
depends=('boost-libs')
makedepends=('python2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/lvtk/ttl2c.git"
        'wscript-disable-check.diff')
md5sums=('SKIP'
         '1203e5270aafad77868aa740b74f7481')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  echo $(git describe --tags).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p0 -i "$srcdir/wscript-disable-check.diff"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python2 waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
