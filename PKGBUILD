# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=matrix-recorder
pkgver=0.0.6
pkgrel=1
pkgdesc="Chat logger for Matrix"
arch=('i686' 'x86_64')
url="https://gitlab.com/argit/matrix-recorder"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("git+https://gitlab.com/argit/matrix-recorder.git#commit=c877ac287e28cdf2f36b614ccc4adbe4f40ae0f9")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	npm install
	#make matrix-recorder.js shell-executable
	sed -i '1s;^;#!/usr/bin/node\n;' matrix-recorder.js
	chmod +x matrix-recorder.js
}

package() {
	cd "$pkgname"
	mkdir -p $pkgdir/opt/$pkgname
	cp -r * $pkgdir/opt/$pkgname
	mkdir -p $pkgdir/usr/bin
	ln -s /opt/matrix-recorder/matrix-recorder.js $pkgdir/usr/bin/matrix-recorder
}
