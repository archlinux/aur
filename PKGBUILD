# Maintainer: Rob Bolton <rob.a.bolton@gmail.com>
pkgname=es-shell
pkgver=0.10.0
pkgrel=1
pkgdesc="Extensible Shell, a shell based on Plan 9's rc shell, influenced by functional languages."
arch=('aarch64' 'x86_64')
url="http://wryun.github.io/es-shell/"
license=('LicenseRef-es-shell')
depends=('glibc' 'readline')
provides=('es')
install=es-shell.install
source=("es-$pkgver.tar.gz::https://github.com/wryun/es-shell/releases/download/v$pkgver/es-$pkgver.tar.gz")
sha256sums=('551ec0974822ec081e7b9f8ee79374c62766ca6dcdb1c685a98efdc3e6dbc4b9')

build() {
	cd "es-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "es-$pkgver"
	make DESTDIR="$pkgdir" prefix="/usr" install
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}

