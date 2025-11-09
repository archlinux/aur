# Maintainer: brenno <dev@brenno.codes>

pkgname=rogauracore-git
pkgver=1.6.2.r0.g5f68958
pkgrel=2
pkgdesc="RGB keyboard control for Asus ROG laptops"
arch=('x86_64')
url="https://github.com/Syndelis/rogauracore"
license=('MIT')
depends=('glibc' 'libusb' 'udev')
makedepends=('git')
options=('!debug')
source=('git+https://github.com/Syndelis/rogauracore.git')
conflicts=('rogauracore')
provides=('rogauracore')
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

