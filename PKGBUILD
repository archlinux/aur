# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=simplearchiver
pkgver=3.7.0
pkgrel=1
pkgdesc="An alternative to tar"
arch=(x86_64)
url="https://github.com/Stephen-Seo/SimpleArchiver"
license=('ISC')
depends=(libcap)
makedepends=(git cmake)
options=()
install=
changelog=
source=("${pkgname}::git+https://github.com/Stephen-Seo/SimpleArchiver.git#tag=${pkgver}")
sha256sums=('fabedcbc7d9c4d9364373ef911f1d03193d1e6603b42bdf33b26427891fa1116')

prepare() {
    cd "${pkgname}"
    cmake -S . -B BuildRel \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_WITH_DEBUGGING_INFO=On \
        -DSDSA_OVERRIDE_VERSION_STRING="${pkgver}-${pkgrel} (AUR)" \
        -DENABLE_LIBCAP=On
}

build() {
    make -C "${pkgname}/BuildRel"
}

check() {
    "${pkgname}/BuildRel/test_datastructures"
    "${pkgname}/BuildRel/test_simplearchiver"
}

package() {
    install -D -m 755 "${pkgname}/BuildRel/simplearchiver" "${pkgdir}/usr/bin/simplearchiver"
    install -D -m 644 "${pkgname}/man/simplearchiver.1" "${pkgdir}/usr/share/man/man1/simplearchiver.1"
}
