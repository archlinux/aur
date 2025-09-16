# Maintainer: fenuks

_pkgname=lombok
pkgname=java-${_pkgname}
pkgver=1.18.40
pkgrel=1
pkgdesc="Project Lombok is a java library that automatically plugs into your editor and build tools, spicing up your java."
arch=("any")
url="https://projectlombok.org"
license=("MIT")
depends=("java-runtime")
optdepends=()
makedepends=("java-runtime")
provides=("${pkgname}")
conflicts=("${pkgname}")
# install=$pkgname.install
_filename=${_pkgname}-${pkgver}.jar
source=("${_filename}::https://projectlombok.org/downloads/lombok-${pkgver}.jar")

sha256sums=('1b2d6609ff332e7082fed397b3aaa5d125812f7bf0a07a7d86ffea15b71cbfdd')

build() {
    cd "${srcdir}"
    java -jar "${_filename}" publicApi
    java -jar "${_filename}" createRuntime -c
}

package() {
    cd "${srcdir}"
    install -Dm644 "${_filename}" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
    install -Dm644 lombok-api.jar "${pkgdir}/usr/share/java/${_pkgname}/"
    install -Dm644 lombok-runtime.jar "${pkgdir}/usr/share/java/${_pkgname}/"
}
