# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=echidna-bin
pkgver=2.3.3
pkgrel=1
pkgdesc='A fast smart contract fuzzer (precompiled binary)'
arch=('x86_64')
url='https://github.com/crytic/echidna'
license=('AGPL-3.0-only')
depends=()
optdepends=('slither: Solidity source compilation and static analysis')
provides=('echidna')
conflicts=('echidna')
options=('!debug')

latestver() {
	gh api repos/crytic/echidna/releases/latest --jq '.tag_name' | sed 's/^v//'
}

source=(
	"echidna-${pkgver}-x86_64-linux.tar.gz::https://github.com/crytic/echidna/releases/download/v${pkgver}/echidna-${pkgver}-x86_64-linux.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/crytic/echidna/v${pkgver}/LICENSE"
)
sha256sums=('436d26cb5af34c6c525812b857ac53f218c7f6ad07d69495ef88bc4cdc85c764'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')

package() {
	install -Dm755 "${srcdir}/echidna" "${pkgdir}/usr/bin/echidna"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
