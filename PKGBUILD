# Maintainer: Static_Rocket

pkgname=rogauracore-git
pkgver=1.4.r0.g9f4c0aa
pkgrel=1
pkgdesc="RGB keyboard control for Asus ROG laptops"
arch=('x86_64')
url="https://github.com/wroberts/rogauracore"
license=('MIT')
depends=('glibc' 'libusb' 'udev')
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
	make DESTDIR="$pkgdir/" udevrulesdir="/usr/lib/udev/rules.d" install
}

