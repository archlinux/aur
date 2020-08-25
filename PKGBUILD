# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0b1
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

md5sums=('98dffe1657c8b772bf075bededab3237'
         'cca2b3f254e98eea086460faa31da8ba'
         'b45822c6384caffaf5db0d7a38bd980a'
         '20195a09509fb84757728374c6b9c669'
         '4960b011c81e453237553be6eb279998'
         '99d64dcbe3465ef760d36bb210f0b89b'
         '7935208134e9478d899d6bb10fd5725a'
         '83939e593f771aae1c36a7308559d88a'
         '99ce740287bb8e329026c12e05fb3c8c'
         '01aeee253098ebc60ebe2cc5c52ff1fd'
         '18ec8d3c0354e769bf0197da39b02c6f'
         '3a0ebdf4fd4e10613ecb67942dd2b44a'
         'f71b129b90ba8b9e6e0adf0d2f2cec42'
         '8fee8d28efba28945321e097eb25fb0e'
         'eaa213cbaa8eefc45b3a05c00cc116da'
         '5b7ca2c5eb9304c5c38e159735056ed9'
         '5891a6d000b43b14f4c29033c882f265'
         '948b86ca3f89ea7ce65fb696c4afd463'
         '880a0b33e07e256b42eaf502a5fcd853'
         '2b9e30fec1879b34747da1f261b90ece'
         '3125bf9328b29074a5f778b16680ea44'
         'd2034e2f5c515afed1c2acba4ebbec68'
         '1166b18a33da6784b84ca05aab7829f8'
         '5b49badc83d43cae2549c680f5770d45'
         '38364a0d43efd79403c52db72c8df125'
         '8e4030defc3d6d3a92839ce788bca283'
         '2da12e99406d0b9fe1590c7b1477bcaa'
         '757310046a7d21f257afe9ce19c81ec1'
         'e6f36f076167c23daa3278bbb9609f9a'
         '83645c6d22d584a5b7a3fc8a10b39035'
         'a0796a82dfdfa3c4e47dc7d401f1d5e1'
         '797233cc6632eb1cffc429d154a5b40f'
         '221654d852f6ae44c4a0f8b3388c84bc'
         '08c6775f4d97c500e325b19fccf5617a'
         '342b7761d914cf277f19b5244c82959b'
         '7e45af72c3c2ed4a50eac45bf655d904'
         '82049a59f13267d84c5afda2d04bc5d3'
         '3c79704b75f979c762708ebc681e9613'
         'a18cc61508448eb7ec5167587715aa1a'
         'd201fec3cabe5a71bc69d621ef87987b'
         'a8480a982adcd627a150d4791da6daa2'
         '62372e118b64112fbbf6d73a0a00ef24'
         '3122bacde60db6fd3190d639f7b3cc17'
         '46c36608536d187cf85d23c070d1a3f3'
         '242c431fb93a882ee2ee5ec334cfcbf5'
         '6c3199112221bd0066979543984d0ed4'
         'efc42af3cc77b755659b4c7df7708314'
         '37d02534abf8b9734fc6872ca264ccfa'
         'd855a541296985aad37d03039627626e'
         '9db5e77d2808373cd8f1539a5c91452c'
         '61fc85eef0080886eedb9e7cce1170e0'
         '6d982da39c75732020904dbafb893170'
         '2c3ffa5ff8629670f549cbccd6dcf781'
         '19dffe63eac223ed9520f67dc6ae813f'
         'a0d5678eb080b9ad80c6557d53404fbf'
         'f1d0c6bbf1b540dcde7805200dcb4e99'
         '540b6acb02b58e1a914c233d8fcf0345'
         '56621fb40f10dac89403c417d5f0925e'
         '95680f3bf7f6da5d7da71dc67a15049a'
         'ba2db52f268fef724a68aa8accc07c0f'
         'eae885d9c9a61b090ed3912a357822de'
         '69734b669d92c5993484ddb249b2325c'
         '6633d1c39fe97db0efd18537fdcfe302'
         '018eecff0bd7b112dcc6d68c35debae8'
         'd661e00303995c9bf02f9807eed100f6'
         'd43e5d7d1ad145572902bdcf087f3445'
         'ed97544a686e9f771d2472e8766f7dba'
         'e367cf0e0268328fee583ff88715fe7e'
         '66c83ff2d18424b55fde98195f1fe11f'
         'b04978a8ad94a582685edfd2cb35c202'
         '7f7b400876a58ec7a99f73c263a3cc8a'
         'ef2c7f85198bc35263957b85c461b7de'
         'ab69b7faf5dec6ab7c9cb71362499033'
         '7b99d5812d02bcaf9166b97b2bef970e'
         'f730faca5970d65671cb882f676a6a80'
         'a2eb666f064dc3403c1145ada8ef055c'
         '28a726757b8489efd06428887aea2b69'
         '5a5a0ea3fba5b8a391e145030eb50229'
         'e84a6c7261bc5d05e850e08e8b2e65e7'
         'd5ee4374ba5811e95d1337ff58d5c34c'
         'ff95b61a55499d2c9b57769728cd2185'
         'ae63155fe2e06683cf51daab924bd3ff'
         '7bba07c0f3346d1e65882206ff9baf0e'
         '1c95f06cc70339b97134339698c4d2e2'
         '31588c6209321e0b95d795d97fd2331a'
         'a3ce3a782d000302c686436b1e2efccd'
         '301d6e5cd6404df424b448a113ce4f32'
         '67fdbbce89823ef0a53ce04d8416006e'
         '319ca4461570d071130d9ed00055bb60'
         'aa0b9bd7216a518b9432efc3c91a5d3e'
         'cc567767bc341e6c4a2e28715f9105f8'
         '9d9631afc4b3e06efe23fffd6f781b2e'
         'b3b60458cfed97b718ffade2418f272d'
         'ecacf273ba2a838f5f6c89e9c08d2e51'
         '4f478d7822b8eb37eb5634f86bd3d55d'
         '2c1e0a2295f90b7c975dcf6dc4575ccb')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
