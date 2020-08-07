# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=80.0b5
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

md5sums=('90ac00de8f2a657031d30c2a5f92be58'
         '391b26fbd9d2e3b9af67670b9bfff13f'
         '10937ef8fcd081f8eeb1e555066fb1ce'
         '4d530df02ed0c1eca7f19a0db574bfb6'
         'd919af5ce78ab977a6f5becb20e602d1'
         '5d4c0d6f8203341f0621ed265049ae00'
         '808a67f5f0a4be24ac26c1760ffda164'
         '7e01f796320affd76d67894ef34d804a'
         '94f4d5fdf9b5a9027d24ef45cd7d62a2'
         'c4a7b6e2b2449e8cf2fce31faba2c713'
         '382656c1fc09c78d85fd6eee83e4acde'
         '144891c0dc15f7f7919a125c4f141c2e'
         '59a4d5e4f059605fb9e1d698685d2d8e'
         'bbeca7c4121465e3b2496df37d4c52bb'
         '6401f598a8d57cb2df2ac1ce0cbab06c'
         'f8629cab9cabd2d6954361389f56225c'
         '2ffc805b659bbd9d73756f15c93a335d'
         '81df7fde734c51447f87d8d7b0c92e94'
         '336e29246897db0bc6f303641428389d'
         'fea120d9656c0306ccfc04ee34fdfd5b'
         'd12bdc1edece439c8057636ffdbcc979'
         'a187a682067668ad047b22f0778fc9b8'
         '31db5d5f5727b6408d3e92b0d75b02e0'
         '22280a80621c8b87337182b21ff67ad6'
         '3ae42b650ae878df4b6c4cb38da181db'
         'faea29009a2b021fc496e79c857b286c'
         '46fe07fcc941b480bcd52d5a7e971928'
         'ad693900ffd163410553c06da8f1373a'
         'cf64f9a9b6ac0be082eb874b88eb56c7'
         'fb45f11d0f0aa885e3c5b4b990f86fa5'
         'f117c6e67c0a8cc1af2213005fb1f296'
         '928b2eee6e697dc3deae6b51bff4c031'
         '9d98ba7f3a137d96a7474ae51b23da7c'
         '1431584691fe35d6f082837836a0be42'
         'cf93feb211b7b0c3cd4a9dbf585de03a'
         '052f6264e1a8cf244434b1a3ffb7c2d5'
         'c5b6598cf7ef389a5912d4b21cea8c1b'
         'd37ced4dba9e92e0ffdd9c07d0dd0b5e'
         '2146f588b398767ff9109c7d1f834b75'
         '3018398e4498ffc2bf502194f692563c'
         'b92cb2f57813070e5a115edb1bb7306f'
         'f7497c6b3522508f4d995771b9b5a3ff'
         'ae666a878ab9e71c2239852b0fbf5af6'
         '7dff26ac4c171e24bd38c9c25a40e1a9'
         '7b151ce10ff28a11f516ef0eae2e4a0c'
         '41ad1bf14be78d751033aac7f4ecd877'
         'd42588532acd447988173393c9ecdaaa'
         'b68291d96cf16754099cc7aa17cdeb5b'
         'ef099cc317ac6a0ca676151ed95fe10a'
         '055d8748e6d6cdccf6ac52b072d0ec88'
         '697729ac0497adbb1548945b4396d1db'
         '597197a7c0980bdd9db5525a6cc5cd3f'
         'cd23f5debf6a7b709240720170bf9eb5'
         'fd74c69f426dcb9a1b524af1c9aac25a'
         '46726b43e5ebc6f06aa0f11eea55ca39'
         'bfd57045db32efa7833156846405057e'
         '291bcf41ceb26cac5c25a23052d0684c'
         '018c026b9de0ef1d2d9d5cd9c2524f5f'
         '421004a96f839b13d430f8121f50b5cf'
         '2dfcfb539ac7431cd9b9c23733690f8b'
         'dcbc2b1483c3e447043b79d457446763'
         '672c59979eadbe337b1d46ed850ba807'
         'bb4d448c296ef744d671cdb4181c2599'
         '3113fc76914cb75439a1db26a6e50281'
         '99d9ae844bfe6dc7fa2f1f2b27fe3790'
         'f055abe7ede69f8edb1cf232258f38a3'
         '7627b29c0c0b8f15e85d8a2faec41b79'
         '6f4822fd48af307ba28246cb82c54d0d'
         'b17d77122b52639ec698909910409fce'
         '7cdc9bdb9ac759cba0ccd7764bf662e6'
         'a7c0ae67a365af577e092d9fe9187d44'
         '5f5bd62181e77475481731ea7ba92f8d'
         '99524be15e311c4adf5298eb82ec77e7'
         '2e22277d31ceb5c041d08b8be08531f5'
         'fdb972900f8b450089d691b8fc21a2ab'
         '4bbdafe0c9c33edd25fada5c09297148'
         'f994b844a53dbeda55cbcb75fd83d8a3'
         '2d3d8fbbae468a41743f0ebd37fb7e5f'
         '97ba1a42e9fcbd5ee9e1972b44a79669'
         'b28952d9e6cc36cd33e584178b38b2a4'
         '1dbc5cae052e5f9bc024fcc478a101bd'
         'b5e56f9c93d902d42614464a918414fb'
         '9c96dcf2034eb530d35d4c81782f7f34'
         '78b97c58e3dfab26b6aa26eafd28bfe5'
         'b46ea03c0996dc5746962704f7855820'
         '82287fbefd240b6c5519f39849b3dcc9'
         'ceda45d6800c97e117a09d9e8b401479'
         '440d7f7082dea369cc8ce167bd7d5ff9'
         'd3b095f642af1573fbd894ced8e5177a'
         'fd14e7d5a35244dc87135c872242f7d9'
         '6111cb42eb928003b7511557a3a2cee9'
         'af50419b94017112afebd8f9b7effdaa'
         'a8be43805fe3d28f912dfb9490e8489a'
         'cca5b7f1a45ca901f5dee062ffb3a29a'
         '7726b355531b439edb1dc69cc8b9ad4b'
         'ed9a2c0783a363e86a41b11157ba6935')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
