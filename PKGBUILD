# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mathias Scherer <scherer.mat@gmail.com>
pkgname=echidna
pkgver=2.2.0
pkgrel=1
epoch=
pkgdesc="A Fast Smart Contract Fuzzer"
arch=('x86_64')
url="https://github.com/crytic/echidna"
license=('AGPL')
makedepends=('stack>=2.0.0'
	'cmake')
depends=('libsecp256k1'
	'python-pip')
source=("echidna-$pkgver.tar.gz::https://github.com/crytic/echidna/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('919a46d5820acdc26c119d2dc36b2abadb2383217a801ba07b1335aac1d07ee1')

build() {
	cd "./$pkgname-$pkgver"
	sh .github/scripts/install-libff.sh
	stack build --flag echidna:-static --extra-lib-dirs="$HOME/.local/lib/" --extra-include-dirs="$HOME/.local/include/"
}

package() {
	cd "./$pkgname-$pkgver"
	pip install slither-analyzer
	stack install --flag echidna:-static --extra-lib-dirs="$HOME/.local/lib/" --extra-include-dirs="$HOME/.local/include/"
}
