# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Matthias Maennich < arch .at. maennich.net >
# Contributor: bruce < b_a_g99 .at. hotmail.com >
# Contributor: carstene1ns <arch carsten-teibes de>

pkgname=dropbox-cli
pkgver=2020.03.04
pkgrel=4
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
  "7889ce1d872bce85b3e94b929abacd6086e7f378644519fd8ebd8acf0316e59f"
  "fb862b534730f0765b4317ca5d0816f42d5a4be0018004c5b18fde63524fdb14"
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
