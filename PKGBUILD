# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=76.0b6
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
      "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

md5sums=('39eab81249b4bb5d708209e8aaf93904'
         'e85657cdb0cf1e5de09d42b80c5187be'
         '8a60314e07b233e861fb18c4c7fa97c1'
         '3725558507cb43ec37c10c48e2459d6f'
         '7fa46927fc8fde473c80c2b2cfc74ed0'
         'ebc33e2f961b7987dc473bfecbc974ec'
         'c9e227a6662f8cfec67374559c558447'
         '3849f3dc19193906122b6fe6f32bf303'
         'f81568ebd5d35df75a7f1b797995cbd0'
         '0a2838e336c9383a0595b8a9ea739083'
         'e067ca6c60a9cbd41c7d39803f2d8104'
         '3caef9a2adbd67bdc60d7783dfbf3f86'
         '623e7d51af324f550b70036621b40081'
         '2fa4febe770d92db8e7efc4140ce9e6b'
         'be3187cabbea1045fb68f1d3fa87872a'
         '3e1fc2c0a60871c5a6c88cc440a8b167'
         '2aa3d2d546311afe5ae609f1f033d402'
         '968a559fab20047c1c5550258338886a'
         'b715434d9599648d23f6ef60cf83864d'
         'fb8d265f52913abe8cde4443d6d014b6'
         'cd9842626228fe5307c3b93759df8e5e'
         '22698238af10004109475c865dbdeb5a'
         'e71d9c6cf4b0a4bc5c1860ffc9f28337'
         '15832e1286868b242af5526d37d6df00'
         '5683e2e6bd4b416bfe7250fdccd09eff'
         '44dead81d59c11ef1dfd5aa9d478ba73'
         'bb9240ff2e0fd992c5754fe6bc364e25'
         '0151d20419737d523c54ed8b6897a96e'
         '57646d6392b0415802f7baefdf471e1f'
         '89e08334b2b74c4378a511c4299b0e91'
         '256102b355297877caf572f48739c84f'
         '4f2d368c5461a9d5ff043059879de0b3'
         'd7ba2a1efc0211d9a931a183fd538474'
         'bade12d5900d74475056698320909913'
         '703c147466570be12a1ade951d408c5e'
         'b4eb55bac9d46c55f047cbd05362d0d1'
         '2d8bd9a5a8f07ba116506e5c68896454'
         'd482e24eccc1de6ee5b1aeabe262157c'
         'ea6dfe1b61e92ff3aa156cbb52c51a2b'
         '559c146b320f1d527fea402f24dc7394'
         'eb703690f2c0c22c28f955b2c6267588'
         'f790d707535d3f2433f3650967652061'
         '888da5ef7eda709a20f73cc0bed61f21'
         'c7fd909f7aa584f2ee199d0fbcfcce0a'
         'e2125d389a9ad40cf419e287ea6552a4'
         'a231b48530925dcbf3752e761a190740'
         '64ee54e1e8c0b956cf031d7b0487b385'
         '3011038cc7f257cde4bed31b307de5b1'
         'ee9f4b8bebe78af75911fcbea8717775'
         '484c146c10691d99ba04e51982b4b46b'
         'fe4972aaf95ef6188f995d6c29424671'
         '97dcf14971e814b2cbd800743d0df01f'
         '1a5670f35111e080a43720aaecae3f81'
         'af3ecc5af6980ca14ed03be2dbdbc8cf'
         'd80929db9e270afb3872d0179fb1fc3e'
         '8bc1e07fbe79865ab8e79e8ada7d501a'
         'fd64913e705be13c0c2a62a40e924ba5'
         '19623e685db57595fef317fe8f16fb83'
         'cf6fa98133bd017baf4212aceeeefc53'
         '46bd9424a7b9b5ff30cc9bc0c560e01e'
         'f58c2b5730094b9bd6738bf87f44d21d'
         'aac0c33f729dc967a2883803af42dbc5'
         'cfba23bfac7bfccb8c8387e104d22865'
         'c8c8c1f20b87d904f044dbe4abc8d888'
         'c10ce3439b9b12e1e1c6cb2720d9684a'
         'ade22d92a7081711ecd985e7d2818a6b'
         '183f350cf6def7e038264c6839e0ed90'
         '3df1df4e0b2a34825d7070cf3a951732'
         '9f69893871472b9cd006c43e992c4900'
         'cc2a68533e0b4a1eb923d88245b9d4c1'
         '55cb0432a359d2d84ee1356c2696c6aa'
         '271315c2cee3e2a774884c9214469652'
         'c873d94382046fc6c7caab39c03a3d7d'
         'a9e32a40a2a32d0319b401b8e408b5da'
         'f713a0c522f8946a31a7e8336060f4cc'
         'b25a53c361c5b3945142f890e0158930'
         '95e348ea292d32fb4e8ad5997ac8613c'
         '71aa8607d89684c9cf24a64e54888aa8'
         '31351182beb3be63f243d5cc9c604ce0'
         '7a415e56be11863a4f42ba08c05ddf66'
         'ff18072a71584068d1b345818c754adb'
         'a4565806d2fe67cc4dc10c2a72b9d382'
         '04c9ab5dfa9b24e99656b4a459c374c8'
         'a9a751bd7fa54e2d67fd57c29e77a7d9'
         '6d285b2b079eaced4fca631dc3efeca1'
         '5aed2c19dc982f0f5448e79796cdaaaa'
         '9e7ee84307d79fa3bf31a8aa635fba17'
         'a708b295071dd054287963789fa77fbb'
         '3f9e0c621653c340db829d7e54fb9391'
         '299d87c9f3425510abe7b2402c80c901'
         'c9d4b9957e243e2987960520b0b5999c'
         'af48b710aca3baef05f19cd8641c8fa5'
         'eadcf0c3df6809e44b7fbb25f05c9fe7'
         '51168926453440b2c6fa727f426b34f8'
         'ad79cee4a886620c071071041ad1086f'
         'cb568e27f9e405e2fd803bb16b93a9d7')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
