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
pkgver=100.0b1
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
  _url=https://archive.mozilla.org/pub/firefox/releases/100.0b1/linux-x86_64/xpi
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

md5sums=('4405c1eae0c4251075c91e73d51bea23'
         '46211db1f405745237fcee9936ff3583'
         'b1a4d546494822ece3327f2045524fd8'
         'e7065ac03a674fba67490dca5042f8b1'
         '9991e799b21995099f318c0bbe363870'
         '7f6c09104d4d0f9d1ed49a00540760cc'
         'dab885207ee77c592e02f13ff78a7600'
         'ec75bc597bd39277af96d77ec6e8d4e8'
         'a130e4c74b82608fd1f490519a57fc9a'
         'e02ad0493caa06005aa85d00ba911a63'
         'a5c70440e4904611b6352e14ff38dcaa'
         '77c9bd84fe66d0623e69710ceafb0392'
         '6ac6dae1cf466770515b050e662134df'
         '7bacb2aa72a29d843401e786a29b6d0a'
         '7b9a0b388bbc4f744afbad7c8d51c6be'
         '37674157facdb65ec5a6885bb4db49e9'
         'e526b745847f53a5216003303459dc4b'
         'c27b8b4210b69bcc30c03fd42fb1905f'
         '5f6e1e027da5898bd43481534ed5b685'
         '94b6f6dc8d48a8b0e6f0fc3064271cea'
         '8e5f3ca5a6f3d1f2c3b48852418e3154'
         '4ba775e21951b5c7f484443611d02cf9'
         '87f4e1c2b1e3730e6632bfb74e0bf56f'
         'f6ae73838718da9127ed1a12bee67b29'
         '2da1764b9d2970835705afc4ce0a3ef5'
         'b972efb703c3f428d6f2259c4a19077e'
         '93147be607b81ebd4082d8e12078d86a'
         'df62b8c2755a09a8cd9c90dbd5ff7d05'
         'a85d52501886aacfd062b2729b7295e5'
         'f1ffdca988a9e3695b88a96ead46e550'
         '3e0f432b9d588a5819659968bd6aa8a6'
         'dc798a87a469fc9e948312516504dfcd'
         '007ec89ab380fe663e1bfa594522edc2'
         '98dc448c3335df0c1d84ed4e13eca47e'
         '8bd9674e5f196c45d53a1f0c07231061'
         '5220e14d8bcfe53d87f366d53cb98c09'
         '5224f8a2653f55dddd2956a0cf74e13c'
         'eb8de05447805de2b2b990835249ccb3'
         '4c6da14e18789aaa1b0a4544110611ff'
         'cd08d769e5b4cfd03a8f155769c75995'
         '114942041cafeb6dd16c5a99835e3754'
         '8366f9e585185466ceb24994c38471c8'
         'ae8a1d1a0b676cd6370c49e052d652e8'
         'ffae607a0909cb04c82607e41b565497'
         '278ef9d0afa1ae50a2e9da781c24ca2d'
         '280c63367743556d6372d484c511eae5'
         '1536592d6b8e812b35e16fea08533d65'
         '54ce2d2afaacdf66b637138716408597'
         '95dc172a5604d6f8eaeb036906b28a11'
         '064e072a8c2b2ab3387a37271c14591f'
         'cf73dbbf125c1566efeca5b639481910'
         'ba7e7d54d3452bcee8ce64f1925ad6d5'
         'e54080afdf73e91a67881d5d1d07d052'
         '746e08a15d798f96cc4163179a5bbdea'
         '67cbe6afd6a8b3929342520ad0233cf8'
         'dbcf05c0abb39b337f22ee5bb49cd17d'
         '5458b90fb770ddeaa65d82af60ed433d'
         'b80a336502ea38de43fea8bdd0fd3c2a'
         'e8115b2b36d8142224b96619cb8b971d'
         'ba731b9641b94e03f295e941cd89fa2c'
         'b1ac34865fa4ece96d3ae3f3b01680d8'
         '2e89eed299fa4eb30b9caa30954a9a39'
         '65d6d59e8c02f2558f5bc1fc4cfdfaf7'
         '22b2f0a66f1e6eed3a16c26886c2bd74'
         '83b6e6185ce9ea35207bee19996acbfa'
         '84bc5fdb47b12a9f40756a7288e5d17a'
         'a5a61dfa56eb282cf7f00d1c0d58a33b'
         'a1527f8d3d22e058dc98fd024919bc72'
         '15b91ada1620c0586568e3df80410635'
         'fded780efb9186fa0b5a00a1a82dd133'
         'b7c31858b200a42a7de762d6c9190fb8'
         '635526f2963f1fb7dd87dd1ed5447077'
         '309d12dfb88d8a72782a6e2a8c5f6117'
         '7d464f3fcafe2daadd530f4af36c1d5c'
         '8474306a062789b8300262b052eb9955'
         'af8ef59c495e034fcc6458aafcc97d6c'
         '79d5b6e36aebe60a5c8838d39b9fde4f'
         '1c79157db9cf285a28c18f34cc775b74'
         'f1f7ac9b1ce054a498bab2160919a1f4'
         'd3703cbe9ab7f72828571e4f0768ca95'
         '9f15656c601ee421f717421e5489a280'
         'cf902e149401c1c09d594df0dd39c2dd'
         'e75798341dc96f0acaeb56d249a42509'
         '6da952aae2c026e0c43b99032c2054e8'
         '13da80b84ea189982a6d82f09a1d04a1'
         'e21ae09cb6c054dcda67469060febbb3'
         '0210a836abd5ed9bd3ab2b738d94ea18'
         '715477b080ba290a28c3b6386fa6a7a3'
         '2837750b5e72ca152e7b019a823af430'
         '7502d7e24629ef93aed20d93ed5eabc5'
         '17dd778fdbcf1d959eb93020f7652338'
         '2f41fae3ec4c4b77004be09d86134113'
         '9e116dbb99f9df74b00a06286bd6ee67'
         '3473527b47dd69e5cc2f13c02e4457e0'
         'b1e14e71e0c8d94fac3466f21adcba1c'
         '3a8b48528f708e8124eb416305df70ed')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
