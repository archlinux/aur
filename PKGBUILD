pkgname=yupass
pkgver=0.1.1
pkgrel=4
pkgdesc="This is a password manager powered by the YubiKey"
url="https://github.com/StratusFearMe21/yupass"
license=('GPT-3')
arch=('any')
makedepends=(
	'rustup'
)
depends=(
	'gnupg'
	'zenity'
)
source=("${pkgname}.tar.gz::https://github.com/StratusFearMe21/yupass/archive/refs/tags/v${pkgver}.tar.gz")
conflicts=("${pkgname}" "${pkgname}-bin" "${pkgname}-git")

build() {
	rustup update stable
	cd "${srcdir}/yupass-${pkgver}/"
	cargo build --release
}

package() {
	cd "${srcdir}/yupass-${pkgver}/target/release/"
	install -d -m755 ${pkgdir}/usr/bin
	cp -r ./yupass ${pkgdir}/usr/bin/
}

sha256sums=('SKIP')
