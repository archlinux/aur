# Maintainer: ZhangHua <zhanghua.00@qq.com>
# Contributor: Faerbit <faerbit at gmail dot com>

pkgname=usbguard-notifier-git
pkgver=0.0.6.6.gaf64a92
pkgrel=1
pkgdesc="A tool for detecting usbguard policy and device presence changes"
arch=('x86_64')
url="https://github.com/Cropi/usbguard-notifier"
license=('GPL2')
depends=('usbguard' 'libnotify' 'librsvg')
makedepends=('catch2' 'asciidoc' 'git')
source=("git+https://github.com/Cropi/usbguard-notifier")
sha256sums=('SKIP')
conflicts=('usbguard-notifier')
provides=('usbguard-notifier')
pkgver(){
	cd "$srcdir/usbguard-notifier"
	git describe --tags | sed "s/usbguard-notifier-//;s/-/./g"
}
build() {
        cd "$srcdir/usbguard-notifier"
	./autogen.sh
        ./configure CPPFLAGS=-I/usr/include/catch2 --prefix=/usr
        make
}

package() {
        cd "$srcdir/usbguard-notifier"
        make DESTDIR="$pkgdir/" SYSTEMD_UNIT_DIR=/usr/lib/systemd/user/ install
}
