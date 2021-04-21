# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=89.0b2
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

md5sums=('3440b74bcc76b127859146105a7f41da'
         '96a3feca23e76a8d2b54af10eb9ce0f5'
         '7a98fa623b3e2547ff751fd6dbe4b738'
         '451b7fdf5b2767e4a2d8660ccee132c3'
         '5c643066d56ae08b1a90f15811bf1c68'
         '339c9ea4d305ccf2dbd3cc5f6f90cb98'
         '57c18a2ff49f66bea9ed071176dd5eba'
         '3aae38b9273ba23759c73ea788a2e673'
         'f6c79587d5528e7631379e5127bd00b9'
         'a57b9a5da82e47015840ae07ebb4d1bf'
         '1b6a579045d86c85e08fc204b1c97c03'
         'bc5f05d6c341a7ef2bb4193fb5fc85cc'
         '90ef7601aef646daf5cf066f4b533827'
         'dba876c5802225d4c7201c405bb8fec6'
         '7d60899a04fc64b2167b345bf1716672'
         '508720280c141d084269d78a5462d2b5'
         '7f581663ad70f088f5689caaa52bc430'
         '371422461c442447f43ed69fb27ff40c'
         '73b0354db7b8d12268573e71f5f9cdf0'
         '5abacc5d0a3e9ff3dd2b8ed7e165db0f'
         'fca34b5a05d8c40a9833314ac591cae3'
         '05adac0de7fca263773c83777b04221c'
         '7fb3330f8825c454d51fdb676e5752e1'
         'e28662108293a34b302a4ad136a6926f'
         'a9badaf9ce7cc85477597545f5ca8092'
         '31816c8f0e0a03437bd57ac1020c2b82'
         '69dc0ba9c8e8d407d87f18d33db1b381'
         '6e921dcdd7801deab992974c76131949'
         'f426024ba4add8b78fa71aadfeccb7b4'
         '0206a1297aeb98649082193507c6e048'
         '03de18e001f1a95d9a7c21c42f704f85'
         'd925ec14a10c9fea7cd391f8e17d13fe'
         'd37113b8519a51d1aa0997d1bd5bdd88'
         'e683acad70b9636da109e114e7df3c3a'
         '9fab2c5180f608839632649bbd8e1043'
         '02b3d16bf99a3e399cda0c6563d7545d'
         'dde3bfa119019c3952b0a95b0cc1a236'
         '0617502a7ffb96eecebea1f52d5ebe2a'
         '219e54ae73ef58ee2a81fa30495856ed'
         '140fbc9f85b0ac9524a4636d0008c35b'
         '4b8a8685e004239355b36113ed310060'
         'a3c88ba2be0bc9cdcd2f6b891665bb2b'
         'b08b3ce6f086b58671d192e78da5eb6a'
         'e72329de4377ed45c47db648f607ce45'
         '145f6c31cd83bd995fd4ee0b10989949'
         '02d0f603f0c0ecbadc4ae6f9765fd62f'
         '2bc2bb6c43ef7c1cd8b6e49f0b1d63f6'
         '10c0177dffadf586b704280ee138b2c1'
         '3763f05820c6607c60597f258bd99217'
         '92df9eac34aebc6cd19a2d82c3b07ef7'
         '7ef4bda9a8a55cc7c7120f7ce7236f06'
         '141f1fe72b6ae2b266caa4322529354e'
         '5286d2caac3369954abac09aa34f294b'
         '9881e9b442f1e07fed60b861692ac3ad'
         '3297ffe09f81038bc5525ad1267e1048'
         '74a6c5f1e8059f96a11ec849f5b88073'
         '1a2ff3d68e6c580f2b4fb2b82d371383'
         '6cf514be3665a134a06e8ee3ab22fc4f'
         'bcb6c8b1fa20a778f9572e9a942f6be8'
         '190b74bba5e9c3f7c39af888c4fe5edb'
         '047f9d148d1511d4a445ea9224173814'
         'd3dfca5405d3629682c0ae47a8fdd477'
         'a6ae1f2faa4416cdd89d5ab72f9adcd8'
         '90584561d01e54d4d5525aa2908aebf9'
         '8f6bb7e4b2d7140e97e9f8fe05074e7c'
         'd6d27444ad80c96f8c76be4cda15b856'
         'b37b16e5780b917c800753531e2995eb'
         'daf001a16f810781d7adf13d01e72d75'
         '51b11154fc995bd3956735c56479798f'
         '32d016e9b46bb384b49e036579d0c3e6'
         'bc9c62a77a2b1b850ca0f13d10a5409f'
         '1fb64381f0c6dffe632e9253d7d5e01e'
         '7b8ad11fc1bb729e870f829a852d5189'
         '19b98f8e20457c8f0284c93f323c2519'
         '30cdcf547c942fdd8b6bf7eb3471dd3e'
         '30a41ef5bfe894ec0d4e45358ebd8d84'
         '5dfa94dd7d7161c0c7d3772d628b21fa'
         'b1d98de976bf2d171c33b9ade65335b6'
         'e4f9b842718943eb59e1ebfbc4541c5d'
         '519223232b67df47ab85f56bd48fca97'
         '5c586eaaff86e4c3ecd9b1004c1a7000'
         '46019d7a4f9bfcd5c5a0235214ca2006'
         '7c905970e6b14d68981de8a839c9d299'
         '11d22fd386136cb1db8e9bd2caa98292'
         '53c049a91e44e54f85da47708c1ee2c1'
         'd8519ab025ba13cd0d6095f41fe67270'
         '19187d74ee0cf8089eee1da544c188da'
         '091b6278fff4169811ffd7ef8147c74e'
         'fdb94e22daede9819fef9efcb0d260e9'
         '263b59d5a0b50c6663e13071666d1950'
         'e80b70e15c4777654ecb5bc5d14b2ca6'
         '687496f81c4aa2004a1b84280cf288c4'
         'd6d8c1c0e0e8ee354290715ab96cdbe6'
         '9c4f742dfadcc65d596b4a0880d7da26'
         'c79c94e8ccfd4878569423a7ba569575'
         'ef02f54ad60fe89f23ea6da5d67b32e4')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
