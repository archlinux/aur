# Maintainer: Pando85 <pando855@gmail.com>
_pkgname=passless
pkgname="${_pkgname}-bin"
pkgver=0.0.4
pkgrel=1
pkgdesc="FIDO2 security token emulator"
arch=('x86_64' 'aarch64')
url="https://github.com/pando85/passless"
license=('GPL')
install=passless.install
depends=('gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/pando85/passless/releases/download/v${pkgver}/passless-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz"
        "passless-${pkgver}.tar.gz::https://github.com/pando85/passless/archive/refs/tags/v${pkgver}.tar.gz"
        "passless.install")
sha256sums=('31143ec67016de32c4bc8014f636f5b6bad3e5e02b5212771e2ff016d58a6d92'
            'SKIP'
            'SKIP')

package() {
	install -Dm755 passless "${pkgdir}/usr/bin/passless"
	install -Dm0644 "passless-${pkgver}/contrib/systemd/passless.service" \
		"${pkgdir}/usr/lib/systemd/user/passless.service"
	install -Dm0644 "passless-${pkgver}/contrib/udev/90-passless.rules" \
		"${pkgdir}/usr/lib/udev/rules.d/90-passless.rules"
	install -Dm0644 "passless-${pkgver}/contrib/sysusers.d/passless.conf" \
		"${pkgdir}/usr/lib/sysusers.d/passless.conf"
}
