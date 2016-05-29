#Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=lxqt_wallet
pkgver=2.2.1
pkgrel=1
pkgdesc="Secure storage of information for lxqt"
arch=("i686" "x86_64")
url="https://github.com/mhogomchungu/lxqt_wallet"
license=("BSD")
depends=("libgcrypt")
optdepends=("kwallet: store passwords in kwallet"
            "libsecret: store passwords in GNOME's secret service")
makedepends=("cmake" "qt5-base" "kwallet" "libsecret")
source=("https://github.com/mhogomchungu/lxqt_wallet/releases/download/${pkgver}/lxqt_wallet-${pkgver}.tar.xz")
sha256sums=('11f3aade41b45fcf080846e05b4642dc938a09355ffff0fe14a600b3e5eeb251')

build() {
    mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELEASE  \
        -DQT5=true \
        -DNOSECRETSUPPORT=false \
        -DNOKDESUPPORT=false \
        -DLIB_SUFFIX=lib \
        "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
