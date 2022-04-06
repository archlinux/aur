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
pkgver=100.0b2
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
  _url=https://archive.mozilla.org/pub/firefox/releases/100.0b2/linux-x86_64/xpi
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

md5sums=('66260e23ebe5c758bf022a8bbdcd13ac'
         'e73c7ed190f0e119e68c306e75ab91bd'
         '88aae47483b346c0f0f01e612df4d0aa'
         'b08632edf93d09170b5bd28d6d2844e4'
         '0dfb41b85a39cc4c15325cd3ce19006a'
         'bf27804cc6f5af7cc1484f075934ed87'
         'ccea64902f7e9415dd45b4da4e7580bd'
         'ecb5cc4b74d9f02883e176b40d8e6c37'
         '9b0038f8cdb3c08a9e457c8346048312'
         '6f20c4161c759496009341daab4f82b2'
         '05423f11306e50065e406fb0669b847c'
         '1cebe19b158add3151e269d7eb5ab55a'
         'bbd45ce6f24486023431b91332738d63'
         'ca20a2f38bab346716b53a853fa55482'
         '344efed4bd60cbeb056ee13368c60dea'
         '43a8742d6acd259f776297f2df4027c8'
         '51959903a8e4df57a00f6712f3771833'
         '55b77fbe73eefac118fdc6e415805e71'
         '3b8bb8ee2e166fcae6c9f7fedec02eca'
         '0bb5f4ad8373a06c0c28c204622cce99'
         '3a965549a18c493123d5a8c7457eebfe'
         '659f5d8b6909619ddbe47711ba36ce76'
         '81f412a786802d89bcd9cc2dc6580ef4'
         '2ddfc8850032f400f60e5b58266dc200'
         '831587f540472921f43278fe61dad19f'
         'c702b1581d14856500b8f72df34a567a'
         '4f459ee24622e3ef2738f37e03aeab2a'
         'a04d1f15f713965eddf5e3d2f5e7558a'
         'fedaa70537fc0f787e7a35e3be3b98e2'
         'ce779f33e6cfecfe502b29ac733571f0'
         '15b5915d5f59bd2b580b4ab159a9b9a9'
         '24a1cf66dd073ebbefc30fd8e37f710a'
         '810e0f5f4ca1dfc91b947b7bed7f9e1c'
         '6595ff1c941fcc0d186f995d5b354822'
         '34578c7cd054b1ffcbdbeed2889efea3'
         'f255ddd7d46d00b1845b64ee5635bde5'
         '9d4e6501301a77a4ab1e2367e304abda'
         '1ac607430370598acc390ee29301fbc6'
         'c5a15d518428fd47f513b03ffab7a32b'
         '0da9341bfb17270b8c1dd2909fd4d245'
         '304853484ea7ffa7a955dd8e2eeb0d14'
         'e86164ed5d7f17a15011b598b90067ed'
         '8be617540934751fb9d12966c6867b36'
         'edc75699bdc876950be9ec26b8fdf06d'
         '26481076eb397a2f60fc5cc6f3b133d2'
         'e50d3acae7d64ef9cc35a6b777550bfd'
         '50b1abe63258c98869590cf981dbea30'
         'f013848afa79ff3bcbbf8a9d3701f272'
         'cf14f571ee3e8f2ee9abf8446d90e26c'
         '710ac9d434e22d7d7f14e5782bfc8bc1'
         '84acb9c1da1ebb7a3295ab318764af43'
         '2fb1f66c6067aeb5e08da3e7008115b0'
         '414be5bcd9b6b231be5c1e371936169b'
         'fb9493dc001f61a25a010a6aead9bdad'
         'e3a4de27918d0a8b2028ee8eb08cc0b7'
         'cac17e1a95c10755f76fa9c1607d6047'
         '6ea22f016c58f0aaaeaf3ab5c1b6372b'
         '791a295312c82dd202d435ae07cd5adc'
         'ab5510b9d8ab7be61a485e7e2a82edfc'
         'baf9fe804337904342efe32b65170793'
         'c724ebf31ffe85414429a3df4d0756b1'
         'ec80eb1f63881da38453046436a17776'
         'f2253435f41c14b6bfa83e91bebbd8d6'
         'e916f7d5ec656f6d24c7d1a46e666795'
         '3730249531aa8eadf196f4119e33ab74'
         '0f3e1a2731bda601bf70a79c0c06f78a'
         '9afc8edb43403fb001879dd0a36f26d9'
         'bed49aff6ce84f287fd5fec2bd1f731e'
         '2d2e59cce410e5c3ef5f4b7dc392d316'
         '0925c19041616a268f8eec66ad4b6c66'
         '2da43611f64fd3aa78954be097997cce'
         'b1cb7729013b7dafd8b56834168a4b19'
         '92d57e65c77e8da03d811870dcd4ec8d'
         'bae49fae9b942ee426b20e2dce522f10'
         'e52bb39cbf65e80b61e95bf9a649c1aa'
         'ad3e27eda5e3008995b8cd1ae955a28a'
         '3e729e8076c53d39f1b894f01190bf3f'
         '474c24b1945e902e84556e4e8e9c5551'
         'b3635164a50d84e8c5835e768de4978d'
         '0781c0235dacf6f2d371b8b9d1f9d9f6'
         '7833c4675b983b83c530c48c762a3df9'
         'f487ae182716b7f25662f65378c7920b'
         '0d543d0a82fd66243760546f271fa122'
         '98d17a4a4ddf56fd97af44e9aeb31a7a'
         '7b0e20c3e499380732f0189fd92557af'
         '8d8e53613e4f10792b10c8c0783d3606'
         '829aa5e0e24d444dd4fed69878efc803'
         '69249d8f5201fd60f6bc3f272a6b8f32'
         'da4f38b4c82b1c420932945fd58498d7'
         '2ceb66326ea18179a647dd354664cb8a'
         '68ba24ce3e524ce51a6e11c587dae32e'
         '2bab4034f9bf3595da0848c9227b1d5a'
         '9133c9f760f7f47015f35e1f2c1e7064'
         '94f8ae87ec2aabc29d5bde6c3529c02c'
         '1d8c4a2e0cafb21a3625cc0597faaacd'
         'efb5b71cfdee2cc73041259214b14acb')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
