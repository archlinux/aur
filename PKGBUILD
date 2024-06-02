# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=ocaml-grain_dypgen
_srcname=dypgen
pkgver=0.2
pkgrel=3
pkgdesc="Self-extensible parsers and lexers for OCaml"
arch=('x86_64')
url="https://github.com/grain-lang/dypgen"
license=('LicenseRef-oLicence_CeCILL-B_V1')
depends=('glibc' 'ocaml' 'perl')
makedepends=('ocaml' 'ocaml-findlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grain-lang/dypgen/archive/${pkgver}.tar.gz")
sha512sums=('b01044243d76550194ea1a9e93eb53f525ae9e88ef0a1d69c5c00ef7adf3791d88df72f8ccb47fe0966c54fc214ff8e54f3cdf34c7627ea10b3a1a64f2e683a0')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"

build() {
    cd "${srcdir}/${_srcname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_srcname}-${pkgver}"
    env DESTDIR="${pkgdir}" \
	OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
	make install

    install -Dm644 Licence_CeCILL-B_V1-en.txt "$pkgdir/usr/share/licenses/$pkgname/Licence_CeCILL-B_V1-en.txt"
    install -Dm644 Licence_CeCILL-B_V1-fr.txt "$pkgdir/usr/share/licenses/$pkgname/Licence_CeCILL-B_V1-fr.txt"
}
