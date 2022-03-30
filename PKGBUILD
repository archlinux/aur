# Maintainer: dalto <dalto at fastmail.com>

pkgname=btrfs-assistant
pkgver=1.0
pkgrel=1
pkgdesc="An application for managing BTRFS subvolumes and Snapper snapshots"
arch=('x86_64')
url="https://gitlab.com/$pkgname/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'noto-fonts' 'polkit')
optdepends=('snapper' 'btrfsmaintenance')
makedepends=('git' 'cmake' 'qt5-tools')
backup=(etc/btrfs-assistant.conf)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1e35c0f231bc7e3b0a34e6f5267c34e801536a2059a67e91e649fb8cc79db60f')

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE='Release'
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0644 btrfs-assistant.conf "$pkgdir/etc/btrfs-assistant.conf"
	install -Dm0644 org.btrfs-assistant.pkexec.policy "$pkgdir/usr/share/polkit-1/actions/org.btrfs-assistant.pkexec.policy"
}

