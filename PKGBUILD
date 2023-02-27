# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
_pkgname=firefox-scripts
pkgver=111.0b4
_pkgver=e5f578b6c3a8fe32fcfc9f5360c00f116f86e732
pkgrel=1
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
url="https://github.com/xiaoxiaoflood/firefox-scripts"
license=('MPL2')
source=(https://codeload.github.com/xiaoxiaoflood/$_pkgname/tar.gz/$_pkgver)
sha512sums=('f0d4cf0300be57dc09aa9d347eb3cb53e24e02cf16f39aa5d121738a6e1761706dd1f04f3559245da278f326268205ff9a5b7f0f01f45c422e4723f1b57245fe')
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
  install RDFDataSource.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install RDFManifestConverter.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install chrome.manifest $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install hookFunction.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install userChrome.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install xPref.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/

  cd ../..
  install -d $pkgdir/usr/share/$pkgname/misc
  install README.md $pkgdir/usr/share/$pkgname/misc/
  find chrome -type f -exec install -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
  find extensions -type f -exec install -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
}

# vim:set ts=2 sw=2 et:
