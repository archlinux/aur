# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=77.0b1
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
_url=https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
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

md5sums=('dd3121747ddd14e9f083d5e51962e928'
         '737420d3d7508c2711eaa81da1697c27'
         '1356f697e5ad3adaf8e6e33e3f398035'
         '6d73b23a328d58dbe9a7991dc9cbada6'
         '5f03a1ad42ec0cc43d9fbf1b02d3eaf1'
         '2297cddc5f86a1250f395d4146627159'
         '234d1c18aa003911e69f642bcff3ae0c'
         'e5955c38fea234775c47f34c5b0bedee'
         '76803cf3139ef6a0772e4d1210735d0d'
         '07e49cde1daccebe4e6fe6de1130c96b'
         'df7c5b82ece7d58b1a873dea99250d4b'
         'd233adebcd73af51ca866198dc548c8c'
         '6690f798e7b2a5a60809b1fe25bc5bac'
         'e6f3cd3021b5bdd27c6f23502d928d42'
         '60da13197f4116e93f2f1b9dff703eb4'
         '89d3ee97666722bdf4bcd02aaac696a7'
         '2d0059bc17d4732e5be5b67e5d821ac0'
         '5e50f7b11e8e9772f9cdd37eb7b187c6'
         '3c2ea3c5f38543a5659a870f843aace4'
         '9cb6005dd82d5f62913f3103b0df62fc'
         'f9aaddceac44f7da0e7ce4fe2e09a690'
         '4a66d5e2cb013b9572ae35212c22d5f8'
         'ec36194efd16e31a60348ced052979ba'
         '3c648efc686a15253fa6fc26b592fc68'
         '897da4dd56701e1ec357968a5945556a'
         'b6be540d2bfc113f1846a29664965375'
         '46fd0b2af75bd76e7347bb8ddb03a9bc'
         '06f3aff7b928e68554c0c2dfb852869d'
         '1f9095fc0523798cc59672b8c4c3788d'
         '646195658a038367c5f101d996542f06'
         '7a29b13f4b7e1222aa628114740c9aca'
         '50c63a4bf0fbf81ce557f850bc03218c'
         '579da56d054a204d06a93967d55cb80d'
         'f0bdd4da62848c3beb1b30f03cee1caa'
         'f4b5124033c9c843f23a0fdcaf0c5424'
         '28264bbb68da4531e9c806f6630d615a'
         'e1e2b0f3a18d3adf9aea1fc8addfc489'
         '6d2885ce8ed17828a970523fbf92d3ef'
         'c7f083895a06a1c906df5839f062ccd6'
         '8d459994a45082ed7b64348f61931c9b'
         'e332723584aa364d957c231998d960f1'
         '26bca90e783348b2758036c5f81ea280'
         'de884d911b6c1a3d51b2ffa0194028cb'
         '42d5a6e6f53669e6253eff97862e6c58'
         'c39f9eb67292e67987412c917d9a5825'
         '59029c133e6abee5c9298e30b2db536e'
         '15323699e1f5f6e674bb864d09a0581d'
         '968c51c15e48e2920e44eede3222f68d'
         '8856c12979e69cc0f1f268525ff1b90b'
         '4d958d9aee4300ef2b4cf6da914219fb'
         '01f9fe12502aa0651d7a727c23050ee0'
         'be81617fd89b84e54ecf54e0bbe1b2d2'
         '70f859181de258fabf6c6174fbf84439'
         '320848193235ca37ac094eda63e66994'
         'abfaeaa9cbb3c3d4860f81267b0c1e35'
         '7ca689a103b253ba8e7b9a6e9b10255b'
         'f43057f4f2273e6b409f3f6091e9a6b8'
         '47384541bd8197043913d185f059fe49'
         'e0d9bbc303ab545f840a1629d37ec02f'
         'bf4551ceb0f7c710d13512edf0ceb0e1'
         '961f089d215f920d1d5ea894e9ae8a93'
         '5402a1fb0ba44c5d058134cef5802175'
         'f02cc3959947c8e1287fb208e5874632'
         '343f8ef63cc27153f9d3d2b33f1e1e6f'
         '200a0c0da61773c9eafbcf4adb463321'
         'caeb8654aeb9c2fb2fa7e537b12c8a96'
         '395acdb87427966622db17b116abeb27'
         'eb0598d9fb8e827b1a400658034349ae'
         '9f2c96b921dad45422eae6ec12a52bf6'
         '23cc864e021e8be83ad0e360a3f97649'
         '94bdeb1170527244a2799d5b2408f326'
         '20509da2c144da42390062e6b46d7b85'
         '72925b12474ee42a638eae1ff77d8123'
         '1c0785ae498d0461ced6cdf96c7a975d'
         '2ae7c7afe19c1d5851757a94820b4cfe'
         '3f01913bcd119d86204f06e03e9b6e5a'
         'b236b08ae6ef4ed9530e01980ab78611'
         'c13fe3662b89a88c970affb413a1ef17'
         '6ee9c2da4e1d722ba25a86fd3ab0f05f'
         '5fbca0d722c453fa58b57af138fc9fb9'
         'dc4bf51e675a0e1a5f5db2564361affe'
         '20a13231f364185a0690d65738bc387a'
         'b69d5276e2f140183b4840eaab4070bb'
         '64cad03c35da2a18bab58443af8b825d'
         'f985049d572ed4c7c50c9fa0b7a6d573'
         '5212ac462f87c1093f56635aecbaea1a'
         'ffabd707cdc2e63666842d4f2acbd603'
         '69885313cb5cbca29b55f5ac42b1b700'
         'e3f5306c88d17f83cda195f64f59f7fc'
         'f0561ea7802ffc88d5eb848cb7709d09'
         'ea0146b71e3d5196906192c0a1eda310'
         '203d8b8f5bf8d7565b56d538607ac62c'
         '5fbb4aaedc523d79907df193c970d09c'
         '668db8c0329351873d7ca4382217ce16'
         '3bd2b1adfe1580b6fe5bd7bc8390416c'
         'cfeeb332b481c1051881f83e74c6320f')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
