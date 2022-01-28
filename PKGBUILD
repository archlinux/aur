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
pkgver=97.0b9
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
  _url=https://archive.mozilla.org/pub/firefox/releases/97.0b9/linux-x86_64/xpi
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

md5sums=('17ded3f7216894cf79d7fd8d9205eb21'
         '0079ba5916aadf4cc7d2e588f38d6f87'
         '98dee610ff44d6cf2c6c13bddb445323'
         'e74c550e1a07572236c02b8b2a4cef12'
         '9f666514e8cbf73eaccf4be51bae1cdd'
         '23742953d14b5ad4575235367ee1e797'
         'beb9b10aaa903a9b159e575ddc5e64d5'
         '20a676eadc3b4c89eb8f0472ed3055a8'
         'e427d5f485852e0f93fb17b6e0fd33bf'
         'bbc43e6f25dd3bd3f53bf5250fe7507d'
         '7078b22a710818f0426bdd1a8c0623c2'
         'a499fb567a30e3fe8c749c6113f64e17'
         '729bfc1cff4da1e2f0e8dcae630a9756'
         '99d8d0d27449f4eb5d5062a0e69febd4'
         '623befe153545185aebf5e95e4be3366'
         '32dd098e687e60ab5961f08777f35735'
         '23a3228fff66c0797eb774bff1cd8173'
         '0d08d93a8e9e49e99492be2414b6684f'
         'ccace6aa8a5614b7e2bd9dad130aad4a'
         '21726ee7a6eff574672afdeb917677ad'
         '2a90f59d6933bb79304328842503ae6f'
         '5b93a6fb115c34c2461146235996fc3e'
         'ce5e6592abaa160052f8435dbd811bdb'
         'e1f82976c87105ab7daaafd392375887'
         '798af40320f65ad698e79ae395de1e94'
         '606ff1ccdf67fa600ff3faca034256e9'
         '5a5611b290dd54d955288eb49beef1d2'
         '0fd061821e77f2c5c47769c0728de8fd'
         'dcc01522eb3661ffa18f53179ef2bd39'
         '9b623e16ea458c92f5154b2ee0a62194'
         '9f521082376ef38787b56767b4fed283'
         '880a815c38a656057303fbcfbe13198f'
         '174631be67200654973d05f640558c7f'
         '08cef51a113d581a4fbe5bc0514711db'
         'bf645d361ae16188bdec2ce3b2372a13'
         'd1f91a21dae8ffe678e9cd2131cf3c9b'
         'f79daf54edfe7f7b3662809ed7ca1627'
         'eeca79dc26ac6af16b8c189f623875b2'
         'af8192253d19e47a6bf414eeccd193d0'
         '4f05300e1469a12a393fd3d13c4641bf'
         '093ca439e6a1df4a155a7009d915dd4b'
         '3bf87b02b100e9d3a9a1d35ac882a11d'
         'aa4efce1f385be51a68bc7055a2d057d'
         '17db941351246eeddf9bc7bcde407683'
         '09bcd3659b75dcea7efe738a6eaf7b62'
         'e69229f8ed06df5f687b60b4623e4ace'
         '2277f564d73828f50a3cd2e1d97d5c5c'
         '43613f4d1e6555faaa630b6382a1fcd7'
         'e3d994e8eceeb71b37e36cacfbed7e16'
         '3ba41b8ed7aadcd922b33e3a0edd5274'
         '2de979cbe59fa0664555984c98e17826'
         '0118aace386b0d3f14a346e9f44f05a5'
         '9a7a75cb4d63a96e38281d7fa22667b1'
         '762690021df4f5a9b57ec8ed9550d3d9'
         'ac5c192a9ba7809342a36ea6b1188f3b'
         'a7415dfc738d4b91bfb8fb15a71f09ec'
         'c18fdbea25dd56ebfe65397bff406da3'
         'f3853fcddeb4c61c4d6b5bd0695b0a4f'
         'b23ccdd76ac112162cc0df9483a02639'
         'f55c07d105585b173336210669b6fbf2'
         '025d1176ad25dc42c45f931a52eb29cb'
         '9385ae93c2e29f2ac54d27391a19f012'
         '869b877127dead980a63344402c90119'
         'e050b5631e533928b6b10a0d1c4b0afa'
         '99ba105e100d30be6281c28cf3ebc1d9'
         '1945ca4952f825baea112d14808b9e14'
         'ccddfa2f9303d687a53ba0d5a4600e10'
         '02ddcd9f8bb607c616f9347defef5490'
         '7294dcd44c419b5840d1a89f92352d7d'
         '00b0cec751e922bad25c968b40dbea0b'
         '80628b55de3b5a00caf520f3d29a187b'
         '34b6ae025058fab8a01d9e21faf0789e'
         '1e5870b93d376bf10ccb2636df42ab04'
         'a020740d40a79e0fcd8b790ab87cdc9e'
         '714a0264ccad033bb340f1e58f3bb2f5'
         '2b5ac5fdbf71c9765b03e22d5e1c7357'
         '4e4fe961a7b30808456ea5d25102086c'
         '88130ad08eca290ed198ebc414eee1f8'
         '460e5d3b02de8a25134ee2746b2e05cf'
         '0f436080ba46b2abb13f856d34678af0'
         '7e0951245d095a5da3f16807a27d6c0f'
         'add387d5d29ffa76f0ed4c37dea7a46b'
         '7358c911b4a6b7d9ac7cf1806bda754e'
         '0f38a777f6020e226da6758e1fdbbfdc'
         '7172f4d4828a3d3ca171472f149008be'
         '1759b061f1a9994b1c733fc927dbaeab'
         '954b639740fbf26723114336f5646d6a'
         '1af2063ecded6c8b53df814d22da2166'
         '674e9bc5aa728d90e966fa04d1b66b49'
         '3e41b44d1ebdf767b8a13049b79921c6'
         '149227657833b5195edd17d1bd03c666'
         '379286f0263fbc12317d71f45dabafde'
         '38c2c95364ae681c5abaa135152e88b9'
         '50c4a3b918c2ffb971f618f4b7a2690a'
         'd42bf485161ed7a4aa356d04ecc0048f'
         'a16bd2e3564aaacd28845a6ffd14f8c8')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
