# Maintainer: Lara <aur@lara.uber.space>
pkgname=trebleshot
_sourcename="TrebleShot-Desktop"
pkgver=0.1.0_alpha2
pkgrel=1
pkgdesc="A multi-platform file-sharing tool"
arch=(x86_64)
url="https://github.com/genonbeta/$_sourcename"
license=('GPL2')
depends=('qt5-base' 'kdnssd')
makedepends=('cmake')
optdepends=('qt5-wayland: Wayland support')
source=("https://github.com/genonbeta/$_sourcename/archive/${pkgver/_/-}.tar.gz")
sha1sums=('ad98267e0129279531222bf28a5a61c03db8afa1')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../$_sourcename-${pkgver/_/-}
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
