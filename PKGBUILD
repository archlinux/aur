# Maintainer: kevku <kevku@gmx.com>
pkgname=libdigidocpp
pkgver=3.13.6.1371
pkgrel=2
pkgdesc="Library for creating, signing and verification of digitally signed documents, according to XAdES and XML-DSIG standards"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL')
depends=('xml-security-c-ria')
makedepends=('cmake' 'xsd>=4.0' 'xxd')
source=("https://installer.id.ee/media/ubuntu/pool/main/libd/$pkgname/${pkgname}_$pkgver.orig.tar.xz")
sha256sums=('00cd5b428b3e2828d0bfe11f26eb0994a9e8f24fb03222e1a6a69f3321f996ba')

prepare() {
    [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
    mkdir "$pkgname-build"
}

build() {
    cd "$pkgname-build"
    cmake .. -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
             -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
             -DCMAKE_INSTALL_PREFIX="/usr" \
             -DCMAKE_INSTALL_LIBDIR="lib" \
             -DCMAKE_INSTALL_SYSCONFDIR="/etc" \
             -DSWIG_EXECUTABLE="" \
             -DBoost_INCLUDE_DIR="" \
             -DMINIZIP_INCLUDE_DIR="" \
             -DPODOFO_INCLUDE_DIR="" \
             -DLIBDIGIDOC_INCLUDE_DIR=""
    make
}

package() {
    cd "$pkgname-build"
    make DESTDIR="$pkgdir/" install
}
