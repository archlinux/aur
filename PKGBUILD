pkgname='ubdsrv'
pkgver=1.0
pkgrel=1
pkgdesc="The userspace part of the ublk framework."
arch=('x86_64' 'i686' 'i486' 'pentium4' 'aarch64' 'armv7h') # Archlinux, Archlinux 32 Bit, Archlinux ARM
url='https://github.com/ming1/ubdsrv'
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('liburing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ming1/ubdsrv/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b9ea58346f98ea85f53304afe5afa61d7493f57ba83bacc03bab8fd5fe239d5cb45d6df0bdcdef773347ff0a895432bf886d9acd3616485f0d4cc1b7753967d5')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr --sbindir /usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}
