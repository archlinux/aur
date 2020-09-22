# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0b1
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

md5sums=('374242d9396bf116d460e95c701bf68f'
         '64f1a00a5f3c6bdf8d525fd54be0fb16'
         'd875f9d8176bd6e2c4dd2effca29a7a0'
         '9d905624756495a3cccebe937a1b7d97'
         '49374b868b028c46fd6aa517670a0e93'
         '534d0fb1303924dd632420fb16eadf9f'
         '090e3c9255a927a1260d7fb67d086ba2'
         '02d60a488699cc480b01b274296dc65c'
         'd7c948fa2fd632e1e72206e178f32be2'
         'fe4d830a46cf91cd33ccdbdb9ba49f02'
         '55440e64b2cd7349aa199097c1238651'
         'f85fd0f444564dddeb177ad49b0579b2'
         'a047e12609c87795e0d46147a6e315d9'
         '321ad774073fb39a8e7fec8c9d72606f'
         '73113307e865030c1f380f65b7ab5892'
         '63ead4cdef2e7f152a2b2d9de604b038'
         '9e83e5b16d9078c020d21fcb1b48f10a'
         'ab986627c4d4300effb24a3e3a289434'
         '04233670a3b562c2db92917f503fc3c2'
         'd98c024bb9f33a796eb2f400fd5e48e6'
         '062bc0af56f245ca192b898366bef376'
         '9ae765a013e516dd35d2c09ff4d55631'
         '94758bfec51d4f83ffaca8d6d92e3186'
         '1e532960778e73d908e9263e60ad405d'
         'dda7b4b367f75551976074eb37421225'
         '36c37dec287e954558d69ef87a236c12'
         '5ea0a5cb66e85c585d29a30c41227919'
         '921e013af3fc33550ab921e47db4b17f'
         '42dc9c2567c81b55016d4c3dac98f4a2'
         '0d2f1c9824cf19217a00ef6e8921e96f'
         '0cc640f9d9cdd0a7960797ed9c88b56c'
         'f80c3e412d026fafe67c4242fee8a8f5'
         '1afe736709382a7ed2f418dbac70bde5'
         '1f6d820eb47771323669127f0c695e85'
         '0363923fb6e99d0644854d9ef8657495'
         'cf50b1558f90bd366f9d20252e3616ef'
         'ff2057209fdbeae5a0dae6bd988bb1bf'
         '15613a1c91f83e8788e5b15566c0d67a'
         'b603eed8fe9154d4e926058099a95638'
         'be50e243ebcb173471a08d96872b274b'
         '8fe2720952e6b43656c2c734dffea166'
         '28c274be48601219859d2ef14b6ea049'
         'f49fc632d0f40b8f15a4860c2d49c787'
         'f6453230bc10ff6c41d2395c83641a32'
         'cf47f33070746a3de10248d77be9f6d7'
         'b4fd1f91ba0ae59297d4a0e5a8a64fa5'
         '9009fda9ccdc8875c0a11bd1f76c63a5'
         '1c16d25b7d8a7ac5b2910ec25323dce3'
         '6cd0b91861c05e60761d4bb954840bbc'
         '1765987b1d0833ccc5709fc43e2f004c'
         'c964ddf231a7a8b70ac956e899da7d43'
         '17d408478da573779fad6b33efb1d174'
         '9e7d6e8c58625eb9acf5418e0c4b445b'
         'd905bdf0bfb11627fba3a44da4ae5476'
         'cd335ffa35a54d2f3443ada4db4af107'
         'a17e578ab082342f7a87247f67d7a9ad'
         '8bf3265eb33a39748267184249298429'
         '2c6331dc4fadb1f1fb3516e77ca956ad'
         '45727729e337e30b1c32bbc6b3041983'
         'cf85fda6cc60635ce88d349cd9d4ddfd'
         '916239ff6a92da958f68538e8cc03541'
         'f5b0104abe5b4fc8459be9e5ac8f6c5d'
         '60711143cecb923ad28042b7dce47b0b'
         'c5383c7013c00a1916acced9a423f204'
         '329e2ef6a3eb0f2ccf681443ab810e4e'
         '707baa65ab9b74aeffb17ad0c43058e2'
         '5aa6376907c964a7ef7a1d5003aa99b1'
         'd816134a6090b30404e396f456810453'
         'd883b877c48deb6cdc2a342b23cfffbf'
         'eebce56ff920370f341ac502cff514e1'
         'dd27f82382c15d1d5ebe8237123cfadc'
         'd5a49fa94de78559e6c3b2f35217a4b4'
         'fb2d08e5725c8e4d6eedf82acd54e69c'
         'e95a367f06d435dd887f1e0cbb7606fe'
         '172ecdf7d57a7229dd1d2c37c5604157'
         'a67f1ce973b83ba5bb8e34ad92e3b44b'
         '78463d5070b457be7d9d18d401f204f6'
         'd4b7160ed1f1b0b79334bb36584da969'
         '613f4e72e18d560d6d2ef9321b50970b'
         '7c95da6fd63456a32ff0efab79ac33c0'
         '68bbb497d4e7628dc420e29bcbb4a078'
         '8de367c1ccd4302959ac7d1ccb5385bf'
         '2884d8b930ef4b484cb291f2c12760d8'
         'a717f7f72a1d2f5cc71b368d7cec1762'
         'fd88107833597e6f7191d3846ada54fc'
         'c1885b4a8f65b5193e509cbe5480ec9f'
         '64706312f6b9de48e460b7bf5af0d837'
         'c13de60d0e800eebdbfdc003bec8bcdc'
         '6d9da81a594d50817b8f8b7941615c3e'
         'c8f73fb1d3a3874f3785a89528b9677c'
         'f2a13435001bd397edf25e799cee60a9'
         '7f0e77784482ca647036c7888cfa1321'
         '31ce415f7f0fbee47fbe20114623fb98'
         'bc5bfb02f4bbda16d0dd17832a99bed4'
         '299cd319484de99ba85f4932bbbefd68'
         '879aa0b5fa651996ee2b92fe5d1c8134')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
