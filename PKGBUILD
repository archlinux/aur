# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Matthias Maennich < arch .at. maennich.net >
# Contributor: bruce < b_a_g99 .at. hotmail.com >
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=dropbox-cli
pkgver=2023.09.06
pkgrel=1
pkgdesc="Command line interface for Dropbox"
arch=("any")
url="http://www.${pkgname%-cli}.com"
license=("GPL")
depends=("${pkgname%-cli}" "python-gobject")
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.py::https://linux.${pkgname%-cli}.com/packages/${pkgname%-cli}.py"
  "${pkgname%-cli}d-fallback.patch"
)
sha256sums=(
  "a7334c5003287d6bc94c59bfbd9a9b2e9e82047c8b35732c739f8cb4ecfeedbc"
  "3e4f5d44c58dbeb586bb9539551ea1206e8a1e4b025ac316c42ba24c53c8f077"
)

prepare() {
  cp -L "${srcdir}/${pkgname}-${pkgver}.py" "${srcdir}/${pkgname}.py"

  # Patch to point to /opt/dropbox/dropboxd in case of local user does not exist
  patch -Np1 -i "${srcdir}/${pkgname%-cli}d-fallback.patch"
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.py" "${pkgdir}/usr/share/${pkgname}/${pkgname}.py"
  ln -s "/usr/share/${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
