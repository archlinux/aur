# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=swayidle
pkgver=1.2
pkgrel=1
license=("MIT")
pkgdesc="Idle management daemon for Wayland"
makedepends=("meson" "git" "scdoc" "wayland-protocols")
depends=("wayland")
arch=("i686" "x86_64")
url="https://swaywm.org"
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/swaywm/swayidle/archive/${pkgver}.tar.gz"
	"https://github.com/swaywm/swayidle/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig"
)
sha256sums=('d65533d6f1fd9b105fa3e2c26d593e12fbfb5b24f48af446707d605cd817c758'
            'SKIP')
validpgpkeys=("9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A") # Drew DeVault

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson -Dwerror=false --prefix /usr "$srcdir/build"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	ninja -C "$srcdir/build"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir/" ninja -C "$srcdir/build" install
}
