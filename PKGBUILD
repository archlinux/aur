# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clai"
pkgname="${_pkgname}-bin"
pkgver=1.12.0
pkgrel=1
pkgdesc="Command line artificial intelligence - Your local LLM context-feeder"

url="https://github.com/baalimago/${_pkgname}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=('glibc')
optdepends=('glow: for formatted markdown output when querying text responses')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

_pkgsrc="${_pkgname}-${pkgver}"

source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-EXAMPLES.md::${url}/raw/refs/tags/v${pkgver}/examples.md"
        "${_pkgsrc}-PROFILES-CODY.json::${url}/raw/refs/tags/v${pkgver}/examples/profiles/cody.json"
        "${_pkgsrc}-PROFILES-GOPHER.json::${url}/raw/refs/tags/v${pkgver}/examples/profiles/gopher.json"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64")
source_i686=("${_pkgsrc}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-386")
source_aarch64=("${_pkgsrc}-${arch[2]}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64")
sha256sums=('05f71d7ce9e95a83906d5b585a4139a52f89e8e0a703eecbd78a6014c44cb331'
            '2a6699c04e7a0a23b100aedab8cd93428b2957e3b381f0c0333415c82ff9877a'
            '81abc6b6ae091984b5defa45e236462099a0f95afd211b5a39c7b70c8926decb'
            '824075343fe6b2f0bda7a627bec99f826e86571fee6c393812315f265d82a741'
            'bc5378230a80daace8ac9ea68f538fb33997fd2abf0fa5d91905365b6b8924dc')
sha256sums_x86_64=('36ce0394f167f4ae522920fcb447d4e6dac1ddddfc8bf02e38063aad7fd460b2')
sha256sums_i686=('d78e699138797ed0d0a02f787b72d4950f38db996ccf3ff3ac083d9dd5999b01')
sha256sums_aarch64=('36ce0394f167f4ae522920fcb447d4e6dac1ddddfc8bf02e38063aad7fd460b2')

package() {
  cd "${srcdir}"

  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-EXAMPLES.md" "${pkgdir}/usr/share/doc/${pkgname}/EXAMPLES.md"
  install -vDm644 "${_pkgsrc}-PROFILES-CODY.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-CODY.json"
  install -vDm644 "${_pkgsrc}-PROFILES-GOPHER.json" "${pkgdir}/usr/share/doc/${pkgname}/PROFILES-GOPHER.json"

  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

