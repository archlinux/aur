# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0b4
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

md5sums=('9e6ceabed8421c7fe33c8bde280288e4'
         'ef7d3acf65dffd72910b9d1ecf1f826b'
         '3fb7aebb782fdea8885be383a0186a1d'
         '78e2e98b342f9dd7f15420e28af86d66'
         '2d70f17684623b3d2a0fa7eb836bc74f'
         '047dc12706ba89f6149768f7c155bb03'
         'a57dfc2585ddcbb12cdea44ede66ce70'
         'ba09e868e8d5975c8aa7beb816fd174d'
         '5f9935206d92720d9c15c016c22673a1'
         '7f7ab5015cf0860d2356b97a9079c466'
         '473c41bc7326dfee4a4c8e3fc8106570'
         '747ff246621b21a049945a74e9b29642'
         'ccc36d7c40805e7618173b985d1539fd'
         '6f2c54b6103545e6bdb7b1da87ec6bba'
         '27bb85c168490e165fb824dc42eb6ea8'
         'dd696f4709277a69f32b59ca7f87f024'
         'eebd976157a43d8b925c25fb6793138c'
         '8d062eb511cde73b5423458a6e674005'
         'd48619a05ee2370a646a23046cf37a19'
         '8a2b452db3547f5c62435b3a7927eae5'
         '6a8357c787a47f91559c708f55e1ad78'
         '5a81ff3de9c38ed29fd48ae4b3b14c8c'
         'd5a5c07b338c4cf0dd9e0b48e5aacb19'
         '0ec364f712c5f51d85e98c6fa36d339f'
         'df310bdeb3c426cbbfc65d47b5ad03b7'
         '4f40bec49223a04b42a41e8bf32266eb'
         '1742122ba50dfc363fe824f862ac5545'
         '3e684704ab54711bbf87de3c67080c54'
         'da179f73f6bf383c5eee4bca2b2468e2'
         'fa7b8884cd0d98587c2c4234994f2abf'
         'b694942af45e36e10a320d366623800f'
         'e77dceec32d450806a78b892604cae5b'
         '5a0f49cc31aaf48094c5431a36023f87'
         'f3e8cb49e550c115ac4a6971e6189035'
         '85184decf81fd0be20404257fb94ab50'
         '11d90f89f2344d503edbeb0527359df3'
         '38896e31a65353c1b3b63aee075ece9c'
         '8df30a2ffe40bd70c9b2c1d2c0f1ba19'
         'cc6417718e757d89da56c8ebdd0a22a4'
         'e738f5734855e274fc06fb18d895c7b3'
         'd36a4a82c2b385baf52a848b7a706bed'
         '21f9f475eb3402649dd700c87449e476'
         '7116d4b9e565f30463440fccfd8a919d'
         '7047eac82e031d3d200cac704ccd2780'
         'a0439dd1580b6c623df5d72191b08df8'
         '5e2701d9f21826a4c5bb437122370629'
         'd952334ce002ac3372bc04010f1e15c2'
         '8140e66aae20d76f4f8bdd94ee113160'
         '07603ddef87e32660e18fc6fe101a1f2'
         '370a7aee26795d2975f5aec9f16340ac'
         '43dcccf7a94c5fc113434bafd1f0d436'
         '4afa2fce9ee3a94c565dac4c605dae9e'
         '1466cdca18aff35f513da14a31efb18b'
         '5fe400b3f677345c6bfd53f4ad2e1c5f'
         'ca6234f2608856448813efe5ce542f2c'
         'dcbc6971ca074c8d2ceb5545cbbea38e'
         '61de8af670d9e726d013e9d3b8569b74'
         'ebab5e6d335c382e4b100f34b3d07687'
         'd36c7f1d80501ddf0408c1cdc00fc109'
         'ed2c18e0bdb22ca839e4b7ec813f7cf8'
         'c3f7aa974546fc620e702fe90e492338'
         '0fc6d2f4ac935267028c8a8b21d5f3d7'
         '4e0c0d2405a30830b70ef0550a6f3582'
         'e7911109f811dd8043d66fc480d0f988'
         'e83a9b39d6b78f887df257c9ce5efd38'
         '6ec61fa5d1475d83afe07170eaa59124'
         '1563661f9fb50f2ae657e3d609f86c84'
         '9b80fcc1299116c5adcbea3a009fa232'
         'edb0b5dfb11c37e40ae598e65ae39c62'
         '9a48d40b220c43d006e68b63bacd4ab8'
         'cbf265e1154d41196fe0c25d707d83aa'
         'd07b9a09ebe2058b01b8a185796e4029'
         'd4477999695ea7ee3cb88e6f71232e5a'
         '810a912bff007508e689c2080a43c75d'
         '3a7712e6c8d6b061717230ecc11c3257'
         '3ca3ddfc078bc7b56e64aeec9c1a8c61'
         'e4281f554f21310c8e28e7b95e8b5590'
         '4ef375e4ee4f8e16ca3489b3cda453b3'
         '1807a16692769c496d7242d76a64f4bf'
         '502925279fec810726aeb803b25322ec'
         '1e9f711e6e8768b76ccd45db3ec0907c'
         'd2d01248217226ed8628add2c5eb1933'
         '79d678da92b2f8cbe4c894da42c53dd6'
         '72567a7a5d3de1c8f30e6ad63ce19dea'
         'baf00b274f428012425966b8aeff3c96'
         '13f094aef5a10a99ea0e6a1a1d630023'
         '0ebbc823808b50148106db58950fc06a'
         '14e0f06aefdcf53bf38523dc88e3554d'
         'ba2cdcaa3eb35e11895391df21f4febf'
         '86271dab79269a9d665feb0161d3db73'
         'de702b66859bb5c4e2282f1107fa80d4'
         'bc4282be54b2e15df39b4769f431ab8d'
         '1b3fd126e21f7fd175f8b4c48bcd8b16'
         '17e2c9449a1f4c1d6374e02bf1e860ba'
         'cd45ba7f95477eff734be4ae118d9fad'
         '17648ae3b3db77a4d15c9dc33edfcde4')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
