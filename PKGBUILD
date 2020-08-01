# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=80.0b2
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

md5sums=('aef3471f094778bff3174a1890d65622'
         'a73ab1025ff383a4c50127f68fee10d4'
         '61333f8cc5f16ce8e14823e9632be7a7'
         'd238911cbb8e826c0b7ff58a2b3a8a12'
         '1e67c2d1be366e06c58f0e81a2668eb4'
         '9c8574bddb4fbb3dd87308ea06328fdc'
         'cfd07331628cb3bcaf8536e9b71ec398'
         '84fe85fd6a9b8353916d7362e0275499'
         '5219f689d11ca80e1ca6dbb7e8cbfc96'
         'df3369ea98d720a99e1de9cdcfe8a243'
         '75488e87657fd6ee4f58ff8a61d1b224'
         '5a0ac338c73e488c28fd881fa4966abf'
         'bc2a5db1a01e3d36ea220ac86ae403d2'
         '60d8775334d8b33d15f2d6a5a8287920'
         '1a75f8d9ef54b8f6aba3f8dffaf27366'
         '3abcc3521e494cf49416c20edf324a34'
         '2263807b71087f7ce30944576ded3553'
         '1ac186264cb4effdd08c8df8a0875587'
         '1c780ac31ee7ef202aeb7a3c8774d0aa'
         '1aec724c194d590667f9a12908ee2b40'
         '93632fa22f1858ad4717972f544a304f'
         '84eb5ba78ac5745f2c0f78b686e840d3'
         '30d2ab367abaad21d145a1774d607d26'
         '564b1964fa2b352185e3b8f169be2cb5'
         'dcbd3cbe270bf45390c52a1da52a7f5d'
         'ccdee8e66cb8023bcdecdf3fa5b0ac5f'
         'cdc0c70aa2587816b6155aa44c2873e4'
         '9cd4b66bcd6d11d4e17d2571820076ee'
         'ec5c2b8ae0de67688d23ea5c71724167'
         '87c3f2059c42e0ca11d24ec8be56fc81'
         '4aeed8f2f011125da9b360069c53eb7e'
         '15d0accb6f0c0aa3d4fc308b58a715be'
         '23d0087e8d82e0bbe6b71e65b589f413'
         '79800f785f9838477168458698b715f6'
         'f9b359590041e9e00046d1bc49a76f9f'
         '62d9667f5550ccda362f2d5a514e59a6'
         '434fcd543f4d3bbdfff95708f9bbf0f2'
         'd30a3ef910927913a6cc6fc090f454b6'
         '1002a423e4df057032377b0cf26f05cf'
         '1a904e689cff680229fc2b89b3f8776e'
         '0500ee0bb2799f05b9c5008b11309eef'
         '7c7bc821d13c0097490ac875c04a9723'
         '153a1859c80518340e35da858fc019ee'
         '4ce1ce836eabd9764395d62764f31c13'
         '97993d47b91bb2ac6ad7c08b0be4f3ca'
         '0885fa9e7060db2beafcdcd9dbda88a1'
         '9326435ad8ac12abf3c1bcbe7591b947'
         '09d4e1ef00aa5dc5dbd3af26fea47db3'
         'd8aa7cf948c4a224902e0da2c902d209'
         'a02462e4237646f7005cc93f35e261e7'
         'd69b73c56e6e34840b2131a80181132c'
         '55521e2ec66be135b6d689780b14bd02'
         '057a83a2b6558f526e70eaa1affebd73'
         '3d5694d4c4c27f110b69f86fc1c6775c'
         '0cfc887af115398c957cbcaf7a59e676'
         'f9aa929da788ad5ebd3bdf11469b6c92'
         'c50c9a395b6cdb17ffdbc1d11fcf8b8f'
         'd4b7d3b741fd93aa3d6cf64594003169'
         '97669141c1c550fcd34eb3ab76464468'
         '455cf087c9bf54f0748860c9801d0094'
         '9719edb7d24617d0255156fc25fda415'
         '5573f2a18fa94af412fdbceadf118ae7'
         '5b992712535e2630b39df6c5f1231683'
         'b746720e580fdb2f6e61d533e6d4c58a'
         '9ce3a4863d588539c1eb668fc0eee665'
         '19abef36f82112a3e7e09876c6a7964d'
         '17ab26b9c8fa5ffff0ca150971a92635'
         '3a1eaa033e5610ec7901d24cbcf09b3b'
         'a0f105f48f20dd68caca27b7d16e4681'
         'b17ce0b816718b900381c83992524f81'
         'b81b2f7f9ade38d1eeeeac11cb09dd7a'
         '67f4bb5b6095dfd0538ac6e89054d0db'
         'f97179d2e096a2c72c23f26ca8083787'
         '993d0578dd80b59d3db3392a2832c5e8'
         '70c3b3ffcc6be532b8a2b840a0a092bd'
         'e3c663825ad593823df19a41696e0371'
         'ac3fec230076fe724ea2855405d72939'
         'dfcf82d5a3bcfb6007106c8360b723e6'
         'ff2744a0ab1e4ad344630339b02ea07c'
         '5da18035f2c151e79949420b791e9f17'
         'e256d8980a95babcdb262d7dce9ef8de'
         '703849fe2a0d3ee375964e64f4c45c6a'
         '12718f7d1c3fcf669a3a109005fe1dce'
         'e8ed463de9d83579cab60d539907625c'
         'ad3593e04035b47baad154c738a7d7d7'
         'fe1c6bae4bcf2d379b16bd5f6d0d8937'
         'c875eb79c917deec4268a45663eb1fc5'
         '723a21fc6c23c852603402c279a90b0a'
         '556e56579e2e355c5b020718c4d1c577'
         '02fa505b1b9e53efdf0e3ece37936408'
         '2411fd611e743dffdcb78abb6f3ea6ae'
         '44de0204d0c866b774ac51ab79fdd700'
         'a11d22c6ad1195ba676082a0bc23c78e'
         '29e7f6e6830b6aaaadcf672ffb6bc14d'
         '9e93c17168725ac2894dd0a328c0b48c'
         '6926a7efc9d4798c2b76ad3339e89f4e')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
