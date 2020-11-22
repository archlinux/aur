# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=84.0b3
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

md5sums=('26b5a0422efcfe50ea584ece3ea88992'
         'ffaf4e448060820c207d1188de97a7dd'
         '74b31fdcb82c3396a572d28cc7bac64c'
         '476aa72d55f95723bb0c1fbf6d07d708'
         'eed1aa41525826f912385bfcc1be1eb8'
         '88aade46b2acb114f40731ab3979fc04'
         'b10d6519dd12bc10d84f482355dc76d2'
         '55317df12616fb8de433a8c7f4e13723'
         'ea51c550ede620bfb79d6ec3067aa284'
         '416ef204fdcf7f2c2c5d18ca6fb1b995'
         'e646f6cd10a1d33fa95457a105538d4c'
         'e87fbb326b99bba2450b001724b3990d'
         '73bfda23130917b34902d1c3ade29c93'
         '6ba5e016ef73cedf1ce198260036e463'
         '31ed31ade0c34d418d6816d0debc3529'
         '3e45f5d3ca96c8c0b79941b2b2ab7a53'
         'a7278aeaa1496486ab8eedc21b4ae3e1'
         '678db9549bcd456d2d7099032017ce75'
         'cd0efff388f8d69e975d8eee930e0220'
         '245f77f44cfe71a7989281d40c12a325'
         '1daaf12b21a56ef1cd10f6a306958fa4'
         '1da1ba6bae4ceca4686eea582b6bc861'
         '808db0ecbdb9a014256b36d3040775b6'
         'be8df2ebee29f7cb97091e40654685cc'
         'f75cf111ca48f519324701aae9e9fa62'
         '1ba8bd639ca42a5762fc10112913ed34'
         '0c388ef5df2c55da6ca60317cce1fa4d'
         '75fcf1401912b0bb85eb36da6a3c14c1'
         'f1132712adc49232a764ea76477de5c1'
         '3ae218fb68b9aaa7a3f34b06932da298'
         'efa92653d28c2a5c471aa0dec452b07b'
         '37756c4a0d42761981df75ee34c83496'
         'dcd5312cfd4181351232bb58655f5525'
         '888cf5db45806adbf93acdeabc3971aa'
         '9b7ecb28ef65ac7bfdcaf6bcba0d326e'
         'ea00ca20a38e050994bed281f5bac7ba'
         '5a8e0f5b17f9c59545526de7a1c25a1a'
         '9b674838a03aabf27fcd7434f6a8ff28'
         '0386444853c7e1a4ca228ca763cb8830'
         '0f35e4ceca61f7c3dbb698f53cf7ac49'
         '395e68c8ae391926ee4c584dec37a32a'
         '1e797a2a511607f4e3730eaed033c3fd'
         '6589de82ada198fbcfa92a7536fd71ac'
         '011ba22b6d5e7569d1c0dbab1d1beec8'
         'b706ed2d9b4d46ea9a4108a3db35a177'
         '29e117fc335f3e51d4179d94ea5bfafb'
         'dfd055a0bb7f7483bf91b3d3f1196db5'
         'd4a77ef677bb303a6aef6117f633ef86'
         '8486afc1d22fbc062eb17e1d470fd0b8'
         '200cde3922a57b6e320d534d1cae1e60'
         '72d6590074598995926bc4399b363574'
         'ca02c165b90524b90fe2b4ae98022254'
         '61530abb5910a7eca6c4adf4ca05e005'
         '76096f779b314040f45653b2e5cc142f'
         '506a7dd6be883389af8b3b18e5d5031a'
         '168bdfe5110b8db2ca85a04d31c6c325'
         'a6eb76bd759d6f75acf6a0bcdad2f7d9'
         '66c84be162fe850d0cb052ed4498d8df'
         '8055d84cbdd061e28a2c43523425ba06'
         'cf53d2c4ca7fc7adfa4dc3db17509cb4'
         'ae52de9cd35646c2d7a7ba652bfbb3be'
         'e223c6c86e445234daa40d1145c0120f'
         '7f5695bbb0d0c3f4b53e2641ed79563f'
         'c5201cf485b7eb35df323756c7060ff0'
         '85c549d7bf6b4f48d5b205dca3e9bf5a'
         'f006def2264ad8f7934956def7746003'
         '9e31b4019cbd2820ab1960a8ff576fca'
         '1011c55ec5a0179004bf656e0b360a21'
         'c79ae7a75ad2236a55529bf45ab335b5'
         '1a1077cde6db1667a7a0522a296d5925'
         '440b0f03757a10afc652068a25dfd3b8'
         'caab897cc7ea8a76fd94677e54966551'
         '9f916c7c1671f033e15bfdc900466f22'
         '7ab8af6b3b143a2c66c2c2b47beadc27'
         'dac41b80ad0c9f5f4ac9bf8cfb505e9f'
         '45b234184cb92858af90e6e82fc44779'
         'b07b7994d10d8c13676f461e8028dca0'
         '08f7762163277969c8834bafd035af44'
         'c1df1c8bb58b6894e8acd4f1bf908f3d'
         'c1d5a96c1a3d822fcf13eab03fffe50a'
         'fd840c2e36441763519f295b25bc15a9'
         '9b6a4aae925d5f95087b3754409cbfa8'
         '67f17e2598b266a9827609fc86a564ec'
         '4341c769598773f929c740a27c9c8bf3'
         '9b64716659a42aadb304aecdb959ef05'
         '9c1714870ce1c81ab5565d8883e22f67'
         'c8482002c6cddbd841f947399b17c35e'
         'd29905d238b4db549e3d0309e1d08842'
         '8a6c762ebf53bed0b72b3a05ab154087'
         '393c90413f272cc7ec7b7299e61f5528'
         '00de17e58ef5e954474a1c785544c56a'
         'e592e1f592c081ac59239b4e04f9e482'
         '1b92d02d838f6164c43568d2ad71ade2'
         '9b30911dd3898f3cfe7dcd09f7f57c00'
         'e47933b7831376bb62c7173f28c4db81'
         '938c45cdf9cada3cdd529f9a2fd303d6')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
