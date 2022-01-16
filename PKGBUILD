# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=97.0b4
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Language pack for Firefox Beta"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
depends=("firefox-beta>=$pkgver")

_languages=(
  'ach    "Acholi"'
  'af     "Afrikaans"'
  'an     "Aragonese"'
  'ar     "Arabic"'
  'ast    "Asturian"'
  'az     "Azerbaijani"'
  'be     "Belarusian"'
  'bg     "Bulgarian"'
  'bn     "Bengali"'
  'br     "Breton"'
  'bs     "Bosnian"'
  'ca-valencia "Catalan (Valencian)"'
  'ca     "Catalan"'
  'cak    "Maya Kaqchikel"'
  'cs     "Czech"'
  'cy     "Welsh"'
  'da     "Danish"'
  'de     "German"'
  'dsb    "Lower Sorbian"'
  'el     "Greek"'
  'en-CA  "English (Canadian)"'
  'en-GB  "English (British)"'
  'en-US  "English (US)"'
  'eo     "Esperanto"'
  'es-AR  "Spanish (Argentina)"'
  'es-CL  "Spanish (Chile)"'
  'es-ES  "Spanish (Spain)"'
  'es-MX  "Spanish (Mexico)"'
  'et     "Estonian"'
  'eu     "Basque"'
  'fa     "Persian"'
  'ff     "Fulah"'
  'fi     "Finnish"'
  'fr     "French"'
  'fy-NL  "Frisian"'
  'ga-IE  "Irish"'
  'gd     "Gaelic (Scotland)"'
  'gl     "Galician"'
  'gn     "Guarani"'
  'gu-IN  "Gujarati (India)"'
  'he     "Hebrew"'
  'hi-IN  "Hindi (India)"'
  'hr     "Croatian"'
  'hsb    "Upper Sorbian"'
  'hu     "Hungarian"'
  'hy-AM  "Armenian"'
  'ia     "Interlingua"'
  'id     "Indonesian"'
  'is     "Icelandic"'
  'it     "Italian"'
  'ja     "Japanese"'
  'ka     "Georgian"'
  'kab    "Kabyle"'
  'kk     "Kazakh"'
  'km     "Khmer"'
  'kn     "Kannada"'
  'ko     "Korean"'
  'lij    "Ligurian"'
  'lt     "Lithuanian"'
  'lv     "Latvian"'
  'mk     "Macedonian"'
  'mr     "Marathi"'
  'ms     "Malay"'
  'my     "Burmese"'
  'nb-NO  "Norwegian (Bokmål)"'
  'ne-NP  "Nepali"'
  'nl     "Dutch"'
  'nn-NO  "Norwegian (Nynorsk)"'
  'oc     "Occitan"'
  'pa-IN  "Punjabi (India)"'
  'pl     "Polish"'
  'pt-BR  "Portuguese (Brazilian)"'
  'pt-PT  "Portuguese (Portugal)"'
  'rm     "Romansh"'
  'ro     "Romanian"'
  'ru     "Russian"'
  'si     "Sinhala"'
  'sk     "Slovak"'
  'sl     "Slovenian"'
  'son    "Songhai"'
  'sq     "Albanian"'
  'sr     "Serbian"'
  'sv-SE  "Swedish"'
  'ta     "Tamil"'
  'te     "Telugu"'
  'th     "Thai"'
  'tl     "Tagalog"'
  'tr     "Turkish"'
  'trs    "Chicahuaxtla Triqui"'
  'uk     "Ukrainian"'
  'ur     "Urdu"'
  'uz     "Uzbek"'
  'vi     "Vietnamese"'
  'xh     "Xhosa"'
  'zh-CN  "Chinese (Simplified)"'
  'zh-TW  "Chinese (Traditional)"'
)

pkgname=()
source=()

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
  _url=https://archive.mozilla.org/pub/firefox/candidates/97.0b4-candidates/build1/linux-x86_64/xpi
  # RC
  if [[ $_build = ? ]]; then
    _url=https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/linux-x86_64/xpi
  fi
  source+=("firefox-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
  eval "package_$_pkgname() {
    _package $_lang
  }"
done

# Don't extract anything
noextract=("${source[@]%%::*}")

package_firefox-beta-i18n-all() {
  pkgdesc="All language packs for Firefox Beta (meta)"
  depends=("${_all_depends[@]}")
}

_package() {
  pkgdesc="${_languages["$1"]} language pack for Firefox Beta"
  provides+=("firefox-i18n-$_as_lower" "firefox-developer-edition-i18n-$_as_lower")
  conflicts=("firefox-i18n-$_as_lower" "firefox-developer-edition-i18n-$_as_lower")

  install -Dm644 "firefox-i18n-$pkgver-$1.xpi" \
      "$pkgdir/usr/lib/firefox-beta/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

md5sums=('dc9bfa30048311e7573975db2992e46c'
         'a9a3c942762cce48bd7d2a7b1e06c943'
         'b807d6d809bc0a62731c1a4cb6a31366'
         '0c8fe035b920d96e1ecc7b825ffb8d6f'
         'b15293d568ad547e0585fa0cba151092'
         '512674a7abec1078f5bcf3986846dbbd'
         'b787ed5adcfa7fd00e375fee71d6ae30'
         'f7d223666152b9449e063ef0ec8b84d6'
         '3054545c4eb1b169bdeb3157c228e5bc'
         'fdeea27a261ac49d0aa19bf6fa48296b'
         '6fe1a46ed1cba14605dc36f3601cd683'
         '706cede7b05bed29d7172369fac15246'
         'bc5e914b8fc64e0977569d4e44d7be4c'
         '1f8e86de2d6faf99468d45179cf2bc43'
         '1a17ec0466a5bcebb3a448e74f156c77'
         '97bdf645e0f71a38a1782a199edb04e7'
         'a104c5c127ba86eb8d4ce7cb78623c4e'
         'f148ebabd1b7319157b34d193a3be00d'
         '435e02646cb416f8e99e7f96b16c770e'
         '8526d93c662dc4cf8df2fe1bd8e81edc'
         'fdc8dea7f46ee0d8d0dbe7ef68c062e3'
         'c54e00ce93865091cf1fa0714ce64025'
         'a7cd1d04a2a4e69b14a79d6cc0c1183f'
         '696ba531932023029c59cf7babf1ede6'
         'bf17f81cf181f754559ae80d54191f6e'
         '8c6e1bb07aac3107a7f2642c80212750'
         'fbdbf43a644950ddc90550a208a7ad95'
         '1ba80d3cfc33a69b5684f80bc88b5bad'
         '7390b9b446b6cbc405cae515f92f087a'
         'f354c36bdbae580ab8998ecf2bd1479a'
         '78d894af28ef5e3a84b59cb0bfb79bcc'
         'd8337b9c731c897ed334f0270209fbe8'
         '8c2b41c62b53a998bb19e31ad06e75bb'
         '99247f724d6688a9ce6c9ca157281851'
         '70c4e2b9312f1ddf184ef5790024574d'
         '0178866cc1ad0682be8dcd188aa5789c'
         '0dd650a1520ea4afdcc8e8737b7319a7'
         '063f326014f21d6c17177f529b3cf0af'
         '3a1796685f106184462be7d435b3eb92'
         '5bd463fe85383e22d2195d593cea38b3'
         '62df173aebada83cb72a63fd088cdd59'
         'e751abfbe119f2b4ef2192da1c946f58'
         'b0f1c25a408f225e17b0d681f21911fd'
         'a7b0607f2983e945cf5b85f2591a355f'
         'db159964bfc4042df026c8e5991add44'
         'c8cd65f819090650459373da0492771c'
         'ed5eb066b57b248ed65318b17bdf9f7d'
         '9207ef041594e9222343b221880082e9'
         'a56cce60619db80bac76f3571d74be0d'
         '87af4c40d8b2a74f35e44d86a1a8024e'
         'eff7c33f3234ad7518146d929f996613'
         'e1c7d48394c13c77267c19dafe20a446'
         '05e8cf99db0228d01bb69568b22af1db'
         'bf7e70be14b277d2e1e462172e8be9f9'
         '3e9418670c5609936af95c84aa33d4da'
         '8ca2856faf12ec4cb686c08826be34b3'
         '8ce9f9d10e51ed54b2b472f8393184a4'
         'c30a2f56e46debb65b59909e173d9735'
         '466320a281ce085997c5d6e5dc6dc51e'
         'd84badfc812e60bd98de38a54e3244e1'
         'feadc028813c9d73b6910041c20cea27'
         '8d5c2c6840982ff1cdb2bd94ad0426cb'
         '791b60827c0e9da3235560f9d67c6922'
         '10a4491ab63bd4cf3a9e260438c4876b'
         'd728e74471027cb7302456aa60a896fa'
         '505ca06e9b91f01e569517b5bba711b0'
         '47df750d91fc228d3e26e01e4cd94943'
         'c9f205dc05faafbe15c67932394bb1a6'
         '01eb56c36990aecf2023c3c85d12138c'
         '22e3fb7eb2470ed2bf3ba5fc5d1a007a'
         'fcb1b766e54dcab1213afbd79df766fa'
         'b08410d1b360332f4dac7198c839507e'
         '01603e65a42511b8c1fcc5a7f7608daa'
         '188af074b96423e152a1fcced1f85ec0'
         'af0f17127833a17ea72f550cb195e12f'
         '0359c5b7c2d25048fe60d869d4c55a07'
         '749f53a6e54583d18e7576b246642ead'
         '48f3fa8eedd8217063f14e8cb6d95241'
         '22cb8f89e252f79d445e528d13165868'
         '76ec683d8f2eff85adbb7d5b9e46283f'
         'c8585371d225db9956e6344e66ad2fd6'
         'f1cd923add17b52eedb5cbb65187be2e'
         '830dad59c18bd36f065bde3a51c11067'
         '7277d510fcdada72a01b192f030bb725'
         'ba17092a5827c93eaeca372609965e57'
         'f227c5e1d5a49e6352b765a37ec56b7e'
         '65e45a99e0a6a62b280db645b87d5166'
         '2ed9eeff410e998182e07cd1373e57bd'
         '5707b216f9f8e1d5c523b36d0c0b214a'
         'c78233a7c8bd083270ac4c5d673803fd'
         '112d3a761da47935e5bee080cfaac437'
         '53a8f83c9d5a3db6e4117bc4bd7df093'
         '1d5b0af88a5dfc6eefdf2a34ca5e790e'
         'a0ce49977665d28fb1be57710ed20fdf'
         '27483bca56c38c66c7fc029a461e66c8'
         'e5c811d81029c19cf2fc933850890db2')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
