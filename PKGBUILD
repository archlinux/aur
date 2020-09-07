# Maintainer: Bruce Zhang
pkgname=wifite2
pkgver=2.2.5
pkgrel=1
pkgdesc="Rewrite of the popular wireless network auditor, \"wifite\""
arch=('x86_64' 'i686')
url="https://github.com/derv82/wifite2"
license=('GPL')
depends=('python' 'wireless_tools' 'net-tools' 'aircrack-ng')
optdepends=(
	'wireshark-cli: For detecting WPS networks and inspecting handshake capture files'
	'reaver: For WPS Pixie-Dust & brute-force attacks'
	'bully: For WPS Pixie-Dust & brute-force attacks'
	'cowpatty: For detecting handshake captures'
	'pyrit: For detecting handshake captures'
	'hashcat: For cracking PMKID hashes'
)
provides=('wifite')
conflicts=('wifite')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/derv82/wifite2/archive/$pkgver.tar.gz")
sha256sums=('3ca7c04502dd153047b71f9ffb24b2e91687a1b597b70d2c2790faebddf1b04b')

build() {
	cd "$pkgname-$pkgver"
	LANG=en_US.UTF-8 python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	LANG=en_US.UTF-8 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	# Move sbin/wifite to bin/wifite
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
