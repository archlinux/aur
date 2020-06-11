# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-core_extended
pkgver=0.14.0
pkgrel=1
epoch=1
pkgdesc="Extra components that are not as closely vetted or as stable as Core"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/core_extended"
license=('Apache')
depends=('ocaml' 'ocaml-bin_prot' 'ocaml-core' 'ocaml-core_kernel' 'ocaml-fieldslib' 'ocaml-ppx_jane' 'ocaml-re2' 'ocaml-sexplib' 'ocaml-textutils' 'ocaml-migrate-parsetree' 'ocaml-ppxlib' 'ocaml-re')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/core_extended-v${pkgver}.tar.gz")
sha256sums=('a7bf672f617891b10e405f1edb1c2ddc1db9e5b3169bd278bbb75b84d57d23ce')

build() {
  cd "${srcdir}/core_extended-v${pkgver}"
  dune build --release --verbose

}

package() {
  cd "${srcdir}/core_extended-v${pkgver}"
  DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
  rm -r "$pkgdir/usr/doc/"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
