# Maintainer: Alain Kalker
pkgname=pacc-git
pkgver=0.0.47.g60d76a2
pkgrel=1
pkgdesc="A compiler-compiler"
arch=('i686' 'x86_64')
url="http://paccrat.org/"
license=('GPL')
depends=('glibc')
makedepends=('git' 'texinfo')
install=$pkgname.install
source=('git://paccrat.org/pacc')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-*}"

  make
  make doc
}

package() {
  cd "$srcdir/${pkgname%-*}"
  install -Dm755 pacc "${pkgdir}/usr/bin/pacc"
  install -Dm644 doc/pacc.info "${pkgdir}/usr/share/info/pacc.info"
  install -Dm644 doc/pacc.pdf "${pkgdir}/usr/share/doc/${pkgname}/pacc.pdf"
}

# vim:set ts=2 sw=2 et:
