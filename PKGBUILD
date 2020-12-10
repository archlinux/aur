# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=84.0rc2
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

md5sums=('5da580100ea3f6dd0d42985ebdf661c8'
         '39c72220710d317d451c501afe9e03e9'
         '5dd66e1d2154c75e423f63ec829d53fb'
         '755ad58166a901d335f7bd4e96f5c25f'
         '97a30c4dcda51c2513482cbdb271a032'
         'b31f797581b03941f1e3e0a3bacc6917'
         '4ade9ae5db86276f91d55b20a9766725'
         '693f98270bab77bac1d6b9dfe49710dc'
         'ba36df0fb308c241d4e5721ce4a269fd'
         'd6a152d3b240ebff6b01cd8d1da60f52'
         'c8a68f4562baf06f11a10ab057fe49aa'
         'ee0f21a3294b7d60419d430b2342199b'
         '8e3d41dc640cac762fb4fa2ceb44a886'
         'aa20d3117bc0072ecc11b77134db8aa1'
         'b03e9149e77efed12f6bb8519f7939bf'
         '0357b6f8e1eebdcd21be06687da036e7'
         'affd8bcc080fe770f4ff38d5149631e2'
         '55592df5076bc623a8db0185c388d252'
         '31a3048000f6034d351e5265d0a126db'
         '81af531df4eb889c757fe9f72086415c'
         '3d2a517afbf0e2c7e1053a945f965ae2'
         '1f47cf5b8a11c8b461f1492a67bdc173'
         'efd92568d493c3a2712b2a4fb01f0d96'
         '4a67e510c492c2e723e89cc931ed7b4d'
         '90d4d2b7417d291687d2b3a29efa5cee'
         'b69434c4c97fdac748e50cb7e4e41f59'
         '043f76a00529222621c9f219d34a00cc'
         'eafab61b1d7af35cde51ce4234271a8f'
         'f40edac357c3ec351d4d337147fe1bbc'
         '5eecc744029534e775a38389561901bb'
         'd1b535cf8324eb6459b2fb9ff95a3c53'
         'fe97611835c8b6b12675297b16f5b58c'
         '57a93bafdc277decfcc130074c40e50d'
         '2825bc3bfc07c30aeb38186f9cad04c4'
         '89761e49009dee35d6451e303dc2d1b4'
         'ba2a640d697c2b10280be84056909bfc'
         '00fb2ff74be00e1cf83593d6608131a9'
         '994320bacb94296801c62b9863829268'
         '5c102ff78970fe0a448b349aec33a3b0'
         '5e8f5773e9bf3a4897e58f628dd1ed69'
         '62294e356bcf9ee7d863df6ec54bc540'
         'f01aae87fbd81777efc00db13cfa1927'
         '87423da53498ae9d3ede286102cb886d'
         'e02ea8268da61195ea033bdf3781696c'
         '7a2242387abc77ff69810b95de1bc2b0'
         '65dea6a4bc39181661ba9315e5cb5471'
         '07eaffaf8480397ee011c0b00b7443ad'
         'fd6d18969db332084724e8efb370b4ac'
         'e201afce56146baeb8181abd4e3b921c'
         'f6cbc1cf95bf68e4aa6ad00edbeb83ec'
         'c2d1db0ffee24b78beacd20a1abfc9f8'
         '64fcbf4564cadfc7cedd296e199fbc90'
         '66db7b568b7b5f364ef9647d8f5c7d95'
         'ed7aaac8dc3c28ee7812a1803548a63d'
         'eb41f417834635b70990e421f4f0bb8c'
         '154b9514bb558e5e6aba48ed0c00bb51'
         '378f70c0820708266318527788a5c000'
         '7dee3243aba1a916393b5429f461014a'
         'f93c5263dedfc567f2c0c453136ca701'
         'a593d561eb3b85b84fef5e5f8fb7d81d'
         '74be60567363acac6d1e64892b0d963f'
         'bed1f24d668c3fe07cf867ad94d66067'
         'ed7546d7712e41fc5ebb76689a4bb15d'
         '313e0a7fab016c401530097128a8a95a'
         'c94ac36dd04fec1b8bafb83b96404ae4'
         '7a753501fcba962b959a0089f71bf07e'
         'd74c0a6558dc7677b507e994601430c9'
         '96f659e83aaebd8ebbd7245efd6e8ae7'
         'd08e4ba8e728a61c2ac6f30f613b3e08'
         'b27a767f1a66bf659ee194a9874d06a3'
         'b57c0d30a485ce16b4d58633fc7be06a'
         'adf85679ac43c354b34c815a67f9756d'
         '57851cf5bf5eb5f54001540ab3d465cc'
         '68172e4d4bfc475d86fb161e4d5db1af'
         '46670a864b195157bbb643060cb8dc52'
         'd489e37da4210826ad0691b9cc3f6b91'
         '90fee0b02e2731882d3ea9b1a2568c40'
         'd7ec88969f2aaae949a9276487d6fc54'
         '85f7930f6e1965ee7d53799fc3df8352'
         '723372066d0388c3b4e9b1b9e676b336'
         'ab0c9162005a2352fb3d54995c4ad7bb'
         'c439d518f5499084415a22d35bf8fbb0'
         'a5ddf40ea3432aa19c10df06df2ff2f5'
         '7f2431e631f29162b7d428cde74618d0'
         '252cd561d665cff99f1e8425bfa07262'
         '4bfbfe941afa308826813b42e563a311'
         '5621a981ccc68831ad0ddc42ee78771c'
         '2dbdd25df5356b3b3ee4efd79eedced2'
         '521117c95473714b4869f8f65c5f9338'
         '6730f4b57bb54b5dea245480b9efeff2'
         '718500673353e723c01949da35c6ed47'
         'ba753cb99717b118d25996aa58b2aa73'
         '32f3ef36501340e121172c277da23cdf'
         '490522ba2b591443792d25f6a7f2f146'
         'de9216d8ca9f59b2db10318251f11fbe'
         'a6aa1ad570a642a8429e45b71b807a3c')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
