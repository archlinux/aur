# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=95.0b7
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

md5sums=('3272342ae9eb1b98ff46bbe3a9a3a193'
         '86eb28b32883e57b3f7963e850eea7b6'
         '83781e9d6d138e5ec5288032f860208a'
         '0b4ee7f211db9924f7ba64fe45eeb650'
         '606a985b52ced31df34d9493e5178983'
         '449b4632c235d7106d113225ba925ebc'
         '616011c2895a25d82e205d1c306892cf'
         '306ec07a29f51478fd77dc9519706cee'
         '5a0727574f282eb8034a9c356b7bd525'
         '3b7e73b0480a7f374331d855c1cab63c'
         'f51be4f5437141de9267e3fbf644a412'
         '56044890f73e59de92abc33aaf717785'
         '65e500fa6d8b42ea351b9dd9c7fff09a'
         '04103c3ae9e73a484ff2fdd0aa0ada6c'
         '0de0c75480cc32495a283fb45a6505df'
         '891bdbec98db022aa235ede74d94784d'
         'a0158be4f06aa3a8e28e9088d0c950cb'
         '4d8b3b462ecedf170cb88787989fc228'
         '7e47978b6aeda844d6aba0257580e07e'
         'ce89c0a3a0bd7bd06bc06196ec055509'
         '0ff49359b2095ec4e588435eed53746e'
         '3cd28e04f74b3f8d23130edd9bc3942e'
         'cee16366f0cf4d52f1f79004034d8bf7'
         '95f12bc16308e496f55cb28569ce2055'
         '1d96b099ac3b4cc27699c0554b0ce194'
         '7e091ab577103bb62509ecec8bb526d7'
         'd7d7edd09fce36b83c889f5ed1dffbb8'
         '740fadd380afd38876e255548578d23a'
         'b3183d1d9f70fd1f5d5bf6dfa2211029'
         '6765fef854b18344b3199c6a3b8fc944'
         'f98d0abca513ad9852a67f9576d279c9'
         'd219a364ef6364f9b4cffb72ff0ce6b5'
         '30af78630a3981dd569f1557743527dd'
         'db48f490d6c514f71161abec6b3974d3'
         '05c7c0f721121d80519b21cf2eaa24da'
         '07e3e22109f0bc447f895cd26f12cce0'
         'b7604b22f93de005545c06538f260cf6'
         'b3d6ba006bec9d78463dbcb1d019f8da'
         'b27d1d2461d06026d2408fb7194b8e47'
         '936ba68acecc9752b962f7df17cadbda'
         '5a4a170da93e53400cc74f1e22e4bb2e'
         '369ec3a3ff8bb07315dd349fababc200'
         '028b34f390384ae9d471c4a488361a39'
         '31f057c54051329d66b75f6c6acbe236'
         '2762a9c6a4a304ffddde1a038c977bf5'
         '849f1f916a8612c4a038b0ea154bad56'
         'c5710ddca081ba217753e60713d208a4'
         'b35cde667c9d78fd58de40515d9da8af'
         'ef5cc26691a240380f5e5bb1ec65aed8'
         '39145b4d4833f7e6f9014299c41055f6'
         '31a0f0ca38347109f8dd9b3f6b4406d8'
         '92b52803945e7867416c280df3e4cd88'
         '8a7cb05ebad8d9713c524777b11b3472'
         '8105d6fb30a17100d13a2319c0834165'
         '53cd98195beed93422564f45ca568205'
         '96f018791070a480e129d7ef9036b69c'
         'f8295ed018d692534c6d9c02b0b0cff1'
         '794b7a44c35caa12dec313ae58c88e9a'
         '1a37106d5e1e210f81daccd3ee3c3369'
         'cf30f8780c1a5472877ed76770db3246'
         'da7e526309b8eb2e9a80094b878fa4ae'
         '777975acd85a515d5bf5b2b68cf075ba'
         '45c64a2a5dd2b4b81c8813e5c43a3dfd'
         '7973ba9e399110b3489bf29e7e5eb440'
         'ea4166fd67df7657f1997987b5d35d6c'
         '2ad30e2d0820b9f063d4baf6341176c3'
         '1f8eea8c3910aff2972aeeda598233b8'
         '64b77c1e83d5df70a5e8462efc53ab9f'
         'e46f8932dd91cd5be0f3108a994fb4fb'
         '96dc6c65230b8db4c5f4988f6576b45b'
         '8499558160faae0923998dfddf90c20a'
         '1ccd4c8711b29015c1154af6aa4a8f6e'
         'a16731c5576909c80920b4547c6420e4'
         '0a629e1ac8cb29d1d5b412c75cdcb3ef'
         'fe2e587140c35d0ff40ffcb733ab9b63'
         '018243d2792721e9896ecc19e7b1316d'
         '627f7e1ed68bbcc1ae38ad7c022e6d9f'
         '5968a142a751763c9e4beb036590a527'
         '420f60b073415ba9bcef808deeb6ce4a'
         '68b481c507d3044d32aee6fab3f7aa80'
         'c857f6b9750fab636bee9750a2809d79'
         '5232a1dace2a0b45abb4c41808ff8c72'
         'f910597aafb77353949a1059b98e7a13'
         '6d7243f484dabe88c991dae71807fa9a'
         '203b88cccbaf049d021e7c72de1a94fe'
         '4e95b8b465cee45eb96ad7c11388817b'
         '3a7b75172f1d61f78c083b56e2db4e85'
         '92a8575dc7cb0bb7c23dacf38ca08d19'
         'fcf3775637b8bb1127ea346a87d2ddc3'
         'bb3cae02f0e53614a291f62b326dfe6e'
         '8e3da3866d4b77c7c0ef9c44fb97dad2'
         '2f967548884c14d83fb78ee1a80c72a3'
         'b9052420935519bf78905e61915a901b'
         'cd70768f822eaa4abe0cd485bfce5761'
         'd268ddd66cc60e6a45ce16dcebd29dc4'
         'c6e4ff68148b5692c85838a26241fea3')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
