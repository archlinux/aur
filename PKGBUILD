# Maintainer: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=lttng-ust
pkgver=2.9.0
pkgrel=1
pkgdesc="LTTng user space tracing libraries for LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('LGPL2.1' 'GPL2' 'MIT')
makedepends=('asciidoc' 'xmlto')
depends=('liburcu>=0.7.2' 'util-linux' 'python')
optdepends=(
    'lttng-tools: LTTng tracing control tools'
    'babeltrace: trace viewer'
)
source=(http://lttng.org/files/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('9937eae64540821b8597cce081e92be76e6b5568')

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --enable-man-pages --disable-python-agent
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make install DESTDIR=${pkgdir}
    install -D -m644 COPYING ${pkgdir}/usr/share/licenses/lttng-ust/COPYING
}
