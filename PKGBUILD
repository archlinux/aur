# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=trottinett
pkgver=0.2.2
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
sha256sums=("7949c6574d41b05dc217b6787d17968264d4d73d313531b4f70b9311d5694bfd")
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
