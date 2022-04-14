# Maintainer: dalto <dalto at fastmail.com>

pkgname=btrfs-assistant
pkgver=1.4
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
sha256sums=('a4824c518118343343b14fdbcd7cf2477009baa359087772d83f65064f8f4f37')

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE='Release'
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}

