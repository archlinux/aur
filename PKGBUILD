# Maintainer: dalto <dalto at fastmail.com>

pkgname=btrfs-assistant
pkgver=0.8
pkgrel=1
pkgdesc="An application for managing BTRFS subvolumes and Snapper snapshots"
arch=('x86_64')
url="https://gitlab.com/garuda-linux/applications/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'noto-fonts' 'polkit' 'btrfsmaintenance')
optdepends=('snapper')
makedepends=('git' 'cmake' 'qt5-tools')
source=(git+$url.git#tag=$pkgver)
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cmake -B build -S . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE='Release'
	make -C build
}

package() {
    cd "$srcdir/$pkgname"
    make -C build DESTDIR="$pkgdir" install

    install -Dm0644 $srcdir/$pkgname/snapper-snap-check.desktop $pkgdir/etc/xdg/autostart/snapper-snap-check.desktop
    install -Dm0644 $srcdir/$pkgname/org.garuda.btrfs-assistant.pkexec.policy $pkgdir/usr/share/polkit-1/actions/org.garuda.btrfs-assistant.pkexec.policy
}
