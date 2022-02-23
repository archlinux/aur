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
pkgver=98.0b8
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
  _url=https://archive.mozilla.org/pub/firefox/releases/98.0b8/linux-x86_64/xpi
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

md5sums=('85cb88f8877a12f949de9d5e52cc5278'
         '407dd8baa006982a7282da58ffddda47'
         '1f75d0be71201b63a0c0d263b3e02544'
         'af3d5a2b8cd248bf37ab776b2b044158'
         'f9400efb2b7070717a2ecb4f7a7024bc'
         '0520333693626d4ec9481e352bd69b6c'
         'f2a1dca516aece232d810b8000082433'
         '725af9f25b9cef17123d12300bcf74f4'
         'd1778daf1a7d88fecbef74a6e786fdb6'
         '0f913d2bca150a42249716b123702c47'
         'afb9aee6b6114823cbba681c6534538f'
         'e9962390a3898cd9440eb1f0a9786fbf'
         'f79bd0216f4c3f3e59b778ededae00df'
         '39e39072f505a3c4d8709ca6abffb782'
         '057c6ae361963c67b9413ea8d0314819'
         'f76fb60baf99a5aa08ccb2b5020e75ce'
         '416412586942c7dcf215db447e212f47'
         'f44d1cff73bde0792378ae0e52660a7d'
         'e11ce8696df91b5917665dea35e2cfc5'
         '0e691c49a145bdf44addd2718bc2d744'
         '6a989e47f9c3cd3cb2e6319b46d01279'
         '82bdc54b2af78b1efa40abdd965cd5f2'
         '603a9a1d09aeb939a81ba13fc124a72b'
         'a64aaa37346bb61e13a30f2e8965c8ff'
         '672be6ca88c15556e4c413f84b624f02'
         '97c0acc03be7e05197969cd516822019'
         'fb8f3faf3c4661a706fe5d231b545bfa'
         '07eed96f36366327499f85ff6d7b9719'
         '7ccb9f055187a560430b5a5ce5887af4'
         'ceffe686d2fb596945b760c3f19cab54'
         'fc16fc315d936339babb5cf0d1691b94'
         '88d7d4a1b6d2e347db2cafcd26d7db86'
         '80ded330548b6bb1c08ca6c0326c87df'
         '674755c522307944e381141f6c369149'
         '9cfc3fa74b16f9989e73631b64971568'
         'a9ccdc15638623b2daf5fffacad15b54'
         '6739c2f33c8a05ac7508d83fbd668384'
         'd31d3a17b455991166afb1a2b0a0d5d1'
         'de2d84e5dd643c812f3e96947cb613b6'
         'c57d75f4152c2ab98c0abfbd292707ab'
         '771e125e67c90df2f06f21bde6bf7b65'
         '736d054ab60a602882eb968053e78801'
         'd9387b8f7a1a4a8c4792f2e1c2e5c1dd'
         '53c6ab077d911b8a06c3ee8b78ea0052'
         '0bb7fe82552b7d73478854b74fc38767'
         '7b663362d1269a7a55355384c616c016'
         '2767910bf69d44032575c5e00b8f11b0'
         '71ab512892ae0bbb71d7b18c2bc97c00'
         'fafc583d3b969574f1bbc4471e68241a'
         '22f35a9858ee1b898d581d96a5fee677'
         '0d83e6b8cbb56bc7af7f3bf554b0f060'
         'bafaaf00a0d985aa029bf9dcde69d7ab'
         'c0a29c5c9b798ce506c27984992732af'
         '3f1f5d7938720881940136bf96f28e77'
         '2e8ed4daa8a2c1b623e15003ad908b48'
         '7f3d057ed0098d8aceb4b08fd999e01f'
         '567b781f34c306c573bb898ec6da603c'
         '8899aafd39c0883dbb7cb1975ab2fec6'
         '11ad56409acf4fd9d3ba2bdef2b9a97f'
         '1495c1b51e8f473a3797a60299453a65'
         '93a2c94bb41b9946a5bd39e862d4faf0'
         '77df9162c1f222957f571454096592d8'
         'eea3553c6571d2ca88d0fde7bc73d0b8'
         '3310f85aed48af909a44da02e19305fb'
         '878f3975ee79eee89cff4390c3778318'
         '6ad0a5a73cb2fdccba577009f5a62a3a'
         '328a9196e45b45619fdae2eddc6a7d0b'
         'bad60b6e61b423201560f0f66091a82b'
         '8849de16fd921b6325639d779f9cbf9f'
         '3a3a2f1a9a5afad66d1b5da2035e23f1'
         'f2396a0b837da8fb0e14b7c76c614143'
         '596759a998e9aa923c191a3540609a11'
         'e879b0a8023a29c21d451467e93f931e'
         '4294278ed9fb9f1ad5e66da6581d6cbc'
         '377a71f4d61a320249dd1c3de106e4f5'
         '4507c2cb768a67f988f2a6234f8d8810'
         '468cb4194d0c96cbc8930ab682b29865'
         '88764e1adead48f89848e1563c7d328c'
         '7c1707e77f0cdb4bbe6748ddf25a81a4'
         '00c811d373e60d1a486256e6c001884e'
         'aae1b4bd379b6f62ac4025cd7e587100'
         '4f188e57caf5fd4987f1c04169e009dd'
         '631272cd06b85a407e4cf75a9ae8636b'
         '037b0870ecf727f24cc612ea47f680f7'
         'b398434be1221338d18224bedf09b6a5'
         '520441fb31c782e7c2e1fbf27d5d69c3'
         'e61b8216b487a1317894f62fb29e10cb'
         '2c3b0c4eda54ceff1ec5ecc12625f0ac'
         '7e4fa1e58757fafefd361dacc4207f4e'
         '372099a7620cd6560978c3e39d47bf73'
         '1bc88f1df7ecd144128ff2d94151f50e'
         'c32d0e93533a37e3574719acd31b4c25'
         '88d00055b9a1c2d5ca9dde6bd6aea4ea'
         '18dd4fe64e6173440b0170b77ceab9b3'
         '871e24b3a11fbdfd2084ce9710a45fe7'
         '84a406aa2ef07519b2bba1a175774e7d')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
