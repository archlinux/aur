# Maintainer: Radon Rosborough <radon@beeper.com>

_pkgname=executor
_author=raujonas
_extname="${_pkgname}@${_author}.github.io"

pkgname="gnome-shell-extension-${_pkgname}"
pkgver=30
pkgrel=1
pkgdesc='Execute multiple shell commands periodically with separate intervals and display the output in gnome top bar'
arch=('any')
url="https://github.com/${_author}/${_pkgname}"
# what is the license? https://github.com/raujonas/executor/issues/100
# license=('')
depends=('gnome-shell')
source=("${_pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_extname}")
sha256sums=('0a855c5a35309a1220e40cf8ee0e3b76fb5364ae5e6fc267daa03e25c038551c')
noextract=("${_pkgname}-${pkgver}.zip")

prepare() {
  rm -rf "${_pkgname}-${pkgver}"
  unzip -d "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}.zip"
}

package() {
  cd "${_pkgname}-${pkgver}"

  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  install -Dm644 -t "${_destdir}" *.css *.js *.json
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
  cp -R locale "${pkgdir}/usr/share/"
  # install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
