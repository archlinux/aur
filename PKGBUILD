# Maintainer: Bao <qubidt at gmail dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta-bin
_pkgver=7.0.0-beta.2+39b8a3316
pkgver="${_pkgver/-beta/beta}"
pkgrel=1
pkgdesc="Zotero is a free, easy-to-use tool to help you collect, organize, cite, and share research."
arch=('x86_64' 'i686')
url="https://www.zotero.org/support/dev_builds"
conflicts=('zotero')
provides=('zotero')
license=('AGPL3')
depends=(
	'dbus-glib'
	'desktop-file-utils'
	'gtk3'
	'libxt'
	'nss'
)
source=('zotero-absolute-path-fix.patch')
source_x86_64=("Zotero-${_pkgver}_linux-${CARCH}.tar.bz2::https://download.zotero.org/client/beta/${_pkgver//+/%2B}/Zotero-${_pkgver//+/%2B}_linux-x86_64.tar.bz2")
source_i686=("Zotero-${_pkgver}_linux-${CARCH}.tar.bz2::https://download.zotero.org/client/beta/${_pkgver//+/%2B}/Zotero-${_pkgver//+/%2B}_linux-x86_64.tar.bz2")
sha256sums=('6f5218281d6c1b384269fcede93cba9b50a4b1907805231098ac6554133a8504')
sha256sums_x86_64=('fef8de25b2d0af59a2be43e4121c3b7380795e588956ebc57f1c545b9f80f6b5')
sha256sums_i686=('fef8de25b2d0af59a2be43e4121c3b7380795e588956ebc57f1c545b9f80f6b5')

prepare() {
  patch --directory="Zotero_linux-$CARCH" --forward --strip=1 --input="${srcdir}/zotero-absolute-path-fix.patch"
}

package() {
  install -dDm755 "$pkgdir"/usr/{bin,lib/zotero,share/applications}
  mv "${srcdir}/Zotero_linux-${CARCH}"/* "$pkgdir"/usr/lib/zotero
  ln -s /usr/lib/zotero/zotero "$pkgdir"/usr/bin/zotero
  ln -s /usr/lib/zotero/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop

  # Copy zotero icons to a standard location
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/main-window.ico "$pkgdir"/usr/share/icons/hicolor/scalable/apps/zotero.ico
}
