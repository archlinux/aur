# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
_pkgname=firefox-scripts
pkgver=107.0b7
_pkgver=bb883bb0942cca89424ef3522c78029e9225f316
pkgrel=1
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
url="https://github.com/xiaoxiaoflood/firefox-scripts"
license=('MPL2')
source=(https://codeload.github.com/xiaoxiaoflood/$_pkgname/tar.gz/$_pkgver)
sha512sums=('3adab367654aadbe674704f26b81d01dcf5957aa471c0b4dd4cf0097c1e69f258e6a63942ef2e94a8ef3fca4197f69df366750585ad4935dcd8feb2561290bfd')
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
