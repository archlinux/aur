# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=ssl-admin
pkgver=1.2.1
pkgrel=4
pkgdesc="OpenSSL certificate manager with OpenVPN support"
arch=('any')
url="https://www.secure-computing.net"
license=('BSD3CLAUSE')
depends=('perl' 'openssl')
backup=('etc/ssl-admin/ssl-admin.conf'
'etc/ssl-admin/openssl.conf')
source=("ftp://ftp.secure-computing.net/pub/ssl-admin/$pkgname-$pkgver.tar.xz"
'fix_makefile_for_linux.patch')
sha256sums=('ebe6667c1beb79c7a12400e8a19bb4ec9f78ea7f72e0363d1eb10ed7f4b357ba'
            '4a85bb4eec3e638720d99753f0f734774f7788f6f5d67016bb01745d8f5652c7')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i "$srcdir/fix_makefile_for_linux.patch"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
