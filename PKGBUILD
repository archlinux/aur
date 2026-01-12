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
sha256sums=('eb48ac60ac2e116cc9f6f9bc3059b89cf90b29ca815bba3ce3af75330bd39372'
            '648b4fa86e7d435814e844a57bf2b29b61a994d7bb4e36cde207e29520f7d9d2'
            '6950b9922e570188f5a84ce38c33cfa04f14212f3bc88bc40d49eca2e37a88cc')
sha256sums_x86_64=('ba4dffd7bd374eed5bdcc19bb4d25fac09d62ac65d8b56ffc53d30cb1264f21d')

source_x86_64=("https://github.com/NAVCoin/navcoin-core/releases/download/${pkgver}/${_basename}-${pkgver}-x86_64-linux-gnu.tar.gz")

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
