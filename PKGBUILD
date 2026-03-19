# Maintainer: Richard Fleming <rfleming@acqusys.com>
pkgname=taskeract
pkgver=1.10.4
pkgrel=1
pkgdesc="Desktop app for orchestrating AI coding agents"
arch=('x86_64')
url="https://f001.backblazeb2.com/file/taskeract-pub/releases"
license=('LicenseRef-Taskeract_EULA')
depends=(
  'webkit2gtk-4.1'
  'openssl'
  'libayatana-appindicator'
  'librsvg'
)
install=taskeract.install
options=('!strip')
source=(
  "${pkgname}-${pkgver}.deb::${url}/v${pkgver}/Taskeract_${pkgver}_amd64.deb"
)
sha256sums=('0bb3e38a3c99ef503cd033e0076ef261a9e8c7e4c1e4a53b45edfd541ee0b053')

prepare() {
  cd "${srcdir}"
  bsdtar -xf "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.*
}

package() {
  # Binary
  install -Dm755 "${srcdir}/usr/bin/taskeract" \
    "${pkgdir}/usr/bin/taskeract"

  # Desktop entry
  install -Dm644 "${srcdir}/usr/share/applications/Taskeract.desktop" \
    "${pkgdir}/usr/share/applications/taskeract.desktop"

  # Icons
  for icon in "${srcdir}"/usr/share/icons/hicolor/*/apps/taskeract.png; do
    [ -f "$icon" ] || continue
    size_dir="${icon#*hicolor/}"
    size_dir="${size_dir%%/apps*}"
    install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${size_dir}/apps/taskeract.png"
  done
}
