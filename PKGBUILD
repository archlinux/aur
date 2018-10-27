# Maintainer: Fran Casas <nflamel@gmail.com>
pkgname=timelimit
pkgver=1.9.0
pkgrel=1
pkgdesc="Limit a process's absolute execution time"
arch=('x86_64')
url="https://devel.ringlet.net/sysutils/timelimit/"
license=('custom')
source=("https://devel.ringlet.net/files/sys/timelimit/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('3d3171bacc60aacdf04bc084b53c20af')

build() {
	cd "$pkgname-$pkgver"
	make
	sed -n '/Copyright/,/SUCH DAMAGE/p' timelimit.c | sed 's/* \?//' > LICENSE
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
