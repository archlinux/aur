# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0b6
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

md5sums=('b7c72bba5fffda1d49ad0edfa4078765'
         'a0f3135dc3936ad56760396215d5d0c7'
         '1dac395eaaeb30dab531bc27e24826ab'
         '48782ba66e88084a1a1ff9538bd98437'
         '8ae8b6f1c2d4de818661fe6e26b4a660'
         '71b776985dbb193a04d5ba0f960f1a8a'
         'd8952545fd98b53de85dee3e5e03f1ac'
         '1cd68f9010c2da0991ac571e4f7a1284'
         'ef37fd9829fa964ba4599b5d928fbc43'
         '61d69edade006760858fd8db17f219c9'
         '53c3f3c232d93472dd4e4d7058da11c2'
         'be7c8d6ccef24378cddb194034d69099'
         'c29e4b7551fd2fc680ee3064f0a7e56c'
         '75d1f557c0745fc338572cabb238b5e5'
         '7675de2c366c0979aeda184878a98320'
         '9df7c3cb8bbb6e91344b0ebcb13019fa'
         '79563ada817a8840e6c29924f20d7f5c'
         '8c33cb13dd93c1042da14829961b075b'
         '56b70c5ef3ed6454c8a85d26d8c9a8b3'
         '26bd17aee3a93531a703945de91e9cd4'
         'b0ba1a1d01b9bfa09f2813be843b7459'
         'c8fccda9729d88715f272c43f20b4e0b'
         '4cf7abce1287d1dd2bddd48efd8363b8'
         '6b10cd3b4377743e2d3b329d0e6d69c6'
         '8558328febf18cd7342d5f87c535ab16'
         'c17666c01be6046f941dfa44e6c9c358'
         'ad8c4cb4f8a80b0f8ef697237ff5cf77'
         'e1f2a53a7de23df7b1ac0882f60d1c14'
         '0d5b2372f08603f9cd3a5ebc7b0aa068'
         '5af60d68b90b935151133bcb7764e8dd'
         '2a724699060295d2720d364654332ec8'
         'a08e1b7813ab6631711f79b4e3001d78'
         '959e13679cbaa1e02aba331248ffd89a'
         '7e7c0d170d0da3ff766d91926099fd72'
         '711b514d5d0e654006a4b10cdc346b09'
         'c52376ab51257472ddf4f91c782a3633'
         '29875eb3f8109f6169359bfd9df72fcc'
         '8a91f9057078244e24d5a5068885379a'
         'a75dde819b696f8b7823024f1c454f5f'
         '9276427f66b2616dc8acebcde7d729b4'
         '882ca26655fe1cd0a641a453e4eeacc4'
         '911f127094dd70fcdfdbb428731151ca'
         '6d48ed25fa772394775fa0bfcdb86c49'
         '8bf5f7bb10ff608d98e7d804f5c71550'
         '4e2c7773982a6bff0113fa6195e431b4'
         'f77d3594f226ded3302928c38f65efb3'
         'b848c6f0d21e2c42b73697f7abbf2e6e'
         'f0e02816f07444b48dba6145c64b3a9e'
         '4f3c1d72cd80f78568ac0cbae7701332'
         'ac52f5d280575be7e19b445a4ba3a794'
         '205f73c15414ade3d2532d27654ccfac'
         'f65f9549cadf9fedf76c46096a51df13'
         '3055ec26fc3cdbc5eb67e64addcf53e1'
         '70cfa8a026ee05d9589a4c9d7ccfd5a7'
         '1f4a7a6b9ac74abba0e2a44302e9d868'
         'dc503f8362befd42e6135133b376b25a'
         '97035f5be68a62d0cbad2f9e5b0d924b'
         '974b9b4cd894553e2d272af547d9507c'
         '94e4f83e11e8fa14210be47cb74b8414'
         '005403c3ed25cd4edf972270a59f3eff'
         'a817db05e2705e31126743fa51d0e944'
         '64d28c7743a5e7ca3b7a0ca6d9c832e4'
         'd7ab793684cbe5fa52686036877c7432'
         '5388db8c60e30b69b343f95b26a4c045'
         'e48e5dcea597fa09fc27cbad1cbd7319'
         'd7abb92d912a3162e8adb5073ff83a8e'
         '5500ed921901427f8aca04e9f76619d5'
         '766eda753cf5b85b1a0015a4bd245a47'
         'e930ec9f2da5d3a5d4632fab9edfbde8'
         'dd9a3fd6eba3e9983b0165e99d09e568'
         'b3b0f4ba77203535bf3ebb77d71a5afc'
         '456f954ea5d62e368d00226fcdd29bba'
         '30239850ba53bf0df2df918587e1751b'
         '0192cb37d0ec29344164ec73f40e1dc8'
         'bb45e6244402435d1bcc37b87a0d7f34'
         '6d3b925bc290494da80dd1fa7b268a4a'
         '7933114185ded1f60379e4c6a6168f3d'
         '3667a96128d1128b45bce1514aa52854'
         '5d8ca927254daea165fbd7d850af6153'
         '92e7d47acf7007cd8d5ddf16327a6f70'
         '2f773009ccc03938980db6219e873910'
         'e14ea147e6ee2b441d895ef656fde141'
         '2696ff376c97e736cc5595f91faefc92'
         '8e9c4844d5046d1f5a4ff2acd8caf786'
         'a0eba44e64af25356454f8743e968f46'
         '87f79244c975c5b0bb4475a99d8676cd'
         'c3f65d4cc4a341a39396502c95331f5a'
         '018a46b0228a3e5d3efd8f16f60e80c4'
         'ff5927d1ccc0d3b5d29291223f19bf03'
         'a6d26a3b8e3dbf4c78668867cc948532'
         '9f8c67b932e311b9085851e6a7cccd6b'
         'bc9d5cd60a3231446295fe3072556547'
         '33c319d1409621b61e4c4d90ba0ec66c'
         'cc6e52236938593921d1208e0dd89f58'
         '586497ce680795cf9ece1e07ffd9e2c8'
         '3247cabc64ac5282038d44abaf9c3a0e')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
