# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-uuid
_vver=9.0.3
_vrel=2
_uver=ae0ca345b9974092bf139409d2852fc46886c250
pkgver=$_vver
pkgrel=$_vrel
pkgdesc="Generate UUIDs in Varnish VCL"
arch=('x86_64')
url="https://github.com/otto-de/libvmod-uuid"
license=('BSD-2-Clause')
depends=("varnish=$_vver-$_vrel" 'uuid')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("libvmod-uuid-$_uver.tar.gz::https://github.com/otto-de/libvmod-uuid/archive/${_uver}.tar.gz")
sha512sums=('a0fb89af3c2dee5542b4173e3853869e2cdbf4cd473900b338e4701f0b769ede7d05436b754a8c1de6b13dc81cda73361a901ace26174b9c4068a3922f1119c3')

build() {
    cd "libvmod-uuid-$_uver"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib
    make
}

check() {
    cd "libvmod-uuid-$_uver"
    make check VERBOSE=1
}

package() {
    cd "libvmod-uuid-$_uver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
