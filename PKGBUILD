# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-dtools
pkgver=0.4.2
pkgrel=1
pkgdesc="OCaml modules for writing daemons"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-dtools"
license=('GPL2')
depends=('ocaml' 'ocaml-syslog')
makedepends=('ocaml-findlib')
options=('!strip')
source=("${pkgname}-${pkgver}::https://github.com/savonet/ocaml-dtools/archive/${pkgver}.tar.gz")
sha256sums=('9ddbef6b8e3c90f2339c81831de7c4ee70308846d72007e5e10ac97941e10c7d')

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
