# Maintainer: 隠岐奈 <okinan@protonmail.com>
_basename='navcoin'
pkgname='navcoin-bin'
pkgver='4.1.1'
pkgrel='1'
pkgdesc="Privacy-oriented cryptocurrency and distributed computing platform - Developer-provided binary"
arch=('x86_64')
url="https://navcoin.org/"
license=('MIT')
depends=('boost' 'python')
optdepends=('miniupnpc: Firewall-jumping support'
			'db4.8: Wallet storage'
			'qt5-base: GUI toolkit'
			'protobuf: Data interchange format used for payment protocol'
			'qrencode: Generate QR codes'
			'zeromq: Generate ZMQ notifications')
provides=('navcoin-bin')
conflicts=('navcoin' 'navcoin-git')
source=("https://github.com/NAVCoin/navcoin-core/releases/download/${pkgver}/${_basename}-${pkgver}-${arch}-linux-gnu.tar.gz"
		"navcoin.desktop"
		"navcoind.service")
md5sums=('5359312e753cbd21ae9a04858599a272'
         '1885c0577f19f819aafc56c7ea52f00a'
         'c67b248610947e2fd11489923eed7fa0')

package() {
	install -Dm755 "${_basename}-${pkgver}/bin/navcoin-cli" "${pkgdir}/usr/bin/navcoin-cli"
	install -Dm755 "${_basename}-${pkgver}/bin/navcoind" "${pkgdir}/usr/bin/navcoind"
	install -Dm755 "${_basename}-${pkgver}/bin/navcoin-qt" "${pkgdir}/usr/bin/navcoin-qt"
	install -Dm755 "${_basename}-${pkgver}/bin/navcoin-tx" "${pkgdir}/usr/bin/navcoin-tx"
	
	install -Dm644 "${srcdir}/navcoind.service" "${pkgdir}/usr/lib/systemd/system/navcoind.service"
	install -Dm644 "${srcdir}/navcoin.desktop" "${pkgdir}/usr/share/applications/navcoin.desktop"
}
