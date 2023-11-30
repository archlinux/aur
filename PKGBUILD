# Maintainer: Dana Sorensen <dana.r.sorensen@gmail.com>

pkgname=iio-oscilloscope-git
pkgver=v0.16.r38.1925e45786a6
pkgrel=1
pkgdesc="A GTK+ based oscilloscope application for interfacing with various IIO devices"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/analogdevicesinc/iio-oscilloscope"
license=('GPL2')
depends=('gtk2' 'gtkdatabox' 'libmatio' 'fftw' 'libxml2' 'bison' 'flex' 'avahi' 'curl' 'jansson' 'libaio' 'libiio' 'ncurses' 'libad9361')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/analogdevicesinc/iio-oscilloscope.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-master//g;s/-/./g'
}

# prepare() {
    # change config.h prefix to "/usr"
    # sed -i 's/\/usr\/local\//\/usr/' "$srcdir/${pkgname%-git}/config.h"
# }

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}

