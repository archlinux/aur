# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0b3
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

md5sums=('749ccf75c6bb4a23581f02b8262bf0a0'
         '4050c68725672bc61ef034e58123953a'
         '061fda9d7311bf19c4e71b9c0c14b4ce'
         '184ac0286df40fb07ee10d29527ed7a3'
         '5059300fe46d82b790e3faab5386a9e6'
         '5e6a1d16c19f749281774e459886c5b4'
         'e5f63412b40f95bc24c61e51a8a17610'
         '30ea20300c98ca7629d29da41de02aae'
         'c8e9987b552118e77542c67d5b7cd185'
         '81cb293aac55cc60de080c54076632eb'
         '50d66e7c99e400ce07647111935d7c3a'
         'fb61c96aac07a4f2def88d4d133251be'
         'b8b71f4cf1f075fac02d13eb88e4a311'
         '8f93dcb61278fc8beea6787a4b1c5196'
         '54bf5eaa96a5b54536aa0000fb7487e2'
         'e34952e67b742903b6e7d59f4d4e83a9'
         '08e0591eafe0a2eb606e982ee6e5f83e'
         'a596d9fa5c1c2bb9bc8cdca9da440c38'
         'a7c7a36e9199a73edd85aa38bf1fe1be'
         '4a68b5e7e100fdda2e00a4e7b3d8cb30'
         '0faf1302dcd60b09cfb76623455a95d1'
         '81d54012e5bbfb884d134cb9717bd338'
         '1b94b1f5d29a232f8664706c63fd71f9'
         'ec90cc9ad2f19191f6e472f8b84a1d31'
         '1317f8fc40cebeea4e4fbfe4b73cf341'
         '293b110bf08f7cf7799e2be70794091e'
         '63b912498048064ecebb3f15dd70b901'
         'aab50970446928fa40437d24ccf47a87'
         'fc55533985f97d918bcc25dc3714f340'
         '930f1b7d435df09956006a54461b8830'
         '650e8ecaeedfd08efc016b1894fd48eb'
         '0f86444a28a3d79a55475fb13170e32e'
         '6605f5aa1161fa7ece728418fca66eee'
         'cecec6eb1be97bdac1cecd56982cbe2d'
         'fcd1fcf77d4071cda63d5ecaab40f8a4'
         'b4ac416a56e75f36c1755afebea97c1d'
         '6683e431276666c9c77033cf9a293205'
         '1f37a8ae6d0d7600c687a42cd713db5d'
         '632f7963299080fb37b6095a6ddfc7a9'
         '6fc58a211d672b7d1beb18c655bd3042'
         'bf7ede5d8b926de1dcd1fc65e548e6e7'
         'd023a1b60e7d7827fd0df755bb1933d5'
         'ff2aa7d8b0d829ab12396a01f6c402d9'
         '503a99860a3fa4f879bcec459eb66217'
         '9790322965b376fe02bf1a939530a16e'
         '5eccdbcd716ae6b3b4c4ae956604d5b3'
         '0f77b99ec5b83555775f7ed02009105a'
         'af4d16ceffd7512aba84f0b5b5573148'
         '44578e76352eeb2821365e00c14fdce8'
         '22fca912653a7c0f39b3cddf32519c71'
         'f92114962a72fd82da2a14ae2be879ff'
         'e164fe6424597bd4287b34cb47fed60a'
         '5317564640fcb73f6e2ed55e02750a74'
         '3193645f641bc35bfe7db243fcb39133'
         'b84a5de7d829844b26aea9db2b627c0c'
         '08a82a0977302cf63f628dc5b127a09d'
         '0a302281b5774c52ae0cff93a133c69d'
         'f4daeecd82859ef43e6f9d8ccb8fa95a'
         'd6a2bf1b14b949f320274943049290f2'
         'b1b3ef3f55328b529fbc119d2901d48e'
         '8499b384c414636ad53441be744adb5c'
         '44503ad74a50d92280c3f5ee71ad1ae4'
         'baef00accd602c4e5c57cabdc37c0faf'
         'cd0d3099d19cee56e287921dadbef73b'
         'f6503cc6c1d1cfc170f22c322a9c2040'
         '811eb01cfce3f369155f565c6c6e905e'
         '327c63c052090709f7c231302cf369ac'
         'be155eb1d8a05e4a45ec1375fde26ba3'
         'f857ca9e4fc4d167e055e3c8cb225b4b'
         '68ecbfb07a3521e21b7cf3299ab7841c'
         '414f04f69f6d9009093bf56b925e2d05'
         '347378be2a17aa796a338a5ee665197a'
         '13f80e18b78d09b3ec1404a6144ee46d'
         '6b9eb5588f0a5827214ecd2848a71bee'
         '44ca20dde87991de7257584725fe67c2'
         'c14b018dfcfeac2d7a6a9fadeeaf7f77'
         'd234f09a2c95b73ffe4f9f215b2e7574'
         '0c7bf803932a156a54d7c806b5e83a73'
         'fa473788656e1e0883190d3b7de0f9a6'
         '1e9113c184122c2e124df31c6df55bec'
         'ae16fd3b277a4c5b8cbfe85c9c6e5772'
         '04a33983d218574728af5b8b353943de'
         '3f888e96b5d074c242b4b0884c320f21'
         'e29a320f328099a8e8365f6ebd43c1db'
         '998f54bdbc1f62528101dff4359ddfb9'
         '08cf1976de969cc4278f12f4d1f099ce'
         '73d43cf1943042d89cd31780d415d294'
         'c6fa631a4e20ff729fdb18c1c3256d66'
         '86b8ad8379407dcbb4aaa0e6b117d1c0'
         'a27bf377fa6614a84f6f057d1f1a814a'
         'ee309667aad0e731c7e7e999d0c14150'
         '53b3eafc8d343d3f1c5db3fac8d169c5'
         'e00b5569f65e53f545bc934e03a0d2d4'
         'b65224c06b9335512e0ac02f38556d17'
         '86efba26b8d57139b9cdd1e57cd60c91'
         'e85147aa27a06333b03840888dde7ba6')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
