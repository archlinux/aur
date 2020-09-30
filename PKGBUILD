# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0b5
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

md5sums=('6e92682c6404d9a95febe6fdf7a6f626'
         '9f8ed5533f1547bdc20bf6227f3c0164'
         'fdeb96c825e3625ad01869ed5101e986'
         '5c7f49b3a82eaeafa100f71b7068bb0a'
         '397129d4cb5330eb2271a846f7e38267'
         '26d949df52a2ad67b66833385e91adc3'
         '7c6cb0a39a8f864511fa0113681efce2'
         '440260bac56f65b7cdd674835c59b777'
         '196ee51eb9580dc878dff3ac83950fd1'
         'd823e05054be41717cf29752fe763eda'
         '59c90cb5a07abd0ad865706cb9fdeeca'
         'd7d245c016c9173756c7fd7dd9110542'
         '5cec85a97e9bb33bb7e1c9acfd5a9fc1'
         '4454c71a9d0bfc70472dda6428e5db24'
         '3ac20beca23c12ca8cc2bc75083303b0'
         '1b3e0330ac9af6f34f990b46292f2724'
         '1e2068a5edad0de5f5de0feb59ebfec9'
         '4577597d9377ef2514a20cf1db9c6e3d'
         '52223cdc1f77fe482755f6bb289eb7a4'
         '9e1228605727ddfd5ad5de830f95fb26'
         'c172b3d7af19936c425ab4dcafbaee66'
         '22f717e712e7aabeed4dbda27c81c77d'
         '18869cb3bf6bc30b9cdd511836e3d125'
         '1e0e3caf72da73d448adea2daea135b2'
         '6cd6e4584125e7b92133a718335585d8'
         '161de11b7d71230107b1b714025d1df7'
         'c25e5c672187195328b6be3892b1c19e'
         '21c827815c3352740ca466450b589717'
         '5728cea9d5253a0ded7688661ddb5801'
         'fd436de862186018aac04b2dcd7f6400'
         '1e95d6b2e68f89aa0486f4c864a11cf5'
         'aa3605f216222d7cc687618e0f289d38'
         '534734afe5c676e0b25bd53bafa5416c'
         'b68ed10730c80293e48ac3b6c0310398'
         'f85e7debc61f5fbb71597160ba2d8dc8'
         'f51024a632c0da9a39832f8e83aa49f8'
         '1fcf7076a3505f2b97f3525a5a61ddf9'
         'acaacd640cb8a6d464f87e0c7c805114'
         'ccafdd6c98a6bf7d51d0d1345344e474'
         '45bbcc8a46595ad820a1120951b204b3'
         'd847bed81ff734b189466d3fb702f2c4'
         '3bd6facf767924f63223ea684480697f'
         'afdbd5d825b6013b1b82fcffd0b1f115'
         '592e1e7475cb5418181c635ffac0dd12'
         '6d71dfbc1e484b1dcd6994c06a98893a'
         '6dc7959f4204c144a80291ba4470cc85'
         'edb1965bb76d2acfcc39bf9903387f64'
         '2b4b457ccede570ea75004afd736c59b'
         '7d4c2b573c5cc04b2283fdec85c21ba7'
         '9b7f55fed78524cad29bea0e51208a2f'
         '9738cd46684d9d9da9a2d11a1ac88006'
         '55885cb36dbffa19dd16243845609aa2'
         '3d108d3ff43f2d6b2a973da0fc889c2a'
         'cf3266a7876d129ec85bb84042c41659'
         'c14538f66e5de1176c3e79f9dabc741a'
         '6ea7af3738abb4aba0018c7afda71fdc'
         '849fad8489074c19a009c06c7cad2cbb'
         '2516a0fcf3424c00d0843dc3ebf630d9'
         'd1362fa058088694d8e0924ad31b7fd6'
         'ac6eb26520a668eb5edb504d9370ed2a'
         '339a36e928e614657b675c53b7f8dd9b'
         '44448c7902ee3b913d72189ac737c62c'
         '6fdcc1fcd8d21c80954a695838cbf385'
         '7ef05e3ca8b4677021f07eb49d5c255c'
         'e716b90b0c86e8c176abfb8176680c9f'
         'c22a1aaa77c3e4b90594aeef72c06bf4'
         '5319f39ab0e53a5ae9fdf314951da3cd'
         '817a1a7a8d3da2f68987623c40fd6f4a'
         '67619abdbcc184a4e5ad3fbac1dea5b8'
         '7a33432aa1f69f4ed028ab71c0273fca'
         '480323cfed827a3a8ad32d2052516deb'
         '863e5764fd9ac827f78590243730c65a'
         'd203e82c8df24b5c7e89595b7e9a7c40'
         '314814accac1103bd383ea0848c4d6ce'
         '07ecc18f39f64adf012fc09a0fe952c6'
         'd094afcacf37c001d9ad360dcd750a19'
         'c55c17edf38bedc42856fd3ebfbbc4d3'
         'f189808f7f8d51fc6bad5440f42de08f'
         '4539609d98b496caead4ad380f8039d8'
         'e07d2c1294801d4a3180a85689476a0f'
         '2ab8c860535612f10efc239725db5d1d'
         '7583dab939baaca8271fdf578ea800a5'
         '2fbb384ec6536066168eb3dc1d76ff38'
         '81fdf4e0fadd64238c550992c0dbc179'
         '0934282f00dd21ce5b050888b934c51d'
         '495e5c3b8d51f5a66689621c6f542a14'
         '3d5a3bab0a1cc1e45044196844e9a63d'
         'ac1be7d02f524c7a3209f6edbcffc767'
         '791ff5d430193da8c901a209edf51306'
         'cfdb2a25c1a705fc989a12ed1463de24'
         '139a431cccd5994690aa1f55b6520195'
         '6dac9a8c258e14d9aeea24cff7eaf47c'
         'd08c3cd1bf21be0c1aa6b1a51fdec237'
         'e86d10699a05da565325d37871f68c2e'
         '032e687331f2ef0192912342aa6f8566'
         'd955a94ce8b4f0f561e18b57433b6581')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
