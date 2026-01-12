# Maintainer: 隠岐奈 <okinan@protonmail.com>
_basename='navcoin'
pkgname='navcoin-bin'
pkgver='7.0.3'
pkgrel='1'
pkgdesc="Privacy-oriented cryptocurrency and distributed computing platform - Official Binaries"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://navcoin.org/"
license=('MIT')
depends=('boost-libs' 'python')
# Fixes warnings and stops the creation of -debug packages
options=('!strip' '!debug')
install="${pkgname}.install"

source=("navcoin.desktop"
	"navcoind.service"
	"navcoin.png::https://raw.githubusercontent.com/navcoin/navcoin-core/master/share/pixmaps/navcoin128.png")

# Use 'updpkgsums' to generate these automatically
sha256sums=('1885c0577f19f819aafc56c7ea52f00a'
	'c67b248610947e2fd11489923eed7fa0'
	'SKIP')

source_x86_64=("https://github.com/NAVCoin/navcoin-core/releases/download/${pkgver}/${_basename}-${pkgver}-x86_64-linux-gnu.tar.gz")
sha256sums_x86_64=('923ec57088b9c87893112a6473919e83ec14d038287e076722d718b958c89423')

package() {
	# Binary installation
	install -Dm755 "${_basename}-${pkgver}/bin/navcoin-cli" "${pkgdir}/usr/bin/navcoin-cli"
	install -Dm755 "${_basename}-${pkgver}/bin/navcoind" "${pkgdir}/usr/bin/navcoind"
	install -Dm755 "${_basename}-${pkgver}/bin/navcoin-qt" "${pkgdir}/usr/bin/navcoin-qt"
	install -Dm755 "${_basename}-${pkgver}/bin/navcoin-tx" "${pkgdir}/usr/bin/navcoin-tx"

	# Systemd and Desktop files
	install -Dm644 "${srcdir}/navcoind.service" "${pkgdir}/usr/lib/systemd/system/navcoind.service"
	install -Dm644 "${srcdir}/navcoin.desktop" "${pkgdir}/usr/share/applications/navcoin.desktop"

	# Icon installation for the application menu
	install -Dm644 "${srcdir}/navcoin.png" "${pkgdir}/usr/share/pixmaps/navcoin.png"
}
