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
pkgver=96.0b2
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

md5sums=('c4481a062e2f7f207bd292fde6b6f7c4'
         'b217996003ae9646f73279fbc8e448f0'
         '88a4e2c31aefd50eb3de7f505ddb0b20'
         '5561bdee34c0e69bf6c7b434281dbf2c'
         '1c537862936caa165901ebb9ad5e56aa'
         '80c38fb9b9e2947bbb503a2534a1cef0'
         '2902041f8166c774edc5228c8f979e8c'
         'c99050d1bc4e9c381286f89acf8f5b66'
         '928f3754887805a4d01bad78698784fe'
         'a7b44d4e47e39ec8dd9982408046efe7'
         '67aab50136f359d588c57f5188f1c09d'
         'd86e568b7390d6d759314fb164c797dd'
         '3d4c2dcaef42e0474cb1657a5eb2f714'
         '5c0eb8db49dbe62c0d145f8f0a791416'
         '7624d077210eb0f071b16bbd1c5a8f37'
         'e45085cf9bcd848bf5bb8159e012bf94'
         '6fc38f2b22ea7f0cfcbfeaf39ac505e0'
         '22a785fa3c87e6bc8cb1e0584952cf9a'
         'a2e591ef455355ccff610da1a0b48320'
         '1a7f6a9e36ed908c371cdce607b7f8dc'
         '368b4b3ebdde1d61347a18dc06e429aa'
         '489849a4209875808014ce4d2e4d32b6'
         'bb03c19e4e95291d3fde5345b85cbc18'
         'd3d037fb3909462bb09754b281bdb6b2'
         'd08bf30919e19bf7d16dfdb745639f49'
         'b3731d545dbab0d57f096b3de22c8526'
         '7efbc3e136948f2fc0a4052ca90f3ffe'
         '05c2da55e1b6f95505ffc74d603bf0a7'
         '07cfa29d56118dc71e265fd58d64e636'
         '5d48377140daabf75e8898c100d14ba0'
         'ed506f3e874b1f878575f0876a521ae4'
         'a8eaca5e96dff9c373c274daddc1f7cb'
         '2374c184ac9a9f32fd3245c02a14de48'
         'a2bff402a259a5dac3f62167b41567d0'
         '7cf9732d19cd0a166851a94455bc6950'
         '849473801a6976c39b19dbc66f2d5d82'
         'd421ea2097e6c3971630096db6c9b069'
         '9c64af8a4ce706b5488b96425e92d01f'
         'ce1cd60f28e18faefc839a7a39c34105'
         'cf11d22a1b193aa3f259da5a779a22af'
         '0f88a4b26c52340230b30e0484b167e8'
         '2b6203329fe6fe3f8a27251288971fac'
         'e5466ca8c069cb3bcf7208bcd21428cb'
         '9ca5c2ea5ee4c99714408628cff327d8'
         'f81bd9337a0bd54512549137b90e2359'
         '578d7a9ead52f8b8e3a9579d3f7f9afa'
         '93d9cefc667129b056bc6afa4b09e7bb'
         '790936506665d1fcede119ef0e8c647c'
         'a4e88afee8277c7192bd8d134dd3679a'
         '6b87112149fee4d345726071e08a310a'
         'f105276145c77fcbc2fc4955d26cc994'
         '41c2211911cc655e9e05a9cb3b7f3612'
         '51097312453114b3cb6c9d1c4fdca443'
         'f9ba6e7a7a7ca611c0cec0809b3546a7'
         '7ecf3e4070e8cef9b383ad2c5f1f1810'
         '2d7de297ef578114e937f39b460b32a8'
         '7fae8f3f048aca0876c64dbfe67dd571'
         'cbb2bf63a1d71d65e0cb9587f55cd96e'
         'ff3b1e96b469a3d612425beadca6891c'
         '4a01bbe4611dd452f6e3c7481bbc729f'
         'c836f9fb1a127f1eec40f001bfab6f7a'
         'ec3b63636c3ebbe29be2df8c423df39d'
         'd14ec61e6b116587f40cee501e823d7e'
         'deeba2a843eba13ab322a9869aa636b3'
         '7386860fc6b850d698686356699837b5'
         'c97c35e4f131708195468d12d1303347'
         '4fc1eb56ee63551d9d157a85cb382a7d'
         'ece77e337a3469e9e63a3244af5cd2f6'
         '3c75104fa5a87167c62c4a08e313a095'
         'f176e435dd9ce50eed33c52852387174'
         '0b5f8b9cc545f0e1d701360fea6f61cb'
         'f06ad9d5c36a9935ffb360a06024f7bc'
         '0470c005ab2fc2af83f13db71252123e'
         '68d734ad396b0e417f3842bf6aabd221'
         '7acc896d0ee21365395674e9cc69cf88'
         'ab135681c01245142d5c8bd6d4c42305'
         '92906b5255a4dd006222ffc77098072a'
         '48a5c0abe5fcc24bd966c9dad502f066'
         '9a350f2b9e61d41d4386d34caa9a61bf'
         'ff22e435480191c2657fb6f14c783f74'
         '9a955875d273515578412bfc1244e9b2'
         'a2c3dcd2b62505ef41a07e12c0ac29ff'
         'b92a5244e12c16a241d283716ff90ace'
         '82f9fb5c805d127527b4ce71080ad1f1'
         'ed9f7c0f425f1000123f3833a2be21d2'
         '0405ab92b4a634db326c60c331b8676a'
         '6bc8d7c2c512a3cd071699d94a3ac8ae'
         'cd986eba7bd8fa38961dedc8147f078b'
         'a8a008fddc4fd232513545de63bdd7f6'
         '2f2d6412edc37939f3031826b2b95064'
         '860cdc96bc30d13c22b9d691370f0b42'
         'c09960df0a4f3e4b1f02a20f326a7b17'
         '555ed5cea1c61de18ba72cb2e870e8ea'
         '4e34222529e10c14ef4647a2fe813b18'
         '9e6067e475a2a6135a06961ee8a574e9'
         'aaa8abce4ccb8b608357fada8533f2f6')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
