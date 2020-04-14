# Maintainer: Static_Rocket

pkgname=rogauracore-git
pkgver=1.2.r1.ga2ba0c4
pkgrel=1
pkgdesc="RGB keyboard control for Asus ROG laptops"
arch=('x86_64')
url="https://github.com/wroberts/rogauracore"
license=('MIT')
depends=('libusb')
makedepends=('git')
source=('git+https://github.com/wroberts/rogauracore.git')
md5sums=('SKIP')
_gitdir=${pkgname%"-git"}

pkgver() {
	cd "$_gitdir"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_gitdir"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$_gitdir"
	make DESTDIR="$pkgdir/" install
}
