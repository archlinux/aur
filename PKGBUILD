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
pkgver=98.0b1
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
  _url=https://archive.mozilla.org/pub/firefox/candidates/98.0b1-candidates/build1/linux-x86_64/xpi
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

md5sums=('27d3c2dc1e65e358c523c9e68c69995b'
         'd83b4b5280411cb732fdcfc6c0bb15d2'
         '76e94ab63630b399a7a734d8e90adcc9'
         'f0b1219af3aa233ffd2ab7dbe2664233'
         '90b6e391ce4cf5088d4b70caaa022aae'
         '2d4f48c7caf59044150b1e9ec0a7ede5'
         '451d56595278c1be83e14b0ccdf18232'
         '15035a34068dcf6fc1be95e59ea8bfa5'
         '26593e40c488545ce5411bfa578dff31'
         '30b74526f5fdf41e34ed48ff0a9be907'
         '8c3d33b96282b3938ebe8597aa6f37a5'
         '91879ce586f3c8cdf949c1b29db23a0f'
         '636aa9cd02a6a97017a36ea0cf2e6965'
         'a692d22d2b2fb633869bcdc7a5d2b9f0'
         'aa4e1664625061723388c88de41bf24e'
         '3010130197c4185be0279b0aa047eb13'
         '7f8b39aa194862f1a9ac928de8d19e08'
         '246ec38ac019ce655669213c7227d1eb'
         '784343ad20d472e53b11e6708dc7a21b'
         '214fdc0962b20fc021b48333692b3472'
         '72ee14c8f4fad9ff571fa7fa62780edc'
         'aedcc1f97d3e5f6ed6343332f8635e47'
         '0e2ac0bc28deeab3fb3d43d7823fe17c'
         '7f841b859d0e4c08e83b643a018fe378'
         '91adb8b0552aac1f3b4e9d73250d89ce'
         '85dcfc18fc75bbff9ec65d0befa59570'
         '8060287ce33e111ed8431b8310e682ff'
         '306241dde2d7db32a9e5b8c5b5779f35'
         '7b1ea6612133c3de9ecd558bf6caea1f'
         'cc1c1fb06c7147e801f72a2a162ebcc6'
         '2630711bf1ec31665b89d78792294b2e'
         '119754be2db9db6d94ac8cfce7d263ce'
         '485dae3105ee3d048422b98fdf5b9788'
         '3a8a21a815bf35e8b7b8d5e18ad106f0'
         '084bad1ed4a9e96f4da9ced09a9611e6'
         '11377f296924c7a0d50328e19f8bcf5c'
         'c98c6dd30fd1462f50926b72f2cb11a6'
         'ba8347a9633e79b35fe04a91ac22d051'
         '546990f74cd6debebd1a2ef635587968'
         '232a0c52ce9e205d628338db21e7e956'
         'e39945b7618c49968dcc38393bb888da'
         'fdaed7cd5b50ee2a9c8a8f89ea820b31'
         'ab1e5bd31aa62e53af58d136e7ac32ff'
         'c72f0b7c2c2a544dc37f3fdbfd81071a'
         '27cf5429d7b2e9e1aaaba4afae75b7ec'
         'dd1fdaf4a5f799972e1d2834881441ad'
         '38844619b3344fd491f9c560e8a78ce7'
         '3aebc5aa018875bc8b36d27d3376a4fe'
         'bca8ed9b613b2435c2d29a23085b4ff7'
         'f4f301b697fb9aa83532ed19728116ab'
         '1606be47a22800167189a14b58a9c856'
         '62a243e6102f86a27bcc5757bf1ea75b'
         'a772d3ed1c284004dad36bc25ef27d8f'
         'cf3e05de0373eba82df778ffb698210d'
         '2a4eefd17593252ce92f03a5a5660025'
         '53edd783d784db9427afa4a550564cde'
         '933879269298301d5087e5c1811c9d04'
         '66b8949d1cdfce5f7ef953307a87dee2'
         'a66ce3b012ca66c4231f6f76b193c8a4'
         '04acdef91028b51870662cd90a6d6620'
         '2234d1618f439b00dfecedf4550fb6c9'
         'b63dd2a7fddb479284256aa06bbaee7e'
         '8adbe1244c718a5078e5ededf5a2c89d'
         '32296c26b04d183a551f10345ab6251e'
         'fb69bf94860416402f6ce5ba9cf3d4db'
         'a5813fd8038fe610c77ba815d76ec1ce'
         'a8f3f886c6a10481af8e7f1d32472d06'
         'fe8c677bff495ab3332d38a4c9f33022'
         '9d04644acf8732c951547fa659ee31d1'
         '311afa33ee7277be351680224cfd512a'
         '3d0e59ec171ff498c9526955cf49b3fe'
         '3490f40221f3ce4d5776d7e9b20bb5d3'
         '867aedaa0729f8d76e1d78ca6d1edc94'
         '56deba553dda3ae53bf79639fea2b7a9'
         '38bad4a2d119c1ec0295294ab9e4219d'
         'f9492fe91fab673d11312e4dc59ce040'
         '802b6ededb1c663c74e06542229f0a1a'
         '1b711dd3f07e09c386dde9505e20daef'
         '76916b26fd162597fca8641bc53560ea'
         'e44b4a6be155d0096d35ff5349f494c2'
         '3d059700527157545d6c9d09ec6a5f32'
         'f0b380149a01e7f53b5d3c6d67407c01'
         'c474af0274ae7a5f873b46cac39fabc4'
         '8d3749b43982967084da41e8089204ff'
         'efa682bdec3076099857fca9f7e9978d'
         '064c685a25db94c1598b45660a8a218c'
         '0c76630551dacec78cc82a4fedb0d737'
         '2b1963dbb1c26431935b1538b85cd989'
         '0f48a7de2c31bef909c784de346bf83e'
         '6fbab295131fd654f40df83133d9b922'
         '76d7825ff5f366360339c02052fa8193'
         '34d044ea39e5318c51bafd5b573f291a'
         '51efb556e9c7f898217d22605205a5b4'
         'e719a2c59f3e19250c29daefe2ed6396'
         '9d8b51bcd6272fd6b7e948235991420f'
         'cc2f4549b049c02cf9646cee1de68b32')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
