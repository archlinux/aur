# Maintainer: robertfoster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-dtools
pkgver=0.4.3
pkgrel=1
pkgdesc="OCaml modules for writing daemons"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-dtools"
license=('GPL2')
depends=('ocaml' 'ocaml-syslog')
makedepends=('dune')
options=('!strip')
source=("https://github.com/savonet/ocaml-dtools/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  dune build --release --verbose
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir 'lib/ocaml' --release --verbose

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  mv "$pkgdir/usr/doc/$_projectname/"* "$pkgdir/usr/share/doc/$pkgname/"
  rm -r "$pkgdir/usr/doc/"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sf "/usr/share/doc/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('14b86fb86a8059e071197832385262578f6a9792596ece52da8173b855e60dcd')
