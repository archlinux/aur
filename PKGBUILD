# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0b8
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

md5sums=('937808d3f108cfcfdcb1d0d9cdfa2ebe'
         'af77f724c7c09b92527ee8868fa1835f'
         'a901339379b89f7c4431893e550a30c9'
         '8428c5e42ef1c3cf337e0137bf96a713'
         '19b5f6bf30641602289146b3d1d5c6bf'
         'ab6952c95b0706c699d1926e3ef17b7b'
         'aac83f82b2f65261b4e7abd9e69e6dce'
         '6fb52d15333ef03826bf8b34875819b1'
         '8119e0f7ed18afd66bf7ad0868227741'
         '00d77e657d3309df4296e0fbc982d9b9'
         'dba4d56502a035e5569972e9d1b40295'
         'f37e0de0556ca500913ee810514b29a5'
         '4ce3d940358480661bdb0e61ee075db8'
         'ad2b67e7e800082b0ed6145a8ce66e5c'
         '630d183b470c43a4f1cdbef5a12942e3'
         'b672e0aa4a06f87dfd3fd92970b206a5'
         '469500f89ba329b6451e70b32f6d6821'
         '553d9cea268531b36e4d11c1c46935ea'
         '80edd25ce81da130cec23519691347e9'
         '8bf50e46d8acaa030e9d074f763fffa2'
         '7d467a5b75c486ae8affeab4c03e77e4'
         '387ddf74e3ab3ef67f3521d284fb3200'
         '8a222fb2eca67293845b9a1b0c94c351'
         '1ec3fcd36d4b74aef8eb30c638cfc954'
         '4fa5d403590b7898b764ce782440ed51'
         'c8bf952a473c7040ed38f338f0b7110e'
         'd2517f093be6df92e84c10c3e802299a'
         'bcb6884ab467c7bfba368c2b23ddbc68'
         '8be32a020b4e464b6718c7b9d82efa08'
         '869b71bc3b24ae14c4f76119b01b255b'
         '3498591ff01dd81d3e0e9d072cc126d1'
         'fb3f7d69e800137bd28f43ce8437cdc3'
         'eb48aa2f7ce6d4b027020f1086c40f96'
         'fa57a6e7c18ed0a9ddb76e06ab0eb1f6'
         'c7b2ec9a9bb86023cc3fc9aff4c2ff90'
         'a285dd55efb523d29c6a212aacf6f1af'
         '123c2d490dee8a3b3af4067e6337531c'
         'c7d6c1dfb99ca0a82c329c6e972561e9'
         '4460a1aa3511b7c936177c3b8031900b'
         'ab1a5e809a363b95b6dc1bed037dc2db'
         '24627c935a9df92515dba2b5b7ed6390'
         '45de9a2a5a19c1fb82144fb1ca085ca5'
         '9b5a9d59c28ed028ae79ecf4a4614214'
         '3347508b608fa458569950738f9100db'
         '3d614e2ffde2bc6b6ca9071f782a0815'
         '4377f5a51e8cba99830017975fc25e09'
         '97b6d1411f567aa1be055041b733dc26'
         'eb9d004ccea4626254a9b8b51c2bb02c'
         '7e0a233f4de125b307f49d83f4cd1979'
         '5c31e33dc4d360bf267a58fc7403bc44'
         'bfadffbe8cfe3bfc994ccaca6353cf91'
         'bca1a120e1fea1e6cf19899469c7a652'
         '4ae50fe44dc45bb8918e4e75e7c2fbd7'
         '2ea9c97751de8133dc736141fa289cf6'
         'e60f3cfdd6180a98591c090213d65343'
         'e54d8b9f93fadd9c3cffbece14afae52'
         '56ca81899a950dd560e8d39562f8c6de'
         '525704a4ae97245e29def69268edd50d'
         '3159fcbd5fb71f84a46ac148dd42d265'
         '65720a3af33b1709ab7122bf2229060d'
         '3491e813e99d8f2f8f34428aa0c6f0ef'
         '414d1d1fef8218b96b8987d754eb45d1'
         'f483602690d776d57ef596da529251d4'
         '927103a893fe612797e82b61b4f2746a'
         'b35d77a8ffc6acb0ba6317c72f006999'
         'c292f736942f03f47b9ceb9c85a880af'
         'c17af7ada2027dcb6ffd2c9856c4f581'
         '60e66bcf809b4a0f61fc3315805aea2c'
         'e8fa05602d3e6e976c3a98f699825552'
         '0fe91be28ea9b5d7ecc6457dbcb9dae5'
         '0030621ac24f18a524a4ed10945d2e53'
         'ef1a57face5d36acf22152c43b11fc9b'
         'db69d051d1bc1ee75d227f1ea664dadc'
         '288e9e79772916c5cbb3406998a8bc21'
         '8184c0ff634c1cdcb0a3d38f4602c208'
         '86cc7beecf4cc0223478ffd557a9a075'
         '4180f4c91e1da1b56aabe8fe871b2fd3'
         '6e23e3ceb9add4b73f3501735a8d5561'
         'ab28365a3b1892fd490c614712686330'
         'c4a921dd78fd1b0fee18a32fc292f58b'
         '83af8bcf232acbb40756d09af94a9ce1'
         'c1cf20a82079ce707bc39bd0cebe8fbf'
         '333aa54b949f9316aeacc52d3ebc802a'
         '39f8c414cf0f506c0c1f79dfca7ce444'
         '12edec268f272c07bb5843d3fe28dce1'
         '8f09e844aadc958d4ef4fee7050d91fc'
         '2f3ffa7afe824fa1cfa61bf72aabea27'
         'f818778d5967d066b1b6897e29534803'
         '6c2510cce3099231fcd8d84663c3f4c3'
         '88559e2545678c87eb7d2a45a82a5ab9'
         'd2cc4b485ae1cc5aa2df54966c05fc99'
         'a85fe247feca3e96ce344917f1dcf457'
         'b11243d2a53a651a62accc5d92075017'
         '5195448b76b8aff88b82e596eb86b53f'
         'e251df9b45b52f72577b753c97114ed9'
         '898f73e9269839a2643797bc5b129f76')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
