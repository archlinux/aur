# Maintainer: Konstantin Nisht <zeron DOT n1 AT yandex DOT ru>
pkgname=arend
pkgver=1.5.0
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
sha512sums=(7646fee259aa3d2deb1e129be3efa136b6b9581892921d68ce359ca6f9e240e700dae35b9a4539dae61c18971ba4d77c7fbb62ffa7f9e73771472b2517b3029b
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
    ln -s "/usr/share/${pkgname}/bin/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}" 
}

