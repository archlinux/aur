# Maintainer: Amin Vakil <info at aminvakil dot com>

_pkgname=tsunami-security-scanner
pkgname=google-tsunami-security-scanner
pkgver=0.0.1
pkgrel=1
pkgdesc="A general purpose network security scanner with an extensible plugin system for detecting high severity vulnerabilities with high confidence"
arch=(any)
url="https://github.com/google/tsunami-security-scanner"
license=('Apache')
depends=('nmap>=7.80' 'ncrack>=0.7' 'jdk11-openjdk') 
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
	)

sha256sums=('33162b9dc6e93504f7875b833847b775d2cf0f3da4ea45c36bb86a95a5a8eeef')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    ./gradlew shadowJar
}
package() {
    bindir="${pkgdir}/usr/bin"
    appdir="${pkgdir}/opt/${pkgname}"
    jar=$(find ${srcdir} -name 'tsunami-main-*-cli.jar')
    jar_filename=$(basename -- "${jar}")

    install -t "${appdir}/Bin" -Dm755 ${jar}
    mkdir -p "${bindir}"
    ln -s /opt/${pkgname}/Bin/${jar_filename} "${bindir}"/${_pkgname}
}
