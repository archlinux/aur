# Maintainer: CodeRadu
pkgname=radu-cloud-desktop
pkgver=1.0.6
pkgrel=1
arch=("x86_64")
url="github.com/coderadu/radu-cloud-desktop"
license=('MIT')
depends=()
makedepends=("nodejs")
install=
changelog=
source=("git+https://$url.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

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
