# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
pkgname=libquotient
pkgver=0.5.2
pkgrel=1
pkgdesc="A Qt5 library to write cross-platform clients for Matrix"
arch=(x86_64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2")
depends=("qt5-base" "qt5-multimedia")
makedepends=("git" "cmake")
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
        -DCMAKE_BUILD_TYPE=Release \
        -DQMATRIXCLIENT_INSTALL_EXAMPLE=false

    cmake --build . --target all
}

package() {
    cd "$srcdir/build"
    cmake --build . --target install -- DESTDIR="${pkgdir}"

    cd "$srcdir/${pkgname}"
    install -dm 644 "examples/qmc-example.cpp" "${pkgdir}/usr/share/doc/${pkgname}/qmc-example.cpp"
    install -dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -dm 644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
}
