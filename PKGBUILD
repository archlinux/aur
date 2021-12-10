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
pkgver=96.0b3
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
  _url=https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/xpi
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

md5sums=('f45ab2dbc998f5ee30665c18baa9ca0e'
         '1f44e517bb07389ac5620af1937b3865'
         '1f56faa592222cc48f73fb1112cfcc80'
         '3f00e6d40298330851ba4c698740da96'
         '2855dd03c139cc3278381b7e68f34c5b'
         '77530c9c4896f178b274bd3ad7ec8fd0'
         'e81f53347b355af6a1eefa0f8fd832d8'
         '6797e50cf0b5bff5bfeb75672c71e3ed'
         'eaf15a9c95a9b48324cef86e209afa4b'
         '5ddfa49403995873932ce4cd2b69e541'
         '5287667f79d6751f02ec87ef124b3b50'
         'f3cbbc98c3d8e9d2b5b1bc9db0e0bcf7'
         '361cd73b9a28e863b274b11608a36479'
         'f9d6acf2791b31247a35b9bb62ce2499'
         '8630e451781c4858826c33d669164617'
         '04e8fd37143decdf4b437c7f89ec5ec5'
         '5fbf6c3a3a8adabb91f3ab8da4e3af09'
         'ca2e43326b7f5734e768a45c94d87255'
         'f368d358dab0764160ea6a38176bd36c'
         'f2212f3d794dc5398bddeac7779d18c4'
         '39e7c68f58e69fd1a21a0fdde2f24cdc'
         'fd4dd36fe12b5f11680897bdceafb045'
         '9222ceb60125850814c8c616f40be8a3'
         'ef54866cc5f68b1839f7485bf830a394'
         'c724dd1e5abc7b8601c1cc98ea3f1e41'
         'db81ea39e65a83d064f36fecdbda76f6'
         '24fff7610664288d4ff96f45f23095c5'
         'cc159dfe0f1afd88aff04bea57181758'
         'b51d9e687731aed36e7722e798000447'
         'b7d804e062d033a6827aef2db867898b'
         '53e63632d2c6709ddda7cf377439fb46'
         '944175bda7bed6d2b1f67d04e496d041'
         'c188028e4e2ca5051874335fa1930761'
         'f0e97b7c37fd81deb621fc217c01aacd'
         'f60ce2a087d8873067131573f3f03c3c'
         '62adc4f6393acea35b4bcdf0fcc7172d'
         'a168d6f0c6d75f5cfbd8803bef55bd5f'
         '49a7645433336a44079e097d2f774e81'
         '6779ba79e568db15794ec9d6f703b2dc'
         'f9f6571ca4974ab0f8a602a268ca7f22'
         'a4345d102dcbb3fe2231de3bd3f4a80a'
         '03f8a5063ba6fef930600313179ebe32'
         'ab8158d107da6b219c016a01df9faea0'
         '0e01c29acca1e26f4a7f6b732c09d015'
         '4bffc7d0ba7dc8c2f5d72ea43c005d57'
         'dd3e3b25694e3ce8c20d55db54b61684'
         '8f292d75c596c11b1d2d6cf9dbfc2f8d'
         '92b5c10fc46703cf1905557c792a9955'
         '7336a40afd6294d7562e6f338404b114'
         '8f1250650b7054f9a1a23a94ceadf26f'
         'b1f07300ed75cbf9ff13a2cfa7d1f649'
         '31f7a5b97e22b3e88d86784babd6c29c'
         '8557b93e667c6245554f5488f7db7b12'
         '5a2bd5eb12c8e535b5b2ac2e22dfc5fe'
         'c034306837709af2a0590a904165ad77'
         'f02ca2cd9f69e00288bac64370c532ae'
         'd7162e14ea82529cd450355c9479b1db'
         '9fe414729cfd6035fb65278f414ffc50'
         '15ebe4cf58082289857ade3b915d41d3'
         '416fce33efa0db4a567a903d14bd8f95'
         '4b245f525f9e192b9d0de3c0bd73b982'
         '818d7e151819a80249f4c87ed24c103b'
         '1efee5086f43ae35dbf74fcaa9d9a867'
         '63b7cd49a244fdc91bc65aae80dd3e8e'
         'd4cd713e2400c77b2c02fb36865094fe'
         '91b7b3ab81ad444eda2813a765193187'
         '3f5be3debe5460a06b8d58f529a9be88'
         'd9658bc0f4fc12ca94746d47993318e4'
         'f3106493916cab9e3b07e0972baf8d82'
         '168e5c5a64a80bd201d35ce2940d6121'
         '3ccd462dc76ee924cc782c101f0e2af6'
         'd795dc509e35ab7c6a607333e53a8929'
         'c26c5ef1dc1aee2f3b01fd0e0bf76c32'
         '3a3f392565bce877dbe762660422ad70'
         '5ec55e64e567f35733d7835d885237e9'
         '064bb2761703e857415a14cca6ec49d1'
         'fb0de9bd1a517ca0d23bf1b2491ba369'
         '6c66595d785fafb4ffdf68c14069195f'
         '22ed48ad1af81c6039aeda6b8dfd9010'
         '8954b81ea30abae419d1e40109fa210a'
         '177ca3605207968153ef066123edf174'
         'cd20ada89d9aa4fa06f6c6137baf822a'
         '456288207a6f348a161bc6a71f4c8728'
         '11b4c73304378e3cfb2331f3c07e58db'
         '7f72d6174488fd7d405434f1d3d81d86'
         'ce40c63cbf9b99982bad923fca0aadcf'
         'baedd86c3e976e6849f5a883bd2b7252'
         '76dbc6db0db45e1b2018121506cf9ef9'
         '9e95c918fc8f74560431e1f69dc790c0'
         'ed919f821e5427d7424c412691bdf747'
         '63397d5b49c293ab9abfa6fc5ff4b0d5'
         '695a6066a1007381c41ff616bfed3143'
         '06661e08467b975f92bca599c14c4140'
         '4e7e8a4525ebab8624d00d38e7939d3c'
         'f414679fcf2584f0215e70b0231cc97a'
         '497c012d3c9931196a5f3ec0f623a552')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
