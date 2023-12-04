# Maintainer: Kloudignite
pkgname=kcm-uefi
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="A Plasma settings control panel to manage the UEFI boot order."
arch=('x86_64')
url="https://invent.kde.org./mmassaro/kcm-uefi"
license=('GPL')
depends=('kauth5' 'kconfig5' 'kdeclarative5' 'kcmutils5' 'efibootmgr')
makedepends=('cmake' 'extra-cmake-modules')
provides=(kcm_uefi)
source=("https://invent.kde.org/mmassaro/kcm-uefi/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('9fbd93d62654f1bb69e8e1f7e0d88ba8')

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
