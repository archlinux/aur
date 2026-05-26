# Maintainer: Guillaume Quintard <guillaume.quintard@varnish-software.com>

pkgname=vmod-querystring
_vver=9.0.3
_vrel=2
_uver=2.0.4
pkgver=$_vver
pkgrel=$_vrel
pkgdesc="QueryString module for Varnish Cache"
arch=('x86_64')
url="https://github.com/Dridi/libvmod-querystring"
license=('GPL-3.0-or-later')
depends=("varnish=$_vver-$_vrel")
makedepends=('pkg-config' 'python-docutils')
source=("$pkgname-$_uver.tar.gz::https://git.sr.ht/~dridi/vmod-querystring/refs/download/vmod-querystring-${_uver}/vmod-querystring-${_uver}.tar.gz")
sha512sums=('609e333279f761e4bb4867f4541003eccf71df06ff4631834e66f3b384d49e1e66dd7fa7ff500717b4a7db215838418f05406a431d19af7e03a61321646422cf')

build() {
    cd "$pkgname-$_uver"
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var/lib
    make
}

check() {
    cd "$pkgname-$_uver"
    make check VERBOSE=1
}

package() {
    cd "$pkgname-$_uver"
    make DESTDIR="$pkgdir" install
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
