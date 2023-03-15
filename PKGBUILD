pkgname='ubdsrv-git'
pkgver=1.1.rc1.r53.g0747711
pkgrel=1
pkgdesc="The userspace part of the ublk framework."
arch=('x86_64' 'i686' 'i486' 'pentium4' 'aarch64' 'armv7h') # Archlinux, Archlinux 32 Bit, Archlinux ARM
url='https://github.com/ming1/ubdsrv'
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('liburing')
conflicts=('ubdsrv')

source=("$pkgname::git+https://github.com/ming1/ubdsrv.git")
b2sums=(SKIP)

pkgver() {
	cd "$pkgname"
	git describe --long --abbrev=7 | sed -E 's/^v//;s/-([0-9]+-g[0-9a-f]+)$/-r\1/;s/-/\./g'
}

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
