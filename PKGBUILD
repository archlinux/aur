# Maintainer: sumt <sumt at sci dot fi>
pkgname=palemoon-i18n-default
pkgver=26.2
pkgrel=2
pkgdesc="Pale Moon language pack for system active language."
arch=('any')
url="http://www.palemoon.org/langpacks.shtml"
license=('MPL' 'GPL')
depends=("palemoon>=$pkgver" 'palemoon<27.0.0')
source=("lang-pref.js")
md5sums=('c654129d7633ca682436825e6eb0aead')

_languages=(
'ar	"Arabic"'
'cs	"Czech"'
'da	"Danish"'
'de	"German"'
'el	"Greek (Modern)"'
'en-GB	"English (U.K.)"'
'es-AR	"Spanish (Argentina)"'
'es-ES	"Spanish (Spain)"'
'es-MX	"Spanish (Mexico)"'
'fi	"Finnish"'
'fr	"French"'
'gl-ES	"Galician (Spain)"'
'hr	"Croatian"'
'hu	"Hungarian"'
'is	"Icelandic"'
'it	"Italian"'
'ja	"Japanese"'
'kn	"Kannada (India)"'
'ko	"Korean"'
'nl	"Dutch"'
'pl	"Polish"'
'pt-BR	"Portuguese (Brazil)"'
'pt-PT	"Portuguese (Portugal)"'
'ro	"Romanian/Moldavian"'
'ru	"Russian"'
'sk	"Slovak"'
'sl	"Slovenian"'
'sr	"Serbian"'
'sv-SE	"Swedish"'
'tr	"Turkish"'
'vi	"Vietnamese"'
'zh-CN	"Chinese (Simplified)"'
'zh-TW	"Chinese (Traditional)"'
)

_md5sums=('1fbb4ba7066cadc3d885dc4aae57b5b3'
         'effd6890ac77e291a67bd9104138a283'
         'e6d5d36c10f423f9a6e59800d635de6f'
         '330185ce98a4224dfaaec743e832b817'
         '2a6f2831c614215e0872f23cc801f671'
         '48e0eac054f572dd558f55c898ca6f8c'
         '2800b50b331eae797e691fedb2b2ae7e'
         '877c9c04b270323dd3cb69824cccd657'
         '7ceedaededafbc135254820668d8990d'
         'ce18eb1b83bd52eb57800c0f08182315'
         '36d4f791705e85ac5c770cb9ae38b7bd'
         '834521f468cb5ec7beb0d0a061248dc6'
         'e55fafb18e68abcfc6eb2d6c58f3d581'
         '3601183e53d76ee5588aa029e48cd756'
         '7557b99ec186011406bb44dca1703e95'
         '555def21bfd3634cbec9af61c1486651'
         '174fead0e1e7cc01190f4f6f6c57d7c0'
         'fd087bd06805f24db53b3af2c4e47098'
         'f074fcf5f474a4113b2ce53e5dae093a'
         '46e00ff83fd0c8570bf451bf0729a6a0'
         '3bf0b5cdf8b1c72862e9c39a91c1f007'
         '4a1095c560aefb9befac62fd871c339e'
         '6ee00da3c03dcdbab20aeb0a2360f967'
         'f0872329531c6124c8d800fa9428e881'
         '8ad8339fe0e3d2a027de416f35ec7afe'
         'd908be6dd5d2a13202cf023f77a4ebb1'
         '30af28a6eee75c09a80531d6b118cf0c'
         'd2e0b3bbb141a7f6cf6c19e6bf6b9171'
         '1bdc99a81036ab62e1b8926b68796fcb'
         '503454011fd084355dc431f4f108ebd2'
         'f2960d864dc5c4bc899bf25705f6464a'
         '0135cd871dfb64e3adfc4c12e20e75ea'
         '046d81b0d837af33c86545cb949be407')

_systemlocale=$(echo $LANG | awk -F'[ .@]' '{print $1}' | tr _ -)
_url=http://relmirror.palemoon.org/langpacks/${pkgver%.*}.x

for i in "${!_languages[@]}"; do
  _locale=$(echo "${_languages[$i]}" | cut -f 1)
  if [[ $_systemlocale == $_locale* ]]; then
    _sourcename=palemoon-i18n-$pkgver-$_locale.xpi
    source+=("$_sourcename::$_url/$_locale.xpi")
    noextract=("$_sourcename")
    md5sums+=(${_md5sums[$i]})
    break
  fi
done

prepare() {
  if [ ${#source[@]} -ne 2 ]; then
    error "Language pack for $_systemlocale not found"
    exit 1
  fi
}

package() {
  install -Dm644 "$_sourcename" \
    "$pkgdir/usr/lib/palemoon/browser/extensions/langpack-$_locale@palemoon.org.xpi"
  install -Dm644 lang-pref.js \
    "$pkgdir/usr/lib/palemoon/browser/defaults/preferences/lang-pref.js"
}
