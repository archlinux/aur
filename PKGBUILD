# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=lxqt_wallet
pkgver=3.1.0
pkgrel=1
pkgdesc="Secure storage of information for lxqt"
arch=("i686" "x86_64")
url="https://github.com/mhogomchungu/lxqt_wallet"
license=("BSD")
depends=("libgcrypt")
optdepends=("kwallet: store passwords in kwallet"
            "libsecret: store passwords in GNOME's secret service")
makedepends=("cmake" "qt5-base" "kwallet" "libsecret" "qt5-tools")
source=("https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
sha256sums=("SKIP" "SKIP")
validpgpkeys=("3AD67A14194FE8E7AEFCA19C3E1F380427A5D3CA")

build() {
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release  \
        -DNOSECRETSUPPORT=false \
        -DNOKDESUPPORT=false \
        -DCMAKE_INSTALL_LIBDIR=lib \
        "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
