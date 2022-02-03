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
pkgver=97.0rc2
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
  _url=https://archive.mozilla.org/pub/firefox/releases/97.0b9/linux-x86_64/xpi
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

md5sums=('1fc0149f96442f7f911cb081ba55cf2d'
         'b2f30c2ee78857380646aff732d1e7af'
         'f6a0015d8ba5f6dbc743feee7031945a'
         '06f3cfa7f05918fb553f38dbff7dcb0c'
         '981d370fb827acc364d9bd7af7ac6c3d'
         '6fc9306861a17cf24457edfd727418c5'
         'baac36a5138a1be4a4c5173979f8d035'
         'd4ab128aa1cf0e937f520ac41688d59f'
         '451ca25d4ba87cda76c7bec6bd88a193'
         '0d97823a4734324a7642cf09ae261964'
         'da8ce0ba23d8bd3d2c717c5f02716e3e'
         '96abc4e1d7f6a6d4b6a21287f228ce3d'
         '2b0e322a24b469bda999a3dbfbb7d32a'
         'c2b12e7ccebb19555bd2af25b666434d'
         'e0385495d6da6c55a5406a73339fbdcf'
         '660cdc9faa59beb3403ec7c1af9c2eee'
         'f9b7ce612a9380b7ddac3d77d4d81bad'
         'be0a5eac75b388a0381f388da80ed811'
         '2202ddfa80c7adc70f3e9b3dbb108f88'
         'd879ab314638e7ca8a79bcd6ef3174c6'
         '2af691fc5bc3536640ca0560171e8b54'
         '67909da9463d1292a1837d4c38fe2681'
         '2b566d229db5b889dc71762caf785b20'
         'a6b5c960721ae80402397d84b686008d'
         '3a803aa2725d8c3212488623aa029542'
         '198fedface0080dfd700d344057a8cdf'
         '046db9b16bd92a665cfeb0dce8bbe52f'
         '2992006153efe13cd5914738944826ca'
         '088f2f16822cd5c73fca72dc41c95365'
         'dac6c37ff18219f1b7d962e6571a1e0e'
         'a71051373f0b1b778999e1b013f8a869'
         'ccaf775a06af0e712cedb22a3e3e0227'
         'd29012c01120db2e75000b209b173ba8'
         'f8d46a41e612778047a3b01140e41dac'
         '5b32f899ef3349a5f98e1656c422ada8'
         '1b668cb9572c1ec566e54571972444fc'
         'c23b6dc4e57c88d2e627a2397b48c8fe'
         '8f83f69f0938a994cda62a357c4f5556'
         '2ab8951af6552326a511550915817228'
         'acf0c8a0ed049910b8be0481cdb34459'
         'd6b95197fe93a3f30232a0e0998e5ce3'
         '8ace6d3f958108f8741de72dc93e108c'
         '3e14893ce3063a842caaf99260e88cef'
         'd41eb558e6276ddf40009f66b08b0418'
         'd9a0ae4c8c766af25652e99651d3d241'
         '5a63edab29eea1ed42aa2ad42cdf0a75'
         '0d7a48243bfd06ac0df6a4e8683ffc9a'
         '8b4d4c761283de3338eacb6b409f953e'
         '74d399fab46bcad60f5914d39d176dbb'
         '2fec33c527cbb8d568508e0487d22803'
         '0509313eadd589dae7e1f3d8a4eaa4a6'
         '586b3a5b4a353af5eb13449b2a0ed9d2'
         'a718dd8657fdb2f4dec9ef5005c91ef2'
         '04ea66d76bca51d40c6e036a9b85208c'
         '489b9fac567257a47cdd2d789194aac8'
         'f2680f6739d3725eef6f323e56c2b7bf'
         '5e88e1cc5f8f7b6b1850cb2dc26ee3df'
         '7387db708bcf9e2876a9f680e031d745'
         '6d236fb61232f71074221f9af1d01cf2'
         '566090c5779652932e1bd857ad3e1c91'
         'eb79085a536dcbc1676d3ecd95b64d9c'
         'a887bc828414d21ebd29e7a9b452e41d'
         '820131dd06889c3052ca0a4264df7943'
         'ee27c24308c0ab103edad71157cf7556'
         '3485fe66413300ceaad1770d36c1f365'
         '69a4025142853ac2730325126aad151c'
         'ec76a9d234f82dce47d59da0c0c61e88'
         '479c960d01cad5dac897e8fad671c260'
         'd75439ca09770960cda36b1804ed4c0c'
         'ba6f0a2c915f045fe5b590b6d6f86e29'
         'c5ab4e7b5ba4eadefa6b6b5903238241'
         '2caf575d2c9ca6f753b7c43f9a7f9bd3'
         'e51a0f14311183987a5991b05a744e29'
         '2064864c740e28f01ecd4f9d7cb38128'
         '0dcf4a6180bff70a5bb2f99da703b77e'
         '9b0db35b5cdd7791c08cc5a176ea0b33'
         '8be05b4bf78eb83fd38e5399fbc5c403'
         '088dc66f123d124b6353914c7b685945'
         '5b196f57d44204e854e32a47fec2db35'
         'b80711e406348259b46b34343bd36eb9'
         'd5deb6c38defe0031b17818ed981a0bd'
         '6d6fba3627bbd901e8fea82a1d6248b9'
         '33b4198caa2dc607b73d27557e32fca1'
         '43176b914263da573a4e83bdc858810b'
         '2665539ba9e60196b23b48a3bc26c954'
         '2fcdd021c58e0fe57d999d8316948a49'
         'd7e5c79339f991ef560240a6cfc07633'
         'b8c6735956e79cd381e439084c28aa2f'
         'a44d35b840047d1107ad07389071afd5'
         '854f8fd24f9c464a850a1267b0883f8f'
         'c5952f9ff501c891e2431fab32cb9b68'
         '54b2862caf0b163299abe08889396533'
         '4eb483a7d7c373bbc5e55c08357237e1'
         '6621b5685c80bdb105fa693eb62dd0e1'
         '08603ffe59819b71a566397c7b40bb44'
         'f3e667e5afc46ddfbf566d38801f4f8a')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
