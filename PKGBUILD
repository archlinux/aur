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
pkgver=99.0b4
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
  _url=https://archive.mozilla.org/pub/firefox/releases/99.0b4/linux-x86_64/xpi
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

md5sums=('0bfab42dfca5ce6d0c5c18af1cacf28c'
         'a29dce805f27a625fffa17a191357b16'
         '17caad36bdee245af6bd59d05f831a4e'
         'd38007795e3f1d56f1768d6dde21d563'
         '6a9ff6ab225d9d243a989c531cb9d6ab'
         '8c653e9449cae99de0f2c28c3f84a6aa'
         'c061d4219cad15300847afa3f4a84f0a'
         '12ec7d847c9666f1583065569862bb22'
         'e65d7190450fbaedcee8512d58946ec5'
         'b3eab485a8d378f9328bc2adc2e7b296'
         '4fa45a47233ff0fe4efc23b1a31d0ae3'
         'de8ac5a849726d38f415393095c003c2'
         '55cf9d58dac94fafc116116e7d2da1ed'
         'bb780e5279841d098d9aa7b9e92a9808'
         'c5093b36370cc9c1bdbbce666e356eeb'
         'ff62aa9f7e5574e39bd06f1a453c24a7'
         '60ab366157a5000f0b83a2ddfe54522d'
         '16766f5061a36d6c31da1d6c004c7705'
         '8ed5a93abdda358b5b347b7019d6a1a5'
         '16725926ae16f2782552159d2cebd2d2'
         '32396c3f091091675ab0ac82016da6ce'
         'bc5e4a48a89df79fb2c7008ccfcbc78f'
         '1d28dc0f5f0f92586d115706367de23e'
         '783787aa439b1cc6c989cb58965a08f9'
         'a347ca1ec19a812624729ac5dc1f1e06'
         '29685503125653589e6e87da4c97acea'
         'd9180f0f20389db2937f75f8eb5f396a'
         '745f2d09814c76322f04957b551f5e2c'
         'c3210afd545f692db9e5bcbc4d43c1a3'
         '02a1e629be48a50a431a21d54c13ac7a'
         'a9a72bfaef728d63d476e196e91f36c6'
         '0e5158b519d30de8e597ace2083af1e5'
         'b48d107eaf2869ca98c2ab0fcf750dc1'
         '582bde7bb8e90cb5ff96b8e224255c04'
         '2cce3b25cfbfdda6746ee9184743058e'
         'f80517cdf6adce1849d7e3dae74fe0ec'
         'a7e5cb0bcdcd9e2256e73345ce64d5a6'
         '0a746ff0da956152b663b3732d423606'
         'fd50612d21b0a07106eca490764bcb97'
         '62c01e08b856c71453f81561450c9252'
         '95840514ee9ada2a6712d862eb02caf0'
         '4a592177a1908e2db8da871f596ac384'
         'b32e07c9dd0a05228a3318139df4efed'
         'd57e4d8825346d9e98a94428a0e598d5'
         '562879b82016cd5e4b4cb07c44e16481'
         '05f05d1c8103e57cfc81755dfa15d2ae'
         'ebef9ac2dabbe879552390f9503601fe'
         '353780ceecd75a891e8a1d74d264468f'
         'a4d21f7a268780cb5abada63b261fd17'
         '64aa946e0a3a026ddec4cbae2942656a'
         '31e43b331ddf457cc3d7eee818d7d9c9'
         '19cf7af7f95f5ffde669364ac9599350'
         '7630ddb7b3c20fb36dc028a33e5578f5'
         '00b7617ffa9642364be4984fcc052396'
         '38049d63b2d998910513fc104a91e51d'
         'a8d43fcbcad912589602e76315fac8b6'
         '6dd4cf0208c16f58f05e226961dcc050'
         '3c8dc4fcd834d9a4e6f749d8aa00d2e2'
         '86229c075d7b4833002c1ab10e4fddef'
         '840457e9d7de7f22c1463dfc95593156'
         'd131ac689c1135eaea8c1373d440e05f'
         '0ec82b3a14a3a5b1052fb934c9991b13'
         'a2603bbfff9bffef0f6455d4e6a8764f'
         '3222c2b4d9b41ad679a962de43942ebb'
         '6f44c037476eb74ceb15d6dea95310c5'
         '516e44f5d85946a2e138641b9834ef59'
         '7d2d18d0dc5a11e883908d46849edeb9'
         '2ef6776324cb890a694ce479f9d09878'
         '30840d54a734583ae18207d45e50a600'
         '3b62f34b80bd93d78db1f27aa008d459'
         'f052ea881baac8e92246f10b75316eaf'
         '77d84c75a980c9a9037ec09dec93167e'
         '78e7a5a652d276d436a3965294dd3ce2'
         '28061f54f206640578cd3830516ac165'
         'a5cb2e380d2237bd6eb4028d7a640ba5'
         '844a890ed9b72c792dc1f63b83408a24'
         '97f6ac6ec40e7f6e7162ce18423fdcc2'
         'd454633500c53d960eb2bf035508abd4'
         'd8a29899bb04cd54bc9050b62bd7a792'
         '8398657d72b4c57d37bc9eab6ffab33c'
         '13c03beaf4d06b73e8e08628f68e91ec'
         '5dcb39b11146979c552fcac128cb8e99'
         '4b568f0f746ec0ab81b7fe669f5800fc'
         '7c8c74275e3d7b80e888db1d4d4a1aac'
         '6179bd6c6c42d99a23da10ada8ee2638'
         'a8394e992decc10d875fa963368335d2'
         '121d2d5a9866caac319247266a0a86e9'
         'dbc14c906db8a4a8835aa11c20fe032d'
         '5a57493b2e734e3c75276b0b108c101d'
         'a883564a6a49cf2a5ee4fa1262fb180e'
         '456dd9a5f0faa661d4ac20c45c78a53b'
         'a263dfdba216624f303022eebce0e4dc'
         'a13aba5445baaddec30dec49439f08db'
         '5bdda8ea1f26dcd5f0cb32befd0cc445'
         '1acc44b972bab57c1a95a879cad4e748'
         '61417309b39e26cf92e3d9983e226091')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
