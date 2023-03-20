# Maintainer: CodeRadu <radu.gabi.m@gmail.com>
pkgname=radu-cloud-desktop
pkgver=1.0.7
pkgrel=1
arch=("x86_64")
url="https://github.com/coderadu/radu-cloud-desktop"
license=('MIT')
depends=()
makedepends=("nodejs")
install=
changelog=
source=("git+$url.git?signed")
validpgpkeys=("C06C15AA341165311DB6964132802AA0C3BC2982") # CodeRadu <radu.gabi.m@gmail.com>
noextract=()
sha256sums=("SKIP")

build() {
	cd "$srcdir/$pkgname"
	git submodule update --init
	npm install
	npm run website:build
	npm run electron:build-pacman
}

package() {
	cd "$srcdir/$pkgname/dist"
	mkdir unpacked || true
	tar -xvf "$pkgname-$pkgver.pacman" -C unpacked
	cp -r $srcdir/$pkgname/dist/unpacked/opt $pkgdir
	cp -r $srcdir/$pkgname/dist/unpacked/usr $pkgdir
}
