# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=VHSgunzo
_pkgname=sharun
pkgname=${_pkgname}-bin
pkgver=0.8.1
pkgrel=2
pkgdesc='Run dynamically linked ELF binaries everywhere'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64' 'aarch64')
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('patchelf' 'strace')

options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}")
sha256sums=('ed1795c447be9b4ae96262f583b559f733a82f627b0265f860f22488c7f8b2ff'
            '45dcc425cfa4879c1473f09ca681ecea1cd99b5bcf926770116926c833418a63')
sha256sums_x86_64=('18d970f56eca2c527ffd3993b161b6bc340055129db14b394a77cb67d8bbfff9')
sha256sums_aarch64=('36a0d16e9d6085e0f11a3e3f76727a0a14aee44ef8e626a76a99555f4da541dc')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
