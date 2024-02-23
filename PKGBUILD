pkgname='ubdsrv'
pkgver=1.1
pkgrel=1
pkgdesc="The userspace part of the ublk framework."
arch=('x86_64' 'i686' 'i486' 'pentium4' 'aarch64' 'armv7h') # Archlinux, Archlinux 32 Bit, Archlinux ARM
url='https://github.com/ming1/ubdsrv'
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('liburing')
makedepends=('git')
source=("$pkgname::git+https://github.com/ming1/ubdsrv.git#commit=f8304e53f78b0414cba9a5f224c33f63103abb47")
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
