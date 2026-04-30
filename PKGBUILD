# Maintainer: fereira <eli@fereira.net>

_pkgname='jreleaser'
pkgname=${_pkgname}-bin
pkgver='1.24.0'
pkgrel='1'
pkgdesc='An automation tool for Java and non-Java projects for creating releases and publishing artifacts.'
url='https://github.com/jreleaser/jreleaser'
license=('Apache-2.0')
arch=('x86_64' 'aarch64')

depends=(
  'glibc'
  'zlib'
)
optdepends=(
  'docker: Release docker images'
)
makedepends=(
  'unzip'
)

conflicts=(${_pkgname})
provides=(${_pkgname})

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-native-${pkgver}-linux-x86_64.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-native-${pkgver}-linux-aarch64.zip")
sha256sums_x86_64=('fad440b3a7f745d1a3295078fa37648ca92db093d9927b5fb31619e6c5e8387d')
sha256sums_aarch64=('2ce61a77c2903f154dde827acc75c9b4292805d0ce73c372420133628922a8d6')

# validpgpkeys=('F1D5F6A91C86B0702CD0734BCCC55C5167419ADB') # Andres Almiray <aalmiray@gmail.com>

package() {
    cd "${srcdir}/${_pkgname}-native-${pkgver}-linux-${CARCH}" || exit

    install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/$pkgname/NOTICE"
}

