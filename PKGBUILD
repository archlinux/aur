# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.1.9
pkgrel=1
pkgdesc="A Linux client for Slack"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('python-dbus' 'python-pyqt4')
install=${pkgname}.install
source=("https://github.com/raelgc/scudcloud/archive/v${pkgver}.tar.gz")
sha256sums=('ae7d7c18ade718118636a703f1c3291dbb21af76bce10acf0bd09c7950784cc0')

package() {
  cd "${pkgname}-${pkgver}/scudcloud-${pkgver:0:3}"

  install -d "${pkgdir}/opt/${pkgname}" \
             "${pkgdir}/opt/${pkgname}/lib" \
             "${pkgdir}/opt/${pkgname}/resources" \
             "${pkgdir}/usr/bin" \
             "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
             "${pkgdir}/usr/share/icons/mono-dark/scalable/apps" \
             "${pkgdir}/usr/share/icons/mono-light/scalable/apps"

  install -Dm644 lib/*.py "${pkgdir}/opt/${pkgname}/lib"
  install -Dm644 resources/* "${pkgdir}/opt/${pkgname}/resources/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 ${pkgname}.desktop \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 systray/hicolor/* \
                 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

  install -Dm644 systray/mono-dark/* \
                 "${pkgdir}/usr/share/icons/mono-dark/scalable/apps"

  install -Dm644 systray/mono-light/* \
                 "${pkgdir}/usr/share/icons/mono-light/scalable/apps"

  install -Dm755 "${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}" \
        "${pkgdir}/usr/bin/${pkgname}"
}
