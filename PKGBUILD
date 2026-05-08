# Maintainer: eltonff <eltonfabricio10@gmail.com>

pkgname=mediaharbor-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="MediaHarbor is all-in-one music streaming and downloading application built with Tauri and React."
arch=('x86_64')
url="https://github.com/MediaHarbor/mediaharbor"
license=('GPL3')

depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libappindicator-gtk3'
  'glib2'
)
provides=('mediaharbor')
conflicts=('mediaharbor')

_pkgname="MediaHarbor"
source=("${_pkgname}-${pkgver}.deb::https://github.com/MediaHarbor/mediaharbor/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")

sha256sums=('47a0f740210b1034e6fdbb8228e827060cfca334120ca2c0a654f844754dc466')

package() {
  cd "$srcdir"

  ar x "${_pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"

  local _desktop_file="$pkgdir/usr/share/applications/MediaHarbor.desktop"

  if grep -q "Categories=" "$_desktop_file"; then
    sed -i "s|^Categories=.*|Categories=AudioVideo;Audio;Music;Player;Network;|" "$_desktop_file"
  else
    sed -i "/\[Desktop Entry\]/a Categories=AudioVideo;Audio;Music;Player;Network;" "$_desktop_file"
  fi
}
