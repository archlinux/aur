# Maintainer: yuf <yuf at yufarch dot com>

pkgname='siki'
pkgver=0.33.14
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
sha512sums=('1d3816dae049b042ce152cb11f37ddfba9eda858fb5b3397dab5f09c4b13a80548ccb65a4a5435ae0aa02b84d6d48acb565fb46a8733e69eba7ded7624340646')

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
