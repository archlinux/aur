# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-cfg
pkgver=9.1.0
pkgrel=2
_srcver=9.1-22.1
pkgdesc="Config VMOD for Varnish"
arch=('x86_64')
url="https://github.com/carlosabalde/libvmod-cfg"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'curl' 'luajit')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils' 'jemalloc' 'xxd')
source=("$pkgname-${_srcver}.tar.gz::https://github.com/carlosabalde/libvmod-cfg/archive/refs/tags/${_srcver}.tar.gz")
sha512sums=('6f19fdaa1b8e79f54cb61baca66fe653e1691f9974cbe656b12b4291060a988ca280ae00ce96e6a006a6f253dcb11a26562da85c2f81f8866e75a41f817f22f7')

build() {
    cd "libvmod-cfg-${_srcver}"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib \
        --disable-flush-jemalloc-tcache
    make
}

check() {
    cd "libvmod-cfg-${_srcver}"
    make check VERBOSE=1
}

package() {
    cd "libvmod-cfg-${_srcver}"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
