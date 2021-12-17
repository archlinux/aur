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
pkgver=96.0b6
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

md5sums=('eaccd9139a3e7da232ce5bcd178152df'
         '82fc26a4312f7211498733b0f63a2446'
         'de4a6130991d16d588ec843c09647a90'
         '9f8f145b4cd537569180ee88540cd2b4'
         '4afc01b50c3b587c93bd730d5fd34cf7'
         'f94c51efda23612694e60ba91ece74ba'
         '1fa7c9c37ce9d8d6df740305af66579b'
         'a2f7c2862cb6850f4a62b4cb22fad1d9'
         '511d671307815c783ab5b6064204ebdd'
         'e910652efad60270a97ce2ed64ccaf71'
         '2385771af34f149cbe199fe58568adb6'
         '1b1a1f21f7268fa3ea68eb8ccf666e0c'
         '36c9dbcbbf434e30de22893c0fc14335'
         '25a9547fb21a1664bb49abe4f586f34f'
         '2d4fdb4ec71be8b8b403f48dad1f4595'
         'bda6f65c345a6021ad06e03079efb4cc'
         '6c7a8fb862e2ce75a6c487462534005e'
         '1d1bb91b1c2187ed3cec2f3729de09e0'
         '33bb813f06a9006f13703f081aa43d81'
         '940420476199974fb159eedce9d7d642'
         'fbdc888933cfd3f49ce72d8e01f5721c'
         '0d7b1355f2359bf0ca6a611988eb3ab0'
         'a725eb7b885c8619c2373ee95dddd28b'
         '9e131b7e2e491f7fb5b9424592ebdc85'
         '8639ac3087a95090eb5951a715af4bea'
         '591f05d73813fdea4cb7d0c86653e6b8'
         'c93e1511c9c1a4227232e0441dbc4444'
         'c0f99b64854a03bab1498e99d3490afc'
         'd09ad35a2212e1c0debe89a755367fac'
         'f8b02d3df5be4b1001b1f9cb5b169cdb'
         '3f763cefa6239f7d3284e5fb51494db7'
         'dafe6b019960fc5df8b4824dd0a6ce14'
         '3944d1e7b04e0e7131c7c448555fc64f'
         '065bbc75f19e31ba3bbdc6a79a5a387d'
         'ebdc580c6fabeeac128674ced5f62cff'
         '75868080320001470b8efa7db4466a74'
         '291063bec8ce11403fa57f31cce8424b'
         '41ebb11c0a8ca63c6db2cdbbbb2d3a79'
         '9915f6ba2ab04828042befb91abd58b0'
         '337efa72a3e58b2635db201f2d812b29'
         '9a48eb32f9bd1ab539bfbf8ea35397f5'
         '2020a523f568d6374db1711bba8dd0d0'
         '1a5a256f2d3cd384dd6d22cd155e7b25'
         'fc9a472f23aa4bf6ea2cad2fb63a0906'
         'a79a4b2967f74bc3378f38bd096407ed'
         '8921ea6009d9267954b56687348df4aa'
         '05c2b01e7cd04c2a646fab810a984381'
         '21d5ce1729af2c83b1f574811f6ef648'
         'b827c860b90c34997a250b503aeddaba'
         '459d762cf9ec084dcdea2db4da703886'
         'd8c0b4d9df04e4ed2922d3fb09804cec'
         'f38cb60cce0a42050d468cafa5f23e6c'
         '73efe313c9903a129028d5cacc9d6b94'
         '96161847445c9d97c2d65580b3226bd9'
         '056e916489c0beebaad55809387ed0b2'
         '30a8efc245ecf177f758d79345a035d3'
         '858bd76d3ad9e654263ad68a49998418'
         'caab59fba743f663b07731d048b57329'
         'c5cf21615cf620e54120e48cfcef4109'
         'ca0898f1fd14cd41bb493f9c39153710'
         '85667ead21ce75db3ba3a663db4fb34e'
         '2fbd29a52fa3cd046d748663131a3909'
         '7e5a51737f79e788069d37756f20e4ca'
         '7869ef178bb16b59c0c5e8b7c0dabae7'
         '2d0966e27943e669e00e061cad0e1585'
         '5b441de453ba0147cba92e58bd721a09'
         '405229544da990e6c733525c729b154d'
         '6776033058226fd9f86311466e9cf19b'
         '5554bffa5f584ec1523f97b9af921d9f'
         'f36f3ed191e1251a9133ab75de834292'
         '9ddb6e32171942af2f7a672f43e79b12'
         'cfbc07e660cc20ca7c96d51a4a1cc529'
         '5d4192fd6292000d4ea937f9c55da2bc'
         'f822d40afa426b0787e1c052ccaf6b69'
         '105eeaf98421d101e36c671ce9f5a914'
         'c3c297675f20d0d76b0baadc67131cb0'
         '3addde33484e44e0a9142d687bbdc556'
         '9b8c3a8985877871ec9920c838435014'
         '8e57367d1cf217eaca16246fff68457b'
         '61072bbf49ff8474d94d5b0cfe8c001a'
         '33f0419326f70fbcf18d917467a2057d'
         'e32ff2546308462acad974a73003204d'
         '1510cda8e5e0a1c6d29e7a28f5378fdc'
         'a98ffd885e234775b7f43957f5064bc3'
         'e3d42af92de4e998ae3c0c8d363eb1af'
         '73dbb861d3ccbf247ed627ab46ede9ed'
         'b62c84563ebc047734954fbc8d152567'
         '8ab15c4993fd68dd88bcac4ce82e08bb'
         '22db235f7fa6879a84f9761d592c910f'
         '4a2e4e5d1a8ecfd53ddc22148d9f056a'
         '1f473fa9fde8a7b714a542edec5283dd'
         '859b86a98cbef2ded130e8ffa888299b'
         '954315f8e58f3235d2f950dfb3de8cc3'
         'ee9faffdf956df6a39670c67c3db8933'
         '4c770d708bc47b23978300445bf6a7b7'
         'bae8ac459134633f7d7f79b6c75e53e2')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
