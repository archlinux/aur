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
pkgver=98.0b6
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
  _url=https://archive.mozilla.org/pub/firefox/releases/98.0b6/linux-x86_64/xpi
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

md5sums=('fa7856641c5abf3f9202300cbc43e350'
         'c1c8e390d670fcb16c4e30ceddb87ee4'
         'ed6468afceb6d203acb35d4a5d3b13c2'
         '8663ba62a593656f02907db3eeb12010'
         '14d248eaafb9155caa046a06abaf95b0'
         'a20ec2e96f8f8a79744e35dceb9a27ba'
         '71981dfe97bb21068502f96bf15d10a3'
         'd34f9cce3756a4e2c59591cd73e4791b'
         '5e96579bc7ef7f845a813bd149cf32f6'
         '846b4d2123af9f95705a8b12a1fba52e'
         'c50a380420d529e6ebbe9afdbe4f483e'
         '78d900d461dde54aeb24d3fe37a3ef46'
         '175ca526df75b96847bd54a287d6546d'
         '5e923b5aa0f0717c65329c03e738739b'
         'ce3353d35e0d759a9d9c809c94f87280'
         '309bd976c0e1b8edeac3512cd95237fe'
         '162c778210e103a40ee1bde02402156a'
         '7822d6c37dfd1321425ade4ac6a55e86'
         '5eccd9ca86ae2c94d9aded81f1bb7e36'
         '8290f98e130a410792a690aa5e666bab'
         '273b8444cf200ea747f642eba1d23143'
         'd481564b4ef880f72b51982318839ee0'
         '14dd465f76eb4ad2cb58a29aa93594a0'
         'ec7c9d375fbd3767111860070a53b65e'
         'd265f9518c4de4ce73c70dfda03b91fb'
         'fd8553baf9028836fceb2ba493fbc5f7'
         '5eb85c812737dc33c5255a708956af98'
         'f4a1a64ff8bf7f16450e6e7c34debbb8'
         'cc60bd45471fc1dc2b83406743c6be9a'
         '8cac33a4638ef8f16088f2bb8c1712de'
         '5789f576ce33c8175465dc4e276e586f'
         'cd3b827ae7f03ef95f7c5955b7a755dd'
         '723b159ccc698a1a4c50bb6e0920fd2c'
         '225bbdb24212c0ad86feda81b03a59d3'
         '74b7b2f3f0c78583fd02b3a0b4002f1a'
         '7e33668a971f411284a5a3775f084422'
         '41a1361789ccbffa887dfb6b7c5ab4db'
         '1614654dfe3fe38493ab57b73b1ce9b3'
         '8c97de56990ded563dc0fadffeead346'
         '5886f2d95055e55d97cae0e9e1a4bc40'
         'd8165ba3b8a6ff703971d5c1b23f1ab2'
         'c1424748d42417a8b44814a6507b5ac6'
         'ed790c15e7ac5ebde6adfa3ecc5beca1'
         '6127e30e1b9e1e56092e76dfc215acd6'
         '3fd56ec0c47b2fa6a578e2bb31d93e7c'
         'd01ecec9df4aa3d65bb8dcc5569a6fe2'
         'f9eed6b3ac042b9f272ab335f3b4fb32'
         '08fb64fd46d521a277c54c527b89df95'
         '3b6845597b1be96df2dd0b4740ed9ea0'
         '44575ab1dc5bbe7b3823471b6e518f42'
         'bacdfc95b0c55bf6f060a6a722afbe03'
         'd65722c605a0ec233abb29c2e9ef4e6f'
         '279bcaca40bc7ab2a970e553d63d08db'
         'd2d3e039dad0cd00582e2f50a12e8f54'
         '90d184864774bc96ffc219156e2b15b1'
         'fe73a9eaf7cb125ee53a07f835466459'
         '538f7a4e8b8510939fd52f6a0457e034'
         '1b73affd45d7baf67fe53a9e87494121'
         '513cd82eab9fa87d17d91ae064fc03c4'
         'f433e6df711a2c77619e01a8afe12a20'
         'ac4807c09cc6e57786c36b092547ae20'
         'c422fea198123992f0499b27cb7f5746'
         '46c1e21d484495b4038658799c624b37'
         '1eab8c61fb179dfe57c11e623363b778'
         'e74b0170f85222292bc7e140e1f39a10'
         'c111bdf8c3d82e07ae32bb2d217a17b6'
         'd97807f81ed6f1399a10c72b5ffcd1d7'
         '2f3886567bf1947bb9d699650e63e3ce'
         '7d79c07ead7c35b4283099afb036fe9f'
         '63974effe7e991222b92202bb01f80c3'
         '04d3644780bc630a1520fe966abff330'
         '870a06a3ae443acec3ccfd9f116e11df'
         'be9eae3e39e8ff35096972ebe5cae1d6'
         'f6df0dd298aad7049341e05f952f536f'
         'a242b3f3b1c5b8b9ffc01dc96ccba082'
         '7b770e45f85f9a43f55bc74aad150b94'
         '76a96a2be01ec361a55346219656521f'
         '7dc3433bf46cbecf54d200999629ba1a'
         'ef397ce6d6a652c3807016d0fb4c69f6'
         '7d25708d6a6ee1e06a93ab618ca532d2'
         '7a6e873cda7ab5628365ff0caa96b59f'
         'd0d3442540aa8d8e44abd5e31f449279'
         '517352ba2d1312ce54c258255873b633'
         '2960f273409faa48fd72b1682b345417'
         'a91c1fdf3728c15575aa2e795284830c'
         '2966b727deba17e43da0eaadff2c2398'
         '7adbf8a9fcd450b12934d9cdcb64973c'
         '2b699573037432ecbaca98350f3957e6'
         'a825fa3cf634d44f7ca9730a72a97e41'
         '400b9e2b1e710a3a0ccb33927f33c778'
         '199f027a7a22ca8b0576992b4d6724e2'
         'e242196291afdbf76746a6d285ae87ba'
         '3dd21cab58281239df9d4062078c41ac'
         '620909b55e89d3dbbbfdfb69f285d172'
         'cabfc5b1eb6df9f4acaef7d3ed77d785'
         '9930f7a15aab632550f9b0191f75c94f')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
