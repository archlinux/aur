# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=lttngtop-git
_gitname="lttngtop"
pkgver=0.3.2.gd0377b6
pkgrel=1
pkgdesc="A top-like, ncurses-based utility to analyze trace information produced by LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL2')
makedepends=('git')
provides=('lttngtop')
conflicts=('lttngtop')
depends=('glib2>=2.22.0' 'ncurses' 'popt>=1.13' 'babeltrace')
source=('git://git.lttng.org/lttngtop.git')
sha1sums=('SKIP')

pkgver()
{
    cd ${_gitname}
    git describe --always | sed 's/-/./g;s/^v//'
}

build()
{
    cd ${_gitname}
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package()
{
    cd ${_gitname}
    make install DESTDIR=${pkgdir}
}
