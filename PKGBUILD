# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0b9
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

md5sums=('7e2e69b53409a622ba0cbb7f5fa6f12b'
         '58f09da8e0159468f5058611978c20f7'
         'aa8e1f4666c61afe39cb6d120967ec31'
         'c319e48b396b24456a8c784a1a3eadcc'
         '495d203d9f462b4554b3286bb154ca6f'
         '9bd974494ce583a949b4d5f1fd1a3084'
         '54b60a67527acc943c543c59787df915'
         '76ff89d6d2678d912d5c14cbef3aecb3'
         '8e2765bc9934913dc99ea8f836b4ce31'
         'b6db208ae5f50999ea734be8686a9271'
         '4b4a839c07abec7e913691ae13906cfc'
         '5c635c7da0afe54ffa6fdbab48a51451'
         '818efc0bbe4397ed166540d681e9aeff'
         'b45cdf88939265795b0fcda3c01874a4'
         '78eccfb57e29060dcc49467c3b43fa87'
         'f34953e41d24d0ebaab8e760b872da46'
         '14b56a974ba44dccddf9dd29dd14a7cb'
         '7f141f92ad22d865b77b230fcca8086c'
         'd385123bc9a2b193fa84c89530f6f396'
         'b5d63f046f5878bffe62e418318b3d29'
         'ca0039ded5a66f63761767d63e10c309'
         'f9a42607320fecf81d773642c6ac7938'
         '00cf982d1f6f0c80e00394e77de98ff1'
         'edfee9202b09aa5ac66b8cfe47baf9e8'
         'e72cb95b9f224caa638b95f733ebcbcc'
         '1c246e30c558465a46a83908ef7904d1'
         'df542d483e7528fb0ba081986e6cb288'
         '45676e081b59f041283943519659313a'
         '444a5e407f38888e3f444789f21d9eb8'
         '5d7186f42c3ad378123d1fbf37fc4bdc'
         '79e08602fa3072b163a0657d52dad196'
         'bc80f0ba886a0c81f16091817a50250a'
         '4cb92c750adc6e6ba5cbeba00839946c'
         '802d1e692fc3bb12bc7443254c16dae3'
         '7492bca36b8918f54ed600316b8b77c6'
         '39e82fa61b209da3ba211fd18200b25d'
         '63f72a81d365e884b33952b3604c271a'
         '052b1b0969e08a1180dc9a024af8e996'
         '3cdaafb52e66a89a04b7299c18b8534d'
         'e09f87e8a29bfaa03a56182679297a62'
         '46974c0bc6156ad1cb6c3cfc51546fec'
         '2bb8d262f949e7e5ff9dee30dc609710'
         '3383e4da5b788ce23863b2f43cc8b415'
         '08bee506671018c56eefe3379cd79db9'
         '34a92f2862e3ab268595f089657e03ff'
         '5e88ae2d6030e764ae7209adc708aa85'
         'e7291630344104cb85c8e7ea02cd6bd1'
         '2184d7d9394b3aead1dccdbd31476bd3'
         '6cca4e9c7755282f8076919c2a64d6f4'
         '76e0bfec1d9b3fb5b29a17c253a8ab93'
         '3a827522901a71e862588cfef23f0e13'
         '5c3d93b0cfdf6cfebe417925c71a991b'
         '1cd07e978f96e465ef04d45fbd6fdddf'
         '537e27cedcab6dd2c99ef90b1b9f8256'
         '8d2ed63eed273c020d8be845fc40447a'
         'fd76d748b42df8fa9381295121ad9c03'
         '7c4685c98a3a39c72262093b520cd004'
         '18b68238b8c52e8a0e48515ae127fd07'
         '32b49e6d88bf3b0dc5c08479d7448a9d'
         '1d99cd8f34d98115290381f5d8e01230'
         '6a2f39f6fa12b4b4d3c39065b1b0bb6b'
         'b9ae8bc11259f69930a089ccf6c88de1'
         'c723ebaf115ce4c9aead4acdfb364db0'
         'e7b570df449c5b4924d859bac9d079c1'
         '1795a7c842fc7d0fda6f09a2361e61c2'
         'be8439820b0599c626e3dc4e6fd9daba'
         '156c1296f61cae5cfec5b788b843a691'
         'b6c5e21293aa3df506daee4b8296520e'
         '164c324c4dad728e3d678012d46976b7'
         'e3a0b9e2cf095ce33e8ead973c196523'
         '5fe19ac52d375954566063878906c3a6'
         '8d83d47bc09906aa0f430ae270bcc62e'
         '6a778c7d0e972f416b428ac35cf25b92'
         '0d11d86f90179d8b171ec735417a3a4c'
         '95b65caae79d2ce07ec4f54f4665aeaa'
         'f68115a736118547b7f9310a468012ae'
         'b6757009ff08d2c9a417ac1b1fe47f74'
         'e3fde766eb5775d8f2e351edb9668909'
         'e0f2812f6fff08d4489d9b5480161dc7'
         '289dff15e4da5f74b14ba3497839f62e'
         '3ca7454fc28982d7500ee821783a6531'
         '78fe498b8f16f5059b8fd5709be42676'
         'd4ab0cada465fce955cb9c4547dc0738'
         'cf3391de588b44790272afec74cdc0c1'
         '36697fce330ad9f308e7edc49d855f31'
         '23675050e0d834f6b17912624ef48cce'
         'e8c4394badde84d94d378b61eda425f5'
         '4c18b8949b237e68fc4ed279e78ca13f'
         '29aa6dd78182b84423d494743debd3bf'
         '01eec1ada4ae409b39e47766682e22b5'
         '7425b550ebfe74b4f497d053c745d4e6'
         'a8a23402fe6eaf234a244f7a0b80390a'
         '457cd79b2a4539c8eba5777f1a73c9af'
         '88c981c74b908631cde8dcef5a1cc6c7'
         '4dce1f1ad2a99d591f0e3434321a970f'
         '90a8e75a30d06535c81e4cd5998fb8d1')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
