# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=95.0b2
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

md5sums=('262ccf69f78310da24cab3cfb5fb1a7a'
         '6789da36886dd93d003c687fd95df6ec'
         '949108f00e96e31417dddf8324fc16f6'
         '69f02c80eea8f4f3a74e63ceb09760c2'
         '9d5c7d66424a57a623f7db6cd928f99c'
         'f00467b8a3c3b4fbed149cceba4a2e91'
         '084a9cf4401f006b2c24b2a8920f6a1b'
         '28db5f7eb1fffb87ef154074d6236516'
         'e0e31485cf2359705716160b31d67c08'
         '33ae61784d8eeba16048ab84c3b3b6fc'
         '2757d78122c65e355daa21dca31b189b'
         'e0a694d89a4479cf43c764a698584b7d'
         '7809d140b33da95541288c00a38ec128'
         '6ff0434ca98bb2f0663927cbee932018'
         '5493a911bb6b5a5f0e81caf22ba21f7b'
         'e0c1cd1a19c31d180bb0e785c3144652'
         'ed7884cd24b37054a11d11ad9afb4bed'
         'bbcdf61a91e6662125f73c18beabeac8'
         'f0adf59e509fcd966d5ea17421b42c9e'
         'b0c728c9be8565f7463850e2e2a17304'
         '30dc5a07f1a01dbbd62c04b57e49cd34'
         '2178aaee9e69da0b5d783b225d44bf19'
         'b1a78eb2b5feb60d3abfeb937401f8bf'
         'f14eff525942d2b70d99340dedd118cd'
         'e612b366af2efbbf6756d355a51cd589'
         '1a55451dda7e5a8fe9e075794643507c'
         'efc34c35997fd51186feacdb4d2d16b7'
         'fb1a304fcd374839dada6be3dde05093'
         'c67ae0823e0bafd028eb9ddd3ebabaf9'
         '97e71e5830ebf5257ac9b01565591d12'
         '75f61a3adc8d27c753ffe583f57afdb7'
         'd47157fe0dee2c384a87b1b5e9f9446d'
         '5d144c5423fec172ce1d0390782aa70a'
         'bf519c7531a014bc48a222b85606a112'
         '3b8b3a902512dbc2e542a8c4fe302201'
         '35773b3fb897dbd449b3961265a19f2c'
         '1343dda3d60dff321c33daab1c370077'
         '11adcc94ec63ea48145f07d375f6b5ca'
         '5c951177800f51020b18e3d48d416de6'
         '9ab3de1a6dd32d0afc5a69c44ea4eb08'
         '8ae885082d62b3e0a38ea7f308597d20'
         '4568e5e9bce11b42f36bb7246a35aadd'
         '4b8ce01bf89e19de1083b5c70be5d7e0'
         '979a9a13abde075bdb5fac62f2c8a3d9'
         '64b03bc78282df057caecd3fb33ba799'
         'aae4bced9bf3ea822e7c4aaefaea6df3'
         '1d493ad99da0050c685ef645cd94f667'
         '2d50743dca589d3411f6e91f74bd099f'
         'ffc1ab3a2d730500c6e890d25e98d4dd'
         '1f56266f07f1b0cd7785ee791c5bfb5a'
         'c9af1e3f2655465d9216f2ae1bad6a80'
         '33c44ac33dfd8d102bb3f34715780c1f'
         'd89c2e283a2616fedad2fcd2ab6b599f'
         'e317a3012a0778e6423676e0deea1a8c'
         '05a1d4dfd5a93d7d8b62aafe301ff72e'
         'b96ddb24c33937d1f5c1633ab41ca97f'
         '6c0db1057474823af09a2e9ceab15eae'
         '6b1ee7c58475112a665e1ae405c836e9'
         '968952d8439f982448664bafcf2a1925'
         '81a81250e88dc0b8fc9fe234c87c02d8'
         '2c467ad13154485ad16ff4457a6f4abe'
         '7db3b8623fb280763bff7f6315cfa5db'
         '15d3ceb1b5b0cb18aa76b07be2ab9187'
         '5603555c4abd4160f06e1fe93e4448df'
         '5836a1c98749ccb825631a1d275b8130'
         '607b661d1214de2bd69cc81814f78ed7'
         '284c2ec2f502001424d4af0893cc9caa'
         '466d54446ec65e5cf5847ea4fe958c9d'
         '2d29ace643ffaf590517b3af05b7d8e8'
         '33ab94d2594ca3d123cbbe6c85956c4d'
         '80ce9073e51f998d624ea563cf49d21f'
         '02890305e39a45205558cbb83bc85372'
         '8519d26124714e42f28bd223891aa991'
         'c314cd2f1d1cf15fea0f5d949d0e8ac5'
         '090cbf305a78e3bc898ccad79bda9286'
         '1e5b83523d2ae61034601f4620d6c5df'
         '4d225d4da4543553abc5cb085d44518d'
         'ea7f2728a3fc62786a6a91630e7bb0eb'
         '9d471618b76430ad1f8175306b39046a'
         '22934e9a5815dac634297c8bb7f6cade'
         '4dec92b30d477d7d8ba246d86ff6660c'
         '4d208a08a712654973d6912f787b63a7'
         '36a1f8618c7e54cc4aa704edd782ee58'
         '13727a37c5ecc5f01d4d7a8309a651a2'
         'a13c6e80d59586c126d10dda9778cd63'
         '9f08059c1607232c1a7ee4784de0f381'
         'e7e74640316c606715c14361929dd6a4'
         '233f878a1b52824ed3f80900b98f7d61'
         '63e181f191cfc56ec4f5492d93298ad3'
         '1607234ab4bc07b9b7296bf4e4920943'
         '29264ccb5e07faf40a65ed1280770fa1'
         'ad096b450c54e0737a49f616f0541223'
         '7fd26543c55aaa1a0be0c4b2d294edb4'
         'b3e00bfcb664a7417fae442ad48456b2'
         '69ba3cd5d5507c7ba92e794e6d85eee8'
         '8ea1893c196de978fcad18961de96bdd')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
