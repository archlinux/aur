#Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=lxqt_wallet
pkgver=2.1.0
pkgrel=1
pkgdesc="Secure storage of information for lxqt"
arch=("i686" "x86_64")
url="https://github.com/mhogomchungu/lxqt_wallet"
license=("BSD")
depends=("libgcrypt")
makedepends=("cmake" "qt4")
source=("https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/lxqt_wallet-${pkgver}.tar.xz")
sha256sums=('2ea48986791d71bec488356afb6beb8c2d3efd4032cfc63fdc91a192f64d3fb2')

build() {
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE -DNOKDESUPPORT=true -DNOSECRETSUPPORT=true "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
