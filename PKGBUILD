# Maintainer: vogan <voganwong@hotmail.com>

pkgname=cherry-studio-bin
_pkgname=cherry-studio
pkgver=1.6.6
pkgrel=1
pkgdesc="🍒 Cherry Studio is a desktop client that supports for multiple LLM providers "
arch=('x86_64')
url="https://github.com/cherryHQ/cherry-studio"
license=('AGPL-3.0')
options=('!strip' '!debug')
depends=('fuse2')
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Cherry-Studio-${pkgver}-${arch}.AppImage"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
  "${pkgname}.sh")
sha256sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP')
conflicts=("$_pkgname")

package() {
  cd "$srcdir"

  # Create directories
  install -dm755 "$pkgdir/usr/bin/$pkgname"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

  # Install AppImage
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"
  # Install icon
  install -Dm644 "$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  # Install desktop file
  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  # Install cherry-studio-bin.sh
  install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
