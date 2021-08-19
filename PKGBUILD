# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta
_pkgname=zotero-beta
pkgver=5.0.97beta.37%ddc7be75c
pkgrel=1
pkgdesc="Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share research."
arch=('x86_64' 'i686')
url="https://www.zotero.org/support/dev_builds"
conflicts=('zotero' 'zotero-dev-bin' 'zotero-dev' 'jurism' 'zotero-git')
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
source=('zotero.desktop')
source_i686=("https://www.zotero.org/download/standalone/dl?platform=linux-i686&channel=beta")
source_x86_64=("https://www.zotero.org/download/standalone/dl?platform=linux-x86_64&channel=beta")
sha256sums=('17d1a0892d7a516e4f9d732de21ee595d9168d7554ca34b11cdd255795b22eaa')
sha256sums_x86_64=('ad3c5c8e38bea19187a772d90d965497306f5f8dc1d379834936f4756f3366cd')
sha256sums_i686=('ddf4944d380c4c46be0c7a5538cd4c71416e77e8672236bd8ebb7168c9a9101f')

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
