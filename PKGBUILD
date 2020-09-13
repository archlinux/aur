# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0b9
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

md5sums=('2b4db0a71d6d5753f062084ed7b6ee66'
         '0accd76f30933fb4590308b76fbc6048'
         '59ba8a755ec0b1123b65ff38baa68f05'
         'a5ceda77dc6ba1e534b86b517c3852d8'
         'f28b35e5c3256a81ffbbd2fda9660fde'
         '9804da3307638ee30300dfd43dbae121'
         '64c2cef23b0ee95b49eb8276259761fe'
         'd4812d0193224baa33230072099a5abe'
         'a4f665ac733273d72fedecc84e212c09'
         '29e5bcb8058110db7a3006a1a5ec3946'
         'cca4d4dcd7cea0e815434a15bfc46ea9'
         '9b5ada4c721a79ffd8aeba52065f10e8'
         'b7de024321b0bebcebdff58ecb25f796'
         'a3a66874ea3ac74d9d552f4e1b24cd5e'
         'd4f3e6c7c268d2c9bd84a83c0e60113c'
         'acb0036cd2ef9c58e7a4f17206c392f3'
         '62f6030844c745582302827537bbf0d4'
         '2487cdf12df602f42ff0487d2b47e038'
         '2d2353d123123b00adeb02da2a3dc9f3'
         '554d6dc6dfe04847e46ce1ae32fba683'
         'd8d29c9b07f3d4d35a47dc9b71ff4953'
         '7fe4c5cc7ca498c7145b4870fb447071'
         'c1b48f649055986048013231b970052a'
         '88a27f085e60a12af24f8ca0cc421b44'
         'a6f1760a5ac3e97d3ab7562cd039f8ec'
         '995fc36c9c8160287960b68f3f7b07cf'
         '0663a7f9e4a266821acbab94b235be98'
         '5688c89c7c802d25a947c4f69ca6b2d0'
         '4d5e9032a12adcdbf7a6f207f81e27d8'
         '0e41c350950c7487f6697efa07b13cd8'
         '8a099ad069f08e2f73b8e953764e887e'
         '81bbca1b262df93096e2ca453794cd2c'
         'bba53af1d53372410413bb89da75cf28'
         'ec2f8367d46fbedab20f96648ca25e29'
         '474ee18e7d76fcd74409daee78a7c038'
         'c84c944810a91791b4e53495eb44086a'
         'a88a1244f3559948d947763e68752791'
         '10a28169bfff349571d69a7a5637217a'
         '0aadd6d27104145d9de53077bbf640bb'
         'c568aa2a42c2c40af8f32d94eb30f1d6'
         'ed6b0b0df3eb88614fbf7a043a88294c'
         'a050e479b1ae61cfaeefd80bb5461808'
         'dcf2c46cb8f5eeea4f270c0ded3d4911'
         'feb7e9a9afa1db63202d9a6a13d0a508'
         'd365aaa1bbb4c854e1c476af7b0e4dcf'
         '70429c21dd9ed151a0691c4fbc14084d'
         '8aecc4cf394bad6cfb103738d7dd2b45'
         '9549d8ccc910422bed2942d2ea020ebc'
         'ded307aad167edb742c2716f281dca29'
         '9c694c0708512f5e8ed6fff5ad13430d'
         '7cc86ed6fa3aa17730b381490b920304'
         'f1a6e9222eba5f3034232c90394d199f'
         'b90883bbbb32d303ee47ebcb403e9554'
         '1efb191ba27c69e02f283b8784eba080'
         '6470263b0ba3e8e2f5226079e7536594'
         '041c658d73e2490c5dfe2bed48d8faa2'
         'be5e25dbce5eb868bcc2caf629dfe7f1'
         '0f117f7cf711a361b36b41a6b34a3416'
         '536d28d95c85a788386c5dec6124f8c9'
         '02311ae1d4d4c4b8bbbc9ee87622236d'
         '35d1534c76a08ce6a2f6e07315a108e2'
         '4f1737976901d2f863c1541e1fc2dcc8'
         '28e58295cfcca393adb3be550917462f'
         'b41f83acfd0050679833e07c47edfe4d'
         '204422300f1a3ef42758ee921a00a77b'
         '180511f49ca4964487bdddfbf3a3f894'
         '62416f9d0431191450fcd49b78082c9d'
         'cdce65ca62b1af297023ecc8d1fda116'
         '69443ab4c2e82f1638b2f249f8e60a79'
         '9d550d810cdba411a55554617e347b1d'
         '4853c44c3f7d40b17ee42297c898ec13'
         '6cc7bca8851ee48329b296c2497b2363'
         '0eabe3c8339a2dc9819585f255623fb7'
         '7856cdc9ac218cb8dcefbce84b6d8915'
         '365f93c64e2ab681baacf0dc6a0bf222'
         '013098b972fa05455975e7fdededfb2b'
         '7d75f4c1409a93fcdcf205c275f3935d'
         '273455eed877687b0bf4e022ff16f82d'
         'd3c521143b1e6973b8c72ec00e411349'
         'bb984bac57e747fa28f91783d8f77f87'
         'c98b7c95db7dd3805241f94abb2d00f1'
         'b977b20bcf99c413c20cfeaf263383ce'
         '0c03b3965da321d8a6febd05de8560b8'
         '0832c6ac2d9d9fa716bbdf7467709b24'
         'd6626802361b70476c7981cd5f5cce49'
         '8d1843d2bcbe367c6c13c5d4853af7a8'
         '0a9e13ade9e578a2721363db81f7d6e7'
         'c799a20d4a86cf885d2e7e20833bae8e'
         '531d727344a19b532aedb4151f74f7ba'
         '9114800de6af24dddba0365577666613'
         'b46469b3528e9bd6e76574fb0c3cceff'
         '8240f809531f400affe99d5d0ae16495'
         '683869236679a6d5c90d4ebe7b0fdcdd'
         'f1730071ac4be07998f05c12ec9def1d'
         '8e5c7ae98c4fac6dc7188ec8556f9ac8'
         '66f53ab5df2e82c72bb327f5fee2903b')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
