# Maintainer: Stefan Ott <stefan@ott.net>
pkgname=trottinett
pkgver=0.2.0
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
sha256sums=("11f772927874c0cbdce2f1ad7d0eb8b0e084d1fb3bc0884aee011e4a05448dd7")
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
