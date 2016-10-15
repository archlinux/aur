# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=cpuminer-xzc-git
pkgver=4.8212d77
pkgrel=1
pkgdesc='CPUMiner for ZCOIN (XZC)'
arch=('any')
url='https://github.com/ocminer/cpuminer-xzc'
license=('GPL2')
depends=('libcurl-gnutls' 'openssl' 'zlib')
provides=('cpuminer')
conflicts=('cpuminer')
source=("$pkgname::git+https://github.com/ocminer/cpuminer-xzc.git"
        "$pkgname.patch")
md5sums=('SKIP'
         '834658714fab7b194ef491f1dfc904bd')

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "$pkgname"
    patch -Np1 -i "$srcdir/$pkgname.patch"
}

build() {
    cd "$pkgname"
    ./build.sh
    ./configure --prefix=/usr
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
