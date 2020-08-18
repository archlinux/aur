# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=80.0rc1
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

md5sums=('1835282fdb1e9be8cddec029a151a15e'
         '2dd06e7fc4a3a380b4d04a90fe211cac'
         '76c0b6a43177017006ea66eda89cec8e'
         'b10fe12c8eac0013b9737cfa915a0fcf'
         '6b745492915a55a2e2fb1dbe1a9ce6d2'
         'c989c95f71d496a3cba8fcec2e12546b'
         '482533dde5ccfde1288a1d16db771635'
         '1cf4a1c10b0dec91f14d2772a233db12'
         'e53da5ae4b3f857b277b8c892301f8ec'
         '7d63cb7278c77a41b338fd1fd4e4c49f'
         '8fb791d8d4457d4036f5812b2231a023'
         'e993bb636206d81e0c636cbfea3cb9df'
         '465678cba340c1f895553c4283bb5bc7'
         '2fdced28cd884c5145b5963dde0cc4c4'
         'b283ef211ce5c7c2a066a624eaa2c35e'
         'a12408c616e73b7f8b90643e3e382ffc'
         '940a3525dbfe0ccf2af638a73eb9cdcc'
         'ac75c3cab3f8fde19d3c7d1e4ca1debc'
         '81f6260afc48a1b264cf4c561dd1962e'
         '573bc5b52e419990f1c042dbe20ab650'
         'c0016a8fc0cef67b9c04007af01b6ad8'
         '6c88797b61433c53288835ecf710e33a'
         '03edf46df56c345efa3fbc09e959914c'
         '4075368d3d8ecf568eae95872243c2db'
         'fba9f0239ebc5c475fab37f66f471b52'
         '1b41b137adf329a9a8782132950e80ac'
         'af4dc77a510986a7548760b7536e12a2'
         '1872d7cf1ff4ca52a2b373a61412e293'
         'c41c60d5bfe87bae8c1df151ed7b8c1b'
         '881afc4de208ff5b47b6d63f25401b68'
         'b40521cdd7ca0605a18d40edcc8efa75'
         '1fae8f43f78b93c56848c07cd7b1fe1b'
         '91620bfea7e9c435a5fc6a63d7aa239e'
         '1dafab22bc2b20bca523f7c087129eb4'
         'eac776933501d0d39c3d8b381b6d50a8'
         'b6e4d295c03458cf929eb9605eb2236e'
         'fec276e0289969f1c691d0f76432cfe0'
         'ac86aed52991718d452d092ca8f1b52a'
         'a9bbea3ca49fe2f06ead31be24ecacc6'
         '04bdef703c03ad41eb9f581290258efa'
         '26f3b6d9e9ac90dc6b5ba473d9e85e08'
         '653ca2693509cdcb5aed1fa2ac11aa48'
         'a173c3b8c34ddc8fd386b3e103ab0070'
         'fa10d7cd6156a25839aaa6373df0df7c'
         '31030059f1c0f644d1060fc0df7fa37f'
         '0960ca94c9e2626f5d3a5bccd5cca5fd'
         '541ac4576bc1ad5d4d4b46afd453cf66'
         '2bd40e2c30ef9b8278022cdb51c0dbf2'
         'ce14a265465b2189a53e3537b8818b6e'
         'be6b78a9b085c302f81be48ceef84046'
         '3ba5b65d63dc4c161073008020b3414c'
         '3605eec42e4750b60c1fbcba445dc079'
         '628aedb6645918df96c8e2e7176601a9'
         '1d049ea8b8893c53413ea9779349b2c9'
         '864a56c5aa9d68d6df0f2134c5e4a48d'
         'aeb0867778c65d5851b4681c67a19bd9'
         'c3c3d089f85612ff4d1ad32c1f9bbfe5'
         '6eaf108c4e001a1e3d939dbedcd28b0c'
         '3215d6debdc397c41481e33692b54bc8'
         '8b02cd6fa19d9f640044a5c2df92244f'
         '22726dc86a371d6aeaedca1153409ed8'
         '41daa7a43b8001ddcd83f12f47911571'
         '82c4b514d84ff31e8a26505ed25ea18d'
         'e05297f02ba3fe4520a627272c468796'
         'aa82fb2fa92eb4fb8d90e96132b598bf'
         '376ec795b190c43e970464ba3c0ad5b0'
         '29ae585a0ba10556960a1905eb27fc26'
         'd8cbe1188691868407a60da91bc145f2'
         'f829a48f524bbe1c6c323723e7fb18c6'
         'eff9d943e18ab18da20c13a7510e291a'
         '4a0f1efb14396838b81b4b5d9ff67889'
         '0b80c19676bcb9da72bfe3e956748424'
         'fc014b57389d2db7bd2860935af7003f'
         '93f42326ee3ca89945c3fbf2dd416f6c'
         'f4fc4383147ca8da967dd0307a7a34c9'
         '88cc52f9e2fe59785c386fce4d029ed1'
         'd913640f84e97b7080504c91a3ca5955'
         'b51178cdf993fda10692720c309371a4'
         'e4ee6d72d3c7c1bed899c2c7b330cabd'
         '9f7d0f0e952da558a4950799aacf2be1'
         '5a263fb4b8e0756b3ee1d6a6783aeba8'
         'e6e0741638a3d3c1b968098e7975e243'
         'fdb22e5ec9b1ec29c7508ebfa1e49199'
         '71b0326353cb3c97e896a33b5bccef02'
         'a97b62702b832745c2ab27fc32ceb914'
         'b6293d44158799f8112354a73f32908f'
         '28521d120a8c4bfded46a214fae4fc2a'
         'bd4eda1b0dd970368672a6248677f10c'
         'be1d12c574d207877d1104993d7324ac'
         '5105d570fb87ded683bc77c1a673fd41'
         '020d72fd984220e838e915f876d03ebf'
         '2c838cdf1e4f25c1b2e7989842eeb266'
         '0bedffec7fc7b34b700faa70956d996a'
         'dd50bc969253ff85876a0e172e4c8048'
         '289e34b5920ce54601b458e8e1f166f9'
         '5f369689abd8d73841de3f4c9a522ed9')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
