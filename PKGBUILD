# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0b1
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

md5sums=('d4d3381351b029bb4c8625bbe49100d5'
         '4aaddee33567a4772d59c1a64bfdd0a5'
         '6c6271fa79e5176dab6e1644e3592e8f'
         '91b624b2457c6b5c76eacbb124892783'
         '8ba2b4b735b95defcf526650d09d5731'
         '73ac18ca2dcbfd2f746e01ab68aab71c'
         '1d91682f3d7e45cdebc0f47454db40b5'
         'fc4230b981319f8192104ed975ca1264'
         '153a8e1ba51b4e39c58d54ad7c41e65a'
         'd309d7b958bc6e7625800157100e31d5'
         'cdddbec5d9afaf4f24621c989dd1b5e2'
         '1e7ff259d164f83ceb9d0ea4021429e3'
         '5ca7b9dc489124368b0e3bed947fc8e0'
         '767c6ebe35e2530c89d67539f5193a0b'
         'a484022cc09dfd7c7b2370ac55b32d8a'
         '3f366e2865fde0249e1a9ffea1dd933f'
         '7978c71251dd51f5cca9c174ff139c56'
         '18a2572792e46ff8ea1490278b82c350'
         '2236e85c5038302623b819d85d7306e4'
         'd4e5b28fa22534bceaf2456360adc260'
         '888237b6c314edad597ed6ecb8c9a34a'
         'fa18582295944089dcd9fc095a279c10'
         'd237fd2cfa0d96ab068321d121a939f8'
         'a727e340564b055e8f08c83cf9cd8425'
         '2a13398c93377c806ff241d53bc5f953'
         '537c2351cf521d74374a9d3b7bc422ef'
         '132aa01330a81c0acb18a29f5af3a4ee'
         '4d8eb5f9973c805f5e54bf451a4b0401'
         'bd15f5b0b6a19c4f5c54f7af61cac3bc'
         'b922ad6fa2c96e3dcb31b60c51e445c5'
         'cefe4e3a3d6ab0961ed574235e7f5dc7'
         '3f9e0020145a425c7d718443fabca5ba'
         'e97e46eeda5d379f10281f6c04882dbc'
         'cdf3623ab22187a774e68d6a3d42b06b'
         'f50ea469a8c94e9c88fe37d75702741c'
         '18f57bf4cecdc856a9605dc95cc5bea2'
         'ac0ec0e848fbb9049bda3db85dee9aa6'
         '596484595f8d960d208a24d713f1b661'
         'ccc1f4aa7f4a25daf5e13ce374ef7781'
         '6d5c66539a864e664390c986ea19494d'
         '4073a0dcdcfa7e21420f57d7ea1b3b5e'
         '02edefb9aa62c9b3eab6d512377f5421'
         '6422c17d579b49f1d9f33fba02f1e068'
         '460e1735229a27ca0e3017e583f6884b'
         '3cdd358d22b0830ba897c13672cac3d3'
         '1b7a539c61a7c23b07434b040dd985a2'
         '20e49345327c2d5ac8a9a06ed3820619'
         'f07eae428d3d81b3fe0370ec80458e8d'
         '93e03895aef5327f28c7780a975b7895'
         '69b43f1911bc968cdf477b70df94ef38'
         'b8cc623b9d690b864d2f0ad9bc587601'
         'bce736c489810bb413d205c56d782a17'
         '7fb46c5716ffb7134b59ca98e693cf73'
         'b8e151ecfbe19be572371395676f80a0'
         '0e7e3e463a0e5167e3a40d14d49e3e6c'
         '26cb21b246ab9e9080ee220812ed0581'
         '07d1486c93cbaedab8c2034d857ad9c1'
         '0903b35fd4e682f257a9babeec60a347'
         '733c3a1cb3e14d7196375317e88baa92'
         '2e4a2dbd942761eab1ca44ad5432695d'
         '4b95b3882a71ce0e049ee780fba9db37'
         '22b43b58d4b49c27f25f7a1611bcfc48'
         '9dc194bb16032f072a2b4855a25ded32'
         'adc628a41d1d287e2adf453d789b91b6'
         'c63ec91e0b4ab05358381263645c390e'
         '2f5058d923299d3a8f8bd22bcee7a72e'
         'e42f8270fbe4dcca1ee53afb5d64cf10'
         '00b734742e8c6947d8967a2b8a44a3b7'
         '1a06d32383cf71730837ee68d4e8fd77'
         '2a0d7db5dfe0b62a58cdf8aefb589d5a'
         'c5dfe5de897ad37030115dc43fdd7956'
         'f122cb3a3bc3fb5aa69c9d7449daad5c'
         '4f529bbaac82b5da60dd7a5a8a104487'
         '58ff7602f7788b5c6f8895414cb8704c'
         '5e042b3ee5007d06c3a06a770061de37'
         '61f121d957d6ea032eb4611a4106a52f'
         '27bb0181508f53aef363412598035bbd'
         '96468503a5240e9b327b22f07bca4677'
         '5431fb89f16276b451749a58c47ea2d5'
         '6d1561f628c8d54fbf822505032da3b4'
         '84dc3bf90bee50f8e50305d81314f7db'
         '78204d764f77e3551c1fd7e7aa090920'
         '7d6edda84d1578a168053e7bcae272b7'
         '39f1dfb2ec479c9ef973dc0020bb5c4f'
         'bbe9dce89f82a2947fce660e4588817b'
         'da68c70561b8e9061c31aea879aaa400'
         '7279a88594c5f24d456528a23eab0a10'
         '88b4aa63cce5f3a8f6e64d4850a39b4c'
         'f7725f8edd71295e7f822d1aaf60fada'
         '61d96bb73c0ae42e3f2143cfabe7ae44'
         '2a9dccbbe2f042976fb354dac9b621cb'
         '30af5eab4e91fa79634092b3a229e804'
         '376f8e4209b4844b3050d22602bf5cda'
         'b8e27d15b058f42a1d843f34e716581d'
         '9e87b94c7601e4cbc85698b0de3bdcf8'
         '4bd9becd26dd5485a0d4c096ff009304')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
