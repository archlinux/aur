# Maintainer: Homalozoa <xuhaiwang at xiaomi dot com>
# Contributor: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=lttng-tools
pkgver=2.13.0
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
sha1sums=(5c72a0450feaac132af7e6d4054520fecb5a9718)

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
