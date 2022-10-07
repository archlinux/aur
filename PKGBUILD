# Maintainer: Joel Grunbaum <joelgrun@gmail.com>

pkgname=spek-x-git
pkgver=v0.9.0.r2.g5ed0a19
pkgrel=1
pkgdesc='Acoustic spectrum analyser forked from spek.'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('GPL3')
depends=('ffmpeg' 'wxgtk3')
makedepends=('git' 'pkgconfig' 'automake' 'intltool' 'gettext')
url='https://github.com/MikeWang000000/spek-X'
conflicts=('spek')
provides=('spek')
source=('spek-x-git::git+https://github.com/MikeWang000000/spek-X')
md5sums=('SKIP')
options=()

pkgver() {
    cd $pkgname
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR=$pkgdir install
}
