# Maintainer: Méven Car <meven@kde.org>

_pkgbase=hid-logitech-headset
pkgname=hid-logitech-headset-dkms
pkgver=0.4
pkgrel=1
pkgdesc="Kernel driver reporting the battery of the Logitech PRO X 2 LIGHTSPEED headset (DKMS)"
arch=('any')
url="https://github.com/meven/hid-logitech-headset"
license=('GPL-2.0-or-later')
depends=('dkms')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
	cd "$_pkgbase-$pkgver"
	local dest="$pkgdir/usr/src/$_pkgbase-$pkgver"
	install -Dm644 -t "$dest" hid-logitech-headset.c Makefile
	sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" dkms.conf > "$dest/dkms.conf"
	install -Dm644 71-hid-logitech-headset.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
