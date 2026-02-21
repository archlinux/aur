# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=pantagruel
pkgver=0.20.0
pkgrel=1
pkgdesc='A language for writing and checking precise descriptions of things.'
arch=('x86_64')
url='https://github.com/subsetpark/pantagruel'
makedepends=('opam' 'ocaml>=4.14')
license=('BSD-3-Clause')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('512c41563e9b1c944fb7cbd4ec550f4d3a18e8d1875807587a60261f0c9b4dea')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export OPAMROOT="$srcdir/opam"
	opam init --bare --no-setup --disable-sandboxing
	opam switch create . --deps-only --locked=false -y
	eval $(opam env)
	dune build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "_build/default/bin/main.exe" "${pkgdir}/usr/bin/pant"
}
