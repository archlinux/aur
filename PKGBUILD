# Maintainer: Alexey Andreyev <aa13q@ya.ru>
# Contributor Sefa Eyeoglu <contact@scrumplex.net>

pkgname=libquotient
_archivever=0.6-beta1
pkgver=0.6.beta1
pkgrel=1
pkgdesc="A Qt5 library to write cross-platform clients for Matrix"
arch=(x86_64)
url="https://github.com/quotient-im/libQuotient"
license=("LGPL2")
depends=("qt5-base" "qt5-multimedia")
optdepends=("qt5-olm")
makedepends=("git" "cmake" "make" "gcc")
provides=("libquotient")
conflicts=("libquotient")
source=("https://github.com/quotient-im/libQuotient/archive/${_archivever}.tar.gz")
sha512sums=("255560ee9a827ce140291859c9a7d11c718094b38a06e4555539aeda055daacd6a354e6685d67991fbbf2b407ab92b12986b854c27b81cfddb7b9b26c0e80e04")

build() {
    cd "$srcdir/libQuotient-${_archivever}/"
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
    cd "$srcdir/libQuotient-${_archivever}/"
    cd "build"
    make DESTDIR="${pkgdir}" install

    cd "$srcdir/libQuotient-${_archivever}/"
    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
