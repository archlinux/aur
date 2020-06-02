# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0b1
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
_url=https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
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

md5sums=('dcf3c9460b284ad7264f8356fb34aeb8'
         '8a65746a6d91ed8b10af410cddd359e1'
         'a34ce0a76a58fff169876dbbabe4aa7b'
         '53adde3ea2b9dd19452bc765a1fb5223'
         '407118e7564973f33ea6519674c0c346'
         '9ed4fb38d27e692466e0609ffadc4edf'
         '7664130977a92d750d4d02a0dd8c01be'
         '970adb53c69727201691cded41df748d'
         'bd8ce5294a27b264d3b73969e09ad139'
         'f942bbc548fffd1d3b8a64bc66dd0ac2'
         'd35799616f56af2d2e1da79341a0b808'
         'b3663e3ff7bce6b097ed50e73c2299e5'
         '440ab20d32265f000bf44da2636c530b'
         '9feba78ad0eccb35cc89265bc3b22d0c'
         'a48be6c786c041e48a493871aa4903fd'
         'f22eba8f94b9005c719a6aced73564ba'
         'aae4e9b16261ae79a211330e330e2a11'
         'cf1775709e54be741742252c243cb95e'
         '75523fb9b3ff935ca034db18184dbcab'
         'edde828c46ecfbcf264b0adbda4afe74'
         '0967cd43788dadb19c7e0cd6fbaf12ca'
         '4b8e19ccd6468a4564d3e3946a63cd97'
         '2e06ed9043c9d0a637f76bb467255a34'
         'bde605803f7039c57ec47fd71500d12e'
         'b456bd4bbbad4843cdd6b5e10fbc12de'
         '2797e109e872c9d4fcc048809eca41c8'
         '2da0f2a82b172cf1a8a6c1230599db72'
         'a68f9c512f7e61c1b6240f44ae18ea31'
         'aea298ec31821c448587a839a9bbdfa7'
         '2e8085a1775e2021fdf88d5f5b0cf435'
         '96233938a5065eebe938f071251b97a0'
         'ff8a31268b84923d8382109eef6e9837'
         '280ce161d0e6ee58c618b5dc7b4eeabe'
         'bb5863494f2089af5bab5325cf076687'
         'ca1367ce88c4961dc91a857f33c29a5e'
         'bec436c287470161fa78001b6b46df2e'
         '616df27d9cf9fca2fd98d0c7e197c8a8'
         '4ee20a79e15069aebb0297f6cb02f22f'
         'a16f386cfb38803c183905b08f56d4e3'
         'a9686cbf08e76a29d9b8f486b58743b8'
         'f1879a8ee94594ca58fda0fda0ccb528'
         '22fcbec050f7c24483603ed07080574f'
         'a9eb3cc33c8cc022bba9ec3f33ff60d2'
         '192651e239767f90d2bca06cecd1e3b6'
         'a14e9ae563c82b217a2fe6844dbab086'
         '7c8fe69dcb9e1dd048c01b0b4e130320'
         'eab43ae070426f1f9c7084e7f29fb4c9'
         'd15bfb73365997612225c7a6512ef794'
         '2adf4222adb1dd6b2303931d96ad327e'
         'fbd47fd17df1ff70b91abaea26332626'
         '7fffd6fee4b67c01cc1390cbb52614ca'
         '8b99916894d5db548b0d231f1321e5b7'
         '7dfcca8ed97c618757a46b51de69cb78'
         '79e848dca87d03265eaf38f5b92a8ca2'
         '936360fe8799c0190c8f518a81fb4b2e'
         'bca5587038eec9cc09762733b6df89c6'
         '45e5c311cadf554fbb5025afa06329e1'
         'dc40d5b8f6e89a632d06d24da57f0e1a'
         '4c961b2a65944cfd229491034ed59e79'
         'dbcea86baeaae2d129b807c69fd00195'
         'a07d7d0198ff4348d5eb893a8d6a11c7'
         'bd434f33136f7d010d7f39128257b84b'
         'c392dbfc23486346e7a69182c25755e8'
         '2f568a07ef6f98c37d036562c8618dcd'
         '5040c354e14ffb8a2fea46a7818557f4'
         '1a1996b4b04336412725ff2e3f2c093e'
         'd5d31c702e012cffb689533226b455ac'
         'c7f6d5c45fa89bee4726d75e27ccae97'
         '737eabf2c4b0b1c9a4498d09eb34b683'
         '72c6fc7aac0594b4ffc4fd1ccc265f2a'
         '1c6eb4ce1b782c1fac16fb88314bc917'
         '24d5cd8cc338309a85e259adfb05024f'
         '1fd6c7b9ad585d3f448bbd01cca64bfe'
         '6cf79e5d4cafa154a84aa4be32a8cebb'
         '7e58ffd846a8ccbcfd241c86c8e6ee06'
         'db10b6007908ffb1217e5759cc794f6e'
         'f559b15ed1d7176230b6f2e5853278cf'
         'dacb77d9f739063daa0f9b30c0ffad97'
         '7728edbfccae4f98f49be7a0cdc34476'
         'bdb3f454d9d8663a697a5a854b48dffb'
         'a106c54e498035c239b8e8f62fa5f331'
         '0b587338358f1f2e5ce25b2c9ce24714'
         '81dc2ee8dc6f6090a73213e12995c8a8'
         '2f9116e2b214308ff525c5013b236d70'
         'afa0f0d5f8f95bed8a28490ec60145db'
         'b108a537d1ee076d40e1346f9a8ba254'
         '8232638e15b0d3e52f90a43ab668a208'
         '371fe4ec6ed17c85f25bb30f3c4b0ca9'
         '0f9ff0a8f5d778d01b0d877b05bf1e10'
         '8cc9912e660c45543fea14ebf1ee8bd7'
         'fee9056e0f2a4d7b6e2b2359fd72069a'
         '7eb765ccede5c2780e8c30d930946e51'
         '73e0c5ccaa70dc1359175a815009b827'
         '0a89f484e9322fe3428536a7a508855c'
         '7ab1e0a286488573179f540d360171e6'
         'a44873d4a73f27da6d0cf2785259929d')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
