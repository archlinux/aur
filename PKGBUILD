# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=94.0b1
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

md5sums=('9210d0688009aceb9dfe8455251d2c58'
         'c1cf13b35ee2634881b1f64191d2d525'
         'de9f73f782f07de31c40198d5c45b413'
         'a6766f40876526d7330b318080ea4c89'
         '5484591e3b91530f9ea15d8e96c16565'
         '8142dbf919762cf8f946879964a6842a'
         'd4127103359e9d6a7a254df0b58108fc'
         'bcc81b4076c03c8fe5b56e665ed3a2d9'
         'e1d82b10b10a62e4b5a17ead15e884a9'
         '97d893e38ed977e87bdee99dd956e133'
         'dba2dc2bf45a2e6c6ee04e2465bc3cef'
         'f149f25afcd9bbd5bccbf5a9dc8a6739'
         '344709d931970cea92488a2c0db9f3b0'
         '9f0bf99c49a8e3bf1683e08840f97f25'
         'd4c792e54f51ec79183b0e9e621844c4'
         'ec7a5b6d18362aeacad1fe04d62e0489'
         'd3cc081d1edc1c8ba92ea674c711a7cc'
         '050492ed2df5eff1bd10f6b2ef28f0b2'
         'ad17e07446e5c761f7ba6ba1b345bdf4'
         '4222a89c4f5fe1d93475d1934d4441d3'
         'd2d9d7abb39f32470ed4541c0093fdca'
         '493561a30a25013f45dbb6a589b493c8'
         '7241bce3f7043b2c9ee7dbd07d98f045'
         'a4f2486d0c8ad56b4e1175665588c874'
         'd042568cc9c4e82f2850f16cc88d196c'
         'fb4397bffb1b1d638789510ba9c99c5a'
         '33ad4cb365a9c267c36cfc59c9d9c892'
         'e3976641d5d26c70c1c57d370f01b3ce'
         'c3d78600b93dbcc154f66015dc6fbe17'
         'ed53e46a7c9d898ec5da14f2d8edc16e'
         'd717ddffcf75af57b62192458288e506'
         '09c4f5ace5351d5784c40085be5ec355'
         'e633eaf1845709eea12a261f83cff3af'
         '5e3a5c421d04e9abfba060ac9aee2c28'
         'ac77f6d4f66f52bf36e408c7b88d95d0'
         '793dae7e4e7c7a41c90ab0c00dc9c9cb'
         '59792a90384288e4d60f3d8c873176ad'
         '2ba42b0e3f33e8f7fd80965ec6b0d8c8'
         '157f84d74bc315da777b78dc95ba5b52'
         'd191991ddbca3fa5b9d576f7a76f1cca'
         '66c766f7dbe6c6bab687f2dfd25594d3'
         'e22a4fdc84b2f2c4caa7b95e759be07a'
         '69b820849b44b04c2406f482b5c0c52d'
         '84401ce692846207c5b9aa0b55b20126'
         '3703132f4ebcc2609e619a7eb44e256a'
         'd395941b3a8587f89d839e7fc4ffe6f7'
         'e7da56419b486ce1f6adf76cdb046c05'
         '8cb4836225956ff3d80a4e1e1250eb39'
         'c354c62c61156c47cb27c9ab4020526e'
         '0d015dd9aba3824ca233669cad75229f'
         '32b32bb67a8745e8f9b555281849e45d'
         'a307bdc553e43ebc0050e891a6cb5176'
         '2f82e8a7550677465de510a12324d0c0'
         '358e7cdd819597ccb7cbf5dc5efa2ffb'
         '943cb8604022eb4b398a7c4621feb01e'
         '9cd156696c40dde8a681dd93dc1efff2'
         'db68d800c360a018ae24a42abc9deae3'
         '5f56f39ba6b2fbaaad9900177c7780ae'
         '97125723482507873944487dd4581766'
         '50e5f6d1ca3fedbbfe12b67de96e3492'
         'bd4c6cabc6771da6019fd078bb3f8756'
         '0b76cbe8b09f0289277c95ac035d602a'
         '5710115f1abdfcfe8945b210741f6ff1'
         '13aab9a7971644a83ddc3e2212e33327'
         '307b1fe75766f1bc8973cb837c3b8c89'
         'a3031265f8bd5554d01dceea637c127a'
         'c63d1b956de47bfc40a6fe86f766a887'
         '0f8f1fc2ed6a267eb41d08a7cbde5ec3'
         '4d144ed62585978406289293b78e21b2'
         '8a59ea3c222ee73d3cbc479e6d3580bd'
         'a77901459ac59781289d2d008953a1eb'
         'dc84b1ea17a7ab99f592622d9b70973f'
         '9929c335c9411e90cdd329ec2dd8b170'
         'f4396ea125200b01c2690689b396939c'
         '7c97699f14b4202b0b9a82918e71ea82'
         '06f4d61ba9495bbccb2fb059a155de0b'
         'f5c80914e2c96d53faee44963063d087'
         '7856382e06b9be2e46fab633a990e8cd'
         'ecc62fa1f41eed7751f9e058e28c0ea2'
         'f5582523fd23174cd6e6bbd12588a461'
         'd1938e256ed15c2029d7bce82ea5ea63'
         '4f37125cdf5b3a0fb42394e1b25baecb'
         'd262c57b23c1ac526deea5c0c0b4c5fb'
         '0a9ccf97f8ebd3f536426019d4c50e3b'
         'b3d5aa27fab5e50f5621c27242649bbc'
         '36e875a8317738ffb8163cc65d5521cb'
         '69f7197b5836e4896de4ba4606af557f'
         '304160dc219cd40dfbf552f09e2db793'
         'c292234a3bae8d17c58ea8749132a18f'
         'beca95ecd44846b3217c6aa3b45e3721'
         '85e606efbde4adbd12ff1228fc834f14'
         '43b74082344d4f04b7079a1aafd400ad'
         '9c48f594cf31803226a01bb20d8df859'
         '4d48907f09973a8b071775742d97cee4'
         '4ea1ddf6bd9b86b0ead69ffb45716557'
         'b279e80099dd70606eeec0768b7c466d')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
