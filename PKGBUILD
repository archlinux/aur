# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0rc2
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

md5sums=('db993e0e041af5ff8bae77bc2a0e44d8'
         '87e89373297c08a29eae607f9c85c24d'
         '5c60f8eecf917852417e03379b9de8dc'
         '9059e2bf01d9eaeb0707145a3876466b'
         '15e2f79062db3818fd5d3d2da1b618dd'
         'a29153ef31d7306d87a44f3b931f8e6b'
         '51442a5da3c207193d532dca7cb3e628'
         '2f615ddf683c7448b49c25230eff5df0'
         'fdfd7a47e441119a0c1a8dee2f1c8fba'
         '61797a50b698fe1c5d4ab3bab67867fd'
         'c16fcde1722694af92ac45c5993832c1'
         'a5b26fb6370211e3d66c2c57bf34ea7b'
         'b13f8664f97fdd5b316310b478960037'
         '20ce04c18c8721c627d4ebe038ac0554'
         '770eafef78b6c2db49aac2d604260a1d'
         '61fab9318a4da1bb99dc4171946ece3a'
         'b4fa176cd1c3a94b7f420050c4efa011'
         '8220e841b36505a3c17235321904113c'
         '5b7837724633b4d07067c7ebab34b6c1'
         '3131a682cc0b64fe043cfc86103d5340'
         '6ffe33d4de072952e7369c032dcb8c88'
         '5e4ce2f6f2dc2be4c230afe79ed8f924'
         'ffb1041f0c120eefbb4ae3eeddabf515'
         'eb9f91789b9e668bf0fb95ef02e8c84e'
         '90373d12fc3fe1dd5d5f0a2db7d4f2bb'
         '9d0a6072da07aa1015e6b65bc0292e8c'
         '89c0c4f11efef89adf5feac7a6c8aeca'
         '6a56ab6766f71f845d443b7ed4bbe7b8'
         '0acbac029256144275671d3d938fc93f'
         'f83d834f11880901ed2a6cbd6c93ae76'
         'd1ab8fbe5eb0f75ee02210d8ff7af2c3'
         'f67953eed31075e39c179ca8b089a53e'
         '9ef54e847d0e26924475880c346216c7'
         'a2aaa8adc0d66ce8de4dabb74676b727'
         '69c9171671a017fcbb96c1522623575c'
         '2890d72da72d96364881c6306f197636'
         'a00b5aab85e8c43e57d5e72518aa121e'
         '70e5943cd0960430a727a5e0f2e358fc'
         '0dcdffc8872a0146888bef175fcc3233'
         'd83eecdecbb87c5a3f5e64f75e26da12'
         'e75ab1ec657eed57fe01eb755a63ee76'
         'fcb99d3f9bafe0c551cca5f4c4066f15'
         '04964abaec3de053a590d32acef37f0b'
         '3556548352a119d3fa650940047cd3ce'
         '6871dc7a4c79ab3922850104831cbdba'
         'cb198c41ef531fe5a888e8c0d6e583bb'
         'c858bbf2c9883f21d3a59fd2f228a226'
         '2226cddd083bdc7f6c98dd8b12d27952'
         '92401b25257283d58e323f02ace9bfb4'
         '5c2de90ea62d1ecc8ce3fd7f32031920'
         'd89b4d1db441eb67237b8151d924429b'
         '2c1cabc2fa5828d3e2875536fedaa54d'
         'c873179dce5ba6414ccb76da82bb4f8c'
         'f7af92382892eb7dbd748674d968518d'
         'c9e4cf39c6730269526bb824d10542fa'
         '662ba2c26aacaac93075c2eed39d5b73'
         'b3b4e1695534a1c71310f40007c4e6b9'
         'fda44fc10a761c3e6e7041294082551a'
         'e4cea50c0d94fada1505b6912e243fa5'
         'b3ec796fe3519c9f8039709a9c1dddd2'
         'be897ea6f036e2fd99c4689b4684f026'
         'bb9ee6a54e03bc31a4f865b048ab6fa5'
         '53a891ca2c2b41a33fdd3b7a7b24ddaa'
         '32b59b70768fd8a7507f5b8d03811427'
         'd7d0c8f5d51b5002e4743cef4b3052c3'
         '6b6949fa2b91cb2f681b610a02a20650'
         '566e0e46ca02fa3227f1916751a5d85e'
         '6495e1fd853db806816085ab66decad6'
         'b9ec04376f4df5aa59a4d6114b196b98'
         'af67053134501674360de074a54171ce'
         'ee9aaf30c172ba60f3ad61e632250edc'
         '1de6b8481ebdf91b0077b8e916cdbc0c'
         '11fe9495b737baa439488f33a1b2b5e6'
         'a04609ce0e4165939f771efd6cfcf06f'
         'f0a0e6200ade087fe08974725e001a10'
         '5ab17ac2fbf1947a9b3bdd7afd879508'
         '7a52016a3b6586a23b368024c7cb0c6d'
         'cb937ef50d6aa2a81e32116a47e78ac5'
         '9b8136380c9a1987c8899ab1da2452bf'
         'c01a97b623d652b81047c1a613147ae1'
         '422292224cddbbe2ebd7cf2eb480ece9'
         'b5e8f9399757b27872ac3af4bbc7884f'
         '8f16d319703c3a8201b21ac14bd941f5'
         '57617ee0e272c58c093ddb084062beb3'
         'f03b9b5b638e58faaf6b16ca15463a5e'
         'fcebbb06e9a7e29ad466ffbb48172469'
         '1175954d978c659795df0221a309ddea'
         '0334d627e59e9c8913f1c21152f9d6d6'
         'a60319f220936b877a9e199cb7f8ec5f'
         '1ee897f7ce8b3beb4d9012709ab634db'
         '850db7971b9057f1825ecb2a1182d043'
         '1524453b17ea8fd35b66be2fbed1531c'
         '940947e60dbef185cd26a71511c95dca'
         '6c48c8a1de4df74a1f8c2e73f3f9922b'
         'b82a87364931dd79a48272de26eae410'
         '0c516799dbc001bb85b4495f16ba00aa')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
