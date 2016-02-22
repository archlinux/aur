# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>

pkgname=piratescope-git
_pkgname=PirateScope
pkgver=r30.e6d10c7
pkgrel=1
pkgdesc='A simple oscilloscope client for the Bus Pirate universal serial interface.'
arch=(any)
url='https://github.com/tgvaughan/PirateScope'
license=(GPL3)
depends=(wxpython2.8 python2-numpy python2-numarray)
makedepends=(python2-setuptools git)
source=(git://github.com/tgvaughan/PirateScope.git select_wx_2.8.patch)
md5sums=(SKIP d37f1e8c8c054f7120958dd282975dd3)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  patch -p1 < ../select_wx_2.8.patch
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m 755 "${_pkgname}" "${pkgdir}/usr/bin/piratescope"
}
