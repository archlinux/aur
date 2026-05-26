# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-geoip2
pkgver=9.0.3
pkgrel=2
_srcver=976c551b5584034dde80ac30f8baa07f1bc92834
pkgdesc="Varnish vmod to query MaxMind GeoIP2 DB files"
arch=('x86_64')
url="https://github.com/varnishcache-friends/libvmod-geoip2"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'libmaxminddb')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("libvmod-geoip2-$_srcver.tar.gz::https://github.com/varnishcache-friends/libvmod-geoip2/archive/${_srcver}.tar.gz")
sha512sums=('510d71112207e5656b7b96f4d9604b16ded8fad55df40b8ab35536e4214dd39838a9e0f39286033424d585b78f8c1aa1adfa8250d6c0f0f13d0ab7342d920437')

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
