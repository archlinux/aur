# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0b2
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

md5sums=('b23d5bb93206339c088bf83d37e40d96'
         '4384fa492dc8e7676321556f14c36e06'
         'ded3155698e2c07c534058ad8d4ead14'
         '4ddcf38e91266e74dbbbb48efc4c821c'
         '919d8f98dc164e645c90ab6a71f168e1'
         '8c468ff70a347340da8f8188b5749517'
         '105971d4ae36822acffeab8a5d27e46e'
         '2231fdc859f423a0628c115fa0ae0a64'
         'e1708aa0bc1c065d23f4851587712f31'
         'd26fac7937e89df3d5ead75a736ab1e4'
         '4c14ff667e7886d63d109d7d3637ab19'
         '5fd77a7f510ffd51c8dd32fdc6971ede'
         'c063be0720bd863717602b9bb489519f'
         '91546a00b131bcd8df27c1b8a43d490c'
         'faba5657b7c6a5cd65f62e202912521c'
         '30892e42434ce25a150594a049fba8c8'
         'ddaf169d2cfd047db3f66b7fb1e37ab2'
         '3d8f9386c33de849d60fec4a6a58d015'
         'b1877215782e8669dc9b7bc09929aa30'
         '8c0fd4f02dd703cd2a7f0e1d0ddcdc96'
         '85b8cf029cc07ee9f01f7c5bfdad750b'
         'b487ed624d5f7a7075886306257c7814'
         'e2e4ae0ddd4e4d85258b8ab9a18d3720'
         'f100b19ca8455a7093e9cf361101e02d'
         '006f785303afc3c39e38e0dd34854ce3'
         '20d3621ff77dcd0f8f79c2323521e8b6'
         '9297a491d1fa61241a9f75b6b951efd8'
         '7f52ee8daca23761aae7b24fa1e60b20'
         '8120b128870479e666f7744db56eebe7'
         '8a8dea34de27cd331aecd8f1dd4bdcda'
         '324c6a934eaa9dda822bca41eb7e54fc'
         'e270347913555369c706f6ba81ef198d'
         'ca74df6d1355d228f869077cd1314b16'
         'c1c86e3e798f19bdf3251eb6e2f0f97c'
         'a59601142550c81286466508b4bd8f98'
         '06701f313c0fb8d0ba62f2edfe617550'
         '48dff3e2b834854ee5aea5610a8629f2'
         'cdc31a6c79a60dfcd35899e8b2a42a20'
         '951293556aabb35f12e0e3411246e441'
         'a12e690aa6e4112e9ef828ac05a4916d'
         'ca30d43e0b4e03677f09c87eac7ae7c0'
         'f9a00358924be714ac41da6c8005ba6e'
         'acef9fe12a4037ef12efdf96008c041c'
         '93e540cb184ce830edd4d2e44b80a3ac'
         '7c8d567b5ae338289fd71bd617f52182'
         '7490d3358f0e20c34d3674e0a9341f0b'
         '78b09f73697096665dcf8e99e87a8694'
         'e859e92d40419fd8edd67b66760005b1'
         'dfa73670a4cba4bd006ce45ff6aee430'
         'f130488e46888b2b7d0830ebfcb1e1a4'
         '18dfce648da7b93d83e534e19f05bd6a'
         '7e9c60236c3a9cf448595d0494730cec'
         '8ee1bdeb2de210696aaf594d9ff4a4da'
         'be27920b780784fa41dbd0acf84d70ef'
         '5b06be9242692a55a27d5f8155cea40c'
         '87c435d79a6ea5b1241648cbc875c819'
         'dfc3262966247d202937e26744cb67f5'
         '97b00b3f9f5c14e75aebda53c7300777'
         '59e786effb3441bc7505e2f5121b82ab'
         'a1e9ebf7d60bbef9651314d32adf984b'
         '282a82b0a991ca74ea57d4c815911cdf'
         '1be5cd913f701bba496c534ea97330db'
         '16785e864630891b9b0c787b62e847ae'
         'bdf70fd63818dd6b7cf0f1a870302a08'
         'b547ec856bfba5e611973e6ec45bd0c4'
         '91ced17c92002f2acd989832125e4d30'
         '81574eb36e842826a677f9fd9aea0d21'
         '6a401acca7220a1b2aaff7ff57afd836'
         '0afee91c59fa53c6d2733255fdc26b5f'
         '9c8999d8c6cb25c94612cf60a3164d66'
         '45b4b59b4746286cbf0ec8dcea41e80c'
         '0bb557e7335cab6cc0252bd78efe400d'
         '43940978619e8a955b08a94373a78935'
         'cbcd0432a47359ae01a9b953222909e8'
         'e2aed0d2c5a793e9d511801089365793'
         'a79ed25dd59036451aa82db3fe2c4311'
         '9e712d4cf9fa79457622e677ebc3c489'
         '81141c702743d6313661a5d5c1e997a4'
         'd9ca99b339e2216c1c026ad3f1af41cf'
         'decccd454ed4cf933207a3fea5b998cf'
         '612541297d53fb682a5bb58f4e670c6a'
         'd181327c5ed35c3a6f49135483b0f968'
         'dbd081e2746365a107620b842dd56d78'
         '80840295c299d90b59eecd1caa28daf0'
         '86d6f3e243cbaecf4382ce89ea01764c'
         'da5e50debac68fbcd43ff176209a1ecb'
         '4e6559ce2d70a686a668282bd9074d89'
         'd7fdae46d9ac8911ca8821f5789463bc'
         '3b7f94d4142ca2ee4ec0c034c05748dd'
         'eedf8438854b0af8c73483c51ed813e1'
         'c267f4b87ac3543089de04dadafc8ca2'
         '23865cd1cc27e6b6a25ad241d00c390d'
         '6eb870aa67ca1c987b2e816ef10ec61f'
         '8e11924c4033e8fc2c7944d01f53ca8f'
         'a62a129d1b19727ebfb8b66c25cb4f88'
         '35f2f47aeb481f794f5fc26c6476669e')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
