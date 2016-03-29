# Maintainer: Leonard de Ruijter <alderuijter@gmail.com>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=cppo
pkgver=1.3.1
pkgrel=1
pkgdesc="The C preprocessor written in OCaml"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('ocaml-findlib')
url='http://mjambon.com/cppo.html'
source=("https://github.com/mjambon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('2e3e658b0ba24d7217c59e76df3e92d4e03866143da8d206b3267cebccfefc69')
build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p "${pkgdir}/usr/bin" "$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  make install BINDIR="${pkgdir}/usr/bin"
}
