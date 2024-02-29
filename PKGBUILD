# Maintainer: ZhangHua <zhanghua.00@qq.com>
# Contributor: Faerbit <faerbit at gmail dot com>

pkgname=usbguard-notifier-git
pkgver=0.1.0.1.gf4586b7
pkgrel=1
pkgdesc="A tool for detecting usbguard policy and device presence changes"
arch=('x86_64')
url="https://github.com/Cropi/usbguard-notifier"
license=('GPL2')
depends=('gcc-libs' 'glib2' 'glibc' 'usbguard' 'libnotify' 'librsvg')
makedepends=('catch2-v2' 'asciidoc' 'git')
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
    sed -i 's|-I/usr/include/catch|-I/usr/include/catch2|' \
      ./configure.ac
    ./autogen.sh
    ./configure --prefix=/usr
    make
}
check() {
    cd "$srcdir/usbguard-notifier"
    make check
}
package() {
    cd "$srcdir/usbguard-notifier"
    make DESTDIR="$pkgdir" install
}
