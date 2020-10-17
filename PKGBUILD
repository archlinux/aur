# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0rc2
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

md5sums=('aac8ea11af6766e61cd46f669d8ea317'
         '22833aa35b52cff45b8144ee14a13e3f'
         'c9acf65da5296009f07c214dd07a4414'
         '19a9cbedbc7ec1a03e4edee32be3957f'
         'b799fceb3b609f83c8e5b0af207ba0b2'
         '3b4bd6eb7fa098c364d926ace6e82822'
         '8fb1cdee97e263b726fa1380ba7190ab'
         '453d97a61cc120f05e5708ae87ffbb54'
         'f163b0d550de44871f7da6a075dff164'
         '27f3c919eaed665df5ee9e91bdede5a9'
         'f1f3b200b5f4cde5a3f1e30082382626'
         'f4c8c1d3fc2af3ed1739e0b0383aeadd'
         'd63490fc9bb72fca37a226a3dd7ddfe9'
         '52a1730300f45f96ebe078cf9349ed89'
         '9bd9d0e1d260ed4036748cd8d2b3f397'
         '8c41e7ed5de31ec5c618dbe80eee5e89'
         'c87e527b43cf971c25a9ea0a81d0d3d6'
         '738ccb12b2f3d35413a3ca483d8b962e'
         'e7bf0bb15800695e43442c89ea4ead0c'
         '0b6ebe92e47c3f272987c4cdecdf8873'
         '134d37486cba40b8109ae42b8020342d'
         '72bff266b2bc995c34e128b60482434e'
         '2aa192b8f28b7f5e0eca0de248608574'
         'be868f5ddda00b982ae2de4bc59c42a1'
         '1366dee8dbc670eb39c8fa2d920d711f'
         '891046693e112eef256f8d18222f4a31'
         '9a6e3583eb51a873feae808d0eb4893e'
         'dd2bf0bb96dce03d5dd55ef2551ee786'
         '5d4d95730cba585e4cb782d6d3ab12cd'
         'ddc41d9e698b665dd4a5fea67c6b0385'
         '042c88cc31970dd0c3ca5832af363b1b'
         'd06156eb868056fe9c7b8afc78e8d57f'
         '4d813192000dc7186e6b426add3245a0'
         '02d18c45163f0240ef6021f682fba3eb'
         '7efa3b182929e282bab1bdf82fa3b084'
         '824a8baac0b4d587b20e13a66b6de5d3'
         '346f306a0f7c1945d96be78b3d4e1577'
         '4277a08d02f6b47596efbcebff45f025'
         '2fcea9db4042b3b9efe41e70c91f6d5e'
         '9afd01732d95f040092a04550b7bbaf5'
         '975ba73b0de5c394324c300a10848346'
         '5abbb92af22090f40c14033727108780'
         'aa7c5bed973ef4a9e10f25ac258bad56'
         '5f8e0a7ff33f06652af5a677f757d49a'
         'ac82391e13c63af7c78d028dac91475b'
         '4dc373053f8f2c0308fb26acf33c88fd'
         '5a730e0552d1171b40c877ab5b4b8c2b'
         '99872f3ecabcbb89569f893db88e0ea7'
         '34e33c9904765683128aa52bf3d15b90'
         '1b6a8483acb8eda0c541e0389c1481c4'
         '8d167c57de875d579fc091dc2521216b'
         '6e605c6b64100dfb545f1c738761daef'
         'e8e54ef8c25164766f99331a0fee64d1'
         '683d0bb92132a6fd8f40d982bee333d9'
         'bb0266e30227ad8e11495bc676a44f99'
         '0fcd9261a21123788585ef3642d37179'
         '2ff43bb04eb89d2a527f236f4f410a98'
         '84b3947c4576bd2864217fa405640adb'
         '7b29de0ca122c7cc8483c377f6665140'
         '6efb057e4f1f516bf0bd3a9e1d4269e3'
         '1d69d8617858798406b93c7c551943f5'
         '36f59686587c8488f2e62aa8b883a008'
         'be8ad6081c9f40bb1a64e10fd3f60752'
         'f1ecea28b41ad0c4ce8d934725af7844'
         '5d0b65f6d566e1a8b2e68227c4dd9f63'
         'fae4b7d2b7e9ee1b75ec6416c363ea7e'
         'a92192b7b55f75e1b5f50e55277453db'
         '5264d0c88554e89f279c56c389cdbfe0'
         '8c239ec8c5c7d21eef785c8607efb50c'
         '9f5ff17687c8f7f720780d3e24a52103'
         '659d56743deb8a83f6bb2c58de8fd065'
         '1e8f34735ffe77f59832fbacd9bdea83'
         '4293b955fc1ee40888111b69aab18f2e'
         '392a580e56cb37fdf62d1a7e82078706'
         '5b4db4aa188addcc7360ca0b107d969e'
         '5fde54f34da8db222081c23ff600c06b'
         '3c7129a6598128096d95059964c47c56'
         '2d36dd05c26e6197125c439eba3f614d'
         '437dd31075affbafd1812ee040c0404a'
         '0f44b07a452f619571377f650f1437cf'
         'e619012a367a6069139b020f61b1d9d6'
         '114f99fc9dd58bef5fc78bc1b55779c1'
         '1ba493976ac0ba32069e3650b9e3952d'
         'd1c03fc5032a75a345b238f57a8cdf94'
         '303126df73f98ede7828209604a8b999'
         'a21d338dc59a9351a38b7b6f35f2a9a2'
         '21051b4f5c45cca46a3e4ec7513a92a3'
         'ced4bbc87592cf4d277adbe1f932c7b4'
         '828c68aa3c809162124da3cd2e160142'
         '7cc9b25855be08274930d1d5ca937b2a'
         'cb9cf35b091131323df6b5a8dcb38977'
         '981102e906dde32779b3fc8674378b52'
         '249f7cb78fd1451eadc2d27c78dea466'
         'd39545c47eedff27a2dbc886810da21e'
         'cc66d516e765bd0d7f8e97a256eda624'
         '56df6597605258cc8ed963752cb74fd2')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
