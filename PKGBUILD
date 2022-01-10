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
pkgver=97.0b1
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
  _url=https://archive.mozilla.org/pub/firefox/candidates/97.0b1-candidates/build1/linux-x86_64/xpi
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

md5sums=('2d8f4bca30b9d13eea2586e1d54f86e7'
         '98bdf165aff9b039b55b9d08dc4fad70'
         'a1f9fb75baf092718b27f60c15f0594e'
         '89bfacd2e9c045eb5c969969f50f92b5'
         'da469a455c03ddd262c0b6ae4f67a53f'
         'fbac574866d08a0df542f344d8302895'
         '754978607240fc811347c8f1f7edde7a'
         '7493bfe741efe91e170c872282b46946'
         'af91f71ea311dc7ee5f9c4b6743dfb30'
         '4c584a14b33ae9fa7dd1b3000ba7aef5'
         'e7c2a154f7b2cf1f26f1d957a8984b48'
         '687dbec931203a765eb50120ab072330'
         '36b1be61ef14d3d6a952e9abe15dc8da'
         '8bee4c606941a2c8becefc85452d2b5c'
         'ddcabf299f2bec853126d44db5048d38'
         '10781f3718dc13f163754e7e2ca93cdc'
         '514613ae4786c28c4d4740991e2d9a36'
         'fc84bc00e7b5996aaa96fab484e90fd2'
         'e1fe08ba459dbf451b97f54a822a516d'
         'e3c9687b5b11e015a400766bdbd7acbe'
         '92f17ddc5cc040ad39e9959c526fbc90'
         'aeef219d95699dcfb7aadce9f2de8990'
         'c5cc7b21bf34a6d4d307ac3ebf948627'
         '27428741718a61e9608cbba9253291e3'
         '6e96d05db7272ca27d7d13b5d1a53708'
         '2458be83d9b2760df1d0780877492eb7'
         '1971c3a55b868a1be43968c4cc79a237'
         'cbce144c591961066b87795529d05c4e'
         '1ea070d0d01cc0b42a15b0240512dcda'
         '4aa8e48ad58405aec150f3afe764380c'
         '276ce8b85ffec891793f62a7d5761213'
         '6e7eb6a177018ff9cee58e865699ba47'
         '332e6df580bfd137223fd6ce4e68d284'
         '2869502b812c36bdaccd41c848c6cc4e'
         '2ae57d1b84fa4a3609a2131379b8afeb'
         'ce17f78115deb099a286a3a652e7c08c'
         'de57674e47ce5c1829f5e0f4ef33c721'
         '72c2fdd0da0a8b7cb7031129b65f9148'
         '0019427b8d65617e93e2d269cf6875fe'
         '8cef8430300708bda6f8101e1b50b785'
         '5780123d37861e6dda995cb3fd72b765'
         '8f3c76203e4c39114e8533075ac3d46a'
         '3dc8f9781db59907875c7771f38a5eba'
         'f78b1981e837d68695f84f35a65afc79'
         'd5bc031e4b7a3f07463772ab1a925f24'
         '2a0522272df514d92e6fc784edf2123d'
         '5ff0fcf3014dd7aab02f59acdaba4f79'
         '2d446eace74a9d80faab8b6a27e4b7c7'
         'ee55814fb37d8e9a66a315caecdbfa74'
         '5a4e159f8759d806e87951e10ef6d14c'
         '53d956af7be9fc7b88f1b5fa847b7ac8'
         '2aef9a0c2fc121bc38df67b49d8122ae'
         'd95050896eed3f5ba1dd2b53b47b01d7'
         '95c3a9f1996941ae42ff0ffc53d3a594'
         '60f869cc463e4677881571039e592b97'
         'e4da3a0fb60b878f14dc9e248eb10e77'
         '2fe319516f2d1eb220bdd00014a73823'
         'd04a9500e427c8a9a05b3cf8ea514c9e'
         '3d74a4563b29b05ccb9cfaf654be93d5'
         '9e11437887150d6a2d733a7762c722e6'
         '508a83e317b54d55294c419464991188'
         'f91c9b63c3b433547edbb3e1aff7b11f'
         '00f192304faae9a93c569100f119032c'
         '32ec0ae5dd5d6fe124000529462b70a1'
         '7803283868627c64e6a6c1b1220e1436'
         'dd987fc2260a3c3a7cca650691650be0'
         '839543a2e447d4355328020fc3eb150a'
         '8edfe9fb4a9283b1d4fe435359748ac9'
         'd5245398692c2cdd9baab17aa7a61ef5'
         'b5d7a04e253503c2c7883197568072d4'
         '0e5ba9b7c1b987dc88c57181b94294aa'
         '440daaa551629397a36ad61166b82de3'
         '02538e75f23614e1b85e1570d63134d1'
         'd0c3d9ac7f89b460d686a1ca11852816'
         'd00e7a31ae3251b8bafe0ece31cd7792'
         '0166870fbe654aa811e5c52943f2afe3'
         'c88a3ae3b7a5889f687e8e53bbce1035'
         'a30743514ebf3cce764ef418d2bd85ca'
         '9a76788abd3b57b28ccd66c8df0f01e6'
         'd2b0cd2f652f7998b6012ab6b7c12d5d'
         '54eae00c517054e0b52f987881cf027c'
         '0ed158f7f5775ce5a1ade6f125201fd7'
         'fc3c9c684ce4f68531cc22da2ff38edf'
         '66b243848748c547faf731afaafced38'
         '46852755809b7ebfa198b6e0ce28c6f5'
         '5d0ca4f97c2a186dc987c3114429a9e8'
         '6e512b0b4893d6f54af9ea58a5966bef'
         'b7c3d67d3448a179d536c6800ae54628'
         'f045fe9528ad0e38231fa7b370da8b6c'
         '60b3fa177f930a238addbcaf6d8a6213'
         '5da1c80893e465000ed351ccb5cc365f'
         'e54fd1d031c6c437a842c5dcac0bff5d'
         '1509ffae60e747ff8b491c1180f0ff13'
         '8e2da9f45ec2ecd3b2f54170d3fad30f'
         'f3530e28e60de0ad2c409eb8581ed4ff'
         '2f849c516c7f0f7be3fc051d670ef3ae')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
