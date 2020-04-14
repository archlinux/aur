# Maintainer: Static_Rocket

pkgname=rogauracore-git
pkgver=1.2.r1.ga2ba0c4
pkgrel=1
pkgdesc="RGB keyboard control for Asus ROG laptops"
arch=('x86_64')
url="https://github.com/wroberts/rogauracore"
license=('MIT')
depends=('glibc' 'libusb' 'udev')
makedepends=('git')
source=('git+https://github.com/wroberts/rogauracore.git' '90-rogauracore.rules')
md5sums=('SKIP' 'acf8f96f46cbd14c5d208594684a69e4')
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
	cd "$srcdir"
	install -Dm644 90-rogauracore.rules "$pkgdir/usr/lib/udev/rules.d/90-rogauracore.rules"
}

