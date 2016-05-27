# Maintainer: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=lttng-ust
pkgver=2.8.0
pkgrel=1
pkgdesc="LTTng user space tracing libraries and agents for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('LGPL2.1' 'GPL2' 'MIT')
depends=('liburcu>=0.7.2' 'util-linux' 'python')
optdepends=(
    'lttng-tools: LTTng tracing control tools'
    'babeltrace: trace viewer'
)
options=('!libtool')
source=(http://lttng.org/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
install='lttng-ust.install'
sha1sums=('648e710683743969087e72faa5aa82697280729d')

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make install DESTDIR=${pkgdir}
    install -D -m644 COPYING ${pkgdir}/usr/share/licenses/lttng-ust/COPYING
}
