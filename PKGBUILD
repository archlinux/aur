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
pkgver=96.0b9
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

md5sums=('f0cea38f524f31d4559bf207a8d3c0d1'
         'd4246fab059fc190a661fcbe224a3d56'
         '1959de57704c44f97c6dee68413e27e1'
         'b8c6de087b5887a72d97f976d44236f6'
         '075168320f76f1ca18ee15258a8f8d46'
         'e40c1a8c79efe91da596e7ba788c583f'
         '3a141ffd42d59460b83b8bca967965f6'
         '07bdadd292a51bc26378842482cd6792'
         'a94c4e07f7f5d6112221e3b46ba280aa'
         'd465b985413511edf9afd35fd1c13e09'
         'cb42a3a0555f1fe4f2990f9497b4af9a'
         '57954ef38511c0f7763e24fc1c624812'
         '49f263a9247ad0e5fdd17155f1e50ee4'
         'a61bbc49048b645c763453a0447e5c65'
         'eed3cf74e271fb0d59bc841036fd309d'
         '05c4ca4858c62bda45d33dbbfc7600d4'
         '6b77840c1982cb6230a07297fc7585f7'
         '0c97059805d3148c2fe9a80ea94bb877'
         'a21ff723d7d38977468e81702ba5109f'
         '336c36827a2e4f15c1e485335ab8c06a'
         '39e9eeb78c55534aa0cd00a04beb982f'
         '28e1e7317aca3eabd764e388dff89785'
         'f152173d81129e23813ca70378cf1403'
         '8daceacdc62f24539db9200ddc6da24a'
         '832aef13a5f5ab2196f7b5cb16a98435'
         'bfd2f650bf102edc37cdddf492b7bfb9'
         '988e6a83439393bb8e52d578a6a60f6e'
         '96c34202e0b8c7c48ab8719d0e1cd9b9'
         'cb13a36ad480762f3e9de61f31deb6a0'
         '41533ecbdfcef132401b721c52aca8fe'
         'd5a8a26a69bc509fb0cb19182734c01f'
         '433b70cc8372e05f4c0757dec0872875'
         '481a5650d62125c92af5e857c717b9e1'
         '3b4b76ed61d56438a9823f1def1e728a'
         'd2f00264905111e584d0bd49ef006bdd'
         '35259c9bbd412464e8a9fc245549310b'
         'e0eba38b6653cd700ffecf2bc02b497d'
         '66dc32f196a4278cffff579698d268e8'
         '07ae3a1b3cf855edf926c7a54553eea3'
         'c5413d9b7148f077eed82e9a242b50fd'
         '092ba7e00942eb06a9bb0e4caa9d4221'
         'db0ad9a16264e7ad9837aa508e669305'
         '0423de69e97e7e1e9ef80ad4a2229bef'
         'f885196ee9e7871ada15349f71ba6d83'
         '81e0134354de55f96c1abd79a38014fd'
         '133bf300e63cf7e11c7fad54ddedbe56'
         '38dc400742e2b0fdcf94bc45381fdd71'
         'a0a6f349a1d7be7a376c1663de872d74'
         'dfe6ea7a21fec05e7da03c559442f26e'
         '44168387314e7c4e886ec6b2e97b2531'
         'db72de10fc16acd427bbfcb41a581ced'
         '96d120ec0e758e9a52933401484bd854'
         '57ff471b457b88c718c5a5a188fcceb9'
         'fc9ae3e6e43746ff67c085c463d984ba'
         '518afa35f3f6524de0b1a07c327a5af3'
         '1b2d6c396a919e956ed491171253aed5'
         '3f4c995ddf27f56a13454e81aea8a0b3'
         '1cece5b59d7c17dbc620e14cf310b271'
         '1939e8c3ad524260230308a15aefe600'
         'c0338a844511210550eb6dd0f8ba3a58'
         '3b46f88476596f9d9720597fd24c963f'
         '260e3da04adbe23db16a8d178ce4c61e'
         '84810098ba286fb5e6f636b3b8d1af33'
         '5c78e05a9476fca731cdb1663128c544'
         '6f98e7e2525d76fe4779b7cd23718b8c'
         '5f2276e96af1a32455b8d98a9a1c66c2'
         'a8f2aa2e6697308778192e6ca122c69d'
         'b3a95132279d4e5f29c132bc2d50a749'
         '5282719f6238eec57933983a94b25baa'
         'b7d6158be9e4ad242d76520137d2bad7'
         '5281b09567f3920611e3a309fb2f4d57'
         'aacb8ad73f08afec81d6593099f805fd'
         '8aaee7ab7ad9e0ccf11bd605175cb9dc'
         '37cb46cef321b82a255c941668fb5839'
         '39686d2337040c99d7d0c57e117bc6bd'
         'fd1229015d70f8d7b62f3b79f60e06bc'
         '71523d89d841adc6b6ab30cdf473ad34'
         '7123981aa0e2446857cbdcf2fdac5cb3'
         '5aa881d39efb461170ac4200bf8b1d1b'
         '5aa9e2a7f1c4ab0879908a96f456fb0f'
         '0860b5c214b6344eefe98b6afd7ad681'
         'a04d3f493cdfdf18ce03d1889c7128a1'
         'f7d466a72a6f9b95381523665bf5a813'
         '9f35e5fcd1a98bb445b7b2dca6aa5aa5'
         '23288533ed33fdc8102035722485b860'
         'ad1e72d3856ca81db52edf7e37c97ce4'
         '1f7b3cb5bacf2256dad6a214faf1db5d'
         '71d886f797891bb0f7db911228f4b93b'
         '467b8a4fba5a061bab255fae0164e990'
         '23ac358bb250d6f8ead5d290cad72759'
         'b457af1099af99112c9fac89851260b0'
         '4b7485a59a6088d51ae21be1d4abe233'
         '1670313e80d653ee819222a80a7c532a'
         '78660ce3aeb2622c12496200cdf51991'
         'd64c7ee9b827b8c596bd42ce2be78179'
         '57eeac46280b0318991288d773088cc8')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
