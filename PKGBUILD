# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-jq
pkgver=9.0.3
pkgrel=2
_srcver=4051a7d08dc3a4ca90d9e8319d5a3a132793e1da
pkgdesc="Use jq programs from Varnish VCL"
arch=('x86_64')
url="https://github.com/varnishcache-friends/libvmod-jq"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'jq')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("libvmod-jq-$_srcver.tar.gz::https://github.com/varnishcache-friends/libvmod-jq/archive/${_srcver}.tar.gz")
sha512sums=('2d9e3827a33b19411d0ba0dd3366a94f8ece1ef5174e1648f3dab7c6ebbc186b840e92b929532dc7f5db9ad3d7dc7e3891f2f61c540c4c109a37a8eda095927c')

build() {
    cd "libvmod-jq-$_srcver"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib
    make
}

check() {
    cd "libvmod-jq-$_srcver"
    make check VERBOSE=1
}

package() {
    cd "libvmod-jq-$_srcver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
