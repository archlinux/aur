# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=cppo
pkgver=1.6.0
pkgrel=2
pkgdesc="The C preprocessor written in OCaml"
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
depends=('glibc')
makedepends=('jbuilder' 'ocaml-findlib' 'ocamlbuild' 'clingo' 'python2')
url='http://mjambon.com/cppo.html'
source=("https://github.com/mjambon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('29cb0223adc1f0c4c5238d6c7bf8931b909505aed349fde398fbf1a39eaa1819')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  export OPAMROOT="${srcdir}/.opam"
  opam init -n
  mkdir -p "${pkgdir}/usr/bin" "$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  make install
  cd _build/install/default/bin
  install -m755 -t ${pkgdir}/usr/bin cppo
}
