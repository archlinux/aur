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
pkgver=97.0b7
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
  _url=https://archive.mozilla.org/pub/firefox/releases/97.0b7/linux-x86_64/xpi
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

md5sums=('7c8a9f295fa4a48eb69c2551ef9f9f32'
         'bab02f2a72819001ba5d37dc133fc788'
         '750b151ed6910e86cfab163d3fd70cf8'
         'cce3bff6413b0b956320e1e9f9299d23'
         '20a5d941e6f0ea7f448ff312f93a77bd'
         'f6df75821784da1f1bc4950a64487ba6'
         '19d54d890298a310dcb142c9ec5e6df3'
         '64d6c3cff1b7a7ead9ebdc511f4605be'
         '101512873b18121ba1d972bcae0a7dd5'
         'fafcccd79f979f0330a7d58a3975c254'
         '0d4654c29a37172b26959e60161d98e6'
         'cfd40abe235fdc929a105d502cdc44d5'
         '15815ee785e951ffbd3a128f7d25ca27'
         '94ea8531d00c407c6fde77289b3445e4'
         '19e3aca55439b0e28428cfe36a43e638'
         '9e77cee21c8a10645ed2a813bdbb9021'
         'd0e6c5d9165c26674bed3e84b33899f0'
         'c96918a0368959b7e85609e88d47a44f'
         'a7df0653168ddb6177205c13ab0da0b2'
         '670b0b56879fe6cb41b9eb3cff7aef03'
         'c03c0607934a5cdb46a4cdf8a4762519'
         '17d9a57fa1f4c06d659446371036aa9a'
         'e188258be865e4ef215f3b3187e75dfb'
         'd2032988dbc4ff7551a106cb53889cd5'
         '17315f23b968c55113401dd019b4b112'
         'a11da105e4036d22a99f1ae2dd160791'
         '3a7f95f09a47cd2775e915ea86cbec81'
         'ada2e1280d246b9e6311aad1a52478bf'
         'df1d073af837e99f377295c8e5ebd1a9'
         '97912027cf19405a1a5f699fdcf773b1'
         'd83ab14a7ae039741ddab4c4035215da'
         '63a09b352226d7273d7a6ed26225f1b5'
         '201d1903b8a3021aa2acc66c5f03a652'
         '8adfe1a786963f34f362a0881b2c57b9'
         '9ec084b8c43c936bdd6c71937155fdc9'
         '8976631761cc2cddd41fa88f0da63dd0'
         'a994d97ff0c5451cbe4ea6eedaae8a31'
         'c8494f5566e3292a4203acfbb227a7f4'
         '2a2a3d0f0691c45b6fa089afbcce1580'
         '74aee7bf9cefe9c901c16ae334921624'
         '2cb9553b13c791eeddad078856d24ee4'
         'd8d2a6a4d59d9f0b3eb1bf6e0140d288'
         '71ad420118fc0a144f5b83698db83bfd'
         '3f413cd18c44e57e99a30507112331c8'
         'bf256ed782dffb221562724991572751'
         'ea4d42efa95205e72e6fd16e1f6ef96d'
         'f9a3c92fbf9f7ef6a72c7af01e7920be'
         '7049dc5845875044548ccb2f8ad242a4'
         '4b88a62d9f957a48cc18076bc8789d91'
         '6c4436ac11131e16efcec742cca37d48'
         'c9dec809bb6e6ad4120ba10316862695'
         '2a40e70d5b6f2c5efd621e68814dc41d'
         'fb79f165b0062090006406c9b608a965'
         '5127277579b4cc7ded87643c20ebba16'
         '55a70a86b956111f08e90dd3ab1af681'
         '91005eb4fee1a29790f012a24aac076f'
         '76f1ef40e0ff309a6c963d9188111468'
         '5b56489bf93ab0b6f62a9d494ae6cbdb'
         '0ddad035207aaea6114e0f91b476d117'
         'd4c598cbcc602640142cb1aab0b1659d'
         '6bbd109e3ce80fe1cc31eef630e0ca3e'
         '02eab5a4b5b7a4cbf4a293a5489f799e'
         '5896d29395eea66376968e1470c52a3e'
         'a2ae215ecd1139060e89c9ab205fe0f6'
         '68ce8aed4175914dba5e97eb6ace7954'
         'f66bf741e1138a569ee7115b13d464cb'
         '2125b48a0f7ab4978ce83210cc862a5e'
         'afb34fee650c1d0d1fd01cc2bc693859'
         '3957b542d0ca36b6654ff6e74cb4d060'
         '228a5021665c10fe9b6ac70635210452'
         '5afaa2ca21de376c7b323b63979ba242'
         '058ee63bd9a3c115c84181de2d72a816'
         '50a3ea30d9ce504c74f402cb13519982'
         '1868c16b972cbcb934ffd5f1e2df6da1'
         '40819aaaac9d5e734f0a125ed865a73d'
         'a28dc71d7983ade58723de1ef7a5162e'
         '48caf3c48644d3bb8637abc20a3959d3'
         'c300fc789eecbdd5440628baa1383adc'
         'e624b4b5b3087c63b863cf90daedf202'
         '8c4886387d4fb576f4d52a4113c54eda'
         '6ecbae148fd3ec9b41028b8c5e1aa54d'
         '858aba50925af701583699bd7ce1f2fb'
         'fdaa92f943ab08cc330e6e77a1a975b2'
         '06b9bb14dea8fa4c85074c7cb2c68337'
         '75566a3e062e9ceb08f04235f56d710a'
         '25d9976f937bfd814b00c16f266ca660'
         'afb89abb475131d6304ae558b2bfb856'
         'f5fe8aedee70ef8d702ff74759d71590'
         '29e213229aa74e781d981fa8c1718e4a'
         'f6b32d4c2409829818e9b6bed569ad69'
         'a438ca666e3831bab59feac1411bf724'
         'cc4fce86c23e699e860f83a055bf62e3'
         '80d7cad8a1097d94dcaf58168a22aeef'
         '782f13c03f78b1a893d6e6b7d3e85edc'
         '22304eeeed6e2a305ea55794f630a6bf'
         'eafe4dd40688b3763b7c9c9caefda23a')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
