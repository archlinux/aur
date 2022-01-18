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
pkgver=97.0b5
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
  _url=https://archive.mozilla.org/pub/firefox/candidates/97.0b5-candidates/build1/linux-x86_64/xpi
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

md5sums=('bf4ab6b641222c725428ecb583933649'
         'b3a14b299f7283bd6f3a42a824a4ff09'
         'eedcf73cfff7f3be9b8a2f2828df1fa6'
         'e74d49f414a48ddd2be3ea5be5349d94'
         'eb5924adb89e7a8e60ce7dd8a820f852'
         'c10f5377b011e2cb0d106ddbb28a27e2'
         '32e49e6adf752d5e6cbda1c8d6573e82'
         '27c9eb01862a938c952f50286d90f056'
         '907a601ee7945fa45464f27d75f65cbb'
         'dcf06dc8217aa67484aa27f45a89be18'
         '995dfa73bed50cc0fb6299c088493db0'
         '732287c081b50dce1972086f8eb2e4b8'
         'b5ceeb1200b433882cdc3872ade5b1b9'
         'a4287fdcbd6b4ef3496a44d86b35bd8a'
         'bf6ca13fa702627d858c91d8d755e70b'
         '37b28abcecf5dc1c91415fb96c505497'
         'eb934c5016656c263f463d1bb612f43d'
         'ab3cf4457b435d55c1901df9f4a1dbcf'
         'b53f4d01c0fd4f00f0e14d59cca4054d'
         'b0441cdce81c9fa96e5d9b1489ba3e8d'
         '49dbc43de08c98d442be5c3c6b614976'
         '9d9bcabf62148bd6299f10d68524a7b2'
         '5cd36e6fa93a202d1017afb65967b5c9'
         '88a25a4ad511ed272355b20ce0aaa67c'
         'dbcb2739864752fbf7f530fccf0d6108'
         '903fafa3bab8538315987cb27cd77aae'
         'aa6843491a67f25d17e1af31c5452644'
         'f7e9c2af21e1a2bdf1824a199354bc6d'
         '0986046b896491d48ceba64f6237a6b8'
         'd3650a20e83550f57de835132d3e0a55'
         '2a22117105c085bca9a4e2439f676a0b'
         '070bbb2d08d1a75e95c000b5a47ea452'
         '8804b94d278b51554c2cd1e67e4d6507'
         'e86c889e8e2dc39eb282f3077faf00e4'
         '20b92b92757b1ff87561c63fc80383ad'
         'dcb2bf359b64d529df60189555e97032'
         'a0bdc4811dbecda2f9afc9a06d683514'
         '09173ffe339d89a33b0b45c167a2fe6a'
         '5197a19b00e91460a84c226f5dacf93d'
         '94f6e0e63560239e5ac2c38c5fdf2f8d'
         '6fbd9b88364a1a12df80ed41ff6318d9'
         'c339bf31ad7342f61247b65a525d1683'
         'e796f467be5e3bfc9064792191ea7148'
         'bad316e410ddebdd8a45692b16ed845e'
         '8de4c2cd5663c1d3207b9ea56a5547b1'
         '6528be6b9e2c2b9f77d68a3ed01a4f00'
         '88f5a8ebe7879537cf0eeaca7cd98dcd'
         '310c724d7324a2d629392099bc5cdfff'
         'a886bb8ba862f7fb518dda4fc8ae7469'
         '839bfd27f2985477ed04c6f25e542506'
         'a17b89a60858d4d5fddda1df09a32a00'
         'e2be6ca5c393d216f3ac474b39061ed2'
         '030fb368761e36806aeb41ba6744dac9'
         '63f76fe9d512cd570eb22a3191bc00d9'
         '0b145949340f4d3af965380cc03986e9'
         'fa8509a1bc7d49961f9f727359b6c494'
         '69f057294af57b5bd9ee179406ea732d'
         '3db5ba581d9b3c8785736d7a50b50c9a'
         '6a89febe6d36b803916fc4920fbff6d7'
         '022d88894caf4dd614168038985988d9'
         '1bfc71ab30987601f9cc5026a068f252'
         '1948ba47fabfdf5428fb5145dac966c2'
         '4710179c2af3dbe7be09d489d33980e3'
         '2f7925e4e4c2183226635f49e1978a8e'
         '2e463d23a3c9206f6a399f16cfbae588'
         'dfc5c6ff2a777c20f06988519d96e69f'
         'd40e409b31dadb00a9371f2e6a752e71'
         'd5778f9150ac62dfc3659d3c90a0e27e'
         'd93653531d8557e289af9d15ff3a49aa'
         'a18661798b5d6f95cb7a4e810e55453d'
         '5ea56adc1101f2c08a2f19c5e4f6f993'
         'f0757b442aa71887873580f15d1d7219'
         '92656277f985bd5784058592b03faf77'
         'c9327e0644f84d5c56a919403ab8c135'
         '346ff1a552f551f226c41efd62e0dff2'
         '5992418478130974f202c799395c3380'
         '92f57b9dbdb1ac1b0827974925784321'
         '6a5e8ad893d625fa92893ec0b0a8b6bb'
         '9c154531e3164fe2b13a463a228645cb'
         '177b9fb7ab1905f93a81d1ae87f41fa8'
         'a69e6519f6027373c9a77de4fb691a9c'
         '7bfb8e3bcca72af4ce32b77bf8c2a313'
         'd01ab2ea934518545354e83cfa2991bf'
         '553dd321961916752b338f492eebdc2a'
         '159d1067ddfde3e5f0c8e6a5debfc16b'
         'c39cadc1e060a63e5df8d164014c07fd'
         '46542e0a7aad141e88988711ba0e88b5'
         '36bdf4501de20e98059a6f673663046b'
         '5974af5447849d957d055910f16bbb2f'
         '26ede97976be49ca6dbdc5361cd299ad'
         '82b7d94c0db18693851a2cbec99ca236'
         '7fc59eae87221bc83bd0d9d9114ea87d'
         '499f91bb8872a5d7923537df350b3a6b'
         '60e98497897b776ccc95a79583e0cc95'
         '67415d92333bffa1f65fb910490435de'
         '3950581aa943415c60762d15a36bc5a7')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
