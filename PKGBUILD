# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0b2
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

md5sums=('4004ad2af093a62b41b8f9aeecf4ad57'
         '659e37c285345bada90eaa17e6177db5'
         '81fcd072960fcd40a144e27a27192add'
         '2cd3445266912a7b3b1de59ff406b21f'
         '4ccb590431fd430015561b3f4522e7ad'
         '3d54cd6e5d60f495dc1dee636a1eee9e'
         '34b18c857d517515dc9ed7cc03972c51'
         '7d08cd1fef5ef9145be8f20ef0b1de4e'
         '606d09825a81a89092732c3edd80793d'
         'b542c4da1c37cd9739d1b5a4810a50b1'
         'bed9c5f6c9623da38adc8faa957526ff'
         '2552c59cb2ead25cb3eee90ffe3437eb'
         '02fc71feb038b8a5c8a054249f18a54d'
         '72ab452bc7b726c9214169f57874e3d1'
         '0d59386a61aebac82a43338d7929ba88'
         'd79b85693c5dbfa59afa93bd1cf141b3'
         '9a08d4d6a1ba3d380f025ab3a9cda6f3'
         '3f7f31924c84f2afad34ed51c1f55028'
         'a072ca456273bfcef8e3ed0c791bf1df'
         'fe9efb6d3f9eb3c83da7b3a0ef603d38'
         '654e49dfed40690fff7ceb2583872701'
         '4f98f6069d987aa3c58ea48587ca888b'
         'b2e38028b25652083007ac7fc0052775'
         '5b51feaa3044c79b69f7a6de973188b1'
         'f25e7e7e45ce224a8fad0563900450bf'
         'ff731e39dfbe0ba3377a38d0f192cb24'
         'b15a8ec4974b3ecda145b06c70675fc0'
         'f5a496382423fe999c47f129166de893'
         '828c131545d74ea852205d028b5ffbf6'
         'e219df39e5b9de79f7692575d4a13a38'
         '2dc692dd6479487e574304fa2f2c26b5'
         'bf2ecf46348bec8eab78a5fb475481ee'
         '1fc7856f896840d8ed05b8a0d9537cf8'
         '74e5c75ecc54152e861b6c0291f3622d'
         '056167aa123fe89ec21054657ff2ce39'
         'd697345326d0786fe52a5be1570d3f4c'
         '812fb136d87afc53be7a37c7332d2bcc'
         'a3f50438c6add99a5570ab940244def3'
         '89ddafe94a924b7a372efe37902cd48d'
         '3177a704a0c06593144523090036e202'
         'a6637894b619c1f6eac4511830e63c4d'
         '79fe01b1371428fe6e346f3bc198c33b'
         'c02e22b198de12166ef9f19eedddb0d7'
         '8d7ae516fde319dc3919fdea5fbe5232'
         '60ef8b9ff978b9d6f31fb2e9fcf0fe76'
         'f7afb9f6362d4187ea02780d86313d70'
         'd6dadde01f950d721bfcdd4f20eb1cc6'
         'a39a96437f247fdcaa1d98df56c56090'
         '69d9abf399d8bb6195dceab9d3e18701'
         '92bc63f2746122b6310a0bbcea869c91'
         'de46c0791f8d6e182b41eb4506ce1625'
         '9f4a7e5ccfcf52bc03073cbfc5a5cb67'
         '35747220f621670041e45198cc81e8e8'
         '6ac35a2fa9709b9deaf8a30e3fae08f7'
         'e27020155b3c6bcaa1d5f12af2a01e57'
         '8c33b9629a5b6a771e61be2749ba70df'
         '820a5734a91eb3376c856623d358554b'
         '1f54c6007669e73aab22ccd3cb533b45'
         '04559500e4f725edba025410dd13efc2'
         '382fac0753f0b2213bbd76d79ff40e9b'
         '19f1469a1ee683117555f40ba3fd1006'
         '74c26dc1150c928547a3b9c055a36d76'
         '53b9c4bedb74823a8a8ac3016c7f32bc'
         '1e0ee1b4afc43bd46538a3d8ace938e7'
         '9bf23c78ff8efc3e63c601a4f00f7ca1'
         '2ae8bb0f125993f4fc0c9bd4b2557af7'
         'dfa0344c14dec40213764bb1132a2b5b'
         'bbde4ba2018d2049206527fa63f34f5f'
         'd14deda280bdd2d74506a05297c0072d'
         '7a37e56a15bf913d904da43ed7db06da'
         'b82a1338fed2aa8cefb8aefe3060a203'
         'ff8a07ce315ae5c908cddee254fefb89'
         '9f04ecbc08af8bc5af5d64753a7494c5'
         '90e861d1c85f79ecc18fcbdcb2ae15e8'
         'b266e621326c0deb694958db1b017e67'
         '17e5fab409c567d1696821e9c69745ea'
         '44181729b69dd3183daf0b3cf82d1844'
         '6218b54cc32809bce65d09c170872e83'
         '5ac7d660a8c2ce4a3c1474697c3a9ff8'
         'c51eb3a66d3e4048b298635dad7ab572'
         'a8039ce6a9ac1931fcd9f8a6a33b1c43'
         '51aa1406a150d91f4a4301975f590139'
         'dda4dc3c144abec64525d1cd38428ae6'
         '3ffb8d8843a034a321a951dd8af749c8'
         '139b2dd37f585d9fcb1392f7a93d7f81'
         'bb0611acceadcd07d9a69e3775e2f27d'
         '09d42cd9c71663eabcb742fcf2c57d29'
         'c7841e6d3ef50e2eee448b796835f668'
         '722cbb3e661558295a47c9664d0e9efd'
         '034aa547af23e8725fbc5dbd1318e8a5'
         'aeeed3b82577bbb8d7943a4f23db0442'
         '3778ba409cc97825e87127fa3c05cbf3'
         '2964a6bd3ab75dfacee39faa3cd1a9fb'
         'dc184fafebf4fd11799a4f1af8279ce0'
         'e3abffbbfff64eaa9bf7613143a8aaf9'
         '4c32ec3d3d5ee3ce0f8384b37a90ac50')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
