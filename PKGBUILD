# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0b6
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

md5sums=('a6067a83d53fa97f6ddb81b8501d9e29'
         '26a21b78ee25676d6369982975bfe369'
         'ced767b83bc960215ee3578582827126'
         '70392bbb5ca754a58cd9a04dc52831b0'
         'd83906ba70c8fd223001ab261ae03b82'
         'd75c41bec2486eeba6e613e0c808eceb'
         'f9a326651f5d1ae69343496399d0a00f'
         'c05cb905b9ae1c4ee9e4faab4ebd5e5e'
         '5140badb791f3208836943af14d5d492'
         'c17524ab009571d1ba8e4a3aa861aafd'
         'e242cfbc3990476b0f2ae3e7bf5fa849'
         '270c214eaa48f03b85725f8030c989a3'
         'ea29681cc05fe06f5370e7779a966c4d'
         'ab6b119ecf14b2df2ba38697159d7bb1'
         'ba86eeeff40863e9861d3a94bd5bef65'
         '222733273889276f6f1423de3dbcd0ae'
         '4f5da1383f18d3faf60a62c243f9b01e'
         '29b8cd649289b1f5c3d3250727dd2529'
         '3ac1123fdf8d70a2f74dabc0b19f5aa5'
         '7883e3a96a2d3b17f3df692870f0ff04'
         '9f4391cdbf8924aa009d563e45bac5c2'
         'de7a4f6165f3d60c2e548da34cbe4847'
         'ff42b32ce4bc0470d2dc473f95bf1922'
         '26c091142caa0b2e5d7dbadb2a8f838b'
         'f5ed98a48749b9c6a8bc6ee5dc6ef097'
         '86367ce442703839a305e9535d492ace'
         '93c5e580aa8c290471946e03672b72fa'
         'b1228b266d04b4b0f78142be3fbcf0e5'
         '101a0f586181dccdbb0f12cfdd2f6620'
         'ffb56962f5bce4da6009a21e4fd5075d'
         '115321668fea28cabed885daba6282d2'
         'dd88baef72a624b29664913b9b8a2efe'
         '8f48869e15ce002b2df7ff2134509af2'
         'b124dcdc8411d0d4bb73aa9753f18cc6'
         '0b26d27c219c33d9d43538f6894242da'
         'a9ac2630b0367e1d83b1e491dfefb692'
         '281c8b5874a224726caaee0fc33d1a85'
         '27c51edafe3fe0a08b964cdf0541c809'
         '3172a8af5214c7342bdc29855a3dcea8'
         '8e8c34fa0d6c5b45bce2d5727405e39d'
         '6d9865a336d3f7d5e2018f5a4145aadf'
         'fe268fd4d8007d1a8b4aab84b857c2b8'
         'b710b279d1108c7bd1c95609427b047a'
         '1e23e82044ee70d6b1618a6e20ee959f'
         'cad206f1ab7f0e1bb663d6a3e7f4ad39'
         'a0b9817e24847ce188d5c6eb5fb39be2'
         '1142e52fbd7f75361e7a13a88a9b6c50'
         'c37021789601f38ff2c95638b0d83e68'
         '23dc2328942a86c8e074bea8cc74d2bd'
         '5c1ec3d6291cbc8f09d352eea3be2991'
         'abe129773007a3232f765cdc517d1919'
         'ca7ad14009bf3a4b64f4bd105ed86d1c'
         '10779879dc7949dfed41a5654a343ad7'
         'd43f380e9127b2e7cdf24cb4ae3a1b44'
         'c51a019e6cf1bad05ae9d1bf2947f4ba'
         '90815aba09471ad1be407942b2d14c8d'
         'c9fed5ea0dfdc7d726a0c0a325c69850'
         'c818b9bec4d9b6f7800c048fb4e24e59'
         'ca847d8d9aba07c62e742ca2f560eef2'
         '645550b462940ea017a13b9889949180'
         'f025bb3c3ab9572e586b8f1f83d100da'
         '9bc12a727cdf56eebea2790d72663072'
         '5fcfc2f1b6cf3eb9594508f2e964526d'
         '1a2cba516bb5328f033ea784f3eb1d62'
         'cd7d83f2eca8d75c97f75a5f34973659'
         '20f7d8997f918c9caaef716a33f7bf7b'
         '4f220fc226443871ba7840f3b77f48bc'
         'ce6966af828ea0d0005f5502ba19e2ac'
         'd36b78501da642f4831f459bf0d7ec14'
         '292901f90fb333fcf22b8c04f344e6c3'
         '4d28d5acbe8ee8fe6ef00081e868ae94'
         '5f7348dd3253abc51239721f1786a5e5'
         'cf1ff115523bd032df18c23086460615'
         'eb7d778ed3de3e3304fddccc0a71b52e'
         '4146cd4bd946497177c765859d7b8a28'
         'b07ccbb0c4708fcde03ee46f3a4809c2'
         '908a11da0e9cec61c108c437bd4deef7'
         '619f9f8f9a49c98db211c3db8d9d14fa'
         '38448493e7043f0124384debddb64b8b'
         '2bc592d612cd1fcb467370c15589e895'
         '231e6f2257306a643013e733f3c3eca1'
         'a0b32d1e661e1f811264138f37e7f7f7'
         '7ac3c3fb70f3406c457db5c9292eb25d'
         '691340adab62f26cb349ce2263fe192e'
         '858669ee8ec2647a813a4a18f49a67e4'
         '173478e4f16677609fa779458c8bcb8d'
         '1052c8a744315d3ab447a670110dd9aa'
         '2a0579c1dbf772f099878abd4eecd621'
         '8183255aae6944e7e3f2548107f4d27c'
         '83c55988e2795ad0a9bdfdb5732b9675'
         'ecee49688724ac1aa76cb5283154224d'
         '9b67cc401dbfd34847a731f73c1edcc1'
         'd1e24ea978bec7953be9a0d53d7dd0ec'
         'f9d65d9afdfb43d900df5b8145e70c0f'
         '2260a6cf7870eb00d602157aeefd0c74'
         '158ef43faf96bd698a2db73aabc518be')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
