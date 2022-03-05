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
pkgver=98.0rc3
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
  _url=https://archive.mozilla.org/pub/firefox/releases/98.0b9/linux-x86_64/xpi
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

md5sums=('b348d87a2b06c1b868169882bc9199d8'
         '891358eaef69c71d4ba32cb78d1e0f19'
         'd39503139de51715f36a601d33ef87fb'
         'd8a20ebcd27a3944fb501a20029eefe8'
         'df65f4c29df3ca929edf37c537955cad'
         '17a93ec610927ee3755ee764fbc8bc48'
         '833af5d79581833fd3b7d2fc2211fb53'
         '3d46efe5b6d8a1bf93f2cebdc88f5961'
         'aa60855afcf88efd7f57a926175a5242'
         '9533271b13524939524130804b0e2a08'
         '1131b634944ba658dc9e6c03fe31c166'
         'c1aaaa83aa82ad98d52aa62f506b8ed1'
         '248a3257a069d2048d1b63243ca24af0'
         '064881d5e562baf6a55edc5725140b42'
         '1e4eb8db7f6f076e8433175b429ce78a'
         '8c5c9d6e1b20fbacb31bb864ea18f393'
         'bfb06bf3881d85850b86f559e5183027'
         'dd45754c5764df647de3e02fd39587b2'
         'd84aca5ce57a7dc1b75127383b4c36a6'
         '059ec123449e6200d897bf3564248750'
         '4440e17a42d8a5e9f57bccd8654ff44e'
         'f9f424582608dec13c53060eeac29788'
         '5b481f4b63269d6a7681e080220dbe73'
         '80ee8d52732ff22d64681a4921d9435a'
         'd620c6534f87d91724c83cd86d64342e'
         'b101d3dc41d88212070589282d5a3f5e'
         '9dca03d611266ca915cbb43e1be3b889'
         '4cfd8bd3d29db9b87da869e7ca3eba89'
         'eb1802288610cefa2c66b203b54e82af'
         'ee6e15c0ddb7f75c2945ad947514425f'
         'fb6d018d6edeaa6e96b71d68dd2e812b'
         'dcbc161e8c93a206ce5ba3935ffddea3'
         '6a141e68bd928e24fc60830c76e477e6'
         '92aaefdd5c07569c470d885830c67f51'
         'ad8300eaa00994e6b799853a3d441004'
         'cb23d0f0e597fb9e807ded295ebe6562'
         '9bfce1c2357a882cc78f3b0cb1ec6864'
         '047d7eeefc44e04cdc576d420078f0a3'
         'da70107cc7ebdfe294207abdf81a2ad7'
         '7a6cdddc0ec22e93ddd840f3ce1cd653'
         'e3eeffad4e49071e744aaf2653563287'
         '23df02c2f70653309475ba88eb2510d1'
         '74fc9ffba91353a0324f03e815669462'
         'f99784c50e9ae2610356df96455e35bd'
         '960e65acb3c2cda23676a72684fd8db3'
         'bef193936975ac7606203eb309643d12'
         '8425f2685ebc724cd9b8483ccd9569df'
         '1fe7e1b13f9df599f3ddc3def226e558'
         '90daaaa13583b7624d3fdaf03837d859'
         '6289ff634cdd3973d69a76d6b8d7e84c'
         '0883a2c3bebbe145d7d1da008125686f'
         'a8e1f9aeae28ad3f60830e93750f8acb'
         'f3a779a3df9214a51ca46df0b7d20729'
         'd97e631a9a8bb34d7cfa4fe0eda6877a'
         '1a225833471d676c2d2dde32738bd1ad'
         '6db5a55fb444879e97e4988bd87839fc'
         'df6d8ecc49d728c66c4addb68ab9b0f3'
         'c31c3bd1d561f33ce2ef0c16eb17805f'
         'cb11ef419981402f9c87c02eb3601956'
         'be0ed78912619756cb640c382e21f977'
         '0d1dd390e2ee69a36d2301fb844df3b3'
         'f304376f2a5e311ae106fb25f7fcdf65'
         'ebd1815b6fc92293ad2faf029c6f0621'
         'df3caa69ec029bcb7a9b49efcae11bb2'
         'b81ad92e40e4f4700adf141735f32832'
         '41fa403a4b2227b298e09006c7fcaca0'
         'bb3f7d10e81e7b998222d4efc0549f9d'
         '61d5786afe1453311c8c1b2aabc8df61'
         '67526aa85910f61b4ee2cd8776045eb8'
         'e0fdf1d862b45f44babfb09eea8b548d'
         '5dcf5384b101a9609edb6654ca02c129'
         '9071e348460201bb1bf8c3cb7158e5d4'
         '04b8cc1b1b91c01e1e5e22e8e3845c9c'
         '96b9c12013f7e703a3f328492c075700'
         '1f3f63442afa9414446129454e610211'
         '0bce48a13f2e5f8995dcb1c252052851'
         '11efe70cbc91efda542f0985037deee4'
         '82a7317074584f74e4c4510b9546ad56'
         '4cf1147f79d92e3f24bf6a5898050860'
         '24b36741b7f563264c16f3b83c610f1e'
         '5ad8cb078b959a377dbc123c1091843e'
         'cfcba217501fa42b2b1223fb6f414ee0'
         '96d8b0b6be768fa496c7b150175ee12e'
         'e0880a6e60ec9ec4ee791b67a4e19385'
         '65e23b162993841ea86879ab4d7a6784'
         '4a31ce1f977e6ea5dc7e3c30b2d90920'
         '09389f80cab689477f62d1c3d357f873'
         '983f0b53aefb8cfd7ee78ef01027868c'
         '9efed47fec566d81f2e65db40bc50f75'
         '2364bd43c2c97ea974857fed275906e0'
         '7d0d950a204bdc29fda4a3f86be76f01'
         'e39d0a0ee36df59a4a6f5150feef325e'
         '4f1b77432e5a6369311f67cfc106bace'
         'af028bc7dcea4222dc61cfd797f04f3a'
         '0674470c285b40b996b5e9709c2fb36d'
         '310073d803781ea1deb4a49b01dd0ad5')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
