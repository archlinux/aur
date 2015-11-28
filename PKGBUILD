pkgname=libmpd-git
pkgver=release.0.20.0.r23.g2c8b595
pkgrel=1
pkgdesc="Signal based wrapper around libmpdclient"
arch=('i686' 'x86_64')
url="http://mpd.wikia.com/wiki/ClientLib:libmpd"
license=('GPL')
depends=('glib2')
conflicts=('libmpd')

source=($pkgname::git://git.musicpd.org/master/libmpd.git)

md5sums=(SKIP)

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"

    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}

