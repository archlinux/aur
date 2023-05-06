# Maintainer: dalto <dalto at fastmail.com>

pkgname=btrfs-assistant
pkgver=1.8
pkgrel=2
pkgdesc="An application for managing BTRFS subvolumes and Snapper snapshots"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'ttf-font' 'polkit' 'util-linux' 'btrfs-progs' 'diffutils')
optdepends=('snapper' 'btrfsmaintenance')
makedepends=('git' 'cmake' 'qt5-tools')
backup=(etc/btrfs-assistant.conf)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0bc31481245d95eaeb539812918d48134395b2498e1c7919ef3cf2a4cb7be421')

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE='Release'
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}

