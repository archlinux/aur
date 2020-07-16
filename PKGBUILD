# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0b8
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
_url=https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
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

md5sums=('5a3c69652365bf088588b85750b56e96'
         'a81f988710d79626fc3c1c853ad2778b'
         '9f0e19ad6579d075ce37543fca6e843b'
         'd222d92eb7e26ab6252ee54b98d33b17'
         '14e21d820a077e5d35a1b91ce9fca5a9'
         'cd74722ef320c82907e1ce65b573bb40'
         '50fa0e7530d4c3c57424d2eefdab4af4'
         '2b8baf45cbac7fe2cd4e6496605456bb'
         '6868791303691192460c5779db22c90e'
         '4e168ef40b01efddfd81328a20227bf9'
         '285672c06c6e2ae77413242bc93e0a5e'
         '26bb387faeda40cfe85dc231228375a1'
         'e64aac0825bd08661d272d9e4642cac8'
         '70965b73a295a3e962c81900fe05ec9b'
         'b0e91c6f4fece80dfc910fd682e06422'
         '134aa496e13e2b9c7f0dfc29668b0033'
         'bfef9c4221074fe16b2491a4481887b8'
         '696d2a55e2f9efb2bae2e6a714b6fade'
         '9ad8d84e18f5b6450518268ba2eb290c'
         'ecba8ef57964503a42e67074a82bd89e'
         '6070f69c6bc232647160b09f6717daf2'
         'db54ccd1939d215332236b46452770ad'
         '44859dacab3fb86d282d4e2705f8ff11'
         '8f496ae8ee8a8abebb501a5226dcfd67'
         'f30c70741d684fcf10dc7734ca134378'
         '6dc1df1fce9460a60c206059970cb22a'
         '9f630ac693e6f06a8541d7f9638ab370'
         '32573fd5f23cb2179ff573b6cf4760b3'
         '1e6c5c0a2792ba7d201a449470b5a3a1'
         '02b0a6380b2c66abba91e6215f7a171b'
         'db53dc394c3a6b711737a33746b03f76'
         'e4dc710360d68abd4735170b9cea4e8c'
         '84bf538fc1b3fafad75426fd9bb7b7da'
         '3bd44c25d45839291e17cbb939d76240'
         'a25ab468b66076e066aee7dc427f2be3'
         '86f359d89399a7e8721f2c1af1e98d85'
         '594011f41c0f6e97d919ee062bc9dafe'
         'f3e1df81e22a544ab9a1b1d3b364dbf2'
         '3bcc99499c10254686564ab5cf298bc3'
         'c21ec7ae5ad7b360531c9894552579e2'
         'ac9638e129301016cf03bb1258c30a11'
         '131862f77eed5e692a3bc3af93abd4cd'
         '80035f53c26200a480e394feea86a7bb'
         '13db2ad97bdefd5d01d7b7ba39ded72c'
         '97e6d5c16fde0e2935526c3a2a7c3c63'
         '7d6842b5fd52db16f8534fc135e8b315'
         '4b942cf388e889664f0c5edbc01358ce'
         '770e4113f1940799d2049cd08ad6c89f'
         '1e66ed739bbb5c74aae2f03d3d323699'
         '02b41534e3b6a6dee7b5140c410cb597'
         '366d1c780d39f39181c08e4095757cd5'
         'cd8d74b65b4e75e50516e6f5e4eb8f3f'
         'e1406482d8c642a228ad800d3771eb80'
         'c581d0ef536c03e806bee726cc79b676'
         'efd1be3ac371d4c91509637ca10d784b'
         '502abedd166ecd895db362c4f259bc5d'
         'f8b70b6cc8422541c7b357a4df7b159c'
         'bd3c9fdbdf9c536a64b8a84092c3f075'
         'dc1f6d247eee8199035d1069509fdb03'
         '7aed775ac2e6cab54c46113dc080ec25'
         'da3bdb247865ded235400d91945e2c61'
         'b3a511580bb1ec7b34be2972618dfeb6'
         '6bf9280767bd90b3cfe98edb334ff4a8'
         '07ea73a3c8ef1946d5cbfc9ebf5bb226'
         '7caaaeecbdd0fe6703b5432fb36bb369'
         'c94b1375d35986d3f7b58cbe2cb8e205'
         'e97f51ce351dc34e5ec27c77841ea1d5'
         'c9369a50d037e308eebae8a96d4286d7'
         'a4a5a730232eb4c310dc4c8faf85e3c2'
         '8473ef108602b9d7a1350db5c2f96fb9'
         'c9f78feb514901f1a5b177225c06e164'
         '3adb7fd21ab04eb4ee30f9096f516cd7'
         '3ac4f8aea1af2e8b4dc771be61ddf9af'
         '0c58f03b4ea4360fa56eca9c183d9f29'
         '12e5f1df7f474ceae76237a1b228d855'
         'c3e20b1134ed3a7586a6198fd22fbc94'
         'c8bbfc930645ea812b3377c15f2c9f22'
         '216d2e7abbcb353f19d529b11735ecdd'
         '249514b0d1ae4223772a6c8fc80a0646'
         'c0359b2cd42dae8c13620abf3e8986e0'
         'c5d352b71ecae0fb3d3582aa0509c4d2'
         '88a1db1e36e4e8337daa5e624dded8a4'
         '5b27bfab948a542cf5bf94928cd0266c'
         '421083a9cee910360a086ba5bcdf736a'
         '086b035f9c0a31d87249db57623872b6'
         '46cdff2dd18a2b6ee33d2e285ee40681'
         '9f97da3c6b78ee5ac1eab5e9e5516d59'
         '6aa9eba53a22fa8a449d8a757dfe2de0'
         '6d3ebbaffc42cc89e2b1872932a32cf4'
         '902b27de3a49dd20acd2f41d5c3cc54f'
         'eac42097e276c67823da52cbfcedba2e'
         'bf09b77708e0431b6f30298369f4ac1e'
         'b1e324102231542f2fe7d49c3f03c2c5'
         '6559091c8db906ceb2ef3960b9b81be5'
         'a214fcf8a95d420ceb449aa4f31a15fb'
         '23964d7b4fde8f5ff2d273ccbddb4f6c')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
