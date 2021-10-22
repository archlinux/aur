# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=java-r5rcore
pkgver=0.5.0
pkgrel=3

pkgdesc="Rapid Realistic Routing with 'R5' (java engine for R package)"
url="https://github.com/ipeaGIT/r5r"
license=("MIT")

arch=("i686" "x86_64")

depends=("jdk11-openjdk" "java-r5" "java-environment")
makedepends=("gradle" "git")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ipeaGIT/r5r/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("c8d4b003de55aa48b8a7f3d50cc265a0462ab2789c194c9d95e3cac3158fa793060da48d5310046220c889b6321e0d6e45d6757cda95748a7aa4e3d5422a49bd")

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
