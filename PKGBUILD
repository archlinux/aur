# Maintainer: Jeff Henson <jeff@henson.io>
# Original PKGBUILD: GreyXor <greyxor@protonmail.com>

pkgname=framework-system
pkgver=0.4.2
pkgrel=1
arch=('x86_64')
pkgdesc='Tool to interact with the framework system'
url='https://github.com/FrameworkComputer/framework-system'
license=('MIT')
depends=(
	"libusb"
	"gcc-libs"
	"glibc"
	"systemd-libs"
)
makedepends=(
	"git"
	"cargo"
	"pkg-config"
)
OPTIONS=(!lto)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('fbdc282a544283cec776d4ee997cdd776d2d42849870dbbd8986365cdc987bce8aa06866485771a6e93acb13d14886a015c459971b1cd593aeb6a25802056250')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release -p framework_tool
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/framework_tool"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE.md"
}
