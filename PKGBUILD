# Maintainer: Marcello Massaro <spam@mmassa.ro>
pkgname=kcm-uefi
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A Plasma settings control panel to manage the UEFI boot order."
arch=('x86_64')
url="https://invent.kde.org./mmassaro/kcm-uefi"
license=('GPL')
depends=('kauth' 'kconfig' 'kdeclarative' 'kcmutils' 'efibootmgr')
makedepends=('cmake' 'extra-cmake-modules')
provides=(kcm_uefi)
source=("https://invent.kde.org/mmassaro/kcm-uefi/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$pkgname-v$pkgver"
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release
	make -j$(nproc)
}

package() {
	cd "$pkgname-v$pkgver"/build
	make DESTDIR="$pkgdir/" install
}
