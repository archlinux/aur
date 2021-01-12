# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=85.0b7
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

md5sums=('8ce15fec71a241cbad163889928faf7f'
         '37e422f7575b833844ab1bb0f2ecbf1d'
         'ba684979863cd9e4ca19b2b95c3cfe61'
         'a398e416c26d28fa2e8cffcc1ad5160a'
         'e6cb3850bb0851cb820106589a4a61ef'
         'a60e57050fb00dee5263cad4c6240cd4'
         'd3dd09643349f06479a6f243f3c7f102'
         'cd8ed5ebdbc399ada095adb61dcdc97f'
         'aa90e90e0ca4fb35b4c2460b10c0e924'
         'a8c28e80eb72fbb86ba3efce4a3e660f'
         'a3c20cb92dc998b19a0004a12f310e68'
         '45f6b7107e0fdb4f6eee0cd9cef5b9f5'
         '409ecbd9372a1433bf39b2ec8adb6eb0'
         '73749a1b7e3a95cf7b0c2d216382787c'
         '96b353d6c39c08a1cb5bfaa305b684ee'
         '7942e535a4d191249f26cfa1c28555db'
         'c3f9e98fc64b1ba5df9d19aec3773f9f'
         'ae41b9d1a2947c3a7f66f05069e79642'
         '7f270b90d2cc5a5b2749a81d361c3c5f'
         '01964f73f29e7843fd4811a3e0c6f126'
         'bea8d37d060da142f946f60137205719'
         '95634c1d5d49c8b050aed4e90b240f74'
         '81631724543ea341677b72fcd81b2f5c'
         '5f9a5c1ccfe92223de01c20b3c243ff3'
         '49295eaa9b711bb17257cddec7f01fbe'
         'eaf22d0f45ddfbf4e115a3581278cf73'
         '219ca70df92a235524ce9757e43e13e7'
         'f7c509e461e2ab5e23125ef336a4d2fb'
         '98b65056e31cd5c185941f9409914336'
         '001c098e5ae3e9866cc30544987a8402'
         '00a97bc0840cf92ee999ae83e47d1497'
         '460f729758353e14ecd8dc3d27c7142e'
         'fbd5f38d9c8dc342284b356e1e507ac1'
         '18e348de1f71dee9942c404bf715f553'
         'f40756497a67a3c4bb1da2ad631f46aa'
         'd10be4ccc5f9b6e3c211b4e090018bf7'
         '6ecafb2b05561feb2bf922209315a40e'
         '20c6826b58b8bda918f574458f004da0'
         '3b756f1edcacb27402cec31cd52764d8'
         'f4955075ec5c9171dbfab4b4a96b2780'
         '1cc5c9be954983d836e06b7e53681705'
         '0ee8f3c46197eeda5e8734abd74e97a1'
         '35406eb4d3101fdf57d41dc2b245d21f'
         '56792a527b378669a8ed2cef52ca3f52'
         'fbcc7638311c0a796d21ee04ea4e6bcd'
         'acfec4ab2427626d1bef5762c4b0a773'
         '5b9aae589917dafe5d85737bea814dfc'
         '9293c9581cfffb97c13e113a54b9e9dd'
         '69568beb5579b132aa1e7c8acff65544'
         '337036826ebc0148c3d19e0247a980e4'
         '3caaf2359607094b318a8c398388bc33'
         '9879f254591110dae51dc17206458beb'
         '0910cac6cf639a851b4083e81c19798e'
         '4ad41b99fc1c35d5204b85615e327e70'
         'd127d424128c46ade0a2880cf1350bb6'
         '7fc8779ac07e36da9c353a482c34b1c0'
         '534189143845b4a3eae615a68a970325'
         'c4198954a0936e1840b99e4dd6e5ff38'
         '01b425052aad0bc3828362d2299b43a2'
         '1b0fbe7d25c8e4f21e55fb60824655fd'
         '50884767c65bb1381befb9fb1cb3a065'
         '38d1602821344c97037eb556ae0bc97d'
         '204f84c309d1ac1a9d76b19a3193d090'
         'cd641bf43d9fade4026ef5798f8dfa43'
         '7604dba1ddeb8f101c89f2c04ef04cea'
         '029bb3f7e8954f2ca03f86a34008bd40'
         '23d84b50ed0b019e706d0605117bd85f'
         '0054cbbc06b5b828173b078d9317930b'
         'c6296985ccb42c1c3f69f292b58c9fd9'
         'ac3730d90a2086fd01d6fb98aedafe6e'
         'c42daebce6c50cc4f7087e020d9585ac'
         'f87394428a89924927d16c28efefe6e6'
         '6265b40146caa0478ae661c0a030d40c'
         'f0ad61970e934b9bcf629af5ef1fbe0e'
         '235a753b6f02ca18be51aa4fd9c90d73'
         '3113f2c3b5a2d07314e9391f01af2ff3'
         'd514b13dd62d8f259c5d2e181f14ace3'
         'bd0f4f67cc393a87be7d8e5a6be59d41'
         '0c5cad469783dd1ab9ca6e53321ac226'
         '048bccdfbce3e4e49e0d70465b1b5b5f'
         '5e7969a05991da74059c55d76b0b2d9a'
         'ccb657a16e30ef33e71c3e9f648569f1'
         '1ed76897e4aa71f405194cd9780bd918'
         '63b6e8c72e5c07c458d9892d306d2ada'
         'ef1d793c2979017f134cf54b33054608'
         '16960f29b3471422a5185982a6c6a5b8'
         '69afa0e506e57ba777ebbb1348cd572e'
         'ed3c2349f06a0d70648f21e3af7cd23f'
         'd31a87e1e70ce5526714e06cbb1482d4'
         'fab766b0d142fcd1702407d53a39719c'
         '1bcd6d9e42d751e3c87e4474032a5a12'
         'e2a31308d90dfbb0b514eac2898f24d9'
         'e968630b387a6a2024d2d1041f96ae26'
         '3bcd108dcb1080ee2c4e4b196a4b6945'
         'a0253fd1d23b17aecc2a01a612497c87'
         'a68513bc3ebc2908124c9caa05f0484d')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
