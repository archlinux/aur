# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=simonmichael
_pkgname=quickbench
pkgname=${_pkgname}
pkgver=1.0.1
pkgrel=1
pkgdesc="Quick and easy benchmarking of command-line programs"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')
depends=('gmp' 'glibc')
makedepends=('ghc' 'stack')
options=(!debug !lto)

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('0b6050bcd920961d3039ca6ea41a562c0e922a2d8f323867fc13cce2138e9e5d')

build() {
	cd ${pkgname}-${pkgver}

	make docs

	stack --verbosity error --system-ghc --local-bin-path "./bin/" install
}

package() {
	cd ${pkgname}-${pkgver}

	install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin"

	install -Dm755 "${pkgname}.1" -t "$pkgdir/usr/share/man/man1"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
