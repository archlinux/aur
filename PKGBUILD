# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_binary=wttr
_pkgauthor=cblte
_pkgname=bash-script-wttr
pkgname=${_binary}-cli
pkgver=1.55
pkgrel=1
pkgdesc='A simple script that checks the weather condition via http://wttr.in'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('any')
license=('MIT')
depends=('bash')
conflicts=("${_binary}")
provides=("${_binary}")
source=("${_binary}-${pkgver}::${_urlraw}/${_binary}"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        version.patch)
sha256sums=('9dd35683651f36d9ea59a89d6d08c45017bec824821deda5f185194dfd981ad4'
            'fd24b2aa3c89ba7d17bebf5a00347c9620d26dd4cd57b3288c51aa4624a3f1ca'
            'e2583226c314583e7aef2e67b7d7866111880ca08bd374ffb88d35d36d58b280'
            'e3042bcac1c61ff13d473e88f7fefc1ab196bd408a1fa1da3123a1ea315f61cc')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_binary}-${pkgver}" "${pkgdir}/usr/bin/${_binary}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  patch "${pkgdir}/usr/bin/${_binary}" < version.patch
}
