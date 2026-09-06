# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
#_pkgname=firefox-scripts
pkgver=155
#_pkgver=a898ac59fb0ca3886c0c46b184fdbc037c83c037
pkgrel=1
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
#url="https://github.com/xiaoxiaoflood/firefox-scripts"
url="https://github.com/onemen/TabMixPlus"
license=('MPL2')
source=(
  "https://github.com/onemen/TabMixPlus/releases/download/dev-build/fx-folder.zip"
  "https://github.com/onemen/TabMixPlus/releases/download/dev-build/utils.zip"
)
sha512sums=(
  '2be133a5ab9d253370111ba7517e9e8442b014a3bf83313ddb84563dbf6c8493eaaff852a9a334200b17786b4a077c4369f981f0782886745849a07729553ded'
  '0c07b1ca43c3cee05a0b6a2b075f6b57ede3e0998bfcc877a5e96a2a3e560f60a87a554036b99e4fc2cf6016d14548ec1673f7d4fbca7535dc1722f2983e7232'
)
install=firefox-userchromejs.install

#prepare() {
  # Leave only first dir once changes get merged upstream
  #find "$srcdir/$_pkgname-$_pkgver" "$srcdir/chrome" "$srcdir/config.js" -type f -exec chmod 644 "{}" \;
  #find "$srcdir/$_pkgname-$_pkgver" "$srcdir/chrome" "$srcdir/config.js" -type d -exec chmod 755 "{}" \;
#}

package() {
  install -d "$pkgdir/usr/lib/firefox/browser/defaults/preferences"
  # For some other firefox installations
  #install -d "$pkgdir/usr/lib/firefox/defaults/pref"
  #install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname/base/chrome/utils"
  #install -d "$pkgdir/usr/share/$pkgname/misc"

  #cd "$srcdir/$_pkgname-$_pkgver/installation-folder"
  cd "$srcdir/fx-folder"
  install -m 644 defaults/pref/config-prefs.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/"
  # For some other firefox installations
  #install config-prefs.js $pkgdir/usr/lib/firefox/defaults/pref/

  # Delete this cd once changes get merged upstream, join to section above
  #cd "$srcdir"
  install -m 644 config.js "$pkgdir/usr/lib/firefox/"

  # Switch to this cd once changes get merged upstream
  #cd "$srcdir/$_pkgname-$_pkgver/chrome"
  #cd "$srcdir/utils"
  cd "$srcdir"
  install -m 644 BootstrapLoader.js "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install -m 644 ChromeManifest.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 RDFDataSource.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 RDFManifestConverter.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 chrome.manifest "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install hookFunction.jsm "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install userChrome.jsm "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 userChrome.js "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install xPref.jsm "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install -m 644 versionInfo.json "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 xPref.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"

  #cd "$srcdir/$_pkgname-$_pkgver/"
  #install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  #install -m 644 README.md "$pkgdir/usr/share/$pkgname/misc/"
  #find chrome -type f -exec install -m 644 -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
  #find extensions -type f -exec install -m 644 -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
}

# vim:set ts=2 sw=2 et:
