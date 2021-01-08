# Maintainer: Amin Vakil <info at aminvakil dot com>

_pkgname=tsunami-security-scanner
pkgname=google-tsunami-security-scanner-git
pkgver=r24.c157f24
pkgrel=1
pkgdesc="A general purpose network security scanner with an extensible plugin system for detecting high severity vulnerabilities with high confidence"
arch=(any)
conflicts=('google-tsunami-security-scanner')
url="https://github.com/google/tsunami-security-scanner"
license=('Apache')
makedepends=("git")
depends=('nmap>=7.80' 'ncrack>=0.7' 'java-runtime<12')
source=("git+${url}.git")

sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_pkgname}
    ./gradlew shadowJar
}
package() {
    appdir="${pkgdir}/opt/${_pkgname}"
    jar=$(find ${srcdir} -name 'tsunami-main-*-cli.jar')
    jar_filename=$(basename -- "${jar}")

    mkdir -p "${appdir}"
    install ${jar} "${appdir}/${jar_filename}"
    install "${srcdir}/${_pkgname}/tsunami.yaml" "${appdir}"
}
