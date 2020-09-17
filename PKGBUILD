# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0rc2
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

md5sums=('171611b9e5993296e661aab4d9dbbcdf'
         'd07f4dd0b0462eebfebd80cbe8f64baa'
         'ecbf763567cd2457ccd8ad4f5292690f'
         '2735bd4e8062f0e39c0fb96dd1091a05'
         '2343374120320839331c948a093ed92f'
         '3225aed8f2f28047d49c56921b100b2e'
         '5c3dad27c747c405eb431eb0f77eecde'
         'fcd23228efe5a57ab90f36794fdff222'
         '1b1adb96d2e543a5ea45a8ecdef996ca'
         '47649a3fdf066b758f554a8b6df0b496'
         '3ce81ba16936154e100b37ce873f0de5'
         'fc81523e7d5a717584a53e26cc48f97e'
         '54a137d6f57a8127ac0ec0605966cbe7'
         'eea746ef90699e51f8dc6ecf2b6af953'
         'e5acae9363127fcf94721d1b9da55633'
         '1b1f3dcba4212a0142d9aa8786c96e6a'
         '90b390c3bb3e5eebaacc578384a45d8b'
         '9d052b63175d4eeec1b77ff9027891a5'
         '2c512b20f77c4b4fa821addccd0a5b91'
         '13c57704668353daf99bab73134e232b'
         '649fd4d90bf537470af0fddb095433cb'
         'f8cb477fcd62feef225b3fb8a032b84f'
         '7f8e7480787a18403cf3b77c6fb16df8'
         '4251badb3f2b9d54beee0f2d757e12b0'
         '7d3560853f4418f51c9573d13d4ea48e'
         '734c0fa86360f83c530696a3e46e64c8'
         'df95d75eaa2ed1cfac566003643cac04'
         '68e1093dfe9519a60f6ab17e927cadd1'
         'f3cbcb470e9f17efce2c42b1d362fadc'
         '2f3cb5048bb0bf7881938bc4aa0465f9'
         '474e353150f3a6e50eab08170890cd5c'
         '5a19ae8c2869fe58c69254081973297d'
         '246170bacf1dfdc853267b8072a01e9f'
         '70fcb5b85b0564600159347bd57cf94c'
         '8bc3c235827a47a40644dae8759b1843'
         '931834455064f2a69debb961ad76d82d'
         'f2858ec17d81e49f85b15b86b2c8f03b'
         '255d328783153785937d0e47cf061697'
         '2fc551e169e7d9527887c72b0a1f43e0'
         '81683f0461e7f693d019d6a5f254003c'
         'be7b260385f2e5c77f189a50c2156b61'
         'dd01d3bcef0728a9861a643058b556b0'
         '98e6b41fce5f86b700cbd2da4f88f43c'
         '3f75b97a5b3905d99105c7238af35692'
         'f526748bd409f97a1cf1efd47b7d8e4e'
         '4cee7d37204a606b72f61d661b0cd76a'
         'b43fcf04bcdd5908bb3262eaade49a7c'
         'e84999060688169bd866692ba248a000'
         '9c2a3ae1b2a8764e26368daa2d971a57'
         'ef067f081c4c1387a754ecf5deea72ec'
         'dafd2be66cc549f944b50272e2479781'
         '6e1c570ba953a285cfc9097479f062f0'
         'd9fd78081035c23be61f39d3cfd6492b'
         'd0036c2478bd6d8e4c8fe8c08aeddbf9'
         '9c4669f8a72e68f1106690f1865ebc8c'
         'c64d98bfe2db7bdd62695f962fe7ee9a'
         '5a3f10997e882f407d7d41e5e4bb31a3'
         '001fb7791939833d88ce2b1e22d03867'
         '4507c29fb5ada88225cedddd72c1389a'
         '818754b2d284495c6da3ee04a6bf61c2'
         'f4e27690acdab15c544ea3a2858776fd'
         '0f241d397dcd3c83d41481b9511e50cc'
         '2cb4033759e490eb03db2cae8bbf4396'
         '8cba497b3d12b57cf88b84bf6edd56cf'
         '54577da8b8cef7679a195a73cf5b03b1'
         '3b5a054439d474fa40cd55aaf26a189d'
         'cf158018462bbbc092410f6b7c1adf53'
         '5e2d302b1eff247d629e0f986e4d7f58'
         '722b9c4bc3ab0b8b6c2567e3f9f3982d'
         '34954982c592de4ee047bef5803a1bf3'
         'c4a63aa8875db645544a99afa7044791'
         '653502a65fc7193a07372165a17abd97'
         '6c2718ec4622116fdcec4ca22192e6e8'
         '8fdfda559132d41f6a35ae0d2365473c'
         'c78951131dea6b710a6fa4f4c9132390'
         'abf9f164f22068d43614c01fabb4080c'
         '77e40e978fdf7e928072f50ab4e8088c'
         '1da6962f17170f68daa6ad425c4b5abd'
         'e53b3222f1a4e8b4b906197ab24bae96'
         '7508988717a3fce7e5337084f6425fb0'
         '71a876f851a9748f5c0b6c96cb1adccb'
         '6608f6c1c2b11aebdbba729d3cd2edff'
         '7d2830fe1f7cb686eb128d7fc6872a99'
         '5a8df912fb5302906db528e49c61b2f4'
         'db5f4ac1474f140e7690957077c8cf8f'
         '3d6d5b5807135cee108c8c12c9d9af00'
         '4c140e078a67f2fdc2ca05185dd81b80'
         'd13d3cc5930c2d3a02efab213ad96291'
         'fa1459674c2e75d878f5040b4a5869dd'
         '62887504f261578310619779e705eea9'
         '11d2f92adeb077530a422e8592f244e9'
         '6abd157c3ab5b5bb300304c800f69e9e'
         '9abd665f9e3ea868e01e03ba1db0b733'
         '3be578e9125aeb92c89e1c1adda1b597'
         'f77b13873530080b0e261ff0b187f871'
         '54cb8faac5d5ea4f799f42cf8b2a1692')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
