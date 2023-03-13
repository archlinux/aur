pkgname='ubdsrv'
pkgver=1.0
pkgrel=1
pkgdesc="The userspace part of the ublk framework."
arch=('x86_64' 'i686' 'i486' 'pentium4' 'aarch64' 'armv7h') # Archlinux, Archlinux 32 Bit, Archlinux ARM
url='https://github.com/ming1/ubdsrv'
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('liburing')
source=("$pkgname::git+https://github.com/ming1/ubdsrv.git#commit=c7170a83f526e97216cb8ee90c4bfeba36260a9e")
b2sums=(SKIP)

build() {
	cd "$pkgname"
	autoreconf -i
	./configure --prefix=/usr --sbindir /usr/bin
	make
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}
