# Maintainer: robertfoster

pkgname=iio-sensor-proxy-git
_pkgname="iio-sensor-proxy"
pkgver=3.0.r18.4d5df70
pkgrel=1
pkgdesc="IIO accelerometer sensor to input device proxy"
arch=('i686' 'x86_64')
url="https://github.com/hadess/iio-sensor-proxy"
license=('GPL2')
provides=('iio-sensor-proxy')
conflicts=('iio-sensor-proxy')
depends=('libgudev' 'gtk3' 'systemd')
makedepends=('git' 'gnome-common' 'gtk-doc' 'meson')
source=("git+https://gitlab.freedesktop.org/hadess/iio-sensor-proxy.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    arch-meson build $_pkgname
    meson compile -C build
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
