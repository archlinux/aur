# Contributor: Isaac Curtis <isaaccurtis1@gmail.com>
# Maintainer: Isaac Curtis <isaaccurtis1@gmail.com>

pkgname=zotero-beta
pkgver="5.0.45_beta.8+8853f8ca4"
pkgrel=1
pkgdesc="Zotero Standalone. A free, easy-to-use tool to help you collect, organize, cite, and share your research sources."
arch=('i686' 'x86_64')
url="http://www.zotero.org/download"
license=('GPL3')
depends=('dbus-glib' 'gtk2' 'gtk3' 'gcc-libs' 'nss' 'libxt')
optdepends=('xpdf: PDF indexing')
conflicts=('zotero')
sha256sums=('8ec2a82b5c9b37e30cbe5ef968f5baa29e324a0e024a8cc28c38738ca3db7c7a')
sha256sums_i686=('38c25b20d59f4017882be8c8f3a2e5ee16dce9b0accf197f6f91b1d4dbee42e8')
sha256sums_x86_64=('26d6879ccff42d9cbf6ab13da45b5eb94206e6339f4323801324d0cb117ac9c4')

_ver=${pkgver//_/-}
_ver=${_ver//+/%2B}
install='zotero-beta.install'

source=("zotero-beta.desktop")
source_i686=("https://download.zotero.org/client/beta/${_ver}/Zotero-${_ver}_linux-i686.tar.bz2")
source_x86_64=("https://download.zotero.org/client/beta/${_ver}/Zotero-${_ver}_linux-x86_64.tar.bz2")

package() {
  mkdir -p "$pkgdir"/usr/{bin,lib/zotero}
  mv "$srcdir"/Zotero_linux-$CARCH/* "$pkgdir"/usr/lib/zotero
  ln -s /usr/lib/zotero/zotero "$pkgdir"/usr/bin/zotero
  install -Dm644 "$srcdir"/zotero-beta.desktop "$pkgdir"/usr/share/applications/zotero-beta.desktop
  # Copy zotero icons to a standard location
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
}
