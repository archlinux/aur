# Contributor: oliver <at> first . in - berlin . de

pkgname=ocaml-xml-light
pkgver=2.5
pkgrel=1
license=('LGPL')
arch=('i686' 'x86_64')
pkgdesc="Objective Caml lightweight xml parser"
url="http://tech.motion-twin.com/xmllight.html"
depends=('ocaml')
makedepends=('dune')
options=('!strip' '!makeflags' 'staticlibs')
source=("https://github.com/ncannasse/xml-light/releases/download/${pkgver}/xml-light-${pkgver}.tbz"
        "META")
md5sums=('b15b3ddfc73159052e9cd734290d10bd'
         'ad22cde4d3a944673d3b0a25a1e835dc')

build() {
cd ${srcdir}/xml-light-${pkgver}
OCAMLPATH=/usr/lib/ocaml dune build --release
}

package() {
cd ${srcdir}/xml-light-${pkgver}
DESTDIR="$pkgdir" dune install --prefix '/usr' --libdir '/usr/lib/ocaml' --release
install -dm755 "$pkgdir/usr/share/doc/$pkgname"
mv "$pkgdir/usr/doc/xml-light/"* "$pkgdir/usr/share/doc/$pkgname/"
rm -r "$pkgdir/usr/doc/"
install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
ln -sf "/usr/share/doc/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
