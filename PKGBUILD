# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=alt-ergo
pkgver=1.01
pkgrel=1
pkgdesc='SMT solver for software verification'
arch=('i686' 'x86_64')
license=('custom:CeCILL-C')
url='https://alt-ergo.ocamlpro.com'
depends=('gtksourceview2' 'zarith')
makedepends=('lablgtk2')
source=("${pkgname}::https://alt-ergo.ocamlpro.com/download_manager.php?target=alt-ergo-${pkgver}.tar.gz")
sha256sums=('d51a9833acf265d475408cde04e9beb75f950355580b9c73292ffbfbebf280eb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure -prefix /usr
    make
    make gui
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    make DESTDIR="$pkgdir" install-gui
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et sw=4 sts=4 et:
