# Maintainer: imi415 <imi415 at imi dot moe>
# Author: Yilin Sun

_pkgname=hailort-drivers
pkgname=$_pkgname-8-dkms
pkgver=4.23.0
pkgrel=1
pkgdesc="Kernel drivers for HAILO-8 series accelerator cards"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/hailo-ai/hailort-drivers"
license=('GPL2')
depends=('dkms' 'hailort-firmware-8')
provides=('hailort-drivers-8' 'hailort-drivers-8-dkms')
conflicts=('hailort-drivers-8' 'hailort-drivers-8-dkms')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
	'dkms.conf.in')
sha256sums=('245c7157746c2fd48b2fab4a990c8fb3b786921dd72c9e5348f5b5619ee05ec3'
	'SKIP')

prepare() {
	sed -e "s/@PCIE_DRIVER_VERSION@/$pkgver/" \
	    -e "s/@DKMS_PACKAGE_NAME@/$_pkgname-8/" \
		"$srcdir/dkms.conf.in" > \
		"$srcdir/$_pkgname-$pkgver/dkms.conf"
}

package() {
	install -Dm755 -d "$pkgdir/usr/src/$_pkgname-8-$pkgver/common" "$pkgdir/usr/src/$_pkgname-8-$pkgver/linux"
	cp -dr --no-preserve='ownership' "$srcdir/$_pkgname-$pkgver/linux" "$pkgdir/usr/src/$_pkgname-8-$pkgver"
	cp -dr --no-preserve='ownership' "$srcdir/$_pkgname-$pkgver/common" "$pkgdir/usr/src/$_pkgname-8-$pkgver"
	install -Dm644 "$srcdir/$_pkgname-$pkgver/dkms.conf" "$pkgdir/usr/src/$_pkgname-8-$pkgver/dkms.conf"
}

