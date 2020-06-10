# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0b5
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

md5sums=('d2b2aa560b8e265a69c842b9d80fcd07'
         '17b68fd979878ee205a0197251091dd1'
         '3295b03864377194a0c2c896d4325724'
         '0d7f7e156f3531d38304018e9f1eea55'
         '227227c6b7fb54601bb56c4dc6a4fb31'
         '6ff128bff601eb6e1addda1e2ca4f797'
         'b56fe118950b67d3cfb8cea211a9f11b'
         '216a6fa4cd720912e1acac06808106d7'
         '69bb8db57f277c792c55a79fe24c5369'
         '781ae19ab584b390d9fac063630173b5'
         '8bd320b6a718386034c3acbdff3ca85c'
         '1429bfa7210c8c79482993080d6e0c32'
         '335d5ca15de930173d1131379875ae16'
         'a4416c0476543dd5056f02418b814114'
         '26b13fcc75b2dde584ed3a96e077b580'
         'cd8591e36dbfcf7b812f44f879175c5c'
         'addda9ed88c2be0ba5faf320da07aa31'
         'e1ac22c293f76af46ca32000dd348fa6'
         '280ea99f29afb1931ce11e396eb24ca6'
         'c7c6f0b336b7dc0f8aaf69fc80a37952'
         '04759a27a9d0693d0cb3e2ae1589ff85'
         'b0414400a808c979d830bed077b9a8e9'
         '217bd009771e73fd07cb27170a629085'
         '3755660f284cf68cfb7043a8fd8a2dc1'
         'e6a221d77eecf51ffc1cb3d186641e92'
         '35e0230fd6d6a25684b930a2f6412757'
         '6916878f806cc9cea81afdd67745cbc4'
         'd53fdd55fa4c17f36da8083071bd1483'
         'ed290f9f6eca470ed5b0ba057c631f6a'
         '73ed7b37b2a135a3b5774cbbeb96360e'
         '7f8538ecf926e20b37b4757714b48f53'
         'afa3855eca4001210ce52cd66f83e1c9'
         '5c738db6f1a51ee9eeb943f21400076c'
         '878d34b45ba4861becab8c482bae21a2'
         'dc2f43a1ae0ce486f18c7da2b7eb367f'
         'c6adaeb3a328fb82d0c110a433e5b63c'
         '485283a0b07dfef4bc005b75f05b09cb'
         'd9c92d5f9746e514c633c6f39945cde6'
         'bd7ec4db2975406dff216e0befe05ac8'
         '448346af6238f6fe3c22f022a0c98771'
         '441631eeb4b9e6aabee5fa6e3ed1f169'
         'a271bba14ea175a08e7b55a05849c380'
         'a95095ecb86d3f19cd8265d19f108146'
         '7def56a3ecac2afb29c8e6b6f675145a'
         'ff330d791df335e3bac99e62c7e6bd8d'
         'bff493d02a4f12477d5325f1f809f819'
         '6d3889774d2182de4f518d3aebc40e95'
         '96df600db3e2097c5e15c83b8886a499'
         '3977516eccf7571d0cb492202990d3f5'
         '48db58d81f91f2119c35d870aeeb7e10'
         '6c13df3e598604f403a3ed20ac4adfda'
         'c38ca20466e94ee3cb1d4de8f0a57959'
         '6bfe54c4eecf355c656d97d0c48e3acd'
         'd07c01b4757e105207622d30fae12fe6'
         '662746ba352fad2438e7bd0fa0f8facb'
         '13dece5a0fb0395e011365bedfbde2ea'
         '219fb5e77064f1a8d3caabf3f6e12103'
         '95bf5ee03beddcf47e42b5abd48d630d'
         '98a439a775c353a5fe69f7de1ae6f42d'
         'ad99ae6dfe3e75b629e7fcf473ed86f9'
         '2bc8e2fb984e644ed4284218e7bbca46'
         'dc4ed0ac688d272ccffc41485d4ff0fe'
         '7152041f5c4b61ffc43accd8f9a1f6b1'
         'abc7e2168549c59a6c4bc3aa72631953'
         '8be068b881f526588620d90fa4e8f0a9'
         '117fa7419c176498141c15996bf6b166'
         '8de6c0a99f581c41e81a1dd999377adf'
         'ec3afbf7660239eafb2198f111d558db'
         '7258144a4147642cdf70353c180e02d2'
         'fc646cf33af9a4eaaaa21150ad43054d'
         '8ce1191918729944f12531172e2fdd0e'
         '946ea5e5fdd7b06b66366b3dd9dd2c0f'
         'b60bfcf65d337de95ad270bc7e3038bc'
         '42f514161dc321db1e7f09883018d28f'
         'cecb4e17bc29a288f51990861245635b'
         '3cc10c93ca431b01011a500f6e941fbd'
         '8c57ca715b55645c963151ffc453a280'
         'd46aaea7727c23e17f3507f93a0a3f26'
         '16f79d7fc3d0b53b1a56ec943a5c529b'
         '1869f57b76057f38b7be4945059fd23d'
         '89e3510d5adde37054b6e504ac962351'
         'd758e1b31499b9e2cc932e167ed8e494'
         '53b2780a4069599528dec68dfd5598eb'
         '4eaec8ec23fedac6658fdff8b9470c80'
         'a586792561c80d2ad55ebc8fe1d606f9'
         'a5a4e9665ab236fde42f34a3ec2e7551'
         '2d1cedcace92caa41be30dbaedd02031'
         '755a2e77e0810c61d237f992555f3e3b'
         '87395452b2195a2f8e898eafa4c7e43e'
         '317707cfd21f447d6b02d58f695667fb'
         '120f114ea5d1c53aab4284a06e0a75e8'
         '7b9358154bd755f49f2351821b4a6e99'
         'f2bbbda192a181002f8f031fda93efa9'
         '301d1ca18f7f550995865e3a445a5d0c'
         '28204aaf2643b636a5e3f4b9f461597f'
         '2c1d39fc6680fe4a7f5d0ffc1464066b')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
