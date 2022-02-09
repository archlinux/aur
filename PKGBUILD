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
pkgver=98.0b2
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
  _url=https://archive.mozilla.org/pub/firefox/releases/98.0b2/linux-x86_64/xpi
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

md5sums=('7d3c0f232749039cc98d488b7c0f5749'
         '23e76fc9374b8e85ada3ffd132ee490b'
         '7d5327771c6c778695e9067657967eb2'
         'fbf74fabd86d939c284e21510a836bc9'
         'c155a139ee1354e49e2f59fef7dace33'
         '3ec1d0d147badb8628b4151d703a4fb3'
         '5888a560c5f35f7c174ebbf4a876d105'
         '8fa156056d1fb4a97b381dabe14ad7e9'
         '1b7d2e7681824a7cdb5895be89116ab5'
         'be11a59442749b9b4bd62eefa528d986'
         '7491ae119f6bfa5a0ad163779b833c3b'
         'bae44289dde6365022be4ce5b3429303'
         'd48e2c032666c1fa52e6dd9644e9c9a7'
         '2f62580942ca45c153688c9d6a3dd015'
         'eac34a62cfbc0e4d5d5f32beeb7e038f'
         '943e6658d73cc806c392ce3fdbb4c19a'
         '98bf10367a4e67a8eb8a01ebd5ac3b25'
         'fee1880632780091490c02e123e413bd'
         'f645a47b5c8bf1ec569f80cc53a287b8'
         '078dec4e09ab1d11f6017a68ae3d7126'
         '9dcf8c73ffa438d97205cf7be492cf80'
         '06a7ae0551385bc80b9550aaaadf03c4'
         'd8c2104d34a805ef219bac48dc9cb978'
         'c57adb604a2690a4caf9d04915fc7cd9'
         '646fecbf7c2b08be804d1120f6c04675'
         '8d50006b17a85e18646526c8ae99838f'
         '4aa0f1e951db483a0c039faa61fd3acf'
         '9db0e91fcd9a0387c3212b803c48d38e'
         '979450d62b90bb4d4d8f4bf25037a9d7'
         '87d27c95affc0fced39218570a299dee'
         '3e928134bde6358247149b9475bee2a3'
         'f5de127b2fe795344115a890352c0488'
         '2657b88bd38066632f909ba8a01fea19'
         '47881eaa38189eb626fb1e408872e478'
         '540029b28bdaced2ac7243dc132cd3e4'
         '6c1d70fd250016810a41f2f7b8a18465'
         '120d8dce4b7d0b128acbf037fa00ade6'
         '7c20b90976e52613291c3da7cbd9f25f'
         '6fab1c138ddee56e6a9e673e44154a6e'
         'ac9b5ae992d7c1600dd3c8832c21343d'
         '7fd0b6775e3fb5a491c0604d7e8b5e15'
         'eceff1d25297dcbf1afeabc2fed12a09'
         'fc23d07e3eac4a308df57678e22cafe9'
         'b03052e448c1d51eaa413ee1595e4b23'
         '4c836f5d7bd7fbb8b4926c7ea959f51e'
         'bd02ddd287b51ada229fe1f21532412a'
         '14eb4c9582a42727d8ca2a31ef709653'
         '8ff90f83281a6aafeebbbc03dcb98afe'
         'c1e0fee8c64fbfc9db1079f2ccc5e857'
         'adbfdd1f4b9a32c20aa75f4a6e066262'
         '2556cc7c270219bebc12e79f095c2c6d'
         'f3143540dd8f5adf7430296eb2a242db'
         '45592179e874d20976c3ae63100e1dc8'
         '94d831a7922e41ed07984dd5d66a1dd8'
         'f10e28bd7029e006bcd3a429f52ac85a'
         'daf94ebb970321c151b71e3a195cbb94'
         '7b37e55a35eea51f06f427e14141232e'
         '3ee411ca3c488398f16694f8b392884b'
         '7dc815e5478cb00002dbfd586e500197'
         '8c4321e147f3f185a1215f63acf54afe'
         'd4cea8efc89c76353a7d35a95be8d8c2'
         '6cd1de6f604e1ed9dbcf92f4f867fb5e'
         '238829fa5d64706f781c961d83a9ace4'
         '8ba2d4df59b4213efc7806edf6d604ea'
         '0dd95c24c9d0cd8bc136352d29ccd70e'
         'ccb83c01b6829974fcd07b49c24450c6'
         'd9033221a3fed7107ee60e1e7bc8888b'
         '663bbfb651f53443ae430b08767f1c97'
         '5bd364ffd1d844411b083ac3ef650e20'
         '25df00e2977094935c1089db495e41cc'
         '85ccf99d1f32cccc62e489b58f09f7ce'
         '2e5a0d0d2878e708858e3b9169747618'
         '5a987238e823669568605330306ecd75'
         '3a321d88ad304d2bc42dbfa6a53d0e1c'
         '2dd3a2f0b8779fb467a2bb04109abd65'
         '454f0eff9e09d3ca3ca011c724c4bfc8'
         'dce62cf7e591b9d53c9a8d275f029035'
         '2dcd97989a719c44d014b56897f22c0b'
         '1ff79f4dbe7d84f353dae5acd537bb5f'
         'b2ef899626870e57ff97a85a004e5b12'
         '5a85c421470796ac56a95aeb03808866'
         'e22b75ea47c094bf090e76f5fbc9da70'
         '233a3745efca02f473801cb68e8c530f'
         'ded060b8bbc249406d5ca02b7ca14ff3'
         '10711f6dd5455b6163debae1168e1f92'
         '9a8298c7b0bf7e2e3d813135c9840f84'
         '4f4e82721cb16771b038dcea3d09e99b'
         'b1f86d3b42f0e74add1b9bde151bc85f'
         '0ce2cc657395849602580ee367714b04'
         '02dba33a672a501f418cf7639f7d149c'
         'ea14431389b885cb9d0bcb869fab45bd'
         '0efbbe46890ae7521309851747afc9d6'
         '308e163d147a7c3639c0ac3a52822baa'
         '4fc6dd8b12c888f7fd52b5cf55716a93'
         '1e40ccb6b3c775a487846cb259584bd2'
         '88b0c408e7cbd72ad26752a913ffb165')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
