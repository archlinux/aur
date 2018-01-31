# Maintainer: Clay Hobbs <clay@lakeserv.net>
pkgname=ibm_capsense_usb_util
pkgver=0.9.0
pkgrel=2
pkgdesc="Graphical utility for configuring xwhatsit capsense keyboard controllers"
arch=('x86_64')
url="http://downloads.cornall.co/ibm-capsense-usb-web/ibm-capsense-usb.html"
license=('GPL3')
groups=()
depends=('qt5-base' 'hidapi')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.cornall.co/ibm-capsense-usb/${pkgver}/ibm-capsense-usb_${pkgver}.tar.gz"
	"82-ibm-capsense-usb.rules"
	"$pkgname.desktop"
	"$pkgname-$pkgver.patch")
noextract=()
sha512sums=("e19070c22437096e05310f474666000d6f61eea09242133b30d474000e00d8a4c7d0178f63f2d8b979f8971461e15384c80c676db811652d8363ea8c335d6bc8"
	"d8062f4734ded9aa05d843b14d2a4305715c00cac82b2e168bd7ac4c4641ca7fa9d2fd953700fcbe194563ef8e026a5d1c4519b92f267187260f72ccb9f09820"
	"9409d9b12a97b82791771546fb210c7d09142133d20e75086c39ba083c0822549eed5743cb3ed3f5615e962c58b840fefb7e5a192b7310b0c72cca2606304686"
	"af1de637c32dd7c3577e3f92f5e1209c80d4f71a774ceb0f79eff0918c97703f879241e2a8619ab1fb5ec28d69e7bb9218022ce51dbcf32547fc583a48d76560")

prepare() {
	cd "ibm-capsense-usb_$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "ibm-capsense-usb_$pkgver/src/util"
	qmake
	make
}

package() {
	cd "ibm-capsense-usb_$pkgver"
	install -m 755 -p -D "src/util/src/$pkgname" "$pkgdir/usr/bin/$pkgname"
	cd "$srcdir"
	install -m 644 -p -D "82-ibm-capsense-usb.rules" "$pkgdir/usr/lib/udev/rules.d/82-ibm-capsense-usb.rules"
	install -m 644 -p -D "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
