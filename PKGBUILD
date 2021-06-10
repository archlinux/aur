# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=90.0b5
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

md5sums=('66b8b8e920a059f068a70ee86ec1af92'
         '2594355aba093aacf1a144cfbe36ea71'
         '842e8d97a38e4cda12e9400463d4660c'
         '18c2a1466d46a12fb78f50ed2ece16e7'
         '65a3b5cdbcc53575535495ec81afb56c'
         '83a3ae01e32ba9cf7f036a42b65d3c33'
         '16cc9ef6aaea219f260c942d33a0d4c8'
         '43b355170532f983f14c22e623d34aee'
         '7ebca9a17aaec5334f2906d60fcc9358'
         'a6aaccf37d7baf6a312ae882523aaa88'
         'ee5e71602d59981de0abe743c687f723'
         '0acb881564b273433ca1be45f5d750d6'
         '802127db0816875f9335865cf8c35dd7'
         '25ec95dfa0ebf2671019c87a903dfba5'
         'e253ce7b608e015cdb394cc0f98fe731'
         'a55695ea7a74f95f740b3df4af5eaee6'
         '76385b9a1935d8b5f40d80fc5057c9e1'
         'cb397356d0046e2e76ff1c2488ac1041'
         '7907555f3c64c4f5c0afe3381d0b155f'
         '1c7a8759e54898431334f09cfe40765f'
         'e80af9ce24b2519761770b4cce278ef4'
         'd5b975b16ba2067b88067696ed2e7ada'
         'd63e430833d71d0545d425cd00ec2d70'
         '0111444869cf733b2dab720d13af445f'
         '555d2be47f7925d6192521a9a4b1035a'
         '0e7fa5e56f5edd99e23bc1e583438806'
         'b942e149756ff47a0bda8482c05df174'
         '91254a9673bd40ee56cf83efdd360159'
         '180c73685b77f649c5521be0096d207d'
         '78dabeecb41d91cd1f5f95f766aee55a'
         '5603a41a26137b20e8dd513b49cd3501'
         '2897b7869b0bcc89c249e0689936882c'
         'aefdb0d1c6e30bd4a223c954fdeed373'
         '521947dae021f6d6b2195ac7092ed282'
         '3ffca7a153216ee4de9d9b56cb1cc342'
         'b3cce66930c3d1f64d23929057ef4bb3'
         '6e9f046f21f224c86ef88316358c3501'
         '962960110a099f765ef2a81d560b0a83'
         '0f244c8b8633186a1e6ec917802c2367'
         '21b65f6aec1292a3cbcc30e2c2c0c5bb'
         'af90401f4e5cd3b06844b583b6204ebb'
         '2bbd8652510ddece442497c97f1c1409'
         'e2246fb93da5707790f52430d894731c'
         'a73667107bfe4ee46ad10a9fb02b62e2'
         '739cef529a0684477af18275277e385e'
         '02c4876cbcf4062e1d2de89521859c96'
         '94ceee27034434ac42bc17c936317392'
         'afa4597a2a912cef184640ee8bdc0728'
         'b0c126aba64aff44724a92db60ac41fb'
         '174e7c7ecf1769c84b9a6119705fe764'
         '91a38d7c66dde77b527c7d4be9864cc6'
         '0fdc03d9f97ccf59fab00e8b88dc5670'
         '968a90f3489d63f07d8b7f13f20ad796'
         '43505cab3ae4cc07255f347d63c2da31'
         '86c8abea05742958fdf3bfae852ba1d3'
         '3842ad831fe28229cbc39ff5263da41b'
         '694db89fd815ee571098053e0aca5941'
         '8c7563f26d04d89d3d6f6907db932ecc'
         '90bd5b37fc4ed9d9bfa5ee5a34a6051d'
         '2f45f6a18ff1bade3514b7ab52765865'
         '76f70fe9de493919a88ff7386e2ad0ed'
         '45e64507b528e4b759787e932e60fb13'
         '0fa5b7b86ced7794c0788076d22070d5'
         '8ce228656bfc4c8458444b677072252b'
         '9af5d97a6abad0c5f63aa9911fa367d8'
         'e69f3780b35ec5ceae9ad106bc2dec01'
         'd784e6168207ce3dd231f50493652ed9'
         '4220e0ba1d9674492c448794f6cd06bf'
         '9709f5b3e1ef67ed07ba3fe256d85f97'
         '7ab775be5b1c237a26d72fc1d00db7b0'
         '15768c50642735fff31f5e38f86a18d6'
         'd96e36ef65c1abda64b5c2042d98c7b3'
         'bfd55efdda9a8a56ecda33643228bdac'
         'e27ce9af15c6f1903f75ce723d280f73'
         'fc5c0966c3fbfd29cc595e16778f37b9'
         'ebbe8c303ea0e693158fe12b94b5be3e'
         '20e363d484dbf38337a1e6bf698d586d'
         '7732bcec66f6af4edfbc702e8548481a'
         'be5d20ed49e2de3d9e662ba044d004f2'
         'db664c8431c353fc015bf3c00d2ce063'
         'ffdb754452bee931b4193298b1b4453f'
         '324f3542fe77087ee88624eb53888937'
         '0821325f25b19661c5ca257db43105b2'
         '3cbfccf59bbb2ca78420c7eb6a8f97c7'
         'c75b7b7a5be2c353b966c85fa1cd8de5'
         '2b1488c12f27907aa7cca0e12c354c56'
         '7b7ef13743160a403ea1161e849e38b5'
         '6ea6003459ace64d29610b6e305c251b'
         '0a19da3f2ad26df0e8cd24ce2422903b'
         '219ba0e34ecb9ee3e670e59ad3ef8ebe'
         'ddd5dda681f1bd6f90ec41c82552b04a'
         '099a2ce3a355520e86546a96a47ee1f4'
         'aa28671f48430460bcbd40e42042b936'
         '6dfc043d29edda463f374e2049a8bc39'
         '5e32e23da9a9644d2bd25b92b0800f29'
         'de7960e7ba63b4b061b1320ae4d2312e')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
