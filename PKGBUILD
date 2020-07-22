# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0rc1
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

md5sums=('6eead4fd5debe55b8cf7e74bba4e05f3'
         'c8c30fd0c5ec4633b7ad313a6777fc79'
         'f62d7877b4d4e83183113a0e41e91fbc'
         '02cecd43548bd46d617d84dc04f1d1c6'
         '551e152a78718bbeba1e371ccaddcfa2'
         '0a448e8428005e30b39dfde6d191dd5b'
         '6a866a66d9ff4d33339f3c5c19a5d841'
         '6068a4aafaeeb1b10a8322b30fa88d09'
         '2d6ab251c084e6171273f10fee03fb43'
         '2af2faff3ad8b944d603882f3f34108e'
         '592846efdd6b9a4db87ab49b11e55629'
         '0844575e7d9baf5ef115f9385ad6d60b'
         '5dbb3b9b81a49ca71c1ebeaae9916ec3'
         '9e481f9e783a176c3fb70a0029660fab'
         'e9d29330ff12c11530da72a816fe7e62'
         'ea46f669d15771bc1f1d0007439ddad5'
         '6734a35b12a86d3ab02c2217f0aa3b4e'
         'e073f57b80883695a233fffe95014d0c'
         '2a1b95d758f70162e4858182f13fa882'
         '8614e8ca5cb83ebe514bf8bf41fc2163'
         'e7ac9b9ce8822bbfee3eb76bdeb16987'
         '3211d7e7b746f449b003151afdd434c0'
         'd610dce0ddcd85ab071e384e99607c8c'
         'e20812b28449f4c74a93a841aa27b2b8'
         '147fb4faee1bbf86cfb9258d894b1356'
         'eaad925c1b6ca43c999f6b0e99a90a9d'
         '5f162bb878b6d7af40c8c2cef5d7031c'
         'e9b5fad58f0e3cb44686d20bd8c012bf'
         '80389a983f845b1351460022be599ab3'
         '01da175700161aac2f2c2d4353c4a9a5'
         '1b17ca2d03634fad4eb1a0c08e160de8'
         '6ab5045071421ffe22130dadc7cef421'
         '8ca89a94ac5975ebe51a41d0ef78b186'
         'a11600a0d950ac456d6c9122cf06a137'
         'f13827a1b3a0402c19c6b9d281bf1c28'
         'ac955a408a359b1a66acc9e207bfc697'
         'd0f6a49f0bae128f3e02811929d11ddb'
         '2bb6de20a7e3b253dcfbed9c92494e88'
         '04aae8093b1e2c6b113cd53fd69db182'
         '116fd0342b9b390a8071a9515953e729'
         '227849a89d596abea26625b3e1bde850'
         '0f82e1f7f19ccfd948e2b9f8dbefe359'
         '2411dfaaeaaf9008e3bd01fa7fc25077'
         '9efd25471c61816455ad97238dbf59ee'
         '3b698ceefb18b61d7d38ed43e8fcbfda'
         'b483aeb6af7d6c911d91d6a10d099ecd'
         '4906203b5d21a221e9df49c8112b2c19'
         '41e44a0cacbc89fb7a9c24954d028056'
         '3263d491937d830e740fd6f96d778c97'
         'a5819bebed5feb9a9f4eff9b272bbccc'
         '2e3189415ac0fac6dc3cc93ffdf237df'
         '8a8979118fba170b92196fff501ff469'
         '240cc4b63aa0c1079054ba3b978bfc6a'
         'b09299605dc7e69b6cd7a971757da6d5'
         'c2a7e74df5f0db4c78c99f5442e0926e'
         '8d74a5d228012d7b20c77d80e547a2e0'
         'dd7d8bf41eae5d691af4ae2c791804c2'
         '24692c2f40145d1baf09b038944478e8'
         '1668370787b1336eecb15876aebff6f8'
         'ab241806f74e19a8b758cf4adae49866'
         '0072f790d2d66b6a6e927151c807fba8'
         'e097302639703a69205243e49fdd8296'
         'aa690665e1f0e887617d8d2686841b5a'
         'a5ab7106fa4f6700a40fd995826d505a'
         '279d0581a0afa870a5fe8becac696a96'
         '2b8e7a7ed54a381cb4ccac92685e35e7'
         'bdbaacddbc0248a8e4d80068f531e1f6'
         'a396676405d741af8e46a787c81d624d'
         '70c6d12db91d66274cd88c5d4e38a65d'
         '994fcff9b4c49507891f3775e2b45424'
         '92a29c1aabc638a4eec6bbc9b8fe5d97'
         'cd6ba37efbf71f22c64821f1799cea9e'
         '1e0f6e278bc0506953ef750b2e143505'
         '0483a7bb78f1fca5713a9c9c5b83575f'
         'df4329a9b9d1e26f55b1e947705cc62a'
         '5e91c11b8eede6f6863b8663c84ab852'
         '4117c1d62516e20809e2450e0c888bca'
         'dfa21c6560957522d171b5a111c94f6c'
         '6313619ad3cc57fb43c2886e1905f4aa'
         '57c6bb7a7fadec99c22c042fae3befc5'
         '99ec6d5a2ed0049c9ce27d5e180b578c'
         '6de25bfd8a49996eca4b742d1555f678'
         '5910d08508d4fcf1d43faae65c84b236'
         '7ae67323ce4acc94a8dc5cd162ee9ab7'
         '37de030e121ad804caeb74c79270478b'
         '33869c158a25c8c17d6285eb909c1b62'
         'd7e89e3d314880fb619231295b8957bf'
         'dced12d2ea67d3b5c6179cdbd9c652a9'
         'b6624812b2e0992307b21346510cfc35'
         '179043c50bc9904807f806218200dd1a'
         '97d3944ae5f65e98252e9ecaea9ed694'
         '59f403adedb31691089088edf96d824b'
         '8a6dc6fb341fbd1dc9fd64f2fff257ed'
         '87c110501bf8d3fadc9d980f86001f86'
         '15aa5119310938729612152fdbcc4785'
         '9cc8c986795d580d7eb8f056915b40e7')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
