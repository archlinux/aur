# Maintainer: dalto <dalto at fastmail.com>

pkgname=btrfs-assistant
pkgver=1.5
pkgrel=1
pkgdesc="An application for managing BTRFS subvolumes and Snapper snapshots"
arch=('x86_64')
url="https://gitlab.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'noto-fonts' 'polkit' 'util-linux' 'btrfs-progs' 'diffutils')
optdepends=('snapper' 'btrfsmaintenance')
makedepends=('git' 'cmake' 'qt5-tools')
backup=(etc/btrfs-assistant.conf)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('08bc7846b80cf0fe1f63966f1d69e377f8486829737f9651ce0e1114da06b17b')

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE='Release'
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}

