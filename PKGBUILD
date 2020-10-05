# Maintainer: Konstantin Nisht <zeron DOT n1 AT yandex DOT ru>
pkgname=arend
pkgver=1.4.1
pkgrel=1
pkgdesc="Proof assistant based on Homotopy Type Theory"
arch=(x86_64)
url="https://arend-lang.github.io/"
license=('Apache')
groups=()
depends=('java-environment')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("https://github.com/JetBrains/Arend/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh")
noextract=()
sha512sums=(94f0995ae2b7b0b7560d99a75dd23c3fb9825107aea342f3b82248cce9a0957c8531130335977f7571aca5f492783c7ecbc0a7646e1198ddd3a4082f07436a21
            4668958c7d98aa241260b8cf87ce0b6710050c2915ad8cbf24d285adbee0c782320c6ac5f5fe90cb7886dc0386f9d13492e571eb3a63998106bc5c982ec8711a)

build() {
    cd "Arend-${pkgver}"
    ./gradlew :cli:jarDep
}

package() {
    install -d "${pkgdir}/usr/share/${pkgname}/bin"
    install -d "${pkgdir}/usr/bin/"
    install -Dm 644 "Arend-${pkgver}/cli/build/libs/cli-${pkgver}-full.jar" "${pkgdir}/usr/share/${pkgname}/bin/Arend.jar"
    install -Dm 755 arend.sh "${pkgdir}/usr/share/${pkgname}/bin"
    ln -s "${pkgdir}/usr/share/${pkgname}/bin/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}" 
}

