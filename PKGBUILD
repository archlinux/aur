# Maintainer: Philippe Proulx <pproulx@efficios.com>

pkgname=('python-lttngust' 'python2-lttngust')
pkgver=2.8.0
pkgrel=1
pkgdesc='LTTng-UST Python agent'
arch=('any')
url='http://lttng.org/'
license=('LGPL2.1' 'GPL2' 'MIT')
source=("http://lttng.org/files/lttng-ust/lttng-ust-$pkgver.tar.bz2")
depends=('liblttng-ust-python-agent>=2.8.0')
optdepends=(
    'lttng-tools: LTTng tracing control tools'
    'babeltrace: trace viewer'
)
options=('!libtool')
sha1sums=('648e710683743969087e72faa5aa82697280729d')

build()
{
    cd "${srcdir}/lttng-ust-${pkgver}"
    ./configure --prefix=/usr --enable-python-agent
    make
}

_common_package() {
    cd "${srcdir}/lttng-ust-${pkgver}/liblttng-ust-python-agent"
    make install PYTHON="/usr/bin/$1" DESTDIR="${pkgdir}"
    rm "${pkgdir}"/usr/lib/liblttng-ust-python-agent.*
    cd "${srcdir}/lttng-ust-${pkgver}"
    install -m0644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-lttngust()
{
    makedepends=('python')
    _common_package python
}

package_python2-lttngust()
{
    makedepends=('python2')
    _common_package python2
}
