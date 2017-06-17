# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=arcueid
pkgname=${_pkgname}-git
pkgver=0.1.2.r413.gb71408e4
pkgrel=1
pkgdesc="A C interpreter for Paul Graham's Arc dialect of Lisp. (GIT version)"
arch=('x86_64' 'i686')
url="https://arcueid-arc.org"
license=('GPL3')
depends=('gmp')
makedepends=('git')
optdepends=('readline')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/dido/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long | sed -e 's/v//;s/-/.r/;s/-/./'
}

build() {
  cd ${_pkgname}
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}
  install -D -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
