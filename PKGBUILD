# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0b5
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

md5sums=('0d44ddf2daea2896ab1398870ef7bc3d'
         'b2450327e362c64bd8c167b9c1eb3423'
         '0ce024380971af036b8b9bd773396a5a'
         '574db1711f7d87a91df85ea11444052c'
         'cb86eddf3989cfa240b461131a515114'
         '0666530d5d01ca7bb8c4e6b142321a76'
         'f65daae3afd39f9f84bda11d1b4b2d0d'
         'd603e3c2e261d015aa6cfd86a0835576'
         'da214f44732a709e744b53b8d92507b2'
         'd5a69513590aa9062e419144edfbe853'
         '75e21f37f02f81a4734f134b32048f7b'
         '21d7082bfed662fe5632ed423205aeb5'
         '29875430fc08278c079edfbb402dd2d4'
         '9384136e71436b48abd34755792d97ff'
         '2409aa266fe839bf829e08cf5cf715d4'
         '66aaa23018c7e494918ee6a4465d0888'
         '5107ab25b013fadc1a078f1dfc886cc6'
         '1ae3e421bb4bbed1a506c918e30caebe'
         '964d79fa2484efc3e649756f34bda142'
         '65b077f49ff6f15613bb3fcc30bcfd57'
         '53f2c330bb0e06467e4b3910f20444ae'
         '5f7ecabc2e983b401ba5f1f807252d8c'
         'c8656a8e43c1173fcbf9e9ab48858e12'
         'ea6066e174a48ef3fc44635491dd1722'
         '34e702aa1bbb2f9bf4010fc79ea43366'
         '6ccee53e0455875a0ffb8a21ba44cf32'
         '689b0a3109afbca0c4e2fca4f9cf45cc'
         '7b0399580a7399827de4b9b9f9271837'
         '69394bd25729e32c6daf414f276cd0c3'
         '4e7dd4f5a5ba19aa14605f723ed5b5bf'
         '24ce4383d30c574e511be49884d76b03'
         'c6c0b5b785eeca342da9d20a2cfdb494'
         '131fb5f4768aa5c6a0f9967c14fb3ce1'
         'efa566e73ca9e6517db2cbae1374f4c3'
         'ef0e9d352c30c4e2d90d860da6ab28db'
         '77caf505ae9c65cad095df63c855b02f'
         'a15220b26614d6f180dcd263e28d0033'
         '6888e056313e749585c9829708dc1d3b'
         'd018ac975fe909c2fe624417e9d9c8b6'
         '91a646366605fd344b06bb46df10c2ef'
         'c676e47977fae4320a2c6135c82b0274'
         '38e457583e781e32f7e0b7c44fd9d0ed'
         '0f1593ab1f0f6f4548404ade78431500'
         '48db9e62ea4b2512a6c325b0c7f63e21'
         '3483ac25a8b259576a0d1b207775168c'
         '2e66ca2e1844f12c32cd609c78537fe0'
         '37d910dfd9f91d3d5a6372f19047e207'
         '947dd019baa5d29eba0376b7232f423d'
         '9593691d26a2cc842d0bad20bb6f1c55'
         '0c7300a62487ce088b7d12264fdabb9e'
         'e3dda7e0cd74d5373531ec8f5dbce313'
         '642e7e7fb48e474a3d6c7a79040f45a8'
         'd57b7dbdb9d892edc395f96ddfa18ac6'
         '62702e4293598b07c4f40dd6f617498e'
         '8f9bb8463312bb85d63c9644dbe254ff'
         'd8391ea67f0da22185a002e02b528b33'
         '9cca6d2747b3e0ed1dfbad66a44743eb'
         '9bc75b7c8aa195c9f15781856eaa8fec'
         '29993f99697066c3c5769039a87c39cd'
         'd4ed285917ef5b13dd703b74d2c1f5fe'
         '632a5357a9658ed1854b9bf6975834b9'
         '0c093b9e1d45914cae356ac80a54303e'
         '5c8ff16e71f6dd1fc4ea71d51db5c4b2'
         '24d2177cba80feedeb65215f84af3b01'
         '5cc91a0fb8415abe4e7f238c309befef'
         'e8b78a10ca922d3a2622284cc626743b'
         '05a03d43e26096c8c0840b5cfdc928b9'
         '5a46e98b11455f5e19256a055d139906'
         'ce8e423d4c47691cc7e458374a1a4bce'
         '5d9ff10a006438130a5194ed68765745'
         'ce8af24782e35a677f0f7c030b32c454'
         'd17b5de4b0a5bb30390954723d00709d'
         '1de4cc2ce2ca36dd9787c15e51b74f0c'
         '424c7c96ed61b395e8712c25ddc1e734'
         'b32983e5fa2b39c22321a7f5a078acd5'
         '22187bf2465d15ce328677ba108bbce5'
         'eca5d7315adeced8cb5aaf2042711008'
         '8bddd43816847a8cc965b75933ee4470'
         'a6dfd9bb55b052226b45dd981d9a6a77'
         '3f34414c2d1ab1841a41030246860b76'
         '991a7a2b50f53aa912fd5a19f070b94f'
         '26ff711277bdfdac36970a4ee1714340'
         'bd031036776e0cde5b00b05b46d24ebf'
         '1e9ddf73616634e1fd8b30894dff85e3'
         '0aa3a4763b3bc4605b1a13577a3cfad4'
         '8ff2cfaa5efe03be0156f990b73ad752'
         'f796589f3c8b9c8b449ea6f712b9c534'
         'ff9fb8fd09d807e88ece6a64f03ffecb'
         '86c188c14a3352e475f1388d277648bf'
         '82bb7089b9666994add2734c6e02ff0b'
         'b4215d816adcbdf9a9dbdcdc696fa3a6'
         '5883ca219ad0d50f13a7ef16c3c71e00'
         '9102271c3a3d2d1f4bbdfa01bf53e73f'
         '753109b9e4d7f1d746bc9f48125bd7c9'
         '9b933916ea95213166087191e617a070'
         'b79d56e8e40fda3ff093a0eb17c520b9')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
