# Maintainer: Maxim Devaev <mdevaev@gmail.com>

pkgname="yakuake-samedir"
pkgver="3.0.4"
pkgrel="1"
pkgdesc="Yakuake with 'Open in same dir' feature"
arch=("i686" "x86_64")
url="http://yakuake.kde.org/"
license=("GPL")
depends=("konsole" "knewstuff" "kwayland" "hicolor-icon-theme")
makedepends=("extra-cmake-modules" "python")
conflicts=("yakuake")
source=(
	"https://download.kde.org/stable/yakuake/${pkgver}/src/yakuake-${pkgver}.tar.xz"
	"samedir.patch"
)
md5sums=(
	"f8f43f2f3d99925d8853879ff1eb5826"
	"329be7d3e70c9cd7d7ef54d28b7e5904"
)
validpgpkeys=("DA6B31C4B98A877DBB2EF9A292220328C632316E") # Eike Hein <hein@kde.org>

build() {
	cd yakuake-${pkgver}
	patch -p0 < ../samedir.patch
	cd -
	mkdir build
	cd build
	cmake ../yakuake-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
