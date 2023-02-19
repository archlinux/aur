# Maintainer : Nicolas Perrin <booloki@lokizone.net>

pkgname=ccextractor-gui-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="CCExtractor flutter GUI (binary)."
arch=('x86_64')
url="https://ccextractor.org/public/general/flutter_gui/"
license=('MIT')
depends=('gtk3' 'ccextractor')
conflicts=('ccextractor-gui')
replaces=('ccextractor-gui')
source=(
        https://github.com/CCExtractor/ccextractorfluttergui/releases/download/v$pkgver/linux.zip
        ccextractor-gui.desktop
)
sha512sums=('69619dff1eacaff30eb35da3e9f40878e2ac5d3738c0774bc18da87700769054ecbef9beae13a940e2330bb9d293278b3dae3f835de602b2b11bb62f508ac224'
            'f068beb0b6e76897c3bad91d3621e05cf266a23e891f03c4613b69bfc9c3b932121989ce47459f326e437fddcac1e891a9b53fd8ad2f20f9fbc13afe859dcc91')

package() {
  # /opt
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -ra "${srcdir}/"{data,lib,ccxgui} "${pkgdir}/opt/${pkgname}"
  chmod a+rx "${pkgdir}/opt/${pkgname}/ccxgui"
  rm "${pkgdir}/opt/${pkgname}/data/flutter_assets/assets/ccextractor"

  # executable binary
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/ccxgui" "${pkgdir}/usr/bin/ccxgui"

  # icon
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/data/flutter_assets/assets/ccx.svg" "${pkgdir}/usr/share/pixmaps/ccx.svg"

  # desktop entry
  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 ccextractor-gui.desktop "${pkgdir}/usr/share/applications/"
}

# vim:set ts=2 sw=2 et:
