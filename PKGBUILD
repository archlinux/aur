# Maintainer: yuf <yuf at yufarch dot com>

pkgname='siki'
pkgver=0.33.4
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
sha512sums=('8042695c91869caaf24f07a9cdb078f020072d7830cb8a2ec6453f099d7d09b33726acf529386918cc22d630c9327b784751a7560dffd3467b5d784b8632257d')

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
