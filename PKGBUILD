# Maintainer: Josh McGee <josh.s.mcgee@gmail.com>
# Contributor: Earnestly <zibeon@gmail.com>

pkgname=shellcheck
pkgver=0.3.7
pkgrel=1
pkgdesc="A shell script static analysis tool: Stable Release"
arch=(i686 x86_64)
url=http://www.shellcheck.net/
license=('AGPL3')
depends=('gmp')
makedepends=('ghc'
             'haskell-json'
	     'haskell-mtl'
	     'haskell-parsec'
	     'haskell-quickcheck'
	     'haskell-regex-tdfa')
source=("https://github.com/koalaman/shellcheck/archive/v$pkgver.tar.gz")
md5sums=('f3c1fb82dbb02d79cb6f17e1623b5712')

prepare() {
	cd "$pkgname-$pkgver"
	runhaskell Setup configure --prefix=/usr --docdir="/usr/share/doc/${pkgname}" -O
}

build() {
	cd "$pkgname-$pkgver"
	export LANG=en_US.UTF-8
	runhaskell Setup -v build
}

package() {
	cd "$pkgname-$pkgver"
	runhaskell Setup copy --destdir="${pkgdir}"
}
