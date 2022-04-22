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
pkgver=100.0b9
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

md5sums=('a83a1b0edb8ee3c1639603aea674c041'
         '26edd291abfabc77d37486ab9ec3754a'
         '1c7366feebb0da97fc7dc7f3506a69bb'
         'd707043a0869333a21fe519067325e4c'
         '67acf5ff9f4ad8bc9bade249e57fc386'
         '40d2bc5cd77cbeb6d843c631b39bf67a'
         '9db16673abc7e37dedb31e61534da180'
         'a2a2e3e186bb1846e8e3c18d02470941'
         '8ceafa37fcdaef944ef5a2c2eb61b986'
         '7bd456df6a08fb15a3639475d0cebc22'
         'df665c2fdf7e97752794f179a3746ee9'
         '6046581b7b58a164a66746cff7bf50b4'
         '2613ae7dd1cfe23d4fcff91dfd339536'
         '7956bd085a3a157ccd62b20e473a5cf8'
         '9fc5e5bc3020a4fdd52dc09782589baf'
         '8b43dddd9a523933bfbac72e364adb20'
         'f57c50a0cf65a5eca55e0b69668847f4'
         '0d232dc01d0d8fb4645d8be598ccf044'
         '0b68714d3e948350ab5ae91cc2e4373a'
         'e2e17745223cf95799e8c00234d7cd75'
         '1f3094bd9b692f5d20c2527b5be25b23'
         '9ae906d6e7e669c0c4f52fc4aeed95c3'
         'd4346f8d5414d19b65782df696f09fbd'
         '33f609655d56adb889b68319e52015c0'
         '21569f95483a65b932e247e057f553fa'
         '3dc2174c357420f6f67530fa99e4578d'
         '34572498b6448a226d42d2c16085b61a'
         'da1809e81b38a96023321df19b7b2e17'
         '8adcf2568ee0c084687dc723b3b53dc9'
         'dadff7bdb858d3e26c74d57cd1a1510e'
         '35e302601e155adafe61914747f38179'
         '19d43a064adf1bcde02a2f89fad15e6b'
         '10c9f9df071021f9b507904673044622'
         'c0f34ae61ea51619af6d36c38bb5f46c'
         '07651b8a8ed9ec1c9fd59fdd280e8a6e'
         '11bc542d3b72d176e36445de41bfcf32'
         '8390b58f37c5eb11678824c17b4c00c8'
         'd419c1e9fd41998443216829e613b64c'
         'e71bd66e90df1b8ed40581435e08126e'
         '5a4d06a9b142f97ee64dfaedaf985b58'
         'cf91bb231905db4c176a64ff8f8c346a'
         'fbe4f612cd33bb4a1c29065efa4bf7e9'
         'ec6ee8b35a86109bdaab1c9706747080'
         '0ecc69d0bbb04256d661d87b904a3dec'
         '91cebb236180dcf3d00e14c026ee58a6'
         '2f057f7175d20bf0e8ad147155ea20ab'
         '745e8f78ac62c8568a3137298b01d0ef'
         'd2d089169178b20ffe41e785df337a5b'
         '6061c23c83c3f945769985c752f346f2'
         '722c935274acd7e7a3424e7f7e515b9c'
         '622aadd1367acb8f496bda53121c3f1f'
         '4087c7c9029fb2941a97fbbc8d266ea2'
         '49d889733c7603cbb5648173b13dc257'
         'a678961b6fb6ea21e0278add564fd4a9'
         '2bd09d3f4e403b9f575f3d6bc8525028'
         '3bb003d2bef239616b21954237a1be53'
         'b195d7a86e6bcef48097a624976e4f16'
         '56c600a8717ad0806d7598a06f375710'
         'e131cb394a047cab0b1d8fcdece729a3'
         '9053ca5109e1907d848f5682e9640a78'
         '3d772136f6e4c79b44a2f8b577b36dea'
         '79eda118a0a65c6b5c4a250049ffacbb'
         '63f6ea9c3505461bd7491564ec3a7c08'
         '921b2089d697dd66d6878ec5adc58485'
         'fe7456527ec499d2afd4a6207f5b06a6'
         '916219b9778bc5b1e708c932df9afb8c'
         '1eb53daeaae2b22c0ef1169c2212fb91'
         '268ed8f5bdd74aced614e7a3b7312128'
         '5d418be352c116abaf8558db9fb7ce7f'
         '531af8f5d4548626ff5c00e05a657a3c'
         'cf8bbe4c76956d94a4ed3d27614df86c'
         '3eaf588f08d3394fd3bd7766fcea7040'
         '5cfbabd42b7b56498a8cab68efeb4043'
         '7febb5f67261c9aea9f51a097b2b7aff'
         'a52c911c2188cca35d2ebbddce07e829'
         '1480a2f08a522874ae75464795b6c6f0'
         '48814b02785482a7228208a5104660c8'
         '63c223f8aeb8977225054850208522f7'
         'b2fef3b56e9fb3591320337b00183ad3'
         '97843635911bf2b9ede465384fa6a110'
         'ec26d8c858b79812248c564115d8a65a'
         '6b04a8fa13b84aab0b77d9b2602f66ff'
         '20e9997276278476c10219a78fb829e6'
         'ec914a1d515b914dff28c202140e1a23'
         '8ebde745107e4eb63f18bada50db39a3'
         'c720ebeb6e00a75b279b421934772ede'
         'b518a3d0c74e533dcbe3899ca05bc202'
         '3256e935cf5ac2e9901317a65daec76e'
         '8d8dd489947680e8c2626e2b17c96713'
         '8e50d4bb0c9848491328c205ae2e649e'
         'c8e29b205fd85faa21f79ebab4c684d2'
         'af31bd5e48a68bae66dcf24151bd998e'
         '29677474963d2b14eb85441c03f1a3e3'
         'b349b37d82ab8d2989b7c8f1e1e8f77c'
         '31fc43b2151e94d3e1899f13a2f4f2b3'
         '5a1cf240ef1f070ccdabcd7ae45eed8c')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
