# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_extended
pkgver=0.15.0
pkgrel=2
epoch=1
pkgdesc="Extra components that are not as closely vetted or as stable as Core"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/core_extended"
license=('Apache')
depends=('ocaml' 'ocaml-bin_prot' 'ocaml-core' 'ocaml-core_unix' 'ocaml-fieldslib' 'ocaml-ppx_jane' 'ocaml-re2' 'ocaml-sexplib' 'ocaml-textutils' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-re' 'ocaml-record_builder')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/core_extended-v${pkgver}.tar.gz")
sha256sums=('875fcea0352c10e3ae6e96ddd86136ffd8e24cb19e56193463aa22c292c737d5')

build() {
  cd "${srcdir}/core_extended-v${pkgver}"
  dune build --release --verbose

}

package() {
  cd "${srcdir}/core_extended-v${pkgver}"
  DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --release --verbose

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
  rm -r "$pkgdir/usr/doc/"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
