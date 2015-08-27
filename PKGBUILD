# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=lttng-ust-git
_gitname="lttng-ust"
pkgver=2.7.0.rc1.28.g0dafcd6
pkgrel=1
pkgdesc="Userspace tracing library for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL2' 'LGPL2.1')
depends=('liburcu>=0.7.2' 'util-linux')
makedepends=('git')
provides=('lttng-ust')
conflicts=('lttng-ust')
optdepends=('babeltrace')
options=('!libtool')
install='lttng-ust-git.install'
source=('git://git.lttng.org/lttng-ust.git')
sha1sums=('SKIP')

pkgver()
{
    cd $_gitname
    git describe --always | sed 's/-/./g;s/^v//'
}

build()
{
    cd $_gitname
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package()
{
    cd $_gitname
    make DESTDIR="$pkgdir/" install
}
