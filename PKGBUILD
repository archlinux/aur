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
pkgver=96.0b10
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

md5sums=('4c361440093690b8fe80fa2f3118b92b'
         '679e0ee71e88fe0046fba37c1ec64715'
         '6178654ff69963c75a6274fafae151b9'
         '9aec155f1df098ba8a906ea49b6836ec'
         'be17ebfc01398e0ec845fb1bca5eb0ba'
         'b0c94c7b4b88fba2e7b6487c0c561c89'
         'f562984686aaf272d24f92f6c79e11c7'
         '581f5f576c5b0c763bc7c368f8792d1c'
         '29e69ccbfb4cc2fa2a6e79cb93b75e51'
         '386064d2b24b5e4cb288b98cbcda9436'
         '9bd3104e3991dc13932681fbd7fecfda'
         'ca7fed40aefab27bed0cf60551f8c958'
         '794876c593bffb8a0cbdaa3ae0be712a'
         '98df89ed969152469d6de91a1e0087c4'
         '00c9f5308c1d7cba3130ae7d3c34e5a3'
         'e9811f3c1bb9c317195481cb63ddec75'
         'c32d36cd0a849d992ade90653d52b8ba'
         'c7dbfc365c6c850e8b83a7d82c2ad739'
         'bd8bbc9b19fc38e8157c424b1b5bc110'
         'd6a57c83d94958b1ff2cee8309abd086'
         '52a42a824f1d1510bebfed7e1d726ac7'
         '8555f5dc353be1da017b2f1216b80e93'
         'e148586c5ab36fb3cf1bc27dc3ac6184'
         '55e7d2e961bd829ea8cdd6249c66985e'
         '7eb0dbbd2b6f73b4cb7bdc7fc54b0ce7'
         '94f0cf09cf954b035ad2df9227e10294'
         'e3dd48cae1901a1cb2181b346a39dca3'
         'd7598ed1e8627431191c0158d52c0341'
         '22057b5f345cbe850121206510366898'
         '0f247628814b8cfe1b35c38b01ef8b8b'
         'f799831a1d5780fc8d3a85059ffda0c4'
         '292e14143e133ff415bb2775536dfdea'
         '90478df999aea16ed2900e9cdfd75442'
         '38443d2d43673891b78507905f6204cc'
         '14b390f6fd6edb7e256c956d3a3f4635'
         '4e8eb7359bc3e56b1e17d1486d423639'
         'a680498885b911b283445de70e6878ca'
         '952e55c68b29fd50bfe0cdd826deecdc'
         'f53a6856d3902d69b39fe132ef3047e3'
         '84eac2451764dda0243e9e5a47596f53'
         '982c9fafc89837ea021270948342a6e5'
         'af6b228401cde5c763c33bcada227e72'
         '532ebbda0b0e7a91d186e8a56a74892a'
         '482da323b2cfc0c96e15f6932143581c'
         '6faf3979576637aee8e458851cd48d35'
         'b0063f11b4ee626e51e0d761f2a7667c'
         '00e00584f3bdb010d252970fec53a8ea'
         'a26c379fdcd98b5353f6d3175c13226a'
         '655c828648576a560e5f11f731e64bc5'
         'b5a558bff0e081edfd59d991b1beee5d'
         'abb3ccf926564b74843b57a7940917e7'
         '8aab0609c02c2c804eaacfdca9d0bde6'
         'e11bb74382edbcead07309733b181661'
         '61208f3cf7b8cc4124f6bcd7dfd8b034'
         '293146c79a706ff5e4bc06717420792b'
         'e46179632bccf57dd0c5d3d85c30b7a9'
         '3d60ee9d946a11267a5965771921bf77'
         '2dbeafc2ed6bce6c56faaabecb9be867'
         '690c4d48bbc38fde7eac24547c7f63c6'
         'fd06e6e3d7fccbf8ebfa6b194e966e86'
         '7943f60b2137aef5e4a901c64fc2709d'
         '4f11fb314738061baf7aeaee3d9e4468'
         '995507414661264737cafc5518540a76'
         'af504fbd9a0d6f74390a3e1cb0dbea42'
         'a2dd64be1f96d6ffc6a659240bce64ca'
         'cb26e07ddebd538e72621d5613cbe86b'
         '600f416f96a982243e8c790fc4653629'
         '6a528b6ed82b857873d179aeb73bce27'
         'fe6b6fc3ee5273f1ae845f5bc25d4d6b'
         '18a549abd4cd80fa784b214ca183da79'
         'f165d8d62bcb6224ebd9ac266c0b3319'
         '841746f8a2106cb89e540d73482151c0'
         '64b4d4ec46f9b13fbe9c5c8159b7764a'
         '5f1f1acb017be3f52787e0d6f1d614d4'
         'a44656770896a20933bdfd4e28d892f8'
         '638b7e9f0755eb49579e1a242c708fff'
         '68a86cc6c2fd4a4013af9718b573fb44'
         'e69dcd2070ee671ec35e6f9b74711e9d'
         '6f9aebe3565cd31f332bab2a368389e9'
         '56b0b71c0103654821a4578c8b3bb7e7'
         '2a1c209f9f44f416d482b5a5b3de6978'
         'b48b525656460131d9a7c28407130f93'
         '72b68f54096b22a8b0acf2c78ade5432'
         '2bd959d60011880a0f45a581ea6f8768'
         'de824610e9b85a9fcd60b6410dc1af60'
         'e75db745b92b978b5120e85f58cdd590'
         'c416b3833baad39ce43d3fdd7e849bfb'
         '745d6cb9493904aa63a43dbe4ad252b0'
         'af4df6aaae921b3b678a43024e7dc2cb'
         'f812026614edae5a87fc59f1a588f3a1'
         'ead200013c6f84c143a4f1eefaf64acd'
         'a79a7c159aacc19b792305daafa1ccdb'
         'e46d15bf55cbb3b58234f818ee209481'
         '444171ecc73824d8bf98b5022ca070a0'
         '5a7299db5d43bca8aa8137a344c80685'
         '28f42b0ae6194adfc895f7eb7e452a04')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
