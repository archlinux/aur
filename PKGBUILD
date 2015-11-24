# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
_pkgname=jload
pkgname=${_pkgname}-git
pkgver=r13.3235d1d
pkgrel=1
pkgdesc="Load average display for JWM"
arch=('i686' 'x86_64')
url="https://github.com/joewing/jload"
license=('unknown')
depends=('libx11')
makedepends=('git')
source=("git://github.com/joewing/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make install DESTDIR=$pkgdir
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
