# Maintainer: Alexey Andreyev <aa13q@ya.ru>
# Contributor Sefa Eyeoglu <contact@scrumplex.net>

_prjname=libQuotient
pkgname=${_prjname,,}
pkgver=0.6.2
pkgrel=1
epoch=1
pkgdesc="A Qt5 library to write cross-platform clients for Matrix"
arch=(x86_64 aarch64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2")
depends=("qt5-base" "qt5-multimedia")
optdepends=("qt5-olm")
makedepends=("git" "cmake" "make" "gcc")
provides=("libquotient")
conflicts=("libquotient")
source=("https://github.com/quotient-im/libQuotient/archive/${pkgver}.tar.gz")
sha512sums=("6388b142675b1f11864c8f0388b0039311a6306feeb6e053060b0ccc737e4e3f97698268314d8802cac2402ea5f2b90a3fce5a10c4966b98e67c7d97bb2b39db")

build() {
    cd "$srcdir/${_prjname}-${pkgver}"
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
    cd "$srcdir/${_prjname}-${pkgver}"
    cd "build"
    make DESTDIR="${pkgdir}" install

    cd "$srcdir/${_prjname}-${pkgver}"
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
