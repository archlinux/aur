# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=trottinett
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="A simple network interface manager"
arch=("x86_64")
url="https://code.ott.net/trottinett/"
license=("GPL")
groups=()
depends=("dhcpcd" "wpa_supplicant" "openrc")
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
source=("trottinett-${pkgver}.tar.gz::https://code.ott.net/trottinett/downloads/trottinett-${pkgver}.tar.gz")
sha256sums=("aaf34d3c4e2ebe8e04194c6e8d019893d82e68adab15f926d0b65f618c83863b")
noextract=()
md5sums=()
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	mkdir -p ${pkgdir}/etc/init.d/
	cp -f ${startdir}/trottinett.init ${pkgdir}/etc/init.d/trottinett

	mkdir -p ${pkgdir}/etc/conf.d/
	cp -f ${startdir}/trottinett.conf ${pkgdir}/etc/conf.d/trottinett

	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
