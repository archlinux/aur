# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta
_pkgname=zotero-beta
pkgver=5.0.97beta.28%2B1daf4b041
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
source=("https://www.zotero.org/download/standalone/dl?platform=linux-x86_64&channel=beta" "zotero.desktop")
sha256sums=('1a87da5dea778731e84c1dfb03a01b6ee8f65870dd7c3231b19960080d8940d2'
            '17d1a0892d7a516e4f9d732de21ee595d9168d7554ca34b11cdd255795b22eaa')

package() {
  install -dDm755 "$pkgdir"/usr/{bin,share/zotero,share/applications}
  mv "$srcdir"/Zotero_linux-x86_64/* "$pkgdir"/usr/share/zotero
  ln -s "$pkgdir"/usr/share/zotero/zotero "$pkgdir"/usr/bin/zotero
  install -Dm755 "$srcdir"/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop

  install -Dm755 "$pkgdir"/usr/share/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
  install -Dm755 "$pkgdir"/usr/share/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
  install -Dm755 "$pkgdir"/usr/share/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
  install -Dm755 "$pkgdir"/usr/share/zotero/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/zotero.png

  sed -i -r 's/^("\$CALLDIR\/zotero-bin" -app "\$CALLDIR\/application.ini" "\$@")/exec \1/' "$pkgdir"/usr/share/zotero/zotero
}
