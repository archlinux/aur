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
pkgver=99.0rc1
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
  _url=https://archive.mozilla.org/pub/firefox/releases/99.0b8/linux-x86_64/xpi
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

md5sums=('1a086ec352f30a988b185068258a1b23'
         'ea786858a09d0a576820043f8c017b66'
         'cdc233dfc5d79c7d06c123ce23c365d1'
         '1b61d0907de4e6b7c29a3dfd19ab7e26'
         'e8da0cfa02f0d75c733f9dd9ebc8d595'
         'c461173a1160c90b60547166865ede87'
         'f9c768e18570312d6781564eba46110b'
         'f957012f2c0d2f76d067f61226158382'
         '352933b1f94a047038e2eee9034f4d07'
         '556a43744675912b05f31da8cde36c4c'
         '06546b7cab7186b1cd869ea1bfb96f1c'
         '12903b63e2066c9638e1ced1147eb485'
         '650cd5f8131688fcf460122cdbf6d590'
         'edd2ce736f6c3fbc1624dd64fce6310d'
         'b1a148939e2be4ce06259894ef185629'
         '96c4ae40e95a2c8067de09e78152f29c'
         '8289537737429a71b6090b2a88a250dd'
         '5647481108dd409dbcd45507f0fb4e32'
         '5372dc7b66f9d2d1173280aa25a02866'
         'b7dff82124fe08c735a9683818c1798c'
         '32076362e0069e2b39a6dc61a9f100dc'
         '43456b9fb55c54179026e27e91eaecd6'
         '1788bc340088ca5ffd212eabfcbbb017'
         '382cff989da18510d761211b35cdcfe2'
         '52760d9c9321230baa1c8ba67f25b43c'
         'fa283ce5699e985f21925ce93abb887c'
         '8174549758f3b6a62640ceb1dc26ee07'
         '8482749ad6ec41b26cc94006b66a5939'
         '82adb8a5faa003c0993255647acda5bd'
         'a5a196b5248f746c3a906a004aee062a'
         'a5330dd1dd72290955a3447d049c8cec'
         '84f3d4fbc02ef0ef34e05867669f0186'
         'a0ab03e75a4193373fa4e7b43d68be4a'
         'b2712d83881de218ae9ba2fda00e077c'
         '6b2d70ef82516b5b4f7170f6668239f9'
         '916791428ff2d5bcd4199e701a6c9ebc'
         '28c7849f6a1ec92131d99bbfc597ae9e'
         '94717eaf847f54f172c39b101401583f'
         '5d63ce2c594d26edd7f7a59c159e9c37'
         '3c7a920cf63d20b66f0bd886ea9908d2'
         'a6f9ea44df417e1efbecba0b2f2f92d1'
         '03b4989656b92d053a9b2d9d0e11ce92'
         '80d7de01b668e1239286811978ec7862'
         '46405da50cb6ec7edf0b9b83c810685e'
         '1413f8f4453cff0f0be6d8504c4463a5'
         '02403964b6850145fdf09f1a3371a62f'
         '0177e68663932b99b6e60f3db0ad89fa'
         'a6402a7ee3a429b4b4007bb5bc2c390f'
         '26985ff757677c496a5529e96176f48f'
         '1607e4b6ae1cb6ad7eee832cfea57d3a'
         '0d75ed24c7cee79352039ff86cd71da6'
         '83d50f315843170b01e8c6ee01014d55'
         '26f988efac708545455e2d4436f6a059'
         '214bbb8b736cfc8c9cf0bba2d6cc93b0'
         '306e0bb575ab766a8955fabeefdf527e'
         '788e3531b4ceee83da47d384456f962d'
         'ad6c6c47e30ba353f78a6f07acf3488a'
         '8bf8f78e3311dfb26caa482841be8d3a'
         '6c80233db2c0eda22063116f58b4bdbe'
         '1b43d280f47d4098acfdc6129fe34147'
         '433f61c283f5c4754407bc9db3ea26fa'
         '77b1f594024c86c432e8f500f291af5c'
         '6ea2d9cd731635bc5a872e06b08113d8'
         '2fea4890d138ad9734ee5897d6046ef5'
         '33d25440244f81fb34ed0ddbcf08cbc2'
         '248e14741dcebdee7627449e4ee8b9fe'
         '7e8010f94316494b16e00745da73d83b'
         '444719f9bb1911811b7d837fe5077b53'
         '75027d8344dc68f88348d96c8032788e'
         '4baf12f18989b556edba22e1b630e8b1'
         'd40d6b5eddfb78d520189fbcccc2de04'
         'c46176e9a89a3699b99e593bf2f5fcb8'
         '100f904b4273487da3e130ef0a421bbe'
         'af778ea9244f26b67c1720fc93352cf0'
         'f5c9f1117b6d5d52203389636c0f99f5'
         '6203de3e2faab16df9e5dc0c9f3ca04f'
         '5b1283db83c16d0758382628cb2000e0'
         '27585a1ee6b3c7ab5e32ecc1af7f2cf0'
         '88a17ddd4dba93dc1875aa5d2211a327'
         '85d6f5cb3f7b5b9a50c1fe7620bd14a0'
         '1ada6ad1e81d539df2eba81c923ecaa7'
         '0fa7bf58814508d9c0b2df993081c63d'
         '2bf04b0280adb117ecb494083c86bc3a'
         '8e78aa4134795fa2928890af680f0c6c'
         'b12ae5f326ddc336372a2041a48a3124'
         'afdf2788a6a5a9bb4674b285e84991b9'
         'bf195e3068262fdebd0279a5d27627f0'
         '8fdb9ecb44ccfb85e89d9e1afefb9baa'
         'd319772cffe502c541a2b339781b4ba0'
         'f26d4e1923065f7da184f409524bc7c9'
         'bdf5ed57ddba761bb702542f25fdac6d'
         '669f649d00ed1eab2b2eb9acc3bb0d61'
         '5b9fb9f2c617a968f12ddf7352161375'
         'f8e5564772b9a7dc3e20fac19bfa420f'
         '502f1fb1ad5fbbcc3ad475525d6df74c'
         '6b1112432380ae059dfe23e4a1432934')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
