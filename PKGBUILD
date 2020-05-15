# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=77.0b6
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

md5sums=('37682ee0d9d58a7d6f5ae12da7b1e34e'
         '291b0c25393e962dd5cfa7582dc6d7e5'
         '1b434f06ff8e01e6c4e2d0afbe1a9d49'
         'e225446f125c6abe9d60d30bb25998ae'
         '84910d7045caa622adadb4820bf348ff'
         '0b3d2fd288cd356a6621d84f637bc19a'
         'df976095d37033711a493de460bbe6c9'
         '99926baf3a55e1d596dc3e6f0ced4863'
         'dd81e17cc0836e8b3ad54f2941fe8792'
         '66bb5fd92e207751f5f1dacfc2da2f79'
         'b950f61e4f601fa8b3c52032b9e65ac6'
         'ffc409ee3995ddf2d48befacc58274be'
         '41bd69d77a9475f34f8f38425e95f7fa'
         'fde01b7baebd6c583213fb926ecd3909'
         '8071c88c576ca38779f6249cf059b771'
         '7ecda7a0e0e7ea5f50e1982420932df5'
         '20bc99a093d948c216e1bd9ea466f116'
         '176e435d51878d948bec9b5989373023'
         '27f57b206a68af2366ecdaf861e6b1a6'
         '9e513751e3f6f3f93b5290484c3f342a'
         '807022d8a85ed787c53021885716fd2c'
         'c3a1e0fe89f469c7c87cd462fce922f3'
         '528083880f2ca211e23b00bbc47511a5'
         '1e31c7f9e1251f14029009f1aadc0a51'
         '24adce15b4d0ba55ca9ac26ec1606e48'
         '3fd70ce4918a146e694cc1db33f16e33'
         '52a29a17ca4bde6d4bd62e63cbeec37b'
         '04c524ea284af24d3f34f60a6c289657'
         '0e690581d138001664a74bca2484a127'
         'ac4f39b951ece003061bf98cd6857c6c'
         '7606ccd5440330dea618f964760c8511'
         '4caa82e88d90ff8bd9a06c581e94612c'
         'a20b5bc529b50c8f27295d0e7c9bee08'
         '30fc1d77aedae8e7e13cbfa1263f6da5'
         '0fecaa5f5325487b3c1ff0c1e0339c31'
         '77dc390cdd3e159909b9a92817f4e682'
         '7cebe1c7bd59e49dbc257bcc2713b27a'
         '30b9750529b06480a22d87046feff327'
         '7e802e2095836759d6cd71bebfef112d'
         'eae13897af0fe10de834c269a7703948'
         '1f8b122e109c8a1ded7347923a145d6d'
         '861f623f59325aa67e5e5b5a347ff17c'
         'a309411b73b26778f126e3e482401cf8'
         'd64103797c8075687e979501bce9b9e7'
         '694ba6af38c03d8143084194e0872079'
         'a8ad049ef663df41a746d0ae199588a3'
         '074d58b249a01bc9f843850310fd4550'
         '539fec442b8c46f121a7df23c3bd6b12'
         '4013689386c07506fdd47fe1135d6adc'
         'ec3e2d443df68961df77ee8f3df3ce80'
         'b11b8ab0e738c944a668e073bfd163bc'
         '151a15bd06165ebb7f8031f67ae16a21'
         '7c0b057bfa9fe19c84b7bd9eb44490bc'
         '534e6474fefe9458908888fe28bd674b'
         '2cf869044c7b48ae35bd932d97f8ade5'
         '56530affe4015663bb9aeb40bdd814ef'
         '0cf44cb4ea47cf4704559d37b3f702a4'
         '2fcb7da8f4c7649ddefa411cf019f850'
         '89dbb8cdcddc6500ce39ace357bfb9f8'
         '3a6f606b031329ff4b3d835581ec75cf'
         'b38a9e750c373e80440c61dd87de8eb0'
         '517a1b0f4c69790df4add36ec1b8fb1a'
         '3b5576f680af2aaad399ca9caf5ca213'
         'd32b60023e55f7826a4c248005a3ac02'
         'bbdf8cb6937c84bb624881f2f00ae050'
         '52d62ad49a3a9e82a4012130b2542bd7'
         '18a2b10c30b2435a52599d8d47760e8e'
         'b6fdd80b66f6efabcf02fa5ad37d6178'
         'e7cacc584c88187cfa090e49efbade2a'
         '8ad346d96d0c70a114bd0a360d44ee38'
         'f05083dbb3113bb0b02e3c9bf373f291'
         'f9c878831e3531ba784d19c11e41ce16'
         'c9e76da13eae9d6f45e81dcaa3cdbda2'
         'b7d72ba7056986419512c5d39d7fe1e4'
         'd8f7d9213b38c856367e9d47ad06a3b8'
         'cb32db61a6b8c72a8b257530163441b6'
         'ca8dd9c98b5c88a4d2066ad845c06ec0'
         '17f5486715a7fb2e9be38576da549837'
         'cc1be540e3495e6cf615f5bde8b3a97a'
         '9d121f552d8baa373220fe9c3bc3006c'
         '6d9301a8ae2e982f0cd6cc6680724513'
         'd16ef2726580d7df3e145b9cc1f09c29'
         'e5023879c53efa3e4efe33cf7cc79a09'
         '01b2c53365b3b024fb4bc0fd09cb1354'
         '902c3c8179bcf0e04f673e5481d8f6e5'
         '5405c4564f611147444f206b29587a8c'
         '3972deb8a3bf92ad22eab2ba06bc5611'
         'd5fbefadb3723c7622b992318d9e11be'
         '39326da34c383a81fce4883e637e0273'
         'cdfdfb799beb0d4696114cf58da33935'
         'b9480a3fde338b3953b44906737b2514'
         'e0f2178ddc0d74e1383754a2aed59cb3'
         '49b934df906305f2573bff4664806d48'
         'ef9916f1ab61e4ab1cf4b9603ffb1f49'
         'f1cc345199affc62be45ad12cd44630a'
         'b004ec0d243e33b05cacc34685c88876')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
