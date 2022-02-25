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
pkgver=98.0b9
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
  _url=https://archive.mozilla.org/pub/firefox/releases/98.0b9/linux-x86_64/xpi
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

md5sums=('03cfdddd8f0c353e58bdb5f9ab720623'
         '2f0733d557f187a3a15192edd3d48608'
         '76d98eb9d8b8a5cd79adb7105509a883'
         '52a6bfb1983f133197e11f45aaa62b2d'
         'bcb741096777b4815259c19480b23aba'
         '244ce1e34887d2d5d4deabf553eace85'
         '852040ecfc953adc94c7ecb28ed0d3ea'
         '486304d9299b818c628686334452fb5f'
         'a93a2973cfe27253de7bcdb8b7de6061'
         '3af598d530700a794835d3f95d5d59f8'
         '16db836634bd7c4200b71aa0a75f7a7d'
         '176221ae603de3399c680f8256d45962'
         'ceafa98c943a82b7251376eec7791462'
         '551b14807db4826555594cb96ffd9d28'
         '70d7c6036daa15baeb2d97236663e920'
         '14832426a7642db9877b171577742877'
         '868146835d1334d8b4665a0565b41a13'
         '245399bee8b65860f9ff1e4fc385e87d'
         'f70eb586ded9433432a30822230d6fb4'
         'c3e816e80a537b7ce83b7c14d4aceab3'
         '3ef5e599abaf88abd3f21d2e1f2f8501'
         'f4894d9c510559b6376569a86b65fae1'
         '97ed1abcd008fcdcc8143b5c2d6dbb95'
         '9168a80fbc49ba6325439aae6b803517'
         'a24955a39046fb94c6e97fdcd5b40e99'
         'f75f721e8f00455d12ba866b27011818'
         'f028e54acc76088628a1bf32c0270645'
         '79b0fe273a9221f1d8819f614df1dcc4'
         'e6f7cddebe43e602f4744cfe20a290f5'
         '0365a5f6b8f2a7916a24119f91d38bb7'
         'ce2d0535987b67f702b3e9bed9228236'
         'cb3f15a3e23fad759f1956fc70e885c6'
         'ef0b6d455894194ebc39df9bc32f3ada'
         'b0f42b3c4cc60860019a0bc6e64da79a'
         '30db86bc44c42ae2f17dff8286d3848a'
         'ff9d7862654e445f7be752efe00d6dab'
         '07f619e6fbd0deccf27af2b8f3818bba'
         '63447a993ed97f75151dd1b61ee322c6'
         'da1a2ddfb1eb18c7d58798b4a15bf67a'
         '562a9738d6adec8044d3f8e106b8b0ed'
         'ab56664b5079fdc7504d9b190fbd65cb'
         'dadbfe2076b9348d37ee60cc49251734'
         '108c0a29666228d1da346d5b4f49fa84'
         '6d9928f165095a9eab808d19b76b0fc9'
         'f556207f74f326a51480ed60e90e11e7'
         '74545ba6e60004e3e78a7b330574b683'
         'eb97dcfe9d6ce48de189bea6b7d892e6'
         '8dab92cc2a29742f9947503594703e07'
         '40fbe7e63e79febb9b1b481eef9f1098'
         '712a91ff9c4124b0c5140fe21dc880f9'
         'd3b5786734c423e13e89922b706cba6d'
         'b34775e257abd365da8b4f1c8ca04b5e'
         'ba9466638ee0b00a82ed7f0194cafc57'
         'b18dce0e7923fd160b7caa2667523ff4'
         'ac51d363079cb631e86bbdb30908dd8c'
         '3c8e103478fe185c51fbe9946ba353d7'
         '107fdb17a17abdb3b78371af4d338f8a'
         '89fc68e00cb3bccddaf57a332377c8c1'
         '228984db9b1a8f23defdc907feb4de4d'
         '2e43c02b06c2c7b39e763eb45ef756f6'
         '2b0f5c38fb61b803fe9ee308653d911c'
         '72007ae1134e975a88d393ee5700ce77'
         '59f250553d4f9d877e41be31dafec496'
         'c3f2b87252a7514cf0532fcda83c8e49'
         '643603472f6d3e2e20ca31f88b089b09'
         '04de4ef6b782b323979dd2bf77f3004c'
         'a041d496339f0cf881b867d87ec9ff7e'
         'ce38703d2bad7e96291fc2184c85f740'
         '1bb94e62e4a90a77cd7381beb045fe86'
         'b229655c76e142fcea59a507928ce354'
         '96fcfe17db55ac14b876ad977c52e8a3'
         '81786e3c92b711c4e110178c086a4d05'
         '8113e569687a7e1fc9eb46fe26a8841e'
         '59faff98b8b3130cc4ad3363d1fc4e4d'
         'dabc74575c1835967a46c9b3537e7dd6'
         '6c4ef6128038d80cd48de6cbe9d8ea82'
         '5449e044f3b41273ec6df586f2fd8a71'
         'd4059a81be61fbbd91dbd6fee642c01a'
         'cd39b6c16bd416202e711906a99f2b6d'
         'dae4754f04437a6c2330a98f23f28fab'
         '6e2f842e5f619b258304720a199ddb31'
         'a301ab8ee3983ff4814d28c3de48e420'
         '45bae1e8df2479e29f32275d500ea364'
         'dd34a55c918841e2212fa34555c1f8f2'
         'a8c4b2979366bfb9f669c0fdf6bc7876'
         'a10b9ad507f8a73fca8b975f1ebff616'
         'f96f1ddd097911a16df98d024f6bd127'
         'da7a7b25a81f26e46a07d7469cb6b167'
         'b0841e70a9ae5491d3b8a3de6b50a994'
         'da47d9cb76d5ece7507fa46b406d4abf'
         '3ea3e5130a8dbe356d82fd777e9d421d'
         '4a2ca17b4d851e5f672aa32b0088fe52'
         'c8e925d3d53dfa82cf2b14a81c78f38b'
         'b6545715c9842d3afc489f0aea493a41'
         '5cdfff86df197adef197668cac208ead'
         '8b3471a911ff7b6624a130a9c47f1334')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
