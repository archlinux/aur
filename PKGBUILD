# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-redis
pkgver=9.1.0
pkgrel=2
_srcver=9.1-24.0
pkgdesc="VMOD using hiredis to access Redis servers from VCL"
arch=('x86_64')
url="https://github.com/carlosabalde/libvmod-redis"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'hiredis' 'libev')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("$pkgname-${_srcver}.tar.gz::https://github.com/carlosabalde/libvmod-redis/archive/refs/tags/${_srcver}.tar.gz")
sha512sums=('a3bdba2d5e835a64b3cca680ceaab01dc1aa3cf07c2dffb5ba898c2c034917b23af9252ee9d8028eed16626567647b3a8496ac0565d69ea790d083f4f536bf4a')

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
