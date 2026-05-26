# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-jq
_vver=9.0.3
_vrel=2
_uver=4051a7d08dc3a4ca90d9e8319d5a3a132793e1da
pkgver=$_vver
pkgrel=$_vrel
pkgdesc="Use jq programs from Varnish VCL"
arch=('x86_64')
url="https://github.com/varnishcache-friends/libvmod-jq"
license=('BSD-2-Clause')
depends=("varnish=$_vver-$_vrel" 'jq')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("libvmod-jq-$_uver.tar.gz::https://github.com/varnishcache-friends/libvmod-jq/archive/${_uver}.tar.gz")
sha512sums=('2d9e3827a33b19411d0ba0dd3366a94f8ece1ef5174e1648f3dab7c6ebbc186b840e92b929532dc7f5db9ad3d7dc7e3891f2f61c540c4c109a37a8eda095927c')

build() {
    cd "libvmod-jq-$_uver"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib
    make
}

check() {
    cd "libvmod-jq-$_uver"
    make check VERBOSE=1
}

package() {
    cd "libvmod-jq-$_uver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
