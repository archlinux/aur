# Maintainer: Jeff Henson <jeff@henson.io>
# Original PKGBUILD: GreyXor <greyxor@protonmail.com>

pkgname=framework-system
pkgver=0.4.0
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
b2sums=('1be1de11915f8888a6440fe3acdb10868bc637e0421f5e771827ed7ee61580a0f2ad36119a4067fee43052744b81c078559901e67fa3db54278348df3fb08fed')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release -p framework_tool
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/framework_tool"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE.md"
}
