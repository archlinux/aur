# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=77.0b7
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

md5sums=('677c22b9b6cad25ba4574373cf0905f0'
         '2d9cb3709e9c3df6b28714147c24ba9d'
         '21fc3e060d368de38ff99ee268bdcfc5'
         '33caa92259ec8997508c7bad5c5c3059'
         'f3c0f108c05f75c69b6dbd53575cee51'
         '15af04c022b3eeceb663706cdf69e9c3'
         '7f8958221708f47853429daf3380f6a8'
         '36dc3f00ce21cc1a3148bfc9ae35dd6c'
         'a1e7a37d8c78faabf6ab62cf2f351e72'
         'c7ea1f00c6f10dd0147327c50a6bf569'
         '4cc9764e9dd617bc2f46375a43e0f075'
         '33f69f4d2ec5bae58e5b356a00dc5258'
         '7845abf3413ac8ae5bac7eba12faae74'
         'b09787bd1c5da71175f3b0624bde4a69'
         '153d709a1d78f72c166e6762a7c5807d'
         'da37353e6bc3681be67184d5f7295e55'
         '111b339adfe18e399d01c64230ea42e4'
         'b141396c726bfa9b658bdad16507107d'
         '0a34abaa231dbd3c994a82865bbfa854'
         '3ff21359d7c05cf25d5a5a8300e63566'
         'ae92bd622d625d0c464644452667f670'
         '0d3ab1ec900d4d78d6a341af3c1306f1'
         '2e182fe63e4f9c5b110dd9e70d686194'
         '7a91e441d18f0053b48dc6a2a9ba1316'
         'b40eb1a5e29aaeec2b7625bf50d88d10'
         'b446eff83102ef06f6f109497de2ecf5'
         '9d73c66d399c2b88d798658672df2e9e'
         'e152c144a55652111b770f9e34c2cbe9'
         '01d9ae2be9853542f4f9894d096da358'
         'da78befdb0d1222b59d96f275a83ccfe'
         '5a88defe3161b6f62b7bc957f780fe40'
         'c979c21c19320c5178dbc20e0145a095'
         '9d3cc228f740e1ddd321913a212f2976'
         'd2f15fa1cb6ab3bfa4c61b177747bb8f'
         '91e3eb471430e3f726299333e3bec94d'
         'e05bfb7e0f2670241e19b10807940a0c'
         'dded0cfba6ff22326856b04cbd2fcd04'
         '1847c4e58c251226d4dca5447e474feb'
         'e17881f7ca1474eeb0ff119a70e6eec6'
         'f695002282803db8130bb82fba28c932'
         '1003a2fc83ceef6122d110f715fb75a0'
         '4746cbc8768914df8164ec33430ae316'
         'bcbcf1dbe68a399b350dc318f65b079d'
         '6e5318848f9b2ab8e60749719a862736'
         '0acaac67939be57c333e80823d6370a2'
         '587859e53fed891099b1002bb4857dd8'
         'd1231bec5c20f4ae4cda0585566521d2'
         'f18b776eb016a6086323c0649b05065b'
         '82e8a3a690d6ab2e75ec3ce0c43cc0fc'
         '07630ca655c989e49c83e6174a9c530c'
         'c932a05a77a1a3b857feebfa47f4429a'
         '6b3089884f897284990af622d5b77942'
         '510525a48b6135740a3b8a4683a1e3ac'
         '892bfeb010bfd8b86c521edd950b8db7'
         '1f6df44eeabc48908690ed8f25517e8e'
         '07d51de371ea449afcb3411f5f4b1bab'
         'b304024b5fec6cbcfdf2b0d0f3b642eb'
         'ab22816b3137edf2f1a382e91c64d6b2'
         '5f0a575409bd2661b89191e1a2e4b58e'
         '80b3e23d3b025de6a17d3512281c6b3c'
         '8672e4e854dd3c1b604934b3496c90fc'
         '5a232f82f1067b75db547b9430819b77'
         '2a1e8c7ad02628ea01d4e79f97e7fdff'
         'ff0188effb651548549b218101fccc94'
         '5b2527752769bc6fb94f46e607120f63'
         'eeac2f4d0b7f6620c5161cddeb6c0c8d'
         '51d2b6b39e3b0ce9de76972901c38f4c'
         '0859d1f0d829b2d190b7af57fd44875d'
         'e2bf7ada617b4ea4ba4e56ce49272221'
         'e2f14c59c10c82029629bf9a452880f0'
         'c2e3be81f909cbc8b7268ebd456ee9fa'
         '89e8fef544231afbf4a9f85092c3a6cb'
         'd11d8d4795b3f0e74abb02d9625d0b85'
         '728a4c31eae89c0486b171de763ef31a'
         '48d26b1fd9409d4c4085396258e8d8cb'
         '58dfcf24c3a04e45f98e9a72de41026b'
         '0adec15a9a277d581f449309fb88cca0'
         '82b7d91b642e076cc590e2a9aee04470'
         '48e831c2047ff1c645ae72873d7ec683'
         'ca70866255ccb79cc8b0d50c760e6a10'
         '1683c1d8bdfbe0b3ec32739986a7c5ed'
         '8572a0371b1728dfa610af6cf85c10ac'
         'd086a09394ede3965aede7df4a733af3'
         'c84dcd8211078d35323ddd9e342f277b'
         'be785ba597fec8e4736555c199acc97e'
         '46a2fd7e58e4e1746a21bc59ebedefa0'
         '4d9b1d9d8833cf8559ef1eb728366207'
         '6dc4b26e320ea6ee3ea783da27bd2823'
         '34d015306df95f7e07f872da129fc85d'
         'b1fb549d9b363114c7dca90b4eaa05d6'
         '42dd403232fa8512a311e92674200bec'
         '4bec2563ab19a5e60ed8c2c515ef3d80'
         'e866a6685d6ae8732705c1adad0fd823'
         'c09622f498594c49177c784b975ba161'
         '3d27c0eed834403e47add12548a9dda9'
         'd35f36f89a08a0bf8d99a58995d35811')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
