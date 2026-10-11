# Maintainer: eltonff <eltonfabricio10@gmail.com>

pkgname=mediaharbor-bin
pkgver=3.0.0
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

sha256sums=('e1f9bef933bec1147a181ec68157a90bf45efea31c3c900d3aff502286d94083')

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
