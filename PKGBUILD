# Maintainer: fenuks

_pkgname=lombok
pkgname=java-${_pkgname}
pkgver=1.18.0
pkgrel=1
pkgdesc="Project Lombok is a java library that automatically plugs into your editor and build tools, spicing up your java."
arch=("any")
url="https://github.com/rzwitserloot/lombok"
license=("MIT")
depends=("java-runtime")
optdepends=()
makedepends=("java-runtime")
provides=("${pkgname}")
conflicts=("${pkgname}")
# install=$pkgname.install
_filename=${_pkgname}-${pkgver}.jar
source=("${_filename}::https://projectlombok.org/downloads/lombok.jar")

sha256sums=('88ed9af526d13a84361cbe1216f815ee78c82c342618ea1a48b6de1acbb9d2b4')

build() {
    cd "${srcdir}"
    java -jar ${_filename} publicApi
    java -jar ${_filename} createRuntime -c
}

package() {
    cd "${srcdir}"
    install -Dm644 ${_filename} "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -Dm644 lombok-api.jar "${pkgdir}/usr/share/java/${_pkgname}/"
    install -Dm644 lombok-runtime.jar "${pkgdir}/usr/share/java/${_pkgname}/"
}
