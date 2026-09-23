# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-geoip2
pkgver=9.1.0
pkgrel=2
_srcver=d958af1dec630794af0695cf4181062a430e99e4
pkgdesc="Varnish vmod to query MaxMind GeoIP2 DB files"
arch=('x86_64')
url="https://github.com/varnishcache-friends/libvmod-geoip2"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'libmaxminddb')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("libvmod-geoip2-$_srcver.tar.gz::https://github.com/varnishcache-friends/libvmod-geoip2/archive/${_srcver}.tar.gz")
sha512sums=('9a24cd05018f8d5aeb1bd06100d688d937d082e1b6644c158ace02a1f8bdf9d28d0021d918a1c75b15f3ae159ddc5055db91ca7969a9c5e3bde911ef992994c6')

build() {
    cd "libvmod-geoip2-$_srcver"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib
    make
}

check() {
    cd "libvmod-geoip2-$_srcver"
    make check VERBOSE=1
}

package() {
    cd "libvmod-geoip2-$_srcver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
