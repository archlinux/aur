# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0b8
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

md5sums=('7c5cf979daebc1e026ec339828eed442'
         '8f9fa675f8512c3aeee803c15569f76a'
         '16f6c0431d26b3a09507e4092afd1f4a'
         '0b82304d574cef95d730e836d2350ba2'
         '8de78298fee05d8336ce4ce3f03e5e73'
         '834266e56f67c0a9de53c552e1b62fbd'
         '6d6d984507e40151969b85960d894cbb'
         '422a044c0f04f4b2b9e8912c90c86031'
         'cb174b36f190683d01c6e9d5e59b81bf'
         '5ee039f54b79d880afed2a20c052d356'
         '6e25bfaa5e894eb2df6d403025d9d4a6'
         'f4472315a4cdd7055128b6d98c865fce'
         '1f595fa94d618354b77cf2b2c4ce43d8'
         '4a51c0e30f4449650ae5c622cc81eb9a'
         'dd70fa9b9e14d03602577ae71494fe16'
         '6447839f4f05ee2eaeeeb5d24546a8c3'
         '7016de289ed01c166e9757904e4bc2f6'
         '6fd0634bf458f24a4041e50f000bd340'
         '0bfcc701d50cbd0cee6723069ad9e84d'
         'e3a1f8c8c528298c363fcd2701f8ff47'
         'f814840a525a324452f6822b854cbbac'
         '2aa89e7b784fa875157352355419e0ad'
         'ef33c80e3ab577b438a5322dc19dc790'
         '7a9c4a636eafe9aa59e829b2c4e88ab6'
         '5f474a9bbbcade2d846ed637b37a22b1'
         '2073e15a59baa5cf35221808e359ea9b'
         '9f0acf26204b5e7c319103f31f464a0a'
         '51d603aaf9d0ea2eb21644587bae1d03'
         'fbb0d02a0a43c79c3cf2cb84438c3f29'
         'dd022f6f6428af0951eae4865d6ccec2'
         'e7646b85f0a1ee2bec770a3a7993b10e'
         '6a98af1fbfe598d54323a70e1db052e3'
         'e10293dd491f15d956f2c8b31244824b'
         'be51239ca50af064ddd41458f7d15efd'
         '8be66d4cd5c74cf1b082497579896f7c'
         '46a900464407a9fb7e6914db644f6b55'
         '1de45fc8dbd814cb31c7b025430a4fd5'
         '5715fc9a17fa7db390434d1dc7a1deab'
         '0eea36a3449bad5763f50f5ec53c7d96'
         '176b9467da4c64df89cffa2b4581c32b'
         'f493985827fe6df82a4a8b745aad6561'
         '69cdcec6d199ab47f954d2e13254dbda'
         '3008fbdfb66ae35d56d3b13999be1734'
         'c68cfad468c5d1e6a74a0935f2cf5e80'
         '44dccd830d497ef13d3e73f75e7277d6'
         '35a61d71a277b4c57e4c561271f568db'
         '7d9899e61364fe1e9f0b09b6b27f6bfe'
         '7fbb87e079379287ccd186dcfcfdd88f'
         '934235d99031b3f7f96ff526d3b9eaa0'
         '044fd0d7d1f71046c3999f93f4be1eca'
         'e4fad104d910d8dd0b456e748a115ebb'
         '8043aa7b415ae24c3578fafe9647bb52'
         'bdab92d78c91782feb51485fcc820a2a'
         '0c3595496ec3f33670f763512ed7cef3'
         '846f6e8f9633b90f391392d5f43e25ac'
         '0dcc921897fe9b608bc336638df0d702'
         'f73ba188da9afa79f2f65e1f71fc133d'
         '7468c50e94d86aa313c2293606634b1e'
         'c992ca212482d7a344b0895dbd9ebbee'
         '160eefe123b7b58f10ed6b15301d1bfa'
         '90620909b9101626184c9b7d82f3a5dc'
         'aaea151e9f8e040f06c8ba545f34b86c'
         'b900766432dc0716dcc205f9d14260fa'
         '7da68fcc980da566f3b26bcd4154bf1f'
         '3eb15df9f32eeee15ff3258f00dce2da'
         'dc02182f4b6a6c57636505e2f4eee312'
         'af200f1aeb6abf663efc54b13de44be1'
         '8ce129289fa8cf14c5db527d55c27b51'
         '140b3f3f4944beb303f7bb4179248309'
         '414dc69eadb95ac51b5926609464a879'
         '9f6ec92b1a5883ea79c89a384cee486a'
         'b7f2b2993803675bf234f76253f0f14c'
         '278cb2745af6b9bf6c4310d528f23668'
         '3af2e4eef72adba2351bb862b30b11e0'
         '32fbd97d8ca785326d64260aae69139a'
         '5be9be6cf61e2fdde147f1e5b795bc6c'
         '56efdb58591e1a08fde5e143220b919f'
         '91d08bb203188015a8be3a14beb22869'
         '6bc046f59897623ddd06290848b250a5'
         'bb09499f2850c7985305510a89dded91'
         '21724cc76103bd33548f0b024f6a28db'
         'bc853a6abdd78917fa80a29f0787ff43'
         'ddfb236270efc9be8b28fb1ca83218f9'
         'e7bdbf7ade8482caf49bfdda29595c21'
         '438127258d39a4a0fd19ba871e0cc489'
         '548b3b08b6c9dafdb453f4852f333350'
         '11f7699f1f47522d0d57949639547e17'
         'cdce62e37882c4687431bafafffe5416'
         '1855f6c011a38fbd72282f63e4b67f77'
         '10d08b7be208be89775e1bc44459684e'
         '109d2fcfdd1ce5845bde2b87964c14f7'
         '6742817bd2c06dc6a1b0cef6d2b4e5d1'
         'ec7cd7aa09cac8e30eff8bedd1a3bbca'
         '44963911ba6936619abc194eff154757'
         '89885173b2d8703d1579e13dc10d7cf0'
         '76e3aac93f9215d4e4d346724b2d1832')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
