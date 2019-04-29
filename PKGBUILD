# Maintainer: Daniel Gray <dng@disroot.org>
_libname=sejda
pkgname=java-${_libname}
pkgver=3.2.72
pkgrel=1
pkgdesc="An extendible and configurable PDF manipulation layer library written in java"
arch=('any')
url="https://github.com/torakiki/sejda"
license=('AGPL3')
depends=('java-runtime-headless')
makedepends=('maven')
checkdepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/torakiki/sejda/archive/v${pkgver}.tar.gz")
sha256sums=('f53415ad32a1c0ee962f708c047e5026443334b8ec70d898412dbf98278aae50')

build() {
    cd "${srcdir}/${_libname}-${pkgver}"
    mvn -Dmaven.repo.local="${_M2_REPO}" \
    clean \
    package \
    -Dmaven.test.skip=true
}

package() {
    install -Dm755 "${srcdir}/${_libname}-${pkgver}"/sejda-console/target/assembled/bin/sejda-console \
                    -t "${pkgdir}"/usr/bin

    install -Dm644 "${srcdir}/${_libname}-${pkgver}"/sejda-console/target/assembled/lib/*.jar \
                    -t "${pkgdir}"/usr/share/java/sejda

    install -Dm644 "${srcdir}/${_libname}-${pkgver}"/LICENSE \
                    "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
