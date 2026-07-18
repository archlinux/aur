# Maintainer: rayman1972 <https://github.com/rayman1972>
# AUR package for kAppIcon — install system-wide under /usr

pkgname=kappicon
pkgver=3.0.0
pkgrel=1
pkgdesc='Change Linux app launcher icons without root (GUI + CLI)'
arch=('any')
url='https://github.com/rayman1972/kappicon'
license=('MIT')
depends=(
  'python'
  'python-pyqt6'
  'imagemagick'
  'libicns'
  'fzf'
)
optdepends=(
  'kdialog: optional KDE desktop notifications'
)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('778069b777d764ede710de1e5d52ed2748cd00f29981fc691fbb287527d76747')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Binaries (GUI + CLI)
  install -Dm755 gui/kappicon "${pkgdir}/usr/bin/kappicon"
  install -Dm755 cli/kappicon-cli "${pkgdir}/usr/bin/kappicon-cli"

  # Desktop launcher (GUI only)
  install -Dm644 gui/kappicon.desktop \
    "${pkgdir}/usr/share/applications/kappicon.desktop"

  # App icon (hicolor + pixmaps fallback)
  install -Dm644 assets/kappicon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kappicon.png"
  install -Dm644 assets/kappicon.png \
    "${pkgdir}/usr/share/pixmaps/kappicon.png"

  # Docs & license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 VERSION "${pkgdir}/usr/share/doc/${pkgname}/VERSION"
}
