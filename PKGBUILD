# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
pkgname=libquotient
pkgver=0.5.2
pkgrel=4
pkgdesc="A Qt5 library to write cross-platform clients for Matrix"
arch=(x86_64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2")
depends=("qt5-base" "qt5-multimedia")
makedepends=("git" "cmake" "make" "gcc")
provides=("libquotient")
conflicts=("libquotient")
source=("${pkgname}::git+https://github.com/quotient-im/libQuotient.git#tag=${pkgver}")
sha512sums=("SKIP")


prepare() {
    mkdir -p "$srcdir/build"
}

build() {
    cd "$srcdir/build"
    cmake ../${pkgname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DQMATRIXCLIENT_INSTALL_EXAMPLE=0

    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="${pkgdir}" install

    cd "$srcdir/${pkgname}"
    install -Dm 644 "examples/qmc-example.cpp" "${pkgdir}/usr/share/doc/${pkgname}/qmc-example.cpp"
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
