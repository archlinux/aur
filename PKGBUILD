# Maintainer: Jeff Henson <jeff@henson.io>
# Original PKGBUILD: GreyXor <greyxor@protonmail.com>

pkgname=framework-system
pkgver=0.4.1
pkgrel=1
arch=('x86_64')
pkgdesc='Tool to interact with the framework system'
url='https://frame.work'
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
source=("https://github.com/FrameworkComputer/framework-system/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('18bb5a42a31f7a30b86d98c51e57f9b74ed6bd500f3c8fdbbbb210accc9644a76f6cd965d38b0c7cd49b4c11617269a09797271bd811135a5b8870995c4b59fa')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release -p framework_tool
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/framework_tool"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE.md"
}
