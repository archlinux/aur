# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
pkgname=alt-ergo
pkgver=2.3.0
pkgrel=2
pkgdesc='SMT solver for software verification'
arch=('x86_64')
license=('custom:CeCILL-C')
url='https://alt-ergo.ocamlpro.com'
depends=('gtksourceview2' 'ocaml-zarith' 'ocaml-zip' 'ocaml-num' 'ocaml-menhir'
         'ocaml-ocplib-simplex' 'ocaml-psmt2-frontend')
makedepends=('lablgtk2' 'dune')
source=("https://github.com/OCamlPro/alt-ergo/archive/$pkgver.tar.gz"
        "non_fatal_warnings.patch")
sha256sums=('8bcb71bc7568658799d49ca595f793cb576534fe87752739f6ec1c215a292e5b'
            'c09353c7d125135e9d451fa55d087dc4c92eadeb280cd56926723673a02a5e84')

prepare() {
    cd "$pkgname-$pkgver"/sources

    # Make deprecation warnings for Pervasives non-fatal
    # https://github.com/ocaml/dune/issues/1465
    patch -p0 < "$srcdir"/non_fatal_warnings.patch
}

build() {
    cd "$pkgname-$pkgver"/sources

    ./configure --prefix=/usr
    make
    make gui
}

package() {
    cd "$pkgname-$pkgver"/sources

    make DESTDIR="$pkgdir" install
    make DESTDIR="$pkgdir" install-gui
}

# vim:set et sw=4 sts=4 et:
