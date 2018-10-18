# Maintainer: EHfive <eh5@sokka.cn>

pkgname=libldac
pkgver=2.0.2
pkgrel=1
pkgdesc="AOSP libldac dispatcher "
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/EHfive/ldacBT"
license=('Apache 2.0')
depends=()
makedepends=("cmake>=3.0" "make")
optdepends=()
provides=("ldacBT=2.0.2" "ldacBT_enc.so=2.0.2" "ldacBT_abr.so=2.0.2")
source=("https://github.com/EHfive/ldacBT/releases/download/1.0-ldac.2.0.2/ldacBT.tar.gz")

sha256sums=('c7e2c6a2310eca03fe53b5bc2898edf2fa6fd834887f51bd46a1871879bf4bdb')


build() {
    cd "$srcdir/ldacBT"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_LIBDIR=/usr/lib \
        -DLDAC_SOFT_FLOAT=OFF \
        .
    make
}

package() {
    cd "$srcdir/ldacBT"
    make DESTDIR="$pkgdir" install
}
