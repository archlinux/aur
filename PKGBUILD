# Maintainer: Homalozoa <xuhaiwang at xiaomi dot com>
# Contributor: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=lttng-tools
pkgver=2.13.8
pkgrel=1
pkgdesc='LTTng tracing control tools'
arch=(i686 x86_64)
url='http://lttng.org/'
license=(GPL2 LGPL2.1)
provides=(lttng)
source=("http://lttng.org/files/$pkgname/$pkgname-$pkgver.tar.bz2")
makedepends=(asciidoc xmlto)
depends=(
    'popt'
    'liburcu>=0.7.2'
    "lttng-ust>=${pkgver%.*}.0"
    'linux>=2.6.27'
    'libxml2>=2.7.6'
)
optdepends=(
    'lttng-modules: kernel tracing support'
    'babeltrace: view traces with `lttng view` command'
    'man-db: view man pages with the `lttng help` command'
)
sha512sums=(6daafb1fd458cfbaa7e19b3a8aaafa958116bb836f389febf7ac4035e5d7884d308a9fdefb4e9063329cb7d837853a79ddae0e263d3b58db1f87519bba2dcb3b)

build()
{
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --sysconfdir=/etc --enable-man-pages
    make
}

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
