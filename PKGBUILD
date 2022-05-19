
# Maintainer: Olly1240 <olly1240 at gmail dot com>


pkgname=usbmuxd2-git
pkgver=r46.753b79e
pkgrel=1
pkgdesc="Drop-in replacement of usbmuxd with wifi support"
arch=('x86_64')
url="https://github.com/tihmstar/usbmuxd2"
license=('LGPL3')
depends=('avahi' 'libplist-git' 'libusbmuxd-git' 'libusb' 'libimobiledevice-git' 'libimobiledevice-glue-git' 'libgeneral-git')
makedepends=('git' 'clang') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("usbmuxd")
conflicts=("usbmuxd")
install=usbmuxd2.install
source=('git+https://github.com/tihmstar/usbmuxd2.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	CC=clang ./autogen.sh --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
