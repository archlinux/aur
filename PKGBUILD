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
pkgver=96.0b8
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

md5sums=('bc9087d04c4a136096313fa470db00e0'
         'c8b830b42fb191ca7b3dcb19c31fdeb3'
         '38d165679b2a5151b72f3176a81d5902'
         '46771db968311b39b57f050f40447555'
         '6631abf5b62c37f1a5190810269e1310'
         '8d8ad4207ad5b9438b55d68f02b06853'
         'afe925f5a9e00b8865c54ad211f99662'
         'eaadd05528468902227233e58bf9130b'
         '5f98bdbfe32a81c584331b1f57a1b1ae'
         'cf9744049be93242d12a063bdfd36b25'
         '6f30bf0ee8ea1816349c3221bc265949'
         'da1d51ad42cbec9fc97a0ccfb770c5bb'
         '86b19e603772d53c1e44877b8932ffd9'
         '6a7094000d85e8dba405e6c7b6c5a7b9'
         'c2e3bc98846f7fba5bd9b58c4113af49'
         '1468d42d73d2257fa8eb7896e371a4ae'
         'a6424634d494282358fcbc29871e5062'
         '59a35c77c68e54a1b75597a54a06c59b'
         '4c94501078d16dbc992dd79d20c100f4'
         'd571898cb247ed39c798a80a16d5bdfd'
         'bc9ed11e579356b21eb5ed37cca36d36'
         '7c41c72a7921eaa2ed942f9b7d2fc80a'
         'd27fd907f25c8c095a4c0cc5f7b8f0f2'
         '16d329730db52698c7afc84f54cdcdf6'
         '2bdd12c26fa494866c7908e87e5405b7'
         'ab6bbe5f615914ffd99fa1f01727b4c3'
         '8216eaa11384837adf90ac7e70b5f697'
         '378060704b7efe6a25d843fdc3cb1759'
         '71d2571a2fa3599c14f16ca9dea866aa'
         'bb14285a497139e23d3edb0956b75b3e'
         'aaa9140d3c94eb6023153f193efb27df'
         'cf5ca680631c3a27352290e8eb9b5b03'
         '538c3108550208789bb3289ceaae1db9'
         'b110e6eff9ecd7d03baa94d3f43ec5d0'
         '39d712140412eec8f3a7f33f7f4df2ad'
         'c68ae577fe29608b5bd6295f76b0ddf8'
         '17f9226c4d3c73c142ce972ae84b8940'
         '10fe9da01b1880bfd2cfc1714a25bcea'
         '0e2f5587e63e3a2780b24b1466367af7'
         '39831104ec1be159329ee065f8f71f85'
         '60ef111b0dfd7f0c884d012a059f9a38'
         '30ff488b0ea0aa7555ba4927af6430f3'
         '2e315d093360e0960fff0e2cc8f67902'
         '709db7bdc19955a3d5b7b3d7eb9fe265'
         'e1f207a6c6b1ef924d6d5e7dea98b10f'
         '94cc94068f6e16ea8aec9543b35bd700'
         'd5db033e37a04fe17285ae7a493e1c72'
         'a8fd996d5e85b4af208a5cd0a1fb77dd'
         '8a849889e508307040a45d9083706c9b'
         'b70041268a5e51cc1209e343bff9b4bf'
         'ece263e5a56006757f1d8c2e0380c7df'
         '0a8140044245c87d409ff659ff69bea8'
         '8451bc6c5379dda71bdae70a75de9345'
         'befd2cf50b6e62e55d12e72047011ff5'
         '036d10da462f253cc882d17b8b69ba8b'
         '529e8ba3bf926dca72c25061bf8bbba7'
         '5dcb0be99217a48c633ee2362dac1205'
         '33101cc43d37cbf0fd99c2292f6d3154'
         '4fb0f4bd35fe3f2a6fca78b5eb9c705b'
         '37a5587fd637b5a525ff5c62b393d6f6'
         'de58c3ee85945bd12e5d2283a3a99957'
         '135875d43ebe28fc389109bfa3b40edd'
         'df6b0296d33e635f51446268603b035f'
         '69914686d544d31a59f187587fa7ef3b'
         '49cb79ecee70994a85dd9bafad941bc1'
         '42a98532143e26b70284e5f156d9d643'
         'f4f65fc72f69b86fe4870a99d547c011'
         '0c7ddbe77daaca8917432e82069a244e'
         '82ab5382eb9698f9c9a5d1df9bb7f64d'
         '7ce485ae6dcad5da0cc0b047720f9602'
         '300933d0fa9a5096c43d9eddd95bdb5e'
         '665d87a71046359a3820919d7b6ffc85'
         '1a2d6f5556e33c4fbccc439e07d21c19'
         '06c69e29f20cbc5cdd58c8bee8fbdb0b'
         '1ea532b127b1c4799a3519e965318fe7'
         '515a8b473e3c6b468305d382c258b61b'
         '8cc24973cc44a12ea36043ab4d6ce8e2'
         '610d2798509f6720ad0dd30f62c21d57'
         '348787fbd3f686a97124e184b1a1f5fa'
         '53bd131ecc5eece762c6831d7c771308'
         'c6993c098cb8378121ce592b9b0e529a'
         '3a6c4a6bc9fe5bc9ecb65af9f8098ff9'
         '23e932fefd5ec87ea17c5d7763546f76'
         'f1d83008f78e7ded86f4c4173fa63331'
         '304dfbe41370155b521d0e9586719b36'
         '5cae9c2c0b73715780373ee339e4747b'
         '5a0962a3ee715ce32931e4f0f08bd185'
         'feabca9f17d8c2169308c7a49a1b3c12'
         '06e28e4d510ec9fc454598c9e1a4ce69'
         'bec4cc35e973fe6acb584881880adc17'
         '352d6e079b0c19c42fc601d7d90b6704'
         '053c2147eec93053959b763dd78a7e08'
         'a664330323e6f6f4f1ca1d10f1db1179'
         '5e6a1179436c57faf6965f1f5d6b0a6f'
         'f812cd1234095f3afd83c9146e8acc9f'
         '9a9de4052fe736642a9a7b77a2f8abbc')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
