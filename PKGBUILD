# Maintainer: Philippe Proulx <eeppeliteloop@gmail.com>

pkgname=python-lttngust
pkgver=2.7.1
pkgrel=1
pkgdesc='LTTng-UST Python agent'
arch=('i686' 'x86_64')
url='http://lttng.org/'
license=('LGPL2.1' 'GPL2' 'MIT')
source=("http://lttng.org/files/lttng-ust/lttng-ust-$pkgver.tar.bz2")
makedepends=('python')
depends=('lttng-ust>=2.7.0')
optdepends=('lttng-tools: LTTng trace control client' 'babeltrace: trace viewing')
options=('!libtool')
sha1sums=('597ebecb885debb58c263de57f30b1096d4eefc6')

build()
{
    cd "${srcdir}/lttng-ust-${pkgver}"
    PYTHON=/usr/bin/python ./configure --prefix=/usr
    make
}

package()
{
    cd "${srcdir}/lttng-ust-${pkgver}/liblttng-ust-python-agent"
    make install DESTDIR="${pkgdir}"
    cd "${srcdir}/lttng-ust-${pkgver}"
    install -m0644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
