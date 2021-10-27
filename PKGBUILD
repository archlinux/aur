# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=java-r5rcore
pkgver=0.6.0
pkgrel=1

pkgdesc="Rapid Realistic Routing with 'R5' (java engine for R package)"
url="https://github.com/ipeaGIT/r5r"
license=("MIT")

arch=("i686" "x86_64")

depends=("jdk11-openjdk" "java-r5" "java-environment")
makedepends=("git")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ipeaGIT/r5r/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("ac4792af61f939a91265288c40eaca759b3d9e333537d5965242fd182818120b4c3c7221fbb87ae8a75c8c554e5d3990f9a3378ad6d85147c6995a74c87977e0")

build() {
    cd "r5r-${pkgver}/${pkgname}"

    javac \
        --class-path=/usr/share/java/r5/r5-all.jar \
        -d lib \
        $(find src -name "*.java")

    cd lib
    jar \
        -cf ../${pkgname}.jar \
        $(find . -name "*.class")
}

package() {
    cd "r5r-${pkgver}"

    install \
        -Dm0644 \
        "${pkgname}/${pkgname}.jar" \
        "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

    install \
        -Dm0644 \
        LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
