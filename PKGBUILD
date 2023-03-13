# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Matthias Maennich < arch .at. maennich.net >
# Contributor: bruce < b_a_g99 .at. hotmail.com >
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=dropbox-cli
pkgver=2022.12.05
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
  "80170c4ab287e24dc131d32c237c2f44f811e33a393c32c32deae21875ad7894"
  "9ae702ebf0699ac56fbf99c577ddaf22701dfd1c9e40d6ec5ac56475c2636f48"
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
