# Maintainer: Romain Bazile <gromain.baz at gmail dot com>
pkgname=wpantund-git
pkgver=0.07.00.r222.g811cef1
pkgrel=2
pkgdesc="Userspace WPAN Network Daemon"
arch=('i686' 'x86_64')
url="https://github.com/openthread/wpantund"
license=('Apache')
makedepends=('git' 'gcc' 'boost-libs' 'readline')
depends=('dbus' 'readline')
provides=('wpantund' 'wpanctl')
source=("$pkgname::git+https://github.com/openthread/wpantund.git")

sha512sums=('SKIP')


pkgver() {
	cd $pkgname
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	./bootstrap.sh
	./configure --sysconfdir=/etc
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" PREFIX=/usr MANPREFIX=/usr/share/man install
}

