# Maintainer: Z. D. Smith <zd at zdsmith dot com>
pkgname=pantagruel
pkgver=0.16.0
pkgrel=1
pkgdesc='An Extremely Lightweight Specification Language'
arch=('x86_64')
url='https://github.com/subsetpark/pantagruel'
makedepends=('opam' 'ocaml>=4.14')
license=('BSD-3-Clause')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

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
