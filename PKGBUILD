# Maintainer: rayman1972 <https://github.com/rayman1972>
# AUR package for kAppIcon — install system-wide under /usr

pkgname=kappicon
pkgver=3.0.1
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
sha256sums=('2950828ac86d6b88ab9b83c1e27488d889aea60c6af022e93b09194e864ee28a')  # filled after tagging v3.0.1

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Binaries (GUI + CLI)
  install -Dm755 gui/kappicon "${pkgdir}/usr/bin/kappicon"
  install -Dm755 cli/kappicon-cli "${pkgdir}/usr/bin/kappicon-cli"

  # Desktop launcher (GUI only)
  install -Dm644 gui/kappicon.desktop \
    "${pkgdir}/usr/share/applications/kappicon.desktop"

  # AppStream metainfo (GNOME Software, Pamac, Discover, …)
  install -Dm644 data/io.github.rayman1972.kappicon.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/io.github.rayman1972.kappicon.metainfo.xml"

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
