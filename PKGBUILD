pkgname=mqttui-bin
pkgver=0.20.0
pkgrel=2
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname/-bin/}"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")

source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('8e4212f9e8e4ec8a469c6d8edaa3f58c6ae4ffbc3efaf13461b4c0add9bc15d9')
sha256sums_aarch64=('2aacdada28394f1994485e901789a6b2cb30a108276a1618f745e2210e5924ab')
sha256sums_armv6h=('e5bdd80b582606d236bf63ed3fef4bcdb9ebc51038818d80f806b15b7e896b8d')
sha256sums_armv7h=('b99d861a3e0006ba2ea93e7b1819f16585ffff5e3b0584c48002413a9c303fdb')

package() {
	install -Dm755 "${pkgname/-bin/}" -t "${pkgdir}/usr/bin/"
	install -Dm644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname/-bin/}/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname/-bin/}/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname/-bin/}/"

	install -Dm644 "completions/${pkgname/-bin/}.bash" -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm644 "completions/${pkgname/-bin/}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -Dm644 "completions/_${pkgname/-bin/}" -t "${pkgdir}/usr/share/zsh/site-functions/"

	for man in manpages/*; do
		install -Dm644 "$man" -t "${pkgdir}/usr/share/man/man1/"
	done
}
