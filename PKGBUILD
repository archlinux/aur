# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=ocaml-record_builder
pkgver=0.15.0
pkgrel=1
pkgdesc="A library which provides traversal of records with an applicative."
arch=('i686' 'x86_64')
url="https://github.com/janestreet/record_builder"
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-ppx_jane' )
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/record_builder-v${pkgver}.tar.gz")
sha256sums=('8a6e30166999971ecca0d52db2f45ed83a81e0d99679cf0c4dd649ce89b21bb1')

build() {
  cd "${srcdir}/record_builder-v${pkgver}"
  dune build --release --verbose

}

package() {
  cd "${srcdir}/record_builder-v${pkgver}"
  DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --release --verbose

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
  rm -r "$pkgdir/usr/doc/"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
