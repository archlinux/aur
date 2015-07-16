# Maintainer: Michael Herold <arch@michaeljherold.com>

_pkgname=scudcloud
pkgname=${_pkgname}-git
pkgver=v1.0.50.r0.g89c0291
pkgrel=1
pkgdesc="A Linux client for Slack"
arch=('any')
url="https://github.com/raelgc/${_pkgname}"
license=('MIT')
depends=('python-dbus' 'python-pyqt4')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install=${_pkgname}.install
source=("git://github.com/raelgc/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}/scudcloud-1.0"

  install -d "${pkgdir}/opt/${_pkgname}" \
             "${pkgdir}/opt/${_pkgname}/lib" \
             "${pkgdir}/opt/${_pkgname}/resources" \
             "${pkgdir}/usr/bin" \
             "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
             "${pkgdir}/usr/share/icons/mono-dark/scalable/apps" \
             "${pkgdir}/usr/share/icons/mono-light/scalable/apps"

  install -Dm644 lib/*.py "${pkgdir}/opt/${_pkgname}/lib"
  install -Dm644 resources/* "${pkgdir}/opt/${_pkgname}/resources/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -Dm644 ${_pkgname}.desktop \
                 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -Dm644 systray/hicolor/* \
                 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

  install -Dm644 systray/mono-dark/* \
                 "${pkgdir}/usr/share/icons/mono-dark/scalable/apps"

  install -Dm644 systray/mono-light/* \
                 "${pkgdir}/usr/share/icons/mono-light/scalable/apps"

  install -Dm755 "${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"

  ln -s "/opt/${_pkgname}/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"
}
