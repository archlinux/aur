# Maintainer: Philippe Proulx <pproulx@efficios.com>

pkgname=('python-babeltrace')
pkgver=1.4.0
pkgrel=1
pkgdesc='Babeltrace Python bindings'
arch=('i686' 'x86_64')
url="http://diamon.org/babeltrace"
license=('LGPL2.1' 'GPL2' 'MIT')
source=(http://www.efficios.com/files/babeltrace/babeltrace-${pkgver}.tar.bz2)
makedepends=('swig>=2.0.0')
depends=('babeltrace>=1.4.0' 'python')
options=('!libtool')
sha1sums=('3b162480ee883625e8581bf163817f78a4b6487b')

build()
{
    cd "${srcdir}/babeltrace-${pkgver}"
    PYTHON=/usr/bin/python PYTHON_CONFIG=/usr/bin/python-config ./configure --prefix=/usr --disable-debug-info --enable-python-bindings
    make
}

package() {
    cd "${srcdir}/babeltrace-${pkgver}/bindings/python"
    make install DESTDIR="${pkgdir}"
    cd "${srcdir}/babeltrace-${pkgver}"
    install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
