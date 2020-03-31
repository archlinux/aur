# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Siddhartha Das bablu.boy@gmail.com>
pkgname=nutty-git
pkgver=1.1.1.r29.g56f5996
pkgrel=1
pkgdesc='A network utility that monitors the devices on your network,
         checks bandwidth and speed details.'
arch=('i686' 'x86_64')
url='https://github.com/babluboy/nutty'
license=('GPL3')
depends=('granite' 'libnotify' 'libxml2' 'libgee' 'sqlite' 'net-tools' 'nethogs'
         'nmap' 'traceroute' 'vnstat' 'wireless_tools' 'iproute2' 'pciutils')
makedepends=('git' 'meson' 'vala' 'appstream')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/babluboy/nutty.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "${pkgname%-git}" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install

	ln -s /usr/bin/com.github.babluboy.nutty "$pkgdir/usr/bin/${pkgname%-git}"
}
