# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0b6
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

md5sums=('71d25fc3cd2855cd3d44d1d904053554'
         '56ac05d93e553c98e68f2d13725a9cfe'
         '66ad7382f6e2a2ba249dc96ae9a38b9a'
         '022e9a9e44b02e2f0c41601951ba58f6'
         'c281181e3c628ae4cd82e522b8cd8488'
         'ad44843055684e206c35b78ea1c6ee01'
         'f9e03745f30c4d9c944af97a1124df5f'
         'a955de07b0e46488ec00a5d5025670ce'
         '42d5df6f4de46049f4f64667588561c6'
         'e578e86d9bf7118b7ae5afa847a4d7e5'
         'df262a91a0f7e507d75d96bf46f3db96'
         'c09bea7fa9f760147f255580e42d92a4'
         '291eb9ec814961aa896f0954280c8d2b'
         '3fd9ef476548f4d284a128cf7b8c7bb6'
         'b3fc22d891373756092dfe3eca966431'
         '31c08dcbbc7c717b2bf49207d493ec78'
         'e9cdb8fc75997ca3a9517915c68b1f72'
         'd366c4f717474ac3504755201a34ed1f'
         'ec77f8767148f4d77dea57a5fe383a2e'
         '1689ebf2bdb010d68fdf92cca7a418f3'
         'd25b19814d796535addf5e2727d99444'
         '49b4ea00d56becc0af7ec58968a009bf'
         'f280c757a6a2577230ada90085d042cd'
         '89bc8f4f397e442e5606a6cbc181c84e'
         '22b5dde0e6fec030f7cec776056c6ed3'
         '89358937d4798f0166dcd731c61720aa'
         'c325f2f20f271ef7c340656b036a394e'
         '81883e403a70c42f55d92ce06116787f'
         'bd20a1c59bcc150e2b4b668502993516'
         'a97508f57c45841a3405f7bb6fb5e31c'
         '57584092fb12d37337e1114ca864bc41'
         'bf481a36ef5c7f3adb40c4164221b061'
         '2795e8554bb70bc219a62cf89fc0d5e9'
         'a08de7c771ef3f12c09a9c193ba37172'
         '5837f132cec4042829437158562dd022'
         '5b5dff44a51a1f684163823187fe951e'
         '064c268331ac8e5b6ceec8b4131daf77'
         'eff02c82ea8d29c9fc6b86b1d229444d'
         '69b16398c3d23816e3f55bac072764e9'
         '82b4ed7b2a41a6df75b3ff5b17d8cc0a'
         'd54e307ab1d7d0d5014d92c86c50fb26'
         '6d0a0e767727daa287b222a0a06708b2'
         '1271d760ed8403bfb31ce0e434b88bfa'
         '70adabbb78ca4546aaf0d0a1c4b01b54'
         '2b71e7814947cb2ce9fb2c0a109cadb0'
         '8ab2d04cd2742b9658906b77c5ee92ca'
         '93576766824c50ced2110225af09a12b'
         '7d1151123d769fbfb6cf98f910949f1d'
         '5a6a96cb9028b27bcc9d29dd12207acc'
         '3be5d49ce4cc7fa911f855b676d4eaaf'
         '21ff9ae49dd76b574c4b72b1100294b3'
         'f880d1b0ba0d4c4bbde4c79a510b5a04'
         '476ca51f6ce6126e55ba22978b616fb0'
         '5a264f5d6438cd676310f83ebb42ac01'
         '66d41abae01a2a5930787ff262557eb5'
         'ad115bf4628a9baa1675be599d3e28b9'
         '19b709d921c85ad21f4e52fc777fed1e'
         'ca7108ed3c184a4e851e8ed3da31d2ff'
         '570d59d515e45da1586e3c0b2a4a2998'
         '53d47b4052a453f44914edc0bf9c16c9'
         'c429bc9e39d0c8fecb560fd1762a5630'
         'eefe7ccdb18a3c0bee7a2a11f9e60583'
         '098d85e495fa72bb46e39d9e38cf8658'
         '35840e3ebbc822bf172dd9c8f5933f4d'
         'a9c755a574109be30aad745e376487e7'
         'd87ea06f13e0acef4cf8a8411648c23a'
         '7fc70bdaccf5c180808137933694b110'
         '48d5b0b57ed007bb3a06025488b14c21'
         'cad5a7d0c338ca8ce630d14d2ca3bea0'
         '5d4ef529aa9239aeb86f0d9823cd9ed4'
         '661bb9e6d0eb0d4496c69d37505db39c'
         'aa114e5262959ca5084e96512fb79d7b'
         '59f910db0f57db201d11c74e50552644'
         '210544204b32f001cafc824b0e99cc2f'
         '5bf5919771bec60d94661d0b3af53cbf'
         'daef269cb10121c90c89f88e352f1dfe'
         '9e4cfc5584f064c20815b03d9f85aabf'
         'acd7c6a887c2cdcb039c0696efbb9b24'
         '9e08756c54b4a8c9bca2134dd1180ed7'
         '1dac4f6818f0096e6296c6cfb66288a8'
         '0f28fc6b48ccc32ddf0f06f774b3f164'
         'fec87b5f76378cd7ded53b27be53bda7'
         '0bf6eb50e0f561cb7c733520ca594c29'
         '7a109ad6efb26538ef82b4be4436c01b'
         'a8def3b612929d4c4dda5c40776d7277'
         '0e7b037024b6249b4a798114c0b6b033'
         '21e86e6072d4d33cce9e00f62c6c2b4f'
         'fdab76c551fb5800e1015a967347f6d7'
         '5354fd06896a58a59dd67d932367beea'
         '940dd1d11e3b656c338be9dda3e116e5'
         '998524048912d42f892779772e4ce987'
         'ac296581e846c7e3a6d2f809aa5e2b4d'
         '807892a04a93cb6d7723ed8f8897e8fc'
         'fd6a1c3e5bfed8a81f47e2d2efd4ffc1'
         'a7a52c5c02f31acd984808f94efc49ea'
         '0a4335156b63ecd2b91713d9fceca9e2')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
