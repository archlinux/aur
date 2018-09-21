# Maintainer: crab2313 <crab2313@gmail.com>

pkgname=rkdeveloptool
pkgver=52
pkgrel=1
pkgdesc='Development tool for Rockchip SOC'
arch=('x86_64')
url='https://github.com/rockchip-linux/rkdeveloptool'
license=('GPL2')
makedepends=('autoconf'
             'git')
depends=('libusb')
source=('git+https://github.com/rockchip-linux/rkdeveloptool.git')
sha256sums=('SKIP')

install=$pkgname.install

pkgver() {
	cd "$srcdir/$pkgname"
	git rev-list --count HEAD
}

build() {
	cd "$srcdir/$pkgname"
	autoreconf -i
	./configure --prefix=/usr --disable-werror
	make
}

package() {
	cd "$srcdir/$pkgname"
    make DESTDIR=$pkgdir install
	mkdir -p "$pkgdir/etc/udev/rules.d/"
	install -m644 99-rk-rockusb.rules "$pkgdir/etc/udev/rules.d/"
}

# vim: set sw=4 ts=4 noet:
