# Maintainer: robertfoster

pkgname=iio-sensor-proxy-git
_pkgname="iio-sensor-proxy"
pkgver=2.5.r2.9e061b9
pkgrel=1
pkgdesc="IIO accelerometer sensor to input device proxy"
arch=('i686' 'x86_64')
url="https://github.com/hadess/iio-sensor-proxy"
license=('GPL2')
provides=('iio-sensor-proxy')
conflicts=('iio-sensor-proxy')
depends=('libgudev>=232' 'gtk3' 'systemd')
makedepends=('git' 'gnome-common' 'gtk-doc')
source=("git+https://github.com/hadess/iio-sensor-proxy.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
        printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--bindir=/usr/bin \
		--sbindir=/usr/bin \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--disable-Werror
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="${pkgdir}" install
}
