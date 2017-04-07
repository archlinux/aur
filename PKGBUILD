# Maintainer: sumt <sumt at sci dot fi>
pkgname=palemoon-i18n-default
pkgver=27.0
pkgrel=2
pkgdesc="Pale Moon language pack for system active language."
arch=('any')
url="http://www.palemoon.org/langpacks.shtml"
license=('MPL')
depends=("palemoon>=$pkgver")
source=("lang-pref.js")
md5sums=('c654129d7633ca682436825e6eb0aead'
         '66516407f07d6b597a7a9a7dbcf910be'
         'c5bca0712e2a0497d612c0227e5d66e0'
         'c7b605b580713215dfcdb5a3029afb78'
         '490b8d99a66012af9d49f630ea6a048e'
         'dbaddeb48bf97f04655fac268990e8ef'
         'ce2b5bcb9562fe5779449e7ce860e97e'
         '5a11d7756b41ad90c3402b44625c3607'
         'a34e293111b296d82236e04f02e58829'
         'eb00ec128e5bd639fa852b84dd4ff9bd'
         'daa9b55badf30e8d6c1e6780d04719e3'
         '47dbce672aa95acd0461d1b0aaf93360'
         '4c3a50550761d9d6c547d6d206ce5d9e'
         '284154e2c0e805057b9d90e35e117d46'
         'c7a112c5ae1809b62006451e11fffd0e')

_currlocale=$(echo $LANG | awk -F'[ .@]' '{print $1}' | tr _ -)
_url=http://relmirror.palemoon.org/langpacks/${pkgver%.*}.x

_locales=(
"cs"
"de"
"en-GB"
"es-AR"
"es-ES"
"es-MX"
"fr"
"hu"
"it"
"ja"
"ko"
"pl"
"ru"
"zh-CN"
)

for _i in "${!_locales[@]}"
do
  if [ ${_locales[$_i]} == $_currlocale ]; then
    _locale=${_locales[$_i]}
    _langpack=palemoon-i18n-$pkgver-$_locale.xpi
    source+=("$_langpack::$_url/$_locale.xpi")
    noextract=("$_langpack")
  fi
done

prepare() {
  if [ ${#source[@]} -ne 2 ]; then
    error "Language pack for $_currlocale not found"
    exit 1
  fi
}

package() {
  install -Dm644 "$_langpack" \
    "$pkgdir/usr/lib/palemoon/browser/extensions/langpack-$_locale@palemoon.org.xpi"
  install -Dm644 lang-pref.js \
    "$pkgdir/usr/lib/palemoon/browser/defaults/preferences/lang-pref.js"
}
