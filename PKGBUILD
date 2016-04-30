# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=cppo
pkgver=1.3.2
pkgrel=1
pkgdesc="The C preprocessor written in OCaml"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('ocaml-findlib')
url='http://mjambon.com/cppo.html'
source=("https://github.com/mjambon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c49e3080b3326466c7ddd97100c63bd568301802b3e48cebea3406e1ca76ebc8')
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
