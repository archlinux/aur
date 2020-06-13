# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0b6
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

md5sums=('5511f9f62dd3a06ed7cf4150b3d817c2'
         '3172e702fe865cc051ccd7a121aa0474'
         'd88924c2ffd10086bf00fbdae6a55e27'
         '8f9215e37ea966b374a17526ff602844'
         'f0959525a9be26eccf97de2fead7a2d1'
         'a00f940ee68030bfc336266e8c4546b9'
         'ee59612ef96b3fddc3a04fcd9e906e91'
         '89a3fc91659d216ade3889b50311f2fd'
         '48da8e510d23b317bebf92ba0fc96708'
         'fa3ddcff54b8bd4d5fb8cea0ce8e0ad9'
         '066b7b2178153f390649cf28ee6f97e9'
         '6535231e14e5dcbb67dd21f18142e61f'
         'e14af9e6fd90dc70a624bc9d6bd5b668'
         'c3449bb9845270fa71c96237de47eba0'
         'a16d3ae879aecac3b775b4771ec6a1fc'
         '370e7c4da6c6dd3f1d7d087e51b8bf4d'
         '132632be3350036980f155c686f49b61'
         'b1148532cb752e91891033b2b35ea7ef'
         '6a2184b2079c709d6dbc2588025b459b'
         'f4871d15176e8ed580e115c9c2287fa5'
         '41a16724a07b4c7f52c971ec15786336'
         '66530e053be37d879b44adcd9d0bc5ef'
         '0b99f2fea1126a8e6f0a1cd26e3f9e0d'
         '5793580779304af13a0bf0c23ab3f473'
         '6b2f9cadd78d77db181044f36d0e7619'
         '4c6b69de5976c012c7a1307df8112949'
         'a6b09c8d850719ccd06888050e74bba2'
         '29a102e80bfbb13d08c0126a1ebf948b'
         '0eea14d082ec9f652cc20784ea6fe000'
         '4e5a1fc09a3a539b8835d61d192c1f2d'
         'aae363a0b29cefa7139032fa0d6ac4aa'
         '0cf0be7eb91745fb6bf11c86962cdd04'
         '745f95875ed33921e85fb1f9090d3b75'
         '30abdfa90365c15040cb4d0a2f4bbfed'
         '35f095e344b3c2261178460039a9ea86'
         '8d728c36674fe827e80ec2d3f1fa380d'
         '92df491f77129c7cd96ad7e4291860aa'
         '77319b7599c47056446cfe71ebcd0bac'
         '50e3a5bd5cf175119729839a2e574e63'
         '214ab58579123ea146eda72d93511e2a'
         '3183015720a5ea0ae455312d97d6b5fb'
         '660aa7b0506104fd54bb4e13d337baac'
         '0b5a8ae7dedd72da4653b761d2e2d0e3'
         '080dae23926aba8b2d6724749db33c66'
         '38b41e1119faceff52244cbfe57700d2'
         'c79eda0c9ae2f4f5636ed3f64e3d22a5'
         '272845849c76b63e573bed5f06eed7b2'
         '296e06a2b607dd496e97b0c03d8b820f'
         'c1f03ed3b16f0ad84d5c9d88f3d4a1d7'
         'a5215dbcb07c73bf7131bde7c180ebe7'
         '1adb22d151e4e084cf7d44e8bceffae9'
         'e9258ed765d849cab850147bae46a891'
         '3f4ec64cd544df531f2c67e890e251b0'
         'ef27ad8f1c7740d60085d1af497a7203'
         '85c5ba0e61c6c43d52b46919eb27969c'
         'cf8320ce61ede1bd42defb78bf9ad4e8'
         'abfb657a45ea3f3f35f5d4d8e1ff9041'
         'f725366624997bc515ba4bef4ab2893e'
         '159fddc2ca3529e926a5b78e708540ec'
         'c94ab54ee1578529f39c1e3db7d0ceae'
         'c82ac6948a5f8f0c6bda47f1afc1ff43'
         'bc2d3c21071906be72d935521d7eb80c'
         '015ca37666f134b81694292961ed717a'
         '4d1078442027b476a073e343e74ac11f'
         'f02aca130bf2add3b5c5bfa0fa3647f3'
         'c10f5bfde107e205bca7eda9385b8d3c'
         '958ab633f4e1c345bf1908b291891e7c'
         '60fbb33f2c5ec18b2ecd260787ec0e3f'
         '20f42b5a238151a6be4ae3c3b4cfb2d7'
         '7a6eb7966dd28278db79fd8031bb5cdf'
         '59682ca4d8ede3a39d9380faddaa49d4'
         'b8e5d36d669d6420924e4f2368d5e978'
         'f790be30fae1c164287347f0606df1c4'
         '8bad87164c299cc45e75841763f6e184'
         'a07966aea2bfcc1204fc96465e25ec2b'
         'c8be58f47f1683100c6bc9f1b08be624'
         '8569bf6b36b4d3df565074a49d8bb569'
         '79a986cd1cb9f25b96508458ec857221'
         '1802f7461f5f58628adcfbb168fda59f'
         '922b32fd1fd0c838db2b1dae5e57d3a6'
         'b41e6394e319fcf5df5bb7b2f49edf80'
         '07df6e0d358bb757c8b86262fdfa6124'
         '465a6eb0a4d37c542026674e5436e008'
         '0a16c82c08afac011cbc1014db684be5'
         'ee68ef137e4f3505fa3711e76066c644'
         'ce8a0bd4d290eeb2c6f6852256e2ae2f'
         '19c6d363ea55c7a4b652c86c9a605fb8'
         '31ce02a28a35765f2ff29e5a7cc76bf8'
         'a891cf840936f86f87894f4c94d3d732'
         '723d5b66ccfed21d224f28067acd90ce'
         '7a7ffbabe33bf535151e68b71c45a8a7'
         'af93ea9061a06254afbd9ae6c77a0769'
         'ab05c70e5000514001e72afc1309c827'
         '0e2aa43a5394bf9d062e0f930f43d318'
         '629920c4d3e557b281e1c65b049578b1'
         '71f6d09123b01ccc83ca92846fcfd766')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
