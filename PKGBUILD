# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=lttng-tools-git
_gitname="lttng-tools"
pkgver=2.7.0.rc1.76.gb789735
pkgrel=1
pkgdesc="Trace control client for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL2' 'LGPL2.1')
provides=('lttng')
conflicts=('lttng-tools')
makedepends=('git')
depends=('popt' 'flex>=2.5.35' 'liburcu>=0.7.2' 'lttng-ust' 'linux>=2.6.27')
optdepends=('lttng-modules: kernel tracing support' 'babeltrace: trace viewing')
source=('git://git.lttng.org/lttng-tools.git')
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
