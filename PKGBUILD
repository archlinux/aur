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
pkgver=100.0rc2
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
  _url=https://archive.mozilla.org/pub/firefox/releases/100.0b9/linux-x86_64/xpi
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

md5sums=('747c98d35984a72fd9f6e7f3bf24e8c8'
         '6d864deef2e9b13c9cb659a0ed259d9c'
         'a5bfeb4be96c020055ce286a3332d11b'
         '49ed01f525d2bad8cbe69c531619bff3'
         '4b3f220f927f6859bb324a24278d82ff'
         'a4ef6d4323ffef2a80cebc2d2562484b'
         'a6edeb2b54b23018caf86d2bd4b8bd5a'
         'f9b74c1dc2e349c8b7e4ba86bdb00e18'
         '25b47d8c828e325aadf1b879fa83a569'
         '7bc75625030b04939766374851cfe569'
         'c24fe206381380b3a3584b017215b0cc'
         'e2db60c8916b3b533b08951a157472c0'
         '0e1df4dd7e54c2176dedcec047a13011'
         '5678af4b8bb95511de110a7dc36c1304'
         '6e90c678cf598cd320042f29b0f54d6b'
         '3b3617f3bb2802a6903ce1ec0a4ec89c'
         '2b718d9078854125a67a3cd6163d743a'
         '17a9f19be0255d1a2b5043c84486d013'
         '2ee0391560781f3df76c01a1b12a253a'
         'a80ce6b71ababcd236487d9e6ec50610'
         '06e799102677b432fb9ed6af36ab3286'
         '399bf13d18b82f48cc2037d5b7c41368'
         '7c196d0c9b5ebbf23f47b33596a0b4ac'
         '6f16ca089804731db08def0d089cc759'
         '70ec623cd9326f2f218ca2369ff69ca0'
         '10e97711162818a2a113e9ae1aafddf4'
         '0186b7e5e1ceece7f32327505b419d76'
         '0acf71e783f38b1256c0cac0e4e7878a'
         '8abd3d4aeebaff8bda1296634ebb7095'
         'da09a15b525a3cf5bf9a75f84c10603a'
         '856b78fb46f2795f5748667baa6156fe'
         '68d6a06941ad115683bf11e4a839ead9'
         '72aa7d7b8816ccf2a1e91fde8a7a8136'
         '40b43070beede5a00684d80b763c05e5'
         'a910005b61642b1c886fb68d44e7bfac'
         '084ee05908c0498b2b6cef1aa68df3e1'
         '5529c7b4d177a45818fed0f26055023f'
         '6c378ed918abd84ec4a708cf0eba803c'
         '98c1a2565edc2ab2db47b35768d27f48'
         '768774385f8a34f7ad2bc1880ba4da4c'
         '9d5ab7bebbe48d3395562df39ee1baba'
         '1099a0ec1f6266fa07aba02941e8d6d8'
         '5f1cb2587b782827d7fc945201703336'
         '88c13b59be9c1cafd01e10acac465528'
         '8ca4811614c4b0cf0e20a12bbb3e8885'
         '9abe6850667c8e86ec3f0ae5022f34a4'
         'b86789ce7861a24f57412d75b1a2a57a'
         '3d12247ae1f670c9157eaecccd102d84'
         'b793889886b9af8db019ce884ca99b10'
         'af98c077e19aedb359b68b03669134c4'
         'b5be5fe238d12bcea21194953117bd8a'
         '0550998738475ca83d841cf78b6dfaa8'
         '3e4c1f6f46dce52613fd9fcd61e5e201'
         '442b06fec1b8c0b67b106812d122d8fb'
         '9a076f7f119ff80156ab59b9a6fbcfca'
         '1b80558808a3e572e4700bb99cb36c78'
         '8046837216b2422fd3920d9f5d981180'
         '1403f5ed99a8c09cfe48205d2ce06c1d'
         '5939c62e71b3e2357a7543a6fa82e8d8'
         'dedbdd3d3f60f8b2f5a2176b6c3ecd0b'
         '9b775fc3a2f871f74d4c3dbb3fce048a'
         '2ee4b189e85d24898c782aeabbc99b56'
         '7f6358a87699249e5a606f80c35f2e67'
         '6a96079dc71b76e65e281e6e82c3319f'
         '7726e7e17ca5f9523a6ee17297310479'
         '065b4e172b99b77a4a4569520105f0d6'
         '34f787c195efc69a2a80c8b47d8376f7'
         'a519b7004c62affb626950cb47236086'
         '0193026098f32c86d1cd09bba03eaa3d'
         'd3b243bf572b2e3fb937d36a0f9761fa'
         '27df945ca0a658d1e530aec430f22b5a'
         '93f76d0d801bd27a192036b9f9626926'
         'a4cee675e6fd108dc9db2a4e6578d56b'
         'e7cb594fcf7e6748e0eed379d574ebe1'
         '0336953af2ade329fa98057fd1736fde'
         '603ca678e8f0fda123f00e67adfa5e6d'
         '45f459ceed8457d01b30d78025461e43'
         'fdcb766ef7fe43001cd4519ae7d3e686'
         '47d0103f2cbc3132aaa4bb3f4c8020c1'
         'ba0f4d906dd773d5451ce8de02632115'
         'd8ab5bdb76dfa4e7829953ae36c83f1d'
         '83952724249b01eeeb98762121799769'
         '4a57924103d6f907f165596dfce6ebc8'
         'aa5ee4005e9b606bf708bf00f0c1cc46'
         '8f9eaad1dd6946f68b9b82b0d528c06c'
         '1fd0b997498ba8c6aa6c58858ad9aae9'
         '6d9e52f4644f2300d74cd83ea6452844'
         'a7c7a93038a6ceb2431cc04944aa2fdb'
         '9a913f47777fdc63c2e0042c9ae12f8e'
         '0ff22f79f77c01ff5f2bc52f8164994c'
         'ddd0a6e357289e1cc2667babcf4bd6ee'
         '6c868debc8126acbed26749ebf9352ba'
         '87efde3d2fa2a22f6d8cac4e6c10459e'
         'f4d4e0abb1f9bc397a1bfe0162b0e839'
         '55fc9baba403b03451506ebe294203ac'
         '766d042e396147927f0100136ddfc65b')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
