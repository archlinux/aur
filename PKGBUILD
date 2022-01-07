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
pkgver=96.0rc2
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

md5sums=('16b96aad1b0cf6eec2366c0ad9a5cea5'
         'fc68a53e66cbeeea8fe40af1177845ae'
         '9991e46cdf2ef5a26bd66c73479b19e6'
         '7ab668da49ecf5e4abe9f00c69ce0eb3'
         '896e5c4e7d6efda152eb4deb394eaf79'
         'ec54d0eb2d05d0e72cc97c294e22f383'
         '6bc6d0b8b3fd427260b452b605bbe02b'
         'bac29b7bff6d724d952e5019491f6d9b'
         'd0166e93290262fd03f36e0faea6c3d6'
         '849533c39ee8299cbcd75def6a09be4b'
         '651b4f463eb794a2707c4abdc49d02eb'
         'e62b78ade5ef89b9269854bec14bfa97'
         'e7e89a245b288e05cec421def67cbbcd'
         'a984c4ac6f64bb17bbb55d03eb6784d8'
         'dd1f43589344e73053574b10510fa190'
         '81c073adda9333d2ee39066bbd4cca8a'
         '5e480d75db200b6a7a978677ec800f61'
         '4115c38b16e482d56f0d267f3cdc20b2'
         '35f1ba7e5c45e0499e7a6442123cb257'
         '7c47a5ad662244b58490f60e7bcee1ff'
         'cb70369f663534b08276917be78ac402'
         'e34b169ca8b9fa691cd05411bb621e52'
         '741b348f59c41673e8e767fc7e50e5f2'
         'e73470f21ff56d43265d2329d8f3d544'
         'f800fa7d9c34d4e7df7d258c0f1c0fe4'
         'd55d69880b9f784c17413efe42a4e54a'
         '7b2c8835a29c6c282713d44c2775e6c5'
         'd28b1be2d864568e4bf3d9e52aa6bbd9'
         'd144e143138f8dfe3ef1dcbbf458e3ec'
         '61c968fdfd6c3d71f097908f814fd9c1'
         '4b89bb85d3e0d3ac3b9697d9d271874f'
         '031cf85150c330f6b4bd18dbdf9d1d92'
         'b36ba65e435e13785c2aea1b35c8d9e2'
         '383efc8b71918b3898f90c9231a742a3'
         '382e4223a637ccdfa41051f088110617'
         'a60e1ef3916e17c2f5c30817cdedb9d7'
         'c5a6c453a2bfc1d9d2cf94d710ee9ff4'
         'f5c042525e145f05a83f5c7cb660c6e5'
         '194c55d9a05b09dcc202605c6d7825a6'
         '06dfd11bbbbe1d3d862db9b03f2cc740'
         'a3e2eeeede655bbd5e609a5bd06de07a'
         '763f856bc7167b22f7daf6e6f89becb2'
         '31ed51702dfed23f70ae014dc899c1dd'
         '448111d62cf6f63aafe1e7c5f25ab644'
         '867061bc8defdc9c9cd8ced96e25789c'
         '5fc9a507452076b29c0e45373869a6a2'
         '5300c4f6186a0242482a1d86e9dfb2d0'
         'd5ac673bd564e0fd0a78f8d50aafd979'
         'c9b58e50cccbaa6e6ed33e43e1e67adc'
         'cd83ec8c2d01cecba633cf2a1c30dd04'
         'e81e0d396e05ee4c1396199ee5b99fc7'
         '881cfa34176e0fc26dd458c985633486'
         'b122ed441d1009d3d9278ce9b08ddeb9'
         'e02ffbafe80c87dbd434ae8af93a59c5'
         'b2ca7c05283f4c96fa08c0f9b1f53445'
         '12a132e739645efed7c6e1af86f0542a'
         'd94748bae6caee0b0269d8f3f84ffdd4'
         '805dd5693d246c54e629435602f3b040'
         'ff0842433076856f25894d5912955bfd'
         '82531a88ddd3ebd396d5fed1604d22fa'
         '6967a0089eec5db56478be65e67e71bd'
         '7c07e463a159743d4b85f7ddca7927eb'
         'f34351f7712e2dafe233fb6f561d3c36'
         '66ee6157ce5f5aa450a370c610ae408c'
         'f798ca9a95b538a4fed22881e2a2965b'
         '7b71443d3770f4aa32632d9666f4947b'
         '1155b1822be9190fbcff5059bcd08385'
         '801c15adf3d1c0e3adcfca5592b94cec'
         'e41df040ddda92d5ec08fbf877b05c95'
         '9190c68be4271a78d27fcfbb7b0103be'
         '76557b298a24d7d9c25947ec0b3ede43'
         '156c017deee981fb6a1da5f9c9a1647a'
         '9bc14a342262916289f546cdfd4b14d0'
         '25b1cc9fab1da9d0001a73e1beb4b6cf'
         '19badd2ed4f20ad3c87141fa4bec8662'
         'f94af1959ed55785ed2642fedc7c31f6'
         '3e5fb932574202183bfe1645a86025e5'
         'd2bb8b3f4b76852f16e3520673f71681'
         'a624ecad149b0521c891d4d6e6c3c940'
         '6ec07a0225a40eaa85c2b49d0358d81c'
         '5a9d77c07fc5ae50ccfb912087c7643e'
         'fce87951d498acd89eece2bda9182ec7'
         '5ac7c362b3958a4e5af98208eeaf6eda'
         '957b8437122dafd277f611b36bb5b38f'
         '8e915badfcc3557e82183808a21c7a97'
         'cf2eec17832dc77a2453572edc51a9be'
         '7982a20515298f6a60923585cfe3805b'
         '278cc58a111d1018cb9b3531e3148ee3'
         '448a348619b2713f697e0264fefc3170'
         'ba622ef373a66b4d95a3d4a6f1d078e3'
         '92082555ac6a2cdf3b5a31eae27fbebe'
         'bd1584d737cd1b145c0c8f446f7c876f'
         'd1874ad42ae499bfdf71d2e585606781'
         '12c24d5245ec021ef54613253b8511b9'
         'ea5dfd10fcbd5ce5a851e46f66006b6c'
         'b3d1ba63b3df335ee449252cd13dc0be')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
