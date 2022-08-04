# Maintainer: Viacheslav Chepelyk-Kozhin <vaceslavkozin619@gmail.com>
pkgname=spmn
pkgver=1.0_5
pkgrel=1
pkgdesc="Patch Manager for Suckless software"
arch=('x86_64')
url="https://github.com/slamko/spmn"
license=('GPL')
depends=('glibc' 'libbsd' 'xdg-utils' 'git')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/slamko/spmn/releases/download/v1.0_5d/$pkgname-$pkgver.tar.gz")
sha256sums=('e3713e098ad1a018e9f5ab8c0997a705883b42d4ef2f9fe8b8a678235685838b')

prepare() {
	mkdir "$pkgname-$pkgver"
	cp "$pkgname-$pkgver.tar.gz" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	tar -xf "$pkgname-$pkgver.tar.gz"
	git clone --depth 1 --branch v0.2.0 "https://github.com/slamko/zic.git"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	cat Makefile
	make DESTDIR="$pkgdir" install
}

