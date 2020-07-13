# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0b7
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

md5sums=('b79a6194d52a69b4924596ad3e85185f'
         '43cfd5a18342aa24b0ff87685b36796b'
         '2e6e66188f0f0efd23447c2d13efb2ea'
         '1ad729f4192e8d91e1403101f4773ab1'
         '16ce4b3fae1a88e045227bd50f3a65fa'
         'b9ebed3ce42015c70653a0b33fe41696'
         '8450156b4344d6f9dbd4f8681184cdb1'
         '79d31ae4ab3120844d4729f4ffb91ecc'
         '9ba5d046ef073ea76f9da778fb1ee577'
         'b1bd102f288bad577cdb6f202c09f0c3'
         'ffb6dfd6dc063167e86de676a584f008'
         '98082c418c5748602799950ffb287df8'
         '2016cd622e63e741b4fa617babd4a827'
         '5251f28c0730d1e6df0cd568eed4ba50'
         '1a9731cea918d4813c38d7dd7500dae4'
         '5fe29ed80fb92cccd8522cde6d7a9a65'
         '188bdb9d6a70914c844c5d6f0a2d26b2'
         '572e2aa1e1a0421ec5a9b301262c35f0'
         'd9c574b3b13b458aa8a40c09e1fcc422'
         '5dbcc241b91a0dc2eaacdb9f8dce6f61'
         '21174187d2cc864b6c2a6574ba4feeb9'
         'f9686b76fb16c0239f35ed399b925fa5'
         'bccec71141c6dd4867d71608e75f19b1'
         'dcfd723be98579d10d6fd3730d9cf57e'
         'b2bea1f1b186cc8994073e6fcf636027'
         'c9d9d08c862cbcd1b5d122b720b584b7'
         '8ee9acf23d44c2b1c9feadb475a138ee'
         'c8900e72d556654ba89b8e92e6336884'
         'c1ca8bbfa717946088ed2e75c3fb4947'
         'aab364effa7d58fd67c93f871e994c8f'
         '2eb659ca87eb4a246a9fb89f8b0d75fe'
         'd2936fa0d51b2501ccb3cbe8fb7587b7'
         '68bfa56109598d8e4b31c76de4170ef5'
         '2f412a49c3092eaf8b3404943f5c6ab4'
         'cb5b869eebeb16d35aaa1e4cd7dfa01f'
         '32aca9c6946eb1a6cbdbac5155aea303'
         'cfcb207cad49d22a098da839fc6bc583'
         'd7f58edf4cea9a13403e57fae6e9909d'
         '82c850dc118948276aa980ae32962348'
         'ea4284d91fc38d846fb420bc19469e37'
         '3100a08ea73ed00d2ee4c4b2f1f9844a'
         'c7c3dbd45c0ffe34ff890bfba6e9e77c'
         'f22e47ed7068c217e6a01cb9747873ae'
         '5088179f0445221dbb3bf34056b97d9a'
         '8096521e913b2869191192b83f7cdf8d'
         '5852610a92bccbc6bfc0f44e56f71e10'
         'c904d14c4dd2153dab8082c1ec49d75e'
         '8e171b2f7f78017874ae9de449503697'
         'e759abc1b99620e102f1c01de4ca9aee'
         'b6779e77ad2309f8ef59815116a3f02f'
         'ef6790b8a1c2359a4592f272eb45995d'
         '2c8a11fb6f07c2c8795020617f056ebb'
         '18007d06cef38945353b6b6d4be2960b'
         '24efaab8729733d873a6c0198b768267'
         '8ce31854940fdaf4bbed02068fb1a959'
         'a066ec5efa600be539fa721278674d2e'
         '6dadb8277ba392f13d72cead654be73d'
         'd732dce32ba31ff5990760f81067f720'
         '8a46169572e454b608a1d720c9fe19b8'
         '95d6b27c90e23230591613ad4d86d6ef'
         '6afc9e575741d6972846edb1eca59c61'
         'e0e5fd5e7e6f74b64352fd6b9f10c4c0'
         'ccc9861c0276d9ddfc0624aec3ecc0fa'
         'e8f2c4670449264518b812fd6a558190'
         'b6e6167d02d50a37b4ba169b8fcbe9a6'
         '3c58db957efd59a7125a8ac826dde34f'
         'bfdc019064ab758f04464702375b25e2'
         'cb10d8bee170d6f1d356d6d055085647'
         '027f45d32f0796f26817e61fbd23bcef'
         '0b759281457a7dfed3fb9e14334e6fb4'
         '9f6360c8fc05b28bdce50ea4c6edd4bb'
         '1250c274d522050ce856799cdce26962'
         'a017e48b3f45fe2c7c2383a62f7d767d'
         '1e9f9d77e3ebc6b214922ee32422fe30'
         'c5fe0e6d29e3c44bb4f4b145b3eea811'
         '1cd76fea71737ab3ad93b3d11820e109'
         '215cd0b901b68a5734b2c9669bf9fd63'
         'f331769d111ec18ddfd8ec062e228b7a'
         '919fe9dbef818a27e659173886fb3da1'
         '677554cca72034956534cf3425dd7154'
         '5a4faa7c8b0a36287bf2fadab6e1f6ac'
         'f229abe0969bc533811052969f5c1807'
         '4e626c5ab515121d5bcaaa593154378f'
         'df3dcc13c7c97806a9a8af4986f005e1'
         '0f8f61489f9493aa7db094f1563c4b68'
         'a932ec6ea86a2436cef381785f735644'
         '640d59fd3ace4248203e1b34c69c2e91'
         '1f6e92b7c83e9773e76b8adaaff5fa1b'
         '27e3176380c7a13ec900896f2bb3c675'
         '6c81fb2aeca6ff04074c4550555deffc'
         '1c6908eab8b245df5bd23f47a0067c4b'
         'bbc5921d28e9ef49eb6d160b78fc3d9f'
         '94727c8fb0dff64a813bde71cd5cd98b'
         '4e09ab14af6374b1488ce68ef9170b6c'
         '4b84bfdd0e64c9151ac63751727775a7'
         '7baa8f029afab1ac3ac47b413e283911')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
