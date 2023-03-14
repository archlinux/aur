# Maintainer: Marcin Serwin <marcin.serwin0@protonmail.com>
pkgname=diohsc
pkgver=0.1.12
pkgrel=1
pkgdesc="Line-based command-oriented interactive client for the gemini protocol."
arch=('x86_64')
url="https://mbays.sdf.org/diohsc/"
license=('GPL3')
depends=('haskell-terminal-size' 'haskell-terminal-size' 'haskell-random' 'haskell-regex-posix' 'haskell-network-uri' 'haskell-network' 'haskell-async')
makedepends=('ghc' 'cabal-install')
source=("https://mbays.sdf.org/diohsc/$pkgname-$pkgver-src.tgz")
sha512sums=('34b5294ef688d535acbfb882348cf41ec642860ee113509a726c6e3c84ed724dae251252813e56cccc50423b0b1a64d915defd7db5efd164374db1b884021c6a')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p target
	cabal update
}

build() {
	cd "$pkgname-$pkgver"
	cabal install --ghc-options=-dynamic --installdir=target --install-method=copy --overwrite-policy=always
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/diohsc "$pkgdir/usr/bin/diohsc"
	install -Dm644 diohscrc.sample "$pkgdir/usr/share/diohsc/diohscrc.sample"
}

