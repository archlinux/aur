# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
_pkgname=firefox-scripts
pkgver=101.0b3
_pkgver=77f56676dc6686af15827f9d51c1e4d3e0989c2a
pkgrel=1
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
url="https://github.com/xiaoxiaoflood/firefox-scripts"
license=('MPL2')
source=(https://codeload.github.com/xiaoxiaoflood/$_pkgname/tar.gz/$_pkgver)
sha512sums=('fc9d15ae702dc08ca1ed2202087de4b175bdad51f276aec4f7b700d80cbdc923f618fcb2398d87c6b796eb495659f072e7982608d8b9b7a0137e2214cb52e8ed')
install=firefox-userchromejs.install

package() {
  cd $srcdir/$_pkgname-$_pkgver/
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname/

  cd installation-folder
  install -d $pkgdir/usr/lib/firefox/browser/defaults/preferences
  install config.js $pkgdir/usr/lib/firefox/
  install config-prefs.js $pkgdir/usr/lib/firefox/browser/defaults/preferences/

  cd ../chrome/utils
  install -d $pkgdir/usr/share/$pkgname/base/chrome/utils
  install BootstrapLoader.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/ 
  install chrome.manifest $pkgdir/usr/share/$pkgname/base/chrome/utils/ 
  install RDFDataSource.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/ 
  install RDFManifestConverter.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/ 
  install userChrome.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/ 
  install xPref.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/ 

  cd ../..
  install -d $pkgdir/usr/share/$pkgname/misc
  install README.md $pkgdir/usr/share/$pkgname/misc/
  find chrome -type f -exec install -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
  find extensions -type f -exec install -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
}

# vim:set ts=2 sw=2 et:
