# Maintainer: yuf <yuf at yufarch dot com>

pkgname='siki'
pkgver=0.34.0
pkgrel=1
pkgdesc='An Electrom-based application for browsing and posting to message boards'
arch=('x86_64')
url='https://sikiapp.net'
license=('MIT')
depends=(
  'gtk3'
  'at-spi2-core'
  'nspr'
  'nss'
  'alsa-lib'
)
options=(!strip)
source=("${pkgname}-${pkgver}-amd64.deb::${url}/archives/${pkgver}/Siki-${pkgver}-amd64.deb")
sha512sums=('1083d83dfa9646d4d84dccdfa07dd81dc188cd3932ba020f6167ed14504861aff1c780f4b64ea5e99e8733e9e70ab50e3fde1bc061a8ef1c7d273a6ae54b5e97')

package() {
  # Extract data.tar.xz
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Make a symlink to executable
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/Siki/siki" "${pkgdir}/usr/bin"

  # Install licenses
  _copyright=$(curl -sL ${url}/license | sed -n 's/<p>\(Copyright.*\)<\/p>/\1/p')
  sed "1i ${_copyright}\n" "${pkgdir}"/opt/Siki/LICENSE.electron.txt >LICENSE
  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -Dm644 "${pkgdir}"/opt/Siki/LICENSES.chromium.html -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
