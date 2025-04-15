# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Thorsten Wißmann <edu@thorsten-wissmann.de>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Paolo Herms
# Contributor: Magnus Therning <magnus@therning.org>
# Contributor: Jose Neder <jlneder(at)gmail(dot)com>

_srcname=ocamlgraph
pkgname=ocaml-$_srcname
pkgver=2.2.0
pkgrel=1
pkgdesc="Graph library for OCaml"
arch=('x86_64')
url="https://github.com/backtracking/ocamlgraph"
license=('LGPL-2.1-only')
depends=('glibc' 'ocaml-stdlib-shims' 'ocaml>=4.08.0')
makedepends=('dune>=2.0' 'ocaml>=4.08.0')
checkdepends=('ocaml-graphics')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('25062ebd7ff6bffb2dbcc003fec0e23c90ecddbc2da0235124c81cbc05391debc363855612532af55a93313d4cea0ea2a76eec64534a0cc0d4dfcc4d567f2e5a')

check() {
    cd "$srcdir/$_srcname-$pkgver"
    dune runtest --release
}

build() {
    cd "$srcdir/$_srcname-$pkgver"
    dune build -p $_srcname
}

package() {
    cd "$srcdir/ocamlgraph-$pkgver"

    DESTDIR="${pkgdir}" dune install \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc" \
	   -p ${_srcname}

    mv $pkgdir/usr/share/doc/$_srcname $pkgdir/usr/share/doc/$pkgname
}
