# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=babeltrace-git
_gitname="babeltrace"
pkgver=1.2.0.369.g2b8dbf9
pkgrel=1
pkgdesc="command-line trace reader for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('MIT' 'GPL2' 'LGPL2.1')
makedepends=('git')
depends=('popt' 'flex' 'util-linux' 'glib2')
options=('!libtool')
provides=('babeltrace')
conflicts=('babeltrace')
source=('git://git.efficios.com/babeltrace.git')
install='babeltrace-git.install'
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
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
