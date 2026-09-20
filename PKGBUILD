# Maintainer: fivegrant
pkgname=glamorous-toolkit-bin
pkgver=1.1.590
pkgrel=2
pkgdesc='Moldable development environment and knowledge management system'
arch=('x86_64' 'aarch64')
url='https://gtoolkit.com/'
_release_url='https://github.com/feenkcom/gtoolkit/releases/download'
license=('MIT')
options=('!strip' '!debug')
depends=('glibc' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'mesa' 'libglvnd')
provides=('gtoolkit')
conflicts=('gtoolkit')
source=('glamorous-toolkit.desktop' 'glamorous-toolkit-launcher')
sha256sums=('d71448a305552f44147ce9f8716861e7f330b2e90d2f273b787ab1bb5139c99e' 'SKIP')
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_release_url}/v${pkgver}/GlamorousToolkit-Linux-x86_64-v${pkgver}.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_release_url}/v${pkgver}/GlamorousToolkit-Linux-aarch64-v${pkgver}.zip")
sha256sums_x86_64=('7f3d3bfd86787035f5df2bb5370f5d9dd5888604ff552d561df820161be1578a')
sha256sums_aarch64=('ee77a50b947a7345e16d4f4dda55e696b58d0189d02200fdcdd725cbbc474dad')

package() {
  local archive
  case "$CARCH" in
    x86_64) archive="${pkgname}-${pkgver}-x86_64.zip" ;;
    aarch64) archive="${pkgname}-${pkgver}-aarch64.zip" ;;
  esac

  install -d "$pkgdir/opt/glamorous-toolkit" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
  bsdtar -xf "$srcdir/$archive" -C "$pkgdir/opt/glamorous-toolkit"
  mv "$pkgdir/opt/glamorous-toolkit/bin/GlamorousToolkit" \
    "$pkgdir/opt/glamorous-toolkit/bin/GlamorousToolkit.bin"
  install -Dm755 "$srcdir/glamorous-toolkit-launcher" \
    "$pkgdir/usr/bin/glamorous-toolkit"
  ln -s /opt/glamorous-toolkit/bin/GlamorousToolkit-cli "$pkgdir/usr/bin/glamorous-toolkit-cli"
  install -Dm644 "$srcdir/glamorous-toolkit.desktop" "$pkgdir/usr/share/applications/glamorous-toolkit.desktop"
}
