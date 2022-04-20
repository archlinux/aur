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
pkgver=100.0b8
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
  _url=https://archive.mozilla.org/pub/firefox/releases/100.0b8/linux-x86_64/xpi
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

md5sums=('97beebe0e794b40681229b3da145012a'
         '791174e311228ccf574253b219bb414e'
         'eacf06d651a8712adc5e275bd480059a'
         'e41cfaa31abfb1ddcd3669aa5b861c46'
         '58763e970e7760f0acc1640579d93143'
         '9fcaa36bed624504907ec8cb366fbbce'
         'beb697d7541ac0578734218d7a4ebfab'
         'afebdd7794b87cc4c84b5df687423df5'
         '85b8ad27b6d5ad1e97d9ec7357ee18e0'
         'e74620451b296de800372ff90ede667e'
         'eedf1f9e71fd8fa125293f55fe8c9fdb'
         'ec945ddcc9d37fd01e3e00acde48e5b0'
         '641ce636e991781181ff6c8d57e93eeb'
         '22a7d168ed546395bff178b4f2349773'
         'd31aac03291c1a620320f63e71f96432'
         '8bd8843a2d1c4cd43bdf419cac934ec4'
         'b5ef233f793e26d7cc9bce494d898cd3'
         '6acadcd3ad11a81b55470fd8d0f6be6e'
         'f5e134c559b521242226135fcfac4b43'
         '99d349f8400c5bfeca0546e1fb181db1'
         '7c908b192e6001fa3e8e6eb796d5063e'
         'a245c401ac70134989f0512235e82799'
         '70e7529235cd441d97b3ecb94ee256ac'
         'd6e1b6afd1eefd3d753517d3fdc02c9f'
         '1b1c1d579c9060922ede88088484fa14'
         '090041c8788aa82ea4f782ef25d160e3'
         '7e3691dab609d9716f56eb7a285f7735'
         'c567a973ff79d923aeed322a182a9caa'
         '361760b87b0590c9b6ee7ba9e8f1902a'
         '74e9ebbe8e04286e8d1e9f74ad90b1bb'
         'd79a4476914fe31a5f1bd149a610a7bb'
         '92300df969738d591c374af45d8e924f'
         'e05b9b4bcea0188f3751ffb1aa9cccb3'
         '4e69a77f0f1bc38a6de942e6da90a773'
         'a8f1a5ec4cea6867080192e7db086dcf'
         '9fa57869f39b0e71a5f7b78a393e1f1e'
         '79dcd3e4f4b5733e51ed1ff58699067d'
         '69a852c6cac3f1c951a33d8796f67eb9'
         'c5d6ef05ac6bbcb418214681f52c1678'
         '43d95e53a49bd4121fea6ca14cd97e13'
         'ac517a60b9368b6933d3bc6fd1133af9'
         '1c0e292a09af0da720ef53386118ca2e'
         '073f2104712740fa96c79b52833dfe35'
         '48b2ededd96bd2574f3db1f13bae3c49'
         'd63a4ef456b2019c32f5b24c2bdf7411'
         'c3e5b485800be2b262e1a88d63a54b95'
         '35ab124c19f30290dcdbfa59d0b19c8e'
         '9f3f17fad40ab7cf6a5ba1e7dd20025b'
         '188f353aaa0b107e3c8072c26b337041'
         'f00a215b6cb2dd0004239f33e813b2e4'
         'cb836f8240402f1c426922492761cd98'
         '3102aa38d4f6913ae83af16b25c3f0d7'
         'fe7f568550cbb2d7830013d99fd25971'
         '0563a08513290cf3844d3a650745dda5'
         '38d7de5389fcb49320e4b5f1eec2cee3'
         '41424218296e006d2e3ff6dce10a75c1'
         '83edcebe45fcf5535c1a982e539d668e'
         '9a50a8a0181dcac0176da9d8660e8798'
         '84195c117cce256b197cf0777c1bbeae'
         'b363040a3c7a110872bc298daf748c9c'
         'c7d9a0e32db0a6da4182d0e868a997f5'
         'eef54e8ec4b128f42841e61b70b1cb0b'
         '3ef0a34f3167cddc30ccd1cbd8ba4a3d'
         '3df659b2e6600e9ec33e084085ed33f2'
         '5fbc3f2573cde4c8b88030783d3e8b80'
         'de29dccd05d22b23e0535d59149ab952'
         '52c63b6cd108b1a4061e78d5c50ea2da'
         '9b55663caef3d08114fea5101e0bff4d'
         '12e48c11c20bd525c0c47a969d685d63'
         '66a5485b974f36c1db6d37d257759049'
         'e2448d61ba04ad252f85284185b4f643'
         '7593ac1e67158a18e5a33c69f6ef97c7'
         '51e957956c98ef4a93059894b3f2b31c'
         '6c2e02cd0b3c8671eae8be5fbb730c74'
         '4dba49613554c265b331ec887b3573ae'
         '9d7aafa18b51f0316e7a968c0603bc56'
         'f7ea083147bc12811125574f0e3936de'
         'c8e2266c0ed7993b5aa428673e05b782'
         '37237199a6f8c7bd74ce2cfd72d85d95'
         'eb5e56381eb8ecc5b2a6b42e8d6526a7'
         'a522d337eb9f83ceb9e16cd1fe589705'
         '78edfbe41f1319fe50e33adc4998af2d'
         '667afae42539bf2eca2620cb03266f7e'
         '06451da84f1fd5066ef8f17301060d89'
         '16a4caaca0296b71e7ed84ab1cc6f616'
         'aca902affa2e52ebfb5499145b893685'
         '213bc20548782d8cb32750103b6322b1'
         '2c97c827560aa3ea26882606eccd0941'
         '31d72aee570144f7d804646cb5660ed2'
         '98bd17b7ce4f0e7c49e2af3580230efa'
         '123d2e91e3d006b231d6bcbe47fc5d81'
         '61db944ed0907e108b89e9766e2daa8d'
         '7b39bdc42584d57fd83217f7d68092e4'
         '7a4428ba07346a3e2e28d8b9efdbf6e0'
         '6aebef3cdb8d65f01f8f3f497c0fcf5e'
         '4aac393420dd1991595870c6cb84d5ee')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
