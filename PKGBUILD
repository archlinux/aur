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
pkgver=99.0b1
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
  _url=https://archive.mozilla.org/pub/firefox/releases/99.0b1/linux-x86_64/xpi
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

md5sums=('32bfc133006ab5a6c1d51aeb562042e6'
         'ee71a379389e6c1c48b5ca75c9e82137'
         '4eb7a2afb4ef1d89617d772d311580a1'
         '1cec7f50619cc147007db0216583f69e'
         '2e16f1c8a077220a05dbd66c183c3640'
         'f2a141bf0274461098ad8a6eeadf2d63'
         '75e28b0861b3fa7b3de331cb0a72dcac'
         'eecda8e342ac7c1f491d2666af07ed35'
         'f9572ae14eb0306c95ee20251f0c2217'
         '7857a55e45e28482b22e8bf23b0a1790'
         '7879c563cdd7a2c1d26650464540fc43'
         'cfb92834ff09a59f4149d082dc238f31'
         '0806d11e714a3138e5b5f7de3f5ad16b'
         'de52d0cf33f5e3bc105095aff86f974e'
         '187cb4872bd4c7d92a66d4e8aedb3e12'
         'c6598df8e9d947127cd37dff21165593'
         '986dd3b9e6846c722561dfa8c809f431'
         '9354ec5182de033bb250ae8db1fb3392'
         '492f25720c3f4fe310f1c3b9d5e5a6f4'
         '996e8ca8f332dcbe8746a7be77a7fdae'
         'a47722939b29f9b7a321b4322820d615'
         '9f53592aed91b9b13930e8d10119dff1'
         '34a4127303ff361dda32f75ed9d75076'
         'c54fa6adb57260f45e90ee17b09bcdcf'
         '16e919b186eedd160dbb9fc2621ee49e'
         'aa21797661f44a3293913d6927e185c3'
         '59521086802fab00b880671997319617'
         '24796d33188874c35ad8bc724246e53f'
         'bf5c7d406fe758ae4dcb08b43119bdff'
         'e26b07efc81d57239b952fbbaaaaa53f'
         'a54f415dc5ae105f2cfc32ee28ce08c2'
         'ac219a5f85b390c1a36ef028f577279b'
         '9f68144de0adfe5a35f1d702a0ac1912'
         '73a31f04ca1dec8c246232178e2c9b81'
         '74a03ac9c570e6b5252e50121574aa3c'
         '0c1651c11c1688da8b5e7cc2834948ff'
         '12c7ce21e0a870f495c2a5cfa0147cf1'
         'd02ae4ca8bd70f5691ab73cf8f3e3a73'
         '08323519a9d392fcb87371744272e061'
         '12efcf098ae598aba7cdc7e6762eae32'
         '1fd1f472d7b5f7b28392b48fa77f5e8e'
         '11b360dcdcae7f3e827f8ff47fbb5260'
         '8122b73f6ae59b9a22ae9f0f8dced8a0'
         '48140cd450b1be4d7f3004ed331c36d2'
         '7757dc40fae7e74298804778d31bec73'
         'a62160c6ba18c18217995dbd63678353'
         '34a9f739f1d6e1ac269a3159daa20996'
         '551795b33ea9069c7366a9da39461630'
         'b3d37c715ab9a6190ecf454e31bd149d'
         '37a4fb0c970394010fcdf546839969c9'
         '48fa3ac297259ef229a4cea44a0e68f5'
         'e21fe2e87ab28d088a6bf51e18e04a60'
         '1d08966c351783e93e5e29cb4ce5e7b4'
         '0e352c1139d7bc29d323c0ca82e37f58'
         '6bb86575efb1786d430cb0dce21ef422'
         '8aac8271ff18a301104d5e4679042120'
         'e232040fe2ddac7ad9790d587e47c0ff'
         'c6fcb5ba842bb32b886b1d39a4a07af6'
         '959026ea6c24cb6cd5a980a74fc85d4c'
         'f7c3f1aadcf76bc86d5ca7513c0092dc'
         '9743d5ee19a5659e4b872aee1426da29'
         '29b1f30a1628f1ff6ff24afbdd89df91'
         '25fcb89274a4c903945ee1b9379d78de'
         '6613c20fde6a088e680098af94c02942'
         'a74482b41924866442ae5645d1498928'
         '81f0ef0c2afadf417b77c6328cbc6040'
         '430f6a4d022335101c9e6185b521d2b9'
         '841d555e0bfadaa159f9ef30825d2893'
         '6be192cdaffd401ccd3b00ae79b64e56'
         'acd392ae406a5cea99c661dc37f1f269'
         'feae96069a973e1b585087c21079630d'
         'b5f6acfcdad717245ae2ecf3ee2b1e1e'
         '21046ea3202a6be701a300e70f7a356c'
         '32772f9e7267dd95381de81b0d7ddb9d'
         'eab95f3462e8f39d017b7ff4ba7a78ab'
         'c4e843a23e6e46ecbfb0877d92042218'
         'e986f88006de378c37531cc9abd70ccf'
         '66fed3a918eab43b8ab237446ec2259c'
         'd16920fab2ceb203f951b7157d70890b'
         'd1f00afe8b64de6069df6b09272fe3b9'
         '89df3eb589e5fd91a9f1ed89f47adf0d'
         '1386a643c8f4120bb56c10a12c9988eb'
         '4f175e34bbe7ba8ea843795bd2bcf73a'
         '35560e47a45851a7dc72baf7d45dc26b'
         '69d0bfbb725d2d7a81e6d88c2f0bdf29'
         '7c5833c7325c949ad24ce6a2d94aad21'
         'a50fd21dd029282943c19502f9d3074e'
         '0d39f8e1a0aa506e4c09b4436a6c0cea'
         '49fc699470f3ff60bbf574f4fed6322b'
         '848d4d4f9d772b9faca7d3fc8dddb5a0'
         'b9890ab24e98079587f06235cc6a1af2'
         'ff6fae63d84fbb15d6c4993ab6b185cf'
         '291d0b63e28e79abb09f8871d9babc9a'
         'f69d0db7be3c8ec165909316a5292ff6'
         'ab47015d9fc5454ee6c54a6047acaf2e'
         '6617d88d1259ae0333e6c2c61ba1b0d1')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
