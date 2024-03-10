# Maintainer: dalto <dalto at fastmail.com>

pkgname=btrfs-assistant
pkgver=2.0
pkgrel=1
pkgdesc="An application for managing BTRFS subvolumes and Snapper snapshots"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt6-base' 'qt6-svg' 'ttf-font' 'polkit' 'util-linux' 'btrfs-progs' 'diffutils')
optdepends=('snapper' 'btrfsmaintenance')
makedepends=('git' 'cmake' 'qt6-tools')
backup=(etc/btrfs-assistant.conf)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1e43de1713e7a3dffb395dba38a241be8d6281ba158029306cb31124b0011ddf')

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE='Release'
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}

