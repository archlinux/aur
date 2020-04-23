# Maintainer: Alexey Andreyev <aa13q@ya.ru>
# Contributor Sefa Eyeoglu <contact@scrumplex.net>

pkgname=libquotient
pkgver=0.5.3
pkgrel=2
pkgdesc="A Qt5 library to write cross-platform clients for Matrix"
arch=(x86_64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2")
depends=("qt5-base" "qt5-multimedia")
optdepends=("qt5-olm")
makedepends=("git" "cmake" "make" "gcc")
provides=("libquotient")
conflicts=("libquotient")
source=("https://github.com/quotient-im/libQuotient/archive/${pkgver}.${pkgrel}.tar.gz")
sha512sums=("b887432ba7fb2b89c72ae5342fbd11b0066770851e8d0ea85ae4d6375bca726a5ee601c4f3d35a11fa1f2ef679ad5436917c08139e114f91516ccb370321e428")

build() {
    cd "$srcdir/libQuotient-${pkgver}.${pkgrel}/"
    mkdir -p "build"
    cd "build"
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1

    make
}

package() {
    cd "$srcdir/libQuotient-${pkgver}.${pkgrel}/"
    cd "build"
    make DESTDIR="${pkgdir}" install

    cd "$srcdir/libQuotient-${pkgver}.${pkgrel}/"
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
