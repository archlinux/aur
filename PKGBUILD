# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Your Name <youremail@domain.com>

pkgname=ocp-build
pkgver=1.99.9_beta
pkgrel=1
pkgdesc="A build system for OCaml applications"
arch=('i686' 'x86_64')
url="http://www.typerex.org/${pkgname}.html"
license=('GPL3')
depends=('ocaml')
source=("http://www.typerex.org/pub/${pkgname}/${pkgname}.${pkgver/_/-}.tar.gz" "destdir.patch")
md5sums=('756bfe6337160693ec52119b400a12c2'
         '5693506e95d1eff4decdbfaa8fa0e18f')

prepare() {
  cd "${srcdir}/${pkgname}.${pkgver/_/-}"

  patch -Np1 -i "$srcdir/destdir.patch"
}

build() {
  cd "${srcdir}/${pkgname}.${pkgver/_/-}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}.${pkgver/_/-}"

  make install DESTDIR="$pkgdir/"
}
