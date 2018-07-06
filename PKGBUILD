pkgname=libmpd-git
pkgver=r419.2c8b595
pkgrel=1
pkgdesc="Signal based wrapper around libmpdclient"
arch=('i686' 'x86_64')
url="http://mpd.wikia.com/wiki/ClientLib:libmpd"
license=('GPL')
depends=('glib2')
conflicts=('libmpd')

source=($pkgname::git://github.com/DaveDavenport/libmpd.git)

md5sums=(SKIP)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

