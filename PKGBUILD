# Maintainer:  Javier Ruere <first name dot last name at gmail>
pkgname=('shncpd-git')
_pkgname=shncpd
pkgver=141
pkgrel=2
pkgdesc='implementation of the Home Networking Control Protocol (HNCP) and associated protocols'
url='https://github.com/jech/shncpd'
arch=('i686' 'x86_64')
license=('MIT')
depends=('babeld')
makedepends=()
source=("git+https://github.com/jech/shncpd.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

build() {
  cd "$srcdir/${_pkgname}/"
  make PREFIX="/usr" CDEBUGFLAGS="$CFLAGS"
}

package() {
  conflicts=()
  provides=('shncpd')

  install -D -m644 "$srcdir/${_pkgname}"/LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m554 "$srcdir/${_pkgname}"/shncpd-script.sh "${pkgdir}/usr/lib/shncpd/shncpd-script.sh"
  install -d "${pkgdir}"/usr/{bin,share/man}
  cd "$srcdir/${_pkgname}"
  make install TARGET="${pkgdir}" PREFIX="/usr"
}
