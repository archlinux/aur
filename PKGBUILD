# Contributor: Isaac Curtis <isaaccurtis1@gmail.com>
# Maintainer: Isaac Curtis <isaaccurtis1@gmail.com>

pkgname=zotero-beta
pkgver="5.0.44_beta.5+7d424f6d1"
pkgrel=1
pkgdesc="Zotero Standalone. A free, easy-to-use tool to help you collect, organize, cite, and share your research sources."
arch=('i686' 'x86_64')
url="http://www.zotero.org/download"
license=('GPL3')
depends=('dbus-glib' 'gtk2' 'gtk3' 'gcc-libs' 'nss' 'libxt')
optdepends=('xpdf: PDF indexing')
conflicts=('zotero')
sha256sums=('8ec2a82b5c9b37e30cbe5ef968f5baa29e324a0e024a8cc28c38738ca3db7c7a')
sha256sums_i686=('c483fa230b82ae305e836b069e6e9a7f4b28204dc057dcce1baedc00b4045ba4')
sha256sums_x86_64=('067a1b8b57972d83586ba64f0c7b7c1575290cd2c68e04bc4a3a5b63e7a95c54')

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
