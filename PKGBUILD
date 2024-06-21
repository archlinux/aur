# Maintainer: onurmercury <onurmercury at proton dot me>

# Releases and details about the project can be found at:
# https://github.com/Stremio/stremio-service
#
# Check new releases:
# curl -sf https://api.github.com/repos/Stremio/stremio-service/releases | grep -om1 '"tag_name": *"[^"]*"' | awk -F'"' '{print $4}'

_debname=stremio-service

pkgname="$_debname-bin"
pkgver=0.1.13
pkgrel=1
pkgdesc="The companion app of Stremio Web"
arch=('x86_64')
url="https://github.com/Stremio/stremio-service"
license=('GPL-2.0')
depends=('cairo'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'gtk3'
         'libayatana-appindicator')
conflicts=("$_debname")
provides=("$_debname")
source=("${_debname}_v${pkgver}-${arch}.deb::https://github.com/Stremio/stremio-service/releases/download/v${pkgver}/${_debname}_amd64.deb")
sha256sums=('36c2d83f43a2af84ae47ca41eb4d7bca636b70af2ed7e85f67a43ad864104f0a')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  # Move license
  install -Dm644 "$pkgdir/usr/share/stremio-service/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$_debname/LICENSE.md"
  rm "$pkgdir/usr/share/stremio-service/LICENSE.md"

  # Remove Debian specific documents
  rm -rf "$pkgdir/usr/share/doc/"
}
