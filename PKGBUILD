# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: Artur Juraszek <artur@juraszek.xyz>

pkgname=dolt-bin
pkgver=0.75.9
pkgrel=1
pkgdesc='Git for data!'
arch=('x86_64' 'aarch64')
url='https://www.dolthub.com/'
license=('Apache')
conflicts=('dolt')
source=("LICENSE::https://raw.githubusercontent.com/dolthub/dolt/main/LICENSE"
		"README.md::https://raw.githubusercontent.com/dolthub/dolt/main/README.md")
source_x86_64=("dolt-linux-${pkgver}-amd64.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-amd64.tar.gz")
source_aarch64=("dolt-linux-${pkgver}-arm64.tar.gz::https://github.com/liquidata-inc/dolt/releases/download/v$pkgver/dolt-linux-arm64.tar.gz")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '642068afa02aeedfd9be10f5e3d17e6fc10a920663f860b931f48a5ec01710d6')
sha256sums_x86_64=('9fcff830e68e82e1b5a500d04a802f7ae34d571188dad3ba56cbba8b671112e1')
sha256sums_aarch64=('d60105b46771a8aa12379c3c10ef920072ffc73e49864b80774e2695bde4caf8')

package() {
	# Get arch
	if [ "$CARCH" = 'x86_64' ]
	then
		_arch='amd64'
	elif [ "$CARCH" = 'aarch64' ]
	then
		_arch='arm64'
	fi

	# Install binary
	install -D -t ${pkgdir}/usr/bin/ ${srcdir}/dolt-linux-${_arch}/bin/dolt

	# Install license
	install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE ${srcdir}/LICENSE

	# Install README
	install -Dm644 -t ${pkgdir}/usr/share/doc/${pkgname}/README.md ${srcdir}/README.md
}
