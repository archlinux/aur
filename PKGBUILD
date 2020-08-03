# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=80.0b3
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

md5sums=('13a66b32d7b635d8f2d71973ef275c5d'
         '226ca4ce4866b2dea250b39338d0fee8'
         'b80a2bf96e8f1ab9a7b8f2eed4ac6e09'
         '42f9a094918509671b830a74027fc281'
         '8cca7042acfaf4e1d4bbd86358497f43'
         'd1270e379f06d5d4bcb247fd51a43a0f'
         '33a31b97109d3caa046444dbbe7062c9'
         '362fb8a0066464a97ca15ef7a524331d'
         '902be2c12113cf810739bed1afd53510'
         '3693dee28dc5de1f5a191415cc868735'
         '87e5556ff3cdcd70c94bb49c34e22a1c'
         'c1d0f2ad89c277a04609c104c074fabb'
         '66261a60c3de1980534b64eea23956df'
         '416ea6fe81e8f24ae4a2d0ed940b6ce0'
         '4e43d8c776fea142a28308c19525c47e'
         '2e9e316f08db4979a18c95c807f9f23b'
         '0d2e5180b37d33bcf12d734edd4a8ac9'
         'c31ecee6647172853c1ba57beeae853b'
         '04a103f694b9070a7cb08703e6a8d09b'
         '0dc6ea1a4c31607188cfe247ac4bbd7c'
         '0e9670baf3229c67ea2d5e8d8f6de8c2'
         'f20523c66d03ea5c410d235b1d041378'
         '7702a15a0a84488f49c86efc6bdbb006'
         '643809b69fa5040fa2366c1aa13f2f52'
         '410a16993e37f0ffa88721cf59b6bbdb'
         '3bae8a4179fdb8c5c0cb9b20403cb5dd'
         '6d658aaa4573b6af3d434c6ec6042f09'
         'b350bdf4c3758751d2cc63d1f1099cbb'
         'f9fca362df4acdfdc6012206fb23269b'
         '7269043de5a3bce33e9a334b646692e1'
         'fb2baac9ef6cfa34e0205cc58f5121b1'
         '1ed359c92b45c499961016ad16fc3569'
         '3037caf04314d7e3d463a1502aedd6d5'
         'c1689cd2ad78a57e15014be82117e541'
         'd1d17ec4d0807424c110f64d8e5a0e75'
         '63d58a9013bece276768d5b1554d48ed'
         '701d617f03cd23c5ed05a529db4056d5'
         'eeb750b35708c950bbf9c37dd920dd66'
         '5c884da2a449c2d955a9b103b1f5872c'
         '32cccc27bf789b6c98c5402e24fd34bd'
         '04f305f030da26f8e6fe4ba4ed032c81'
         'baa088ec41a67110266ba8dd2f7f7133'
         '8b66146215228a8df2f8d3d2013092af'
         '507fe96a6c07da0723bc3f211bcd1c23'
         'ad327d2cde48c38f2b245fd99552fd17'
         '8eeb8b66442afb456a3ed8f7dc8f99fc'
         '66a09ac89ab89374d6c74f4cd83a6729'
         '40a7fdf7bf4351f6639ab6293bb1fc31'
         '3ee883509b078ccbfc336772ae862dbe'
         '9f4cf1102a98481950346cd8c24f2511'
         '1954f6762c39f2672f8176e2c1cf64b4'
         '1d0498af1ed843271a77d63987fa202d'
         'acd2377eb6b47d6d8e45591c10df6be4'
         'dcf9da795b1348c5d390e0a6c8d91d91'
         'a9615f182f1b3cd9c9eaed27119f7038'
         'f4c1f3865c0651f57713b33a1b302933'
         '682515599c67a7482080e14aa7146914'
         'fa5d24f3cf01e17eeb47879ca9f28aed'
         '0ee436c4eeedb6777a3bb71a7702d7fb'
         '971ff72b2b2d0e7e04931ebef6d52768'
         'beabf8dae5712e048bb3b5ca0552ccfa'
         'a7148a6486e7ee90f76713aa908a596e'
         'fc50b7bd573a9ff48bc607c7e1baa2b0'
         'c7a620dc42c604dcf2e505b664b4c1f4'
         '5b36eadb4b967795a302e6d6f876732c'
         '9a2b38c6db15b84c776d6aed28e28c0d'
         '2b079b8895f825a1b222e2cac59ca73d'
         'bb0c17a357e2bdfff61e883ebf6eb952'
         '596e3a052ba72ac87be4a1ab2d87cadf'
         '95776b653b9aead64684f6e1dc0587d9'
         'ccd3655cf0367cd1c6915631ca110dc1'
         '2ae60b91f12945f29688d681aeef2f5a'
         '4f5f96d8e3f2b9b75c9e2781349b94fe'
         '6eac16b4309eb72ddf29faf3ba66f760'
         '4e74d10b2ad53175020bf113157bf205'
         'd53fe1757261be1ba8d9d22d5e0394b5'
         '39b8917cfb5617b011ce1e617e4790cd'
         'e9372486f1b6e20e61035bcddd77e6d5'
         '831bc6c3ab33326334181ac480df767c'
         'd4f0379b0602722fae14d55bee2d7408'
         '4d14db16519dd71de20c99b89bdb672b'
         '44a69a095ff62ecd9eb5fa6465d296f8'
         'c3f35d8aefde3102cf7c5a37f91df0fc'
         '3393561cad617737ee54c2f5c2d13be2'
         '4f172ef5421d19725ff2361da785b051'
         'c11ae522b49000c83fc0da84df05def7'
         'd5b7610466710dc7aa5f4072ffecbfc5'
         '13621093da7dadbabf4891a72cbcbef4'
         '67c4ae38393fffcb2ebd404f27042257'
         '4b87d56012f34ec06204679d9d2c0bc8'
         '6996719059567fe0eafed940f216939f'
         '3abcac06fa117243ae8bf874b195cefe'
         '6d5924c3909422ceb5897ed57c9d17a5'
         '6a38d6ff2fcd61c9fbfb654afed83519'
         '694757bc0b7b0a7a3ab2506bf4410496'
         'dd22c484bc9316773a3fad8174d5b724')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
