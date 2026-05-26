# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-redis
pkgver=9.0.3
pkgrel=2
_srcver=9.0-23.0
pkgdesc="VMOD using hiredis to access Redis servers from VCL"
arch=('x86_64')
url="https://github.com/carlosabalde/libvmod-redis"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'hiredis' 'libev')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("$pkgname-${_srcver}.tar.gz::https://github.com/carlosabalde/libvmod-redis/archive/refs/tags/${_srcver}.tar.gz")
sha512sums=('94d8f2d4e631d8282c56aa657403378fc0789c28b409d4da58cc2143460c973ebb6bfa1ac4cab69e42cf0010faf6b42e51f7f9ca06ab241419436aa9d0f94465')

build() {
    cd "libvmod-redis-${_srcver}"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib \
        --disable-tls
    make
}

package() {
    cd "libvmod-redis-${_srcver}"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
