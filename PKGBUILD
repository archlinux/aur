# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=95.0b4
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

md5sums=('efdbe1ab9e3e3e1243086782e82aa084'
         '21085616293033fda9d6738c1edc88a7'
         '94e7de89180a857295f62cd8d3a0f8e8'
         '4692cedc53e47770d62cd45d8b2996b8'
         '40868a06ba195f8824ec0f1f0a18d085'
         '50163f7753a00b50052743d28c150758'
         '34c766451c3d8d0ae0dde65eaec8dc71'
         '6c92173b8c487fd525e21f1de088edf1'
         '12d836bff7d19a71863c954a5eb226e8'
         '948e2314718b30698fabf8949037ab88'
         'ea59f635c008083c9e076797215f6f47'
         'ece46b3d376777d09fc4adf3b75e410e'
         'b6d34149f5a189f8ed4e31db0b28dc7f'
         'aa096d4e66dba7760c7b2e7c95860cf6'
         'bf786d2e4b72a57da75e55d5559fd8ce'
         '7996b1902bddccb8cfae73c143c6a976'
         '41f320897e8f00cd827db5fa95db0ac7'
         '9a9021002c35008c9f88303018104d30'
         'e331efe526295116ef95f319420aa851'
         '329d37f524987cf9f7f16727d0efd2db'
         '140c531831c284d40dec16efaa5748e7'
         'ebee04314382034d11bc8b1e1bc90009'
         '2507183f4b48facda25f050f511ee9c3'
         '2babc57a39b65d84e23f6e9d44eca46d'
         '63cfbca7efb87f03f49f22a28d9d9ddb'
         'ae5802223405de994c9ba9816df43c51'
         '17f34de550b9e311369c305696817a96'
         '5fc3c85bf3deea344bb377ae5701c4a2'
         'cc91735ce07eac1d0620022ddb1b9820'
         '2c44f0045b15093309a4ff143a56e5da'
         'a2a52efd3741aff6dd44d99c7fdc65a0'
         '9a9e145107b56cd08421c676487ee22c'
         '52da682274ad80b0ea009a5705c17db9'
         '41bac46e7877e03b6cbc5a8ad8e0be9e'
         '262c27473c5af8500610848f7c77e17c'
         '15b4610f4fcc9dbedce99ca5dad1ad1b'
         '59086d0c8e5c8721d670bab9a4094d8a'
         '855d75e901f16c2e9e098829b5be32ab'
         '0c6f6033d065961fc5365fb081fcd17c'
         'b1a73b7e4d354dee99cecce9e2263693'
         '640f06a890e61924007a0da9573f332f'
         '42b669d70eacff471acc4313aacfcda9'
         'd173d9f8c904c8c9e6db65d6c11255fc'
         '36f403f19c9f2f24368eaffda97dc96b'
         '9412760b9841d728329a892e428e7bab'
         'a65d24f04d271d5648c22f4d4defd7ec'
         '224997dc497f06c20050fb38ebf42ed3'
         'eaa1c0f4da505274b6c16638cbe5e6fe'
         '9f85e068b770afa152f4ec3e29dd61f9'
         '24778969a6823043de47e5c667fafe77'
         '12bb4955d0bc57f1089ae6bd9ac3f582'
         'e969de1f81a67a100c12742aa3177352'
         'd6d5ffc010861e65d0c770df4f773d3d'
         'ba979dfe33f3fd6ccd6168e1ad5d4dff'
         '8414ea4e907cd4ceb7c8b2bc261e4c5d'
         '8f0616ba9833e6d9dab44f91b6989efb'
         '5db98155508ddbef8a2ef0606f2973eb'
         '532751724839c075b6cf67658c069fe5'
         '937794271a45a0b87f1c548569ed40ed'
         '96c087cb0c24c63ead074c066742f54b'
         '1b17ad743a482be9c7374ba5566ae40d'
         'e34b99ac2562b1fb0b9cb96a5720215b'
         '2a18ba27e257c664671ac8f82ead611a'
         'edd4c32c34d16b8b83b141600c814b21'
         'f8ddfba633873923813d1583ff2e3398'
         '211de3f13a2b4505e71351ad7038721e'
         'a6fa38364194c788318641a3a376ee00'
         'ee6c1f6dc872b8b348dbf6ebe7248f46'
         '01e5e87c2c5a0b2aedefb9eebbcccc50'
         '633ef7072f3ca0b94b73817ed5b310fd'
         '3ea3bbeb273b07fdb4561e962cffd6f8'
         '2d74a1f58e4408178cfb6441033b3c31'
         'eb076780520b5cd849cd625eda98f9d4'
         'f9b55b6f4493ff0aeb05a2061d6f52c9'
         'bb1239aa310557f469623c1eeee20754'
         '9f18615915f0b11b0ab4c18c4c87a689'
         '6935b516763dca8c9b1374efc5a752d8'
         '34de4815ae46c8514f447aa3c109d8f8'
         '85e6a01f0a75776b5b5331c8b463c3d7'
         'dc7c86c23200da8dcaff0454e32476a4'
         '19717c9f4e07fe8840c380d68fb0c581'
         'e09fbe1fbf814bb8cb630565401696c5'
         '38a5f15ef156a5aed6967b9bf71c02bc'
         'b448fff2244ac4abd2522f0ef62b04e2'
         'cd6a04497e8a83be296b4dae0a6e5083'
         'b65c5a03d7ead4a80724901bf98ae7d4'
         '356ec77744bd0f2d8124cede3ce7ff8f'
         '09f3d25039a594bb1499840d6056ece5'
         '9d054bd56ecffb35081f62b7d69a1bc2'
         'ecad6f27e974949afa251672fbf83c91'
         'c1d409b2c3a6da8e32693a3c34994a90'
         '0238fda17541cc934a83fe05a4bdb8b2'
         '344a3866e8e6140b91c493a3727d25e0'
         '371fec70fd55bd9edd6a498f792be2c4'
         '4b91f9d72bc40fd30dc62e33bc42919c'
         'cb0637b82f49acba7bd64216902ed42f')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
