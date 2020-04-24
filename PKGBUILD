# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=76.0b8
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
      "$pkgdir/usr/lib/firefox/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

md5sums=('dc00c117a8839291c4492f43e387aa96'
         '17f6bd4acc7923d2ea410f1137065a16'
         'e7f36f255d21e5d69b3031d8b956ff36'
         '81f2379e6cbca101f8807e0ffa29258c'
         'ec6ed28f4f79a7aa167e53ddd70f3b9c'
         'd22593d5ece376f1e906cf716aefffcb'
         '255136bc052a3f63d873b0ec02bbc4d1'
         '7971c43d1099b0afa3b6987a0470d293'
         'a1273c39ad7aa365eb22ccc658d4b47d'
         '5394570568e84fa01d4f99989d714f95'
         'a2f85c33f7ea70d497ce447ed2a49d3c'
         '19c8de063c381c1c3ffa6e320b28e58d'
         '376b1ce9a310e27a7ea14d7726e79f6f'
         '8cdd61bd57ad7d7c3c0988610b33f89f'
         '4164362d03c8d8dbd154d48133d00678'
         'bf098daeb0a3c69ecfa0e28db610437c'
         '82658e653dd14ef40db8a530b9770e3a'
         'de8d749b860a1f290bdeb7090b2cfc89'
         'bb258f5ff47a2903a9b331099ee5960a'
         '85e7127a9b6509f4fee3a4ccf712d0d7'
         '6c347449c19755e99017aabba741f1eb'
         'd6f0782e1af016908cd7c329c914c6f6'
         'ab25e47871797efa5651810525c9f605'
         '7b607841bfdb765365e1ccec240bd77c'
         '5023737ed32bd5f2797225c076875361'
         '4abc39769ef43c4e2d190b75d37a682e'
         'f8ba6791566d4345afe4bd02624cbbf2'
         'c5f3203220dd28dbe4a873324579fa90'
         '82d56f4910d07b4dcd1edd167d56778f'
         'c30fc8754901be412578dcf08b799619'
         '0dd7dbd5a8e6ef3feaf7faa38a97a185'
         '755230e4fc5848d1efc725ddab94f290'
         'c8eda08028161dcc9e0cdb8bccc7ce35'
         '4a61448ba909459aa749bce05d8d3baa'
         '78e8a1f8dda5ecbe6c60fcd7bc114cd2'
         'af500f850bab6da355027fa003173b2f'
         'faf511bd5e59050a3b9bfee50c949476'
         '94a6a2187d92e43f7a3e0f34da9fb446'
         '3174b106ddbb3c4849f3e2c02be4b77a'
         '47655feda95412c6c0831887c7680bdc'
         '9d89ab534efdf8600f709632707c3abc'
         'bccf3b07302cd3abd21da6caf0b39fcc'
         '936c2d164c4a4bf8519cf603fd649743'
         'b943ce4ca2b1b7410729f23edca2a950'
         '96df9da260b362fc18add62a7e068c81'
         '02bc917bd1e15dd1c3ec5648b8cc8e15'
         '1abb7d552b4713ff48bd644674adc736'
         'c2371a0e2acb4c2cbe091ee6d50b5da6'
         '8c36756ff3ca67a39d1086ee43a1043d'
         'a855a48a8fff8bf4f4a09b3f659789b6'
         'a53326d4d94e9da1cbac5e28ab391a63'
         '2eaaa0a9be8e6024cca8a61e4b10af2c'
         'c5b5616c0badf6ae1fcbfe6ae324595f'
         '8656a2bcd2456f9526a1e5ef7827aa8d'
         'a00523d08700468d83f8b3145e4bbdc2'
         '04a7063b0b9f78dce6735f52463a53b4'
         '6279c2cd847e0bb5a7bcdea017f6d3bd'
         'ad21e1dbaa73df9461618cb40eb672ac'
         'cd8c629d3a283b327d85cc39fe70fdbe'
         '8a8793c947d69cf7368b4d1972925827'
         '2fde057f865ee225d0f491f642168daf'
         '066e8745a8403a6870c6133e04976913'
         'c8309e2cc510c92ba0d0babe8f12c2cc'
         '44d8413e8dcda0dac1316069a2ac2280'
         '510612615b38857db19a04add1aa04de'
         '7cff97fe9bd838cc1576f4e870266ee1'
         'cc19b8453a15fa621dd394b7dfa6ad8c'
         'e56502effeca3df0b95745f5fbf36b58'
         'b20313df812019ea11fc97ac8193d183'
         'f4cbe665f0ab62faf072026c5dba3a5d'
         '5a2c0ba0b84d094b2952d0a21dec0f02'
         '7254622de96db7694c8ea7c279f35a47'
         'e6d58db55e9c56a905a9fdc641b23731'
         'b66d5f9ba18d8e35d7e5321868de2167'
         'd726f20c99c38b41235d95039a1c7770'
         '209a0eb53db6ad2960b1141b70401c59'
         '9efad1028893ea2d86d76f60495a228c'
         'e9efe126d4b2a88a001d8bc6691456cd'
         '29a6f80d2bcde4dad6e9369192121003'
         'c198c3d0b2b57505c1568953ed4b2a7f'
         '42a3f5690c6fba357703ddc37b358bf8'
         '9c94422e3d118ac572d94904493ec00a'
         '398721bae2ac526488793b1c05112735'
         'e81d8d73c31405c6abb789fe6e24c12b'
         '9671bb1a74add60240ce821b5cf99e6a'
         'b17135566332f788beb9da26494b3fab'
         'ed4a125eab8a0377c0662c973604b0e2'
         '30ded552e8fabc692e5444aaea5dfc45'
         '4ff6f9e1cc1507a29975e0440a5690c7'
         '092e26767c28d4a9ef24f2c1eba59339'
         '0a478d374debba39bfb87df264cb2afb'
         '9bf21ea22af1daa3c9712a9bbed9a083'
         '164ce94a079fcd0e1d274c45f515cbee'
         'f632fcf9bb5e6b4221c35a9be7232388'
         'afc6e0782435a6d8664353c69edc7a8e'
         '7366ac897d72b6a5794b43405087eadf')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
