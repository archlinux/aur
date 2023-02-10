# Maintainer: éclairevoyant
# Contributor: Dave Reisner <d at falconindy dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>

pkgname=systemd-bootchart-git
pkgver=234.r2.ef042f6
pkgrel=1
pkgdesc="Boot performance graphing tool"
arch=('i686' 'x86_64')
url="https://github.com/systemd/systemd-bootchart"
license=('LGPL2.1')
depends=('libsystemd.so')
makedepends=('docbook-xsl' 'git' 'intltool' 'libxslt')
provides=('systemd-bootchart')
conflicts=('systemd-bootchart' 'systemd<=229')
source=("git+$url.git")
b2sums=('SKIP')
backup=('etc/systemd/bootchart.conf')

pkgver() {
	cd "systemd-bootchart"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "systemd-bootchart"
	./autogen.sh
}

build() {
	cd "systemd-bootchart"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--libdir=/usr/lib
	make
}

package() {
	cd "systemd-bootchart"
	make DESTDIR="$pkgdir" install
}
