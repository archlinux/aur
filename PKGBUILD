# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-uuid
_srcver=ae0ca345b9974092bf139409d2852fc46886c250
pkgver=9.0.3
pkgrel=2
pkgdesc="Generate UUIDs in Varnish VCL"
arch=('x86_64')
url="https://github.com/otto-de/libvmod-uuid"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'uuid')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("libvmod-uuid-$_srcver.tar.gz::https://github.com/otto-de/libvmod-uuid/archive/${_srcver}.tar.gz")
sha512sums=('a0fb89af3c2dee5542b4173e3853869e2cdbf4cd473900b338e4701f0b769ede7d05436b754a8c1de6b13dc81cda73361a901ace26174b9c4068a3922f1119c3')

build() {
    cd "libvmod-uuid-$_srcver"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib
    make
}

check() {
    cd "libvmod-uuid-$_srcver"
    make check VERBOSE=1
}

package() {
    cd "libvmod-uuid-$_srcver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
