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
pkgver=97.0b6
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
  _url=https://archive.mozilla.org/pub/firefox/candidates/97.0b6-candidates/build1/linux-x86_64/xpi
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

md5sums=('2af6dbb294c78730040c5e06dc5d4da5'
         '6f6d0a3d4f67514d71a8feb47b001b5d'
         'b9270dafae81168b070ff91b0c14acb4'
         '0060526fff092cd8303ea855118d279f'
         'b0692b82dce31f5698c736c0c2308d5d'
         'af38a1905355310ad6468f069a20b94b'
         '91ce4b8ac40db7d534c47fe1eab46b9b'
         '5aefce294a72e8ffa51f8f727f47e5ff'
         '308fcacd11a8a686b196d1ba4aefd94b'
         'a9de1e6f246b370c91254fccf3bdb2b6'
         'e7f8093848c0c474c5f6d446f60b6c8d'
         'b370fc29c70e1a08438878152d7dac8b'
         '10494fe0c0b1e42a1ffc2c31b8869bcf'
         '11c1f97ffd32ef8fc26dbf26d4e04adf'
         '2c60f2dfd520224cbd20a631a40b59d0'
         'fb8ab225fb0e7beca187b18a88ec6235'
         'bb5ee5e1f4338496e256a917c6d7ea78'
         '0305da112df9b9c677b97531a3a714e3'
         'd6cb41a6dc5bb63770fe7da15c1c23f4'
         '32467d6d7e71b9897b2bb7a0b8d91941'
         '16d7d0fb88e4fd59427fb75a3379be3f'
         'a95a9c2f477893cc3b120bfee729646e'
         '5692d83cd9bb1462f0cdf4a1a4ab0044'
         'aec2149a9a6664fd50d275e210db8011'
         'ae5e5950d865b6b1de2f4f9300873648'
         'fd6f32c5141abe75630d50efc9b6a9f9'
         '1cc6a61cc642fa9552ca8835e08da93d'
         '3c20f3ffff223733bcdc945c06728538'
         '76b105e4f418652ddc05d8f51ca7597a'
         '4a5befe760710dc1ec57bc276d153a73'
         '9fb993e38fb03536c62ee3fb31e068fa'
         '65e34cfd522937820a3e3817aa34be3e'
         'f67743ea8020824123da91a2ee38b8fd'
         'e4140de4a5a5e46c091c655ad997de1c'
         '43fd853e9f7132a80d8064013b32adef'
         '134ad70c7e6c5df74150c34d25d08660'
         'f16553fc52e6c3a5666e28c703204ee0'
         '75c1f52e13703e93b055280015529369'
         '8a9d9e752504d3f2446014726cee5add'
         '6c110f355af9016db5ae7f75afcb2745'
         'e6d636a56907af07af8443a92c4acd82'
         '717f0385fc0077dffa438e7d3340a79e'
         '6dad4d8159f4fab9eda94840eeb3c5b1'
         '34e6bf3f4e36ba4cf9a313ef3e14e839'
         '96566138f065e9de700a68fe76d76b7c'
         '02f8b833f64a15d274fbe6d494869a3f'
         '7adceeb871dcd3051cb912f282371c54'
         '3a2d1c1a661a12789435d94c266da8ab'
         '6d37de79a507d2b0a796887c40600933'
         '1dc6075d3694d76dbc56ed6ec44e8410'
         '55552f065cfcb837cdd2a8856d9597b0'
         '47bad051162dd5f3449df64f7eaabb6b'
         'f7b382563c19645d725d01a80043d42c'
         'b3f72f9673922de92f74a314e742c552'
         '6ed4f49f243395ad56c9237bd4d22ca1'
         'c0ad615c8ee5c398f2f4aab8746a1955'
         'a553fe3284465597621a5171c7c8061b'
         '929cde2e77c94c373ad4b7a8bb64f720'
         '30376a13222d505e91f4488b509b35b6'
         '7a276f7d6caad8f8bd1807d7e00a28f7'
         'c6119fda081c7b4f24067cf48b19f709'
         'fda59aa42c4e39aaffe2bfd2bc0de21f'
         '2b62b8474e6e14eb649310883b5c27ff'
         '83f1d1d4161e0856fd815eb5e342eef1'
         '7762ddd7b1a88bcd33028825f49c8f65'
         '76b68000a0e0a4a94aa05c76f42954fd'
         'a4c7ce882f68c31ac46b6e6180878d7e'
         'a40f8d23dfe5424b113266fda2876639'
         '4a6132b80b028d41d1ed68453a35300f'
         'fa1a730056ab36f504e6c504789aefe7'
         'a8356398c83b7fbd72f37d0ba0fc2491'
         '8ca6d3cd240aaaa62208446325e5112b'
         '07dad428a52a18b635820dd8477d952e'
         '80364a31b2500c9f558d9ff8436581f0'
         '980e8044527bf6028ca6548d29ea6384'
         'b4830eeea2c92033fb7ded8958946793'
         '02925735e8af8974b9f4df4a7d033f7c'
         '560566c52fa0bbae45afbe710a0729d8'
         '735c838e5e2d68acde458a7960c9918b'
         '7927f17f3d5e1ee29b6ee546a8e51b89'
         'b4b37903ece7f67284e895c6d98837b2'
         'e6fab56b915dee77a2a0256a02a0235e'
         '3bf756bd64a6f6870c25c0c6f486de2f'
         'bc861e6b8a4dea6484e2e8e5a2a3449c'
         '6ad5d7e6a2dca579858b91a9e9513cc5'
         '001a785e4f72e28f32c296cb3d06d4d6'
         'aac9da0acaf147db8c71ed025bdac457'
         '53e5978a0feb4f589dc923a751fdad9c'
         'ed21ceb5b677a59be353677d2c2032c9'
         'cb13b884cd1a1e1697daef255bcc7710'
         '3b9c9f3f24889b27854d64ba98924d0a'
         '8295182e58046257ebd127a07c5f2b1b'
         '6e89d28723c225119945c96db59cede0'
         '13e57f2ed72fceb6302a49e7241e264e'
         '55a0528f424f5961a8b5c14e9325a62d'
         '133eff349777cfe1fcfd247caa15a182')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
