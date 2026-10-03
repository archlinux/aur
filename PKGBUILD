# Maintainer: haxxordan

pkgname=seraphirc-bin
_pkgname=seraphirc
pkgver=6.0.8
pkgrel=1
pkgdesc="Modern desktop IRC client built with Go and Wails (prebuilt binary)"
arch=('x86_64')
url="https://www.seraphirc.chat/"
license=('custom')
depends=(
  'desktop-file-utils'
  'gnome-keyring'
  'gst-libav'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk4'
  'hicolor-icon-theme'
  'libsecret'
  'webkitgtk-6.0'
)
provides=('seraphirc')
conflicts=('seraphirc')
options=('!strip')
source=("seraphirc_${pkgver}_amd64.deb::https://github.com/seraphirc/seraphirc-download/releases/download/v${pkgver}/seraphirc_${pkgver}_amd64.deb")
sha256sums=('bfd3d1ca0032b628716351249862dd1e0cebdf69bfe9525db7e2f2fa453bb89b')

package() {
  local data_archive
  data_archive="$(find "${srcdir}" -maxdepth 1 -type f -name 'data.tar.*' -print -quit)"
  if [[ -z "${data_archive}" ]]; then
    error "Could not find data.tar.* in upstream Debian package"
    return 1
  fi

  bsdtar --no-same-owner -xf "${data_archive}" -C "${pkgdir}"

  install -Dm644 "${pkgdir}/usr/share/doc/seraphirc/LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
