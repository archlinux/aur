# Maintainer: eltonff <eltonfabricio10@gmail.com>

pkgname=mediaharbor-bin
pkgver=2.0.5
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

sha256sums=('227f35797af8e410f31ce2cf8088133ecbf3591b20b8a37dcacb38384178eecb')

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
