# Maintainer: torculus <20175597+torculus@users.noreply.github.com>
# Contributor: torculus <20175597+torculus@users.noreply.github.com>
pkgname=hp-printer-app
pkgver=1.3.1
pkgrel=1
pkgdesc="Example printer application for HP PCL printers using PAPPL."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/michaelrsweet/hp-printer-app"
license=('Apache-2.0')
depends=('glibc' 'pappl' 'libcups')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4759308f549ff9c2c0b7618ab925829127ec366dbf0c1a40bcd0ada903d58d5cdf512cb90b355efcf657e0a1fb04d7009bc2e13f113c80684a11c79a25be447a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-experimental \
	--with-systemd=/usr/lib/systemd/system \
	--with-ldflags=" -Wl,-z,now,-z,shstk"
	make all
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
