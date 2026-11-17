# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgexec=mdedup
_pkgauthor=kdeldycke
_pkgname=mail-deduplicate
pkgname=${_pkgname}-bin
pkgver=9.7.1
pkgrel=1
pkgdesc='CLI to deduplicate mails from mail boxes'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('GPL-2.0-or-later')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgexec}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/license"
        "README-${pkgver}.md::${_urlraw}/readme.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/changelog.md")
source_x86_64=("${_pkgexec}-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgexec}-linux-x64.bin")
source_aarch64=("${_pkgexec}-${pkgver}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgexec}-linux-arm64.bin")
sha256sums=('8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            'c25019e1a51096a8dff4eb096f1d78d1edd750e053b870d9fd3b71b46b06b6d2'
            '8bd4d82b8ee3d31c31b63c85e2e95ba45d646e057d3107abaf83eea2390e2790')
sha256sums_x86_64=('baaacbf457ef08f00307edcbb62302deb0134ccc813e33c1c0da1d1525f725f2')
sha256sums_aarch64=('fb06fdef61745bebc26d6fa9d7c334dd2f6eb63266bb027480b85b486f2a2328')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
