# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0b2
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

md5sums=('a410f8acd21718d4cd662673d1115865'
         '392f61b7b21f3822b2f6440149464057'
         'c51378e4b7065635432706a74a74638c'
         '6cb5f98b11f82afe7f4110f8cc91ed38'
         '74d445402102b69565f9e1f29ad84d6a'
         '22f621e39ea448978e29a8ab876117ea'
         'c64322ebd0248438d8df8c96ac0a299f'
         'abd82188de472727931bbcf734f4231d'
         '8cdb85d523e919475f95f04b26794116'
         'a97219bd54672b61407ca5503fb4d13c'
         'd7e478115c2a22e8a2ba6b6165d30863'
         'bb230abd48c13a3c6ca9da7fd13f84aa'
         'f0c0115373ac47028b735699f436d032'
         '7c599c9e6802f36a3ba77c90f2ca3617'
         '76bff1c20be93caf1d5ebceb92321ed0'
         '0e1836904f402e529a14f3593b60c4e0'
         '88cac4b4055a5cf2130c3e98b8dad2bd'
         'af67f27fe94bbb67182f322708afcb15'
         '6c92992aeaf2c811802279a35cf13a83'
         '0156f2cdc1998cd073516b19d9b60800'
         '8aee4a92259a83ad04d7e5fb6b576b2d'
         'e8580a700da0b032dbc35c4ff20e56cd'
         'd282f282025d0bc5f2d594a6629a8ca7'
         '9e32774f9154e02bd755adfde0ef73bc'
         'b73f965c55ef73869e544f8ae78d075a'
         '2c927b0567b2e86202f14bc79ea6ee2b'
         'f7e3d45642545b4b05e5d7ff1bfd8508'
         'b48c437bb84587aa9cdfdba522e73750'
         '2098b8d6734975f58ea148b0405d8d01'
         '224b187e64008ebcab134adb8f1adf21'
         '3dba95b8031f3247b2a2be3b96c56efc'
         '5178d4b89cb34a898a8f5ec67c7f8be6'
         '0b86ddd56cdec2d216607c4dd490b5d4'
         'a51b7a77fadcf9453f483da095e1c8ce'
         '89cb8cf7a96cb29a5d74b645c851ef99'
         '73edb68215fb4ec4943c87ed17aaa47d'
         'cd238cff8ba9f5e56bcde674986bf09f'
         '920ea515b5e65ced99e9e4b1e68cdb6b'
         '387f63423536d2d3c13d4fb370cc5713'
         '45620a0b270aaecde30409f491d00dac'
         'a22d693238785f1ab0a7a2af2c88b4f7'
         '8837583356bf9cf02a6c643d88242272'
         'a976a5e5a7b719d6d730ea0646a30e88'
         '305ecbab2f9d75d49fda44a423fecbfd'
         '39028cd0cce6ab99158538e0655a8f65'
         '921cae5dfc6e2f9459c8dfe326240e09'
         '0d8d86881b178ea5b75a8805b65c9932'
         '417ecedfedfbe7223e00388f408bb73b'
         '9394cb5f1315f0810ed4b6c9acd01460'
         '096b8e83416ab7c5729f6a5f4c9accfe'
         '450194954788f44bac70097c72fd280e'
         'a41345bdd56b7609f76eea73fa6f101e'
         '1513ffaafe00685b97e5c2e18030c5e3'
         'a88f686a6535e7d1f01c67bea918cd2f'
         '1fc034cbca8a96c3a3ec508ebdc2f6ab'
         '693801425ebbe07a97a35d250436b05d'
         'f797337b95cd6680fb38107bbdddbf01'
         '70d3909fbfb00581da9a9b8bcd1f2365'
         'dfd408c7d585457f364f0f1b8ef85600'
         'fff5b69ab55d9f762babbb05a643ecb0'
         'bde2c8784d96b53490d2e0e445043939'
         'a8bcf1206ff475a61c863c31f3af833d'
         'a01a96835acb51ae95db6874d8acf960'
         '81a5490c018ea2b96148bc4e81300f0f'
         'c78613b38c600ac29d8386fc8a0f760a'
         'f83969737029bbdb80d01cbb9ae6c35b'
         '4ba23051860b5c9492338bc6decfc718'
         'bc7ab195863dc78b55ef0d3f94c5bcfe'
         '0c2168153e6351c5e8ec57b159734d96'
         '4587a10bf13a86dac3ffdda2015ba88a'
         'acb81825022d67e9475f0cf2412a22f2'
         '7b4c25fe7c95464a5dca84a6ca5a4bac'
         '628ff6bf09fd9f6c3cb2b95731d43cdb'
         '6918f8b9abe5b829a044f628b24fe51c'
         'a672407bf53b06727d7f0db9acfbb7ed'
         '3bfdd7860b82643d9315ad22318755e9'
         '520ca0e537ed387b987949011453531e'
         'b1bc73b0d5e7b8280ef5232cc7e093ac'
         '3863853dabdc5448ba3d897ae6c428a8'
         '7134c8ad0b832e061b2c2f72d879c5b8'
         '8bf037c3113da64b29db7d997ea62c84'
         'cd37a1a08b609798fae79a3e76c1b694'
         '536ad1101ecfa11a5401516380d5b011'
         '9d04464a5fad59d5438c0858a2990e0d'
         'e1675a89baa1a52b2d82f6688cd02d2b'
         '107393ff326b141ed151dd341abefba3'
         '561e9db42e698bca155a8476780ba470'
         '16f38337530b0eeddf9bcc2df0ed9094'
         '4d5dd63658ebe9af38cb2446b4e8c1bd'
         '32673af8bb1cf7aef6ff07dc6b4c30ca'
         'a8a4ff808642898ebbe153a7787de82f'
         'fc4d67b57840b2c3ec0ea0fdad571348'
         '3aca874a2ff7b2d1a62ad50ca8cf6b25'
         '1d0419bdba2ea1d19556b6404034583c'
         '05e2a9ee4141e3d75165db80b3951fee'
         'fc4021c8b6f258e82766e764de8a67ed')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
