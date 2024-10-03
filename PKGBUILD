# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
_pkgname=firefox-scripts
pkgver=131
_pkgver=0c288820e16af6827e0cc19bb3fcdaec36a58935
pkgrel=1
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
url="https://github.com/xiaoxiaoflood/firefox-scripts"
license=('MPL2')
source=(https://codeload.github.com/xiaoxiaoflood/$_pkgname/tar.gz/$_pkgver)
sha512sums=('8f5baaea696845a2e89b99779a743ee532b3269400912153570b68535bb589169eb7e457a4d7f83891a9742fc28c5b8ad27ee8c1ad447a627c14514b9e87f079')
install=firefox-userchromejs.install

package() {
  cd $srcdir/$_pkgname-$_pkgver/
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname/

  cd installation-folder
  install -d $pkgdir/usr/lib/firefox/browser/defaults/preferences
  #install -d $pkgdir/usr/lib/firefox/defaults/pref
  install config.js $pkgdir/usr/lib/firefox/
  install config-prefs.js $pkgdir/usr/lib/firefox/browser/defaults/preferences/
  #install config-prefs.js $pkgdir/usr/lib/firefox/defaults/pref/

  cd ../chrome/utils
  install -d $pkgdir/usr/share/$pkgname/base/chrome/utils
  install BootstrapLoader.js $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install RDFDataSource.sys.mjs $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install RDFManifestConverter.sys.mjs $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install chrome.manifest $pkgdir/usr/share/$pkgname/base/chrome/utils/
  #install hookFunction.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install userChrome.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install xPref.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/

  cd ../..
  install -d $pkgdir/usr/share/$pkgname/misc
  install README.md $pkgdir/usr/share/$pkgname/misc/
  find chrome -type f -exec install -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
  find extensions -type f -exec install -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
}

# vim:set ts=2 sw=2 et:
