# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0a1.20200826
_pkgver=82.0a1
pkgrel=1
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
depends=("firefox-nightly>=$pkgver")

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
_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-nightly-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-i18n-$_pkgver-$_locale.xpi::$_url/firefox-$_pkgver.$_locale.langpack.xpi")
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
      "$pkgdir/opt/firefox-nightly/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('bb2f3dcdf4e6310f044c602c2e83c900ae5d4131167ce8012521fcaa8fe77155'
            '09afb7be5ac3cc344abd8a6e8ba87aebc8ab519ec21dcc89985ee8fe438795d5'
            'c0ef2f3b588617bddc37e28442d93d6abfbdfa677775db463e9c7303f7237015'
            '39febf72e50801921b6b200a92d02f159310022a0e3949611f0da65ae28c9221'
            '58731691cc207ccf86499ab3284397ff337c1bae4ff90a93d6e6a955ff9dfa4f'
            '97b4eb6ac93ecdd31ac282a2f92fd08a1ef9d299ab93cd55a0cb7414b604d14e'
            '42dc2fdd0e60e0e44bbf91eb6e51403750a923dc6ad3bad6a8784018c416f1d6'
            'ed68894d7b95612fa2e3fe7236a4a85f0ebdfb6558646645ca6cb75186d3f4e9'
            'b340befdb12ca37225ddcb31dd9e6616bae5cbbf382d3b1075f5d5eae55aeb20'
            'fc727bceed19c93dd30c5686ff2b4784aa3aca68a8060929061f518460a19384'
            '936734e6acca3da54b6a2b11f3cbe1735c4dc3d60afdff7f28cf6ca48159da16'
            '76960701e71a9035d907fc636e2dfad843efb13b62e06f4263947f827444dfe5'
            '16eb75984b45f0ba6c649d70a87243664dec56f08fa82e3a762fc1d4206cd3ee'
            'b1ec19559286572f692fe0aae77bc6730a2163843e6f7b183019ce99d17ade61'
            'c6dba831b0f92184b24c49ec6ecb30017e33fa8994013a4476db9addcb37c8da'
            'dbcf6f757d090b7278b7b793e269a78e9d8053073fab0b1b090841fda0697061'
            '60230875ddf3c44a10580cb857c743182b46b421346f638eae2dc115492f0500'
            '0d85631fd63bb2111b0f2ed061562ef09dcbc29417353d5104ab4696022ca9d0'
            'a0f3ff3d6f9f9652ecc8d41e179e217d617a9ae1fe01c0fa3956ad55ffa02c86'
            'a4610cf785cd30b3798bfb78cb31dee2bafe28da2f70fa3b7c9544cfec1ecd9b'
            '7f34b2e41ea36ba6c16a81ec398563b862f84ae6a61cfa46b2d56f3161d65fdd'
            '17b3c40834e5181286ec7945ca63c747ac48f7025b270ac291047529a8a50bcf'
            '7608e0047c159b6710af8d831e73100ceabdb6158872b7378e8b0dd214433459'
            '5624eb989da1843368e3986fbac269d719b8a833d826997c0c98f2e6186956a2'
            'd6d4d4fe07e6dd7939213d1753e8b005fe684268e59494ae38dc4d2adcc8ea7e'
            'e406d8ea8b69bab84f4b61d47e633f08dcaf854a9e429094c06d1000928e71de'
            '637da8abcd2b61ca3481348e7cbda46adfe0e45100ff71a0b53d18e9ba0cddf4'
            'b69d35f177ec228eeaa3b8ef6be8e49449af0a831619a4ac661ee4f967c3e19b'
            '7a41348c0a0f6e0356f797c9713b9859401cf8569cede0318ee6a0d8b4c7ab52'
            '9160d9722202eff68c3aa82ae15cbca06cc453ce4d39dcf8225f1c90a3ea1398'
            '9903ee11e76224291fe6a70a9c24250d1604212fa1fadfbe052d0863cb3a1728'
            '9b31c76816df85f11bf5e1a7d4b938a7b64799a762f072fc48dc87a607f1038d'
            'd021ec1afa96cbd9667646779f77b2d8cc57bbd31661f2db6297dda41b06a76d'
            'e58454d68eba1688f543654e7fac2a316a6d3a46675080a668b5e9a1823a0e52'
            '383bcc62144c4876a9d09785dac714bf1b1b662aa2d7b3a9fec682f23bb2f4b2'
            '4f951673de5ca28295994d03ee00383ceeff83f32665c03173d5f805dddf965a'
            'b964e6052f85b83a267e9b54f531c6792087dcde44ca6741c49daa52e527215a'
            'df593c7629c98bd29643eacecf1f6bf7a5da61709cdc51d5870dae2b5d821d40'
            '9c9693a5f2c506238c79e959215eeda14498409b590986d2d9c20bdfdaee95a3'
            '20ba98b9f2d62d52ea7ac89162747b0ed0ddb8341036aa3d5afe91e6995ee68f'
            '106e1ecbbdfb7abfe02009e6882650550f9dae58df54b14f7a8a0dc72891b962'
            '7c84f6c33328cda7bd5ea10abccd1a5e305ff61ec01549f7321a895fb949d5e4'
            'e7e0020f5255c60fec284eac764fb079d51193a13d20fa8bcd52adf2bd7477f1'
            '286e7cf971502dcd3969486e8617172e11a538218289746e2ccce2842677e9e0'
            'bac412c4529c81f907fd71a29d5b8909cad0b799ea60e0c96113ae8cfd06a7ed'
            '7c46a3f9bda4a30da19cae2ac28b915d7d2b8a9f95f800a01d69aeb022d603a9'
            'c1eca9bc797913818204b7bfa69ae839155c6362880728b0677a28cba1a7b325'
            'ac6ded3f5a4042b9ede2bd9a449d3339f0334866e0aedf923e7808a7b2ed6e13'
            '4d877c6e54e2c115e5ea79023ca3b5e73257a7cfe24faa82d58a70701164eeb4'
            '57a355eb93d68ffc39d543c766da4e0d907c139303ec8e07cfa45ef43373aef6'
            '98aebf706d1cc4d6308ec064a2e0f49638727122864e3b43808525b0b9ab8030'
            'c53212f0b27068bacdbe47416e33e1c922c49f1c2a4e37c1a5d0472d3046747a'
            '1fa9599fb3c24a3ef7da3d8cf62549c8841947e888397cd87fa1a54f45c567fa'
            '67a7bf15394194232316cdb057160b6decce059e6eb854d8c9e13d84545b35d5'
            '95ad08d1519c1d4a29ef1034ec3a9d04687d9c1f0e375ab3f65cb428fcbcac93'
            'ecec520df9f1b9e1142c776d1a32aade936d1cca344e8177d10c684923e249bb'
            '633a7081e867a30c0676fa71c0f8c13732d802cc5b075b7cd7d262a5bed2536a'
            '72de4565789231e35a89754467641632b4762ba6333ea2b01148c97da5cec77f'
            '453a7eaf959eaeb51507fabe5726431c56eff51c7fafce8b28b79420bcdcb831'
            '93ae5c9a3576649fdfa697dee2b27883b40a580eb6865a5f8e941ee3e5e93003'
            '9e3560af74aaba0a8e689160868fc7b659eba90d78c58400849f78fec20715e7'
            'fe99510eb528c381820e54d96c8c1d63d073d9aa072287d3656d93ae62bf7eac'
            '2203d389c90d954c7c750bf8c92c034ae020f03ca22a771d19a17fddef37609b'
            '63759b3bbb0de5464aa962c67320426803ca82b6b93bf13de18c3c9ea6f619eb'
            '3ecd7716cc7b4a791caf6778de9ee495eda4655542176309f017a3cb47ff5f69'
            '23b23201c0fcebea898f20f31623cb4ae855bf8bbf0f002f0e86595af67eac0d'
            '5e99b210e9b9d8883f8d3854af9233393bf3d70b44018f73898abafb687ca3cf'
            'ebaf31645651b89569b837852f11cff0a3920ca56a54690534c6f52ffa5ccef6'
            '6a0039a62f8ac7ded8f3044f472a1ebbfcaf21d03f5d6592cd76a2c1be1e37c9'
            '1eb0a643e46bfbecbb08ae58d1802017326538735f9d223abbb96ef56f6e3337'
            '391f75509a654eda745fa57c34efc49d7833072ba9a6fc9e31f1ab35fe9cd8d2'
            '83c85fa5a2d64f5fa9f9a3b741d68a4154259e6556dbc57016cf6f220766d6d2'
            'eb2cc325fc19440536d9fd21af5231dc455df0d509ac22fe0eb56c9c3303917b'
            '792db3d67b66e731c9d70d302ef698ed151855c56ae284d67aa356ed6af51d32'
            '7cc004988fa1f9df7406f837cfb21a2a4622d463fc7f4be7c9368e71eb0a849b'
            '9fe70aff33cccccd585515d3718660e64a91022e359c1eda91380c9a3868e3b6'
            '49f6a068e8a3ddc6a96dffc688bb26fb84d21d9c31cbf697fb12ef4dc06b6d41'
            '0ec6f305a119f7afc7daac3a0bb5b72da64c47beed663bef8c714f3b58b0bc43'
            '6034ebf01d5adf6cc3b9e149a72447aa8f28cedafc8f8052d26630f12a8d3595'
            'a532affbcaa33cc5f86781b37d92244bfd18c3c40417de84b81aec9a0b39a4cd'
            '60b2c2ec1f8fe473f7112c2779500bbae21814acb9c4b327158860c208e9e5fd'
            '81f3660e0cdae4d10bf2cce09b2d36c55a76e3b694552d23bb76302a6cb06459'
            '4b65a8593b2f0ccf733bc209b7e39d0ffd6d1d738ac1dba69f0275e18c9b5e09'
            '1e187e5bf7f4940bdd0e1c6cdfc70f07e6783e757d5d63beba602cb8b29d70a5'
            'b25ffcb61006f9c0fd0c87236752649ebfafa3fa59c23589e345c3c444ad77e6'
            '932cfc9a37d5dc7bd3d55e9f13643bad0e482e7529aac085dc83e7fdd5a502d1'
            '786effaf93bc3377e24966ad1cf577b680c961c27a60f8b640f53259e9f17c7f'
            '1bbe06fb2e0f0f1eb1c37c2ce95a4cddc182138bb42e2a8d9668b010792e5c18'
            '7ef18607c3ec9b92dd3f51aa678a83d786b0d7a4987acb5375065d4ea9129296'
            '3885a110f74ed2f7d3f4e1b9162fdde8366d0a66ea912fc3b437013cffb154a0'
            '887173c0042abefbb2b0f331f80140cc89c51ccdfac88fe4df5847592083f45e'
            '812ba5bade9f1cf8b90a247a675bcdb1d60bae665c3e5e61b024ca1ed9985c50'
            '629bdafd3ceba42b4a67d00b52a942e45ff1212d471e27efd4891d5812027bd1'
            '1c54be74aae77855069b718bc24035c161be3c4735da2497aae9dc67dc2e479f'
            '703f0c055ef1576717394d55a482482650e60c9a92b156997cabb82660500b4c')
