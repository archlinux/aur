# Maintainer: eltonff <eltonfabricio10@gmail.com>

pkgname=mediaharbor-bin
pkgver=2.0.5
pkgrel=1
pkgdesc="MediaHarbor is all-in-one music streaming and downloading application built with Tauri and React."
arch=('x86_64')
url="https://github.com/MediaHarbor/mediaharbor"
license=('GPL-3.0-or-later')

depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libappindicator-gtk3'
  'glib2'
)
provides=("mediaharbor-bin=${pkgver}")
conflicts=('mediaharbor-bin')

_pkgname="MediaHarbor"
source=("${_pkgname}-${pkgver}.deb::https://github.com/MediaHarbor/mediaharbor/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")

sha256sums=('227f35797af8e410f31ce2cf8088133ecbf3591b20b8a37dcacb38384178eecb')

package() {
  cd "$srcdir"
  ar x "${_pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"

  local _sandbox="$pkgdir/opt/MediaHarbor/chrome-sandbox"
  if [[ -f "$_sandbox" ]]; then
    echo "Setting permissions for chrome-sandbox..."
    chown root:root "$_sandbox"
    chmod 4755 "$_sandbox"
  else
    echo "$_sandbox not found, please ensure MediaHarbor is correctly installed."
  fi
}
