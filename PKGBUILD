# Maintainer: fereira <eli@fereira.net>

_pkgname='jreleaser'
pkgname=${_pkgname}-bin
pkgver='1.23.0'
pkgrel='3'
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
sha256sums_x86_64=('0cecc7d88a1645c6b3350e755f618fc8a2a507187012a2f265f6c0880a178ef5')
sha256sums_aarch64=('e597095746e53a2e69681ee8c1e8e8b8548ced186a3241f9ef2707f8cde033e5')

# validpgpkeys=('F1D5F6A91C86B0702CD0734BCCC55C5167419ADB') # Andres Almiray <aalmiray@gmail.com>

package() {
    cd "${srcdir}/${_pkgname}-native-${pkgver}-linux-${CARCH}" || exit

    install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/$pkgname/NOTICE"
}

