# Contributor: Bas Bleeker <bubbel@kpnplanet.nl>

pkgname=fping-git
pkgver=5.3.r1.g511aa37
pkgrel=1
pkgdesc="A utility to ping multiple hosts at once - development version"
arch=(x86_64)
url="https://www.fping.org/"
license=('BSD-4.3TAHOE')
depends=('glibc')
makedepends=('git')
provides=('fping')
conflicts=('fping')
source=("$pkgname"::'git+https://github.com/schweikert/fping.git#branch=develop')
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd "${pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin \
         --mandir=/usr/share/man \
         --enable-ipv4 \
         --enable-ipv6
    make
}

check() {
    cd "${pkgname}"
    make -k check
}

package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
