# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=80.0rc2
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

md5sums=('f0a101b343f7187a17d64528e87f9ea3'
         'a31c98c2e619bea57072e5b5a60da3c5'
         'd02920aaf1af944cef25cb1578165e1f'
         '0964acbb73a071e7e8f180b26972c5a9'
         '5b2cc19cf98e8a0569e1c6d668ca78fc'
         'a08e1523be15305c74cd64983db1c15e'
         'f6be5887a41b7cd8eb2d586509ea4349'
         'b5b1e3d4b6aa46d33244db1c3d0cf855'
         '2f7ba20b4a642ad9b0c2118d7edef582'
         '61231e1dba6b2ddad502ef9b24f5a6e1'
         'b3bf77a945fb3e793fe9ed897ab81ae8'
         'be15a22c07e5d3866f7f6ea6aca49e09'
         '14d56cedc515796f5c5a9851c37d054f'
         '41448315c99039be1617008808cc359b'
         '429ebc9282296a4d4b63b8c0bbd28a71'
         '5192777140bae67bcb73ed3397691e94'
         '9d6407813e4f6bbbddf49cd4c95dcf9d'
         '38fbdc0d00eb52ef6fbbfbcd8c9626ea'
         'a9f651ed13806c9a2261b2b6e47c8d4d'
         '6d4fb540cf0499e966c38b31aaf225af'
         'f8da7ed322b9fe90045a640c00fb16b0'
         '41259cea3726ec27b00bebb4852fd0aa'
         'c3e314fc9d148a12f92fe817d77b6085'
         'eeac43b1073f89e7b94452a185c97d22'
         '901eb8576dc78844b5b822e6672498d8'
         '5a6c83d784b5d784fefeae207781b5c4'
         '12d1bd79d398c151fbb8c1b2856cf976'
         '6e37456b373a8f29cdb6984203197aa7'
         '8cdc631515048fa66a1f63f686394d94'
         'c7ffbb3c5bca0a9715a4c820e69e56fe'
         '5bfc0fb4ed8e3ddcd6886d75a19419e8'
         'ea5216758cbedbbc7e4f38085aea9cd0'
         '3b3ce3e1f1141ed982b19f707c8569f9'
         'e5b447033ec572f001e25810b0b621f9'
         '1265060e3af784806593893f0acc8ee8'
         '6969a1ab1d1aa3008740bf43fde5155d'
         '13adab918535ec54dc953ea026cac4ac'
         '198e868896e17eb9cfb0c2de39bc66bb'
         'f6f52780e2de31894e1eefd49b682381'
         '2570a4025a2caf3c66483e4e5624dbb1'
         '08254c16b0476b4f889bc3912561c8f4'
         '203c0f6846e57cfbd5e6de1a3bb36a01'
         '6ba3a3d4c6825e29302fcf5fd8c9008b'
         '618bf0d72b28ce0a118424a626cee6be'
         '524137bcc8936f5810bc8c89ae891e75'
         'ae02dedbd4a0f0b131397cea7d8691f4'
         '13958b1821a258ddf92204ea6128c004'
         '7a9b45f21973950d11d4e3cb437960ff'
         'd4f5c0baeb8f54c528569211cd2fad2e'
         'e35377f900867ceee3347d69155b8ceb'
         '87f4986ecb3d9c002657654f8646ddd9'
         '4bd7aef36d7733c9ba826c4214dad420'
         'e02ab197f2b650a7e72dbdeec4b34a29'
         '598f11c23cd8cf40a4ad76edae713af1'
         'e11d3cffecbb7df1ea2c7cf6cc927e37'
         'f7f5afba548f3dea2d46b5a81dc5606f'
         '8ad467511426f6df18ae1289113acd62'
         'aeb2def2fb824172139d28f52ecc042e'
         '19ea2ed225b2da81c2a006a364600e1c'
         '7376c52fe0f82f2aecb4901548dc9721'
         'fe70fbe74bf6460ef874ed3d95cc5ae9'
         '4f87c0cd3b212a8a022a7be1257792e8'
         'eaf94fa5835dbac0131c6aee085147b7'
         'd082a8e95c6139f1c0ea2c76271dfe6c'
         '3a3f22b4c650639a8799a67abf7ec569'
         '165dc15449694ef6a11581b62848f2c9'
         '9e6330ac4290e9960b984d06cd813509'
         '4c5d4e53268162c9e3b4fa2aac17d8da'
         '65a7e020de3a7d1ff3d13e7533540376'
         '3f8d5c1f5d3e896fadf2f90826c17aff'
         '245429ec5c01b12d0a1deedd7d8037a7'
         '6ea280102cad2d206600eb1a76f6f5f2'
         '3bb7ee07d00cd1d51373f1dfa3caf447'
         '304ece444b9f6e9af414614cb66cde2f'
         'be2177a2537220fc3a387765be07b501'
         '24421bfef5a0525082c0e5bfb7199bcc'
         '98b0874db2eb6bc3b2b1ab22df9a5041'
         '0f54e29d444556fbc71ab1269fe4163a'
         'd79298bb0b9a0aebae779ba93921903f'
         '0b0d95c0c29f61bd5e5d12d0c02b97cf'
         '59ce4b6a6d907a0ae492a1cde10222a5'
         'ec0914ab01607175c6dff9b4f9fbbe99'
         '144a851b1787685279e1f2627626e145'
         '96cd43cf4e2fd690f11659c241551a53'
         '359444ac8576651f3ae0f0c26eaf336d'
         'd4714342baaab16ab11a23780bfdb598'
         '25d9e30ab45db003898d66468d3b8cb5'
         '2d8585f687d0f1d92be58af2fec51071'
         '12f7cac7e081064d703c6343e16dba89'
         '50f4dfd61e9431632ade79d47d070be4'
         'a27a1da143dbaed3b5ab4973b1051321'
         '5fed321d1a89ab13105e19177bdb31d3'
         '872584a560411afe4c47787909b9fab2'
         'e85ce94e04e36dba539d5b440c7ed1a8'
         'a8a0d041e31d8c9b83e89bf6e66ae004'
         '4b084ac47b0106ae4a751ea35f4ad413')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
