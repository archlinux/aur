# Maintainer: robertfoster

pkgname=iio-sensor-proxy-git
_pkgname="iio-sensor-proxy"
pkgver=2.8.r12.9fdbb36
pkgrel=1
pkgdesc="IIO accelerometer sensor to input device proxy"
arch=('i686' 'x86_64')
url="https://github.com/hadess/iio-sensor-proxy"
license=('GPL2')
provides=('iio-sensor-proxy')
conflicts=('iio-sensor-proxy')
depends=('libgudev' 'gtk3' 'systemd')
makedepends=('git' 'gnome-common' 'gtk-doc')
source=("git+https://gitlab.freedesktop.org/hadess/iio-sensor-proxy.git")
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
    --sysconfdir=/usr/share \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --with-dbuspolicydir
}

package() {
    cd "$srcdir/$_pkgname"
    make DESTDIR="${pkgdir}" install
}
