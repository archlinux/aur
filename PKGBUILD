# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0b3
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

md5sums=('a4a84dbc9ccede42702a59e3b5b00c59'
         '1d4c56cfb1cb55a955d6d0fff882e813'
         'e9f3b9fbcb168fa40d11826985f1830b'
         '083dbd1f58a8c7add2c5c038fc75caba'
         'da1bc7c48e856676a5cf49c5b4cceb06'
         'a5210f2218e002d5f39d2d9b85d4d169'
         'aa24f458f52c07ad92fcc505345b0319'
         '929e640afc53ee54068cbfb9fe011514'
         '0a77e90df7ace05dde0a487906e4a9a9'
         '376f3885d22cab659a821730d9269edc'
         'ba7c19611a11b57e0904bb8526d00038'
         '3b3111459685cbab28e9d90de86fe395'
         '646d684e3a9f3e82dd6cd04c1d1738b7'
         'ffe280894cf120a324a2d7c464ee793d'
         '451ac78a73519d34b55e4f8f317d462f'
         '6f1b798d046c6a1aba404da7eff42594'
         'b903a2726724cfacb1a255da73fdf111'
         '54f75b93f7bcc30f3cb491c1a1f4e1a1'
         '607959f309a71ffd1766b8090de3234c'
         'b75853ae2ccfedd981a6636a96757b79'
         '2b4f0e5f7d1d1be36446a43da0598892'
         '8481598933dc328f7c1128d7b9408db8'
         '4bd94f73df28a3bf3be720b867c70716'
         '48aba95a9aa9de4038c0230168507b51'
         'bc1ad2d7dc71bf88ec0ff382fc5d21ca'
         '075cd0dba31aaeaa8cb209315d70a7b8'
         '7587ca49dafd350675622d578f4494ec'
         '6da45af3dffd361c9513933da9bd2e20'
         'd68693b62b1e72b879a6179b0df44089'
         'ab9039c4fe9ba99b4d9c9c892810b44f'
         '0182c8093d6e3653acb7df699bc8d919'
         '30eb57c8ff6f8745977f7c2fca9f4103'
         '3f2946f0bc2f1108f77a24c687d2d17d'
         'e3d8d091e3e88bc6f36cbef2b399ec79'
         '2115ee62a377b7b887e2ae72fdf6389d'
         '6317fcc935e724d416168f7ae1d5a8f3'
         'c751954a2bc0d48a734012ee9adb0af8'
         '6150bdb2c3881969986d4ae3a19b66f3'
         '2e59122f8ceeb2afe4c62d1123f6bfd1'
         'c601a2b9ea2ef7fdccff001308dbaa2e'
         '8df4c8afebbe949c81fac2784f5595c1'
         '82b11cac20418bd7cd111b7eac51012b'
         'a9af48b5bea49a7eb878e0908a7b2c8d'
         '2100be22fc3b356e65507289b298c51e'
         'd9a58def81a351aab978696a8b06c022'
         '2a43c1e805c333c7b4a1cd37a646b64f'
         '712080c515f934a4ba219a44a41e7cfa'
         'c09484c44efe6e47d05342137f242bec'
         '6302dbd3d6a7f5d6af50c6222a4c20a3'
         '97fdf285ee4b9efd0a4504134166e5a9'
         'd4b2ec70fb528c322a5c7c127e7205c6'
         '68f007407862d88b1c97e57c354ddc69'
         'da8fca0e04a5075aa713e566142cb196'
         'cdcdfdf1b878ce0bc703225e682ad561'
         '3b70d51580263f7e4fdc2cfe7d5dd0fe'
         '9d116733c5e24d7a9f5d4e5aa76478ac'
         '531ddc3460553206af2d4c2705f67c6d'
         '20a6bb6566ec038d3057545e05dd17e4'
         'd4ad177bb0e05d6d8a6ba8c3ef1568c0'
         '3be4bd4809bb3d1df63e7753ec152ab1'
         'c8c9387e09771c3d47eae5ccfaf6dd53'
         '115ac20fcde200a352e5830b7f01f95c'
         'cbe87ebeecab2167cd15383cb167b33b'
         '972da59d7448939fa246958b0e21f38c'
         '597c8ac0c8007127b10849830d3caf4d'
         'cc1edf7b3d0ff662bd886fb40a59f737'
         '68350f97085022b5e556c0a42ec0e60e'
         'ebbb6e7f88e49261559084b3f872d953'
         'ec96618afab85fbdad8a062bb9f58876'
         '1a51e6bc139eeb44dcf3d763f8ab3151'
         '77344eab6f7c5fca97c621bcec44565a'
         '5e59a89ffd8538a13d835bc1075d5cdc'
         '3b7a05b8025090e3921a69fbe52c3c9d'
         'ca8108359a9594b69a0147d2b203b697'
         '9dfc85d6d1ac1a5a4ab611b3a2dfd238'
         'aaacfe281399b2c7420fc3569027d092'
         'af27eb6092e91c549476ce6c993f1614'
         '5c0a0d8587f0fb22323460e3acec4a6d'
         '2c8c9092133f9aa4bdb1056e8f50062f'
         'e82b612f76d7dbe7a5e5a705eaa09bab'
         '9f6a6750baf93014b1a8a8fe8f1ec02a'
         '20b800a832842a90b60e5207ff88043a'
         '090ea626a1ebf013936fd7a631488de2'
         '4b832e89f4190b9f6a74a7ffdf481874'
         '65d336c9abf3ea31fddffd8741888a11'
         '3b1f7e0ce1f435aeb294595b0fab7d74'
         '9570b08d308b74a65eec1a5e90aff562'
         '20ff46d59886326d883d54b8d8349ac0'
         '11336cd034594e9eb7d81fa1c61fce35'
         '5779b208215562ff13db607b607e7bc9'
         '64aade23dc1d7b7730f9a1caa84c71cd'
         '05ea5467f6f26ebc963209659532bdb4'
         'b08b35e8698411729255b29d41eb4d49'
         '20a2be7a9e577e6737664f15e66499db'
         'd9fb2fa0f90d2b41053b8385659104d4'
         'c05a117073fa5fb9e28fc77178b0f6e2')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
