# Maintainer: Bao <qubidt at gmail dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=zotero-beta-bin
_pkgver=7.0.0-beta.63+52856ae69
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
sha256sums=('7a633ebad3a2d7bec604cc6fdb2aae13fd6c707975978ddccd39a526f933f585')
sha256sums_x86_64=('53003de145e58418be8cbf758781a95ca383a7fb7a8eec903cc76d6f5ebaae5e')
sha256sums_i686=('53003de145e58418be8cbf758781a95ca383a7fb7a8eec903cc76d6f5ebaae5e')

prepare() {
  patch --directory="Zotero_linux-$CARCH" --forward --strip=1 --input="${srcdir}/zotero-absolute-path-fix.patch"
}

package() {
  install -dDm755 "$pkgdir"/usr/{bin,lib/zotero,share/applications}
  mv "${srcdir}/Zotero_linux-${CARCH}"/* "$pkgdir"/usr/lib/zotero
  ln -s /usr/lib/zotero/zotero "$pkgdir"/usr/bin/zotero
  ln -s /usr/lib/zotero/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop

  # Copy zotero icons to a standard location
  install -Dm644 "$pkgdir"/usr/lib/zotero/icons/icon32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/icons/icon64.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/icons/icon128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/icons/symbolic.svg "$pkgdir"/usr/share/icons/hicolor/symbolic/apps/zotero-symbolic.svg
}
