# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-jq
pkgver=9.1.0
pkgrel=2
_srcver=d117ed322d75c06d40324180746f6973b99424b3
pkgdesc="Use jq programs from Varnish VCL"
arch=('x86_64')
url="https://github.com/varnishcache-friends/libvmod-jq"
license=('BSD-2-Clause')
depends=("varnish=$pkgver-$pkgrel" 'jq')
makedepends=('autoconf' 'automake' 'libtool' 'autoconf-archive' 'pkg-config' 'python-docutils')
source=("libvmod-jq-$_srcver.tar.gz::https://github.com/varnishcache-friends/libvmod-jq/archive/${_srcver}.tar.gz")
sha512sums=('54d2320279074c0e6698d6e293228718254bdccfdcff76357054ececf5a298666397bc8c28f48581cd6d1ba4ee99db7c8d873ce0126149b4ec5408a02f873aae')

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
