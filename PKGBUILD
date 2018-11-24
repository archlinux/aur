# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Matthias Maennich < arch .at. maennich.net >
# Contributor: bruce < b_a_g99 .at. hotmail.com >
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=dropbox-cli
pkgver=2018.11.08
pkgrel=1
pkgdesc="Command line interface for Dropbox"
arch=("any")
url="http://www.${pkgname%-cli}.com"
license=("GPL")
depends=("${pkgname%-cli}" "python2")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.py::https://linux.${pkgname%-cli}.com/packages/${pkgname%-cli}.py"
        "${pkgname}.patch")
sha256sums=("5441fae95e1028cf2a7e10dd9b4f45bd7a181ddc5a35b4cdd108bd4b879bec04"
            "63c653b19dd8ec1c72d4debcaded8be1c996effb79b1372ca0fb7bb24a8a2c1e")

prepare() {
  cd "${srcdir}"
  cp -L "${srcdir}/${pkgname}-${pkgver}.py" "${srcdir}/${pkgname}.py"
  patch -i "${srcdir}/${pkgname}.patch"
}

package() {
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.py" "${pkgdir}/usr/share/${pkgname}/${pkgname}.py"
  ln -s "/usr/share/${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
