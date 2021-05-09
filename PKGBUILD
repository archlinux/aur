# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta
_pkgname=zotero-beta
pkgver=5.0.97_beta.23+2Bd27b622f9
_pkgver=5.0.97-beta.23%2Bd27b622f9
pkgrel=1
pkgdesc="Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share research."
arch=('x86_64')
url="https://www.zotero.org/support/dev_builds"
license=('AGPL3')
depends=(
	'aarch64-linux-gnu-gcc'
	'atk'
	'cairo'
	'dbus'
	'dbus-glib'
	'desktop-file-utils'
	'fontconfig'
	'freetype2'
	'gdk-pixbuf2'
	'glib2'
	'glibc'
	'gnupg'
	'gtk3'
	'harfbuzz'
	'hicolor-icon-theme'
	'libx11'
	'libxcb'
	'libxcomposite'
	'libxcursor'
	'libxdamage'
	'libxext'
	'libxfixes'
	'libxi'
	'libxrender'
	'libxt'
	'nss'
)
source=("https://download.zotero.org/client/beta/${_pkgver}/Zotero-${_pkgver}_linux-x86_64.tar.bz2")
sha256sums=('6a2ae49782f709ad699536f623d4ebf910033a849209d9b2e01ae4ee07a926bb')

package() {
  install -dDm755 "$pkgdir"/usr/{bin,share/zotero,share/applications}
  mv "$srcdir"/Zotero_linux-x86_64/* "$pkgdir"/usr/share/zotero
  ln -s "$pkgdir"/usr/share/zotero/zotero "$pkgdir"/usr/bin/zotero
  ln -s "$pkgdir"/usr/share/zotero/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop
  # Copy zotero icons to a standard location
  install -Dm644 "$pkgdir"/usr/share/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/share/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/share/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/share/zotero/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/zotero.png

  # No need to keep a shell around when launching Zotero
  sed -i -r 's/^("\$CALLDIR\/zotero-bin" -app "\$CALLDIR\/application.ini" "\$@")/exec \1/' "$pkgdir"/usr/share/zotero/zotero
}
