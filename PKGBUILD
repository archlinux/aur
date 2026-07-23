# Maintainer: Riski Andriyanto <putra7a@gmail.com>

pkgname=comicrd-bin
_pkgname=comicrd
pkgver=2.1.2
pkgrel=1
pkgdesc="ComicRD desktop comic reader built with Flutter and Rust"
arch=('x86_64')
url="https://github.com/andrizan/comicRD"
license=('MIT')
depends=(
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libepoxy'
)
provides=('comicrd')
conflicts=('comicrd')
source=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::https://github.com/andrizan/comicRD/releases/download/v${pkgver}/comicrd-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('e5d2de315ae777ac6d10606aa326348e95f3abbe6e376ee3fe86c3eb785cd554')

package() {
  cp -R --no-preserve=ownership "${srcdir}/comicrd-${pkgver}-linux-x86_64/opt" "${pkgdir}/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf /opt/comicrd/ComicRD "${pkgdir}/usr/bin/comicrd"
  install -Dm644 "${srcdir}/comicrd-${pkgver}-linux-x86_64/usr/share/applications/comicrd.desktop" "${pkgdir}/usr/share/applications/comicrd.desktop"
  install -Dm644 "${srcdir}/comicrd-${pkgver}-linux-x86_64/usr/share/icons/hicolor/512x512/apps/comicrd.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/comicrd.png"

  if [ -f "${srcdir}/comicrd-${pkgver}-linux-x86_64/usr/share/licenses/comicrd-bin/LICENSE" ]; then
    install -Dm644 "${srcdir}/comicrd-${pkgver}-linux-x86_64/usr/share/licenses/comicrd-bin/LICENSE" "${pkgdir}/usr/share/licenses/comicrd-bin/LICENSE"
  fi
}
