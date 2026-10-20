# Maintainer: Stephen Seo <seo.disparate@gmail.com>
pkgname=simplearchiver
pkgver=4.1.0
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
sha256sums=('31d266eae2442cdb5bc8fdaa8cda2322e076b704e99625390a5420ec0e5c8aa2')

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
