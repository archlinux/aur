# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=96.0b7
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

md5sums=('c2ce960c22c4dd65136984996ab30090'
         '3a52a7575670158dd014a6f74360c7e5'
         '66fdf21dec2a89e31f2efe40bbf7c698'
         '74d7a554e11b6d691e887cc45a89bd45'
         '6de9c87af1c9ce458b04c0aabfd5ee7f'
         '86098b08d6a4afd3038ec103b64e4d08'
         '5205d0280d7aeaaa38b724cea0a92834'
         'c0a4bb991955a9e049e28e7f05815041'
         '9c2a26f7efef03dabd6f71e4bbdb13e9'
         'eb28b01fde6d09f6e9855cd60a7efc1f'
         '5c88f40b5e7fb288045ce747de75b8b0'
         '64cb940db5cab2891f03f7ea54d96887'
         '16f8e551166ea486cac0de12b0f4b90f'
         '5c3a6f03604255c9cdf7978f7a5e83bd'
         '70bfd2cde10aa855faa174d31c33bf02'
         '7b5071c71d0345cf049a5bfe20f59bf6'
         '26c2b70a3e2e13978296fda87087a8a0'
         '5c740c07e3cebf441193e437ffabe41b'
         '3049fa8fb39d28256721beca64875197'
         '623f716ebaf97109b938c0e1485c4f78'
         '702c795d6e1cb44801a91ae94c04ac91'
         '50f5e7c3ff856aafce649b3f05d6fa3b'
         'ada8c6ca17c271735819ed5e33921346'
         'fb9a498291aa60775f3f20872ca2e78e'
         'bf57ac1442417616e47c2b7aa08abc12'
         'eba01f7177212f85139b509a88178d60'
         '1885aceec586852f4aa4e528c544b45f'
         'd481e65520e6ac10729fd13c5825b0f7'
         'ba7172efc269c240fa919851af5d7161'
         '77a73e6e7ac4b7d6b7a0cb17135aa641'
         '76ff87f9f8892c754d87eed42c260532'
         'dbb3ca1af6222a51b109c1fb0705785c'
         'c164cee63348ef19eb780f2d07d06450'
         'e8b7e7c9a2e9ee17c81d7b7c5bffcaf2'
         'b6a723fd71ba5eebc22fb8c22f7ef875'
         'abe23d4dddddfc047dc1c53a57d78320'
         '82d149cb1f28fc25b05b3b1e2f624490'
         '946a06aeea490fdbb966d1f9c262a978'
         'fafaeeda9b04710b22d4585c8f22d96e'
         '3aa739716b3d17bceec8e183b343bfd7'
         'c4ce96be72f57a1f15c2f899f46a4466'
         '2fdef60556d8f824e93f5f50395ec32a'
         '717529a26499559c1f9cfc8aca8bb7f8'
         '60e10577ffad78d8d4f20407812ace6f'
         '3bf83f60635276e706469d61322992c1'
         'f6a37baf972de16dbe1431bf44f0a372'
         '3a28792810f18617c168332658435320'
         'b872bcc5a106b9f22d3cec978e71dd02'
         '55a58e217b415b6f10539faa46cb8530'
         '1479a4b8af3749f4580cb03779ec7e26'
         '53f5806d7fe79646c33f946b723adc5c'
         'f93646fc04ee8d39a9d9c74b4da495d3'
         '4fbd867a132f4afc95c0b8a4ec4863ed'
         '4d4b2adb96518a986a10f91685e1882d'
         'd49d710d8938c6294550d3db2521e91c'
         'aca51406a4cb6b6c476f00c54bf556b5'
         '7db6fe84899762790d5121e3ee0ad65a'
         'a5247441b6c8ef3cdb3c9bb4c1c9057b'
         '0259dbc2e552fe805513fbb2cdbf3ea3'
         '0a825a76567371b38bddf3c9d84456f3'
         'a6ed1048e9102e40175a5c3bd2fb66f6'
         '8da24f03db5677eaa2598e55bcd0b823'
         '98e4036b0890b9cc6a6d1087f91324c8'
         '5341f467a9f740d2e620ea4850cc4f87'
         '8c2541b3237b8a166b7a9c34c85541a7'
         '1257de23740c52127e4fff729cfca33a'
         'e7a5502785a821ffe27eed26eec27111'
         'b6c9d8e8112371605c1aafc308dbd863'
         'b20b1e8201ff5d2ec9301384f5bb0adb'
         'cd7a9d2e54fbb5eb66227ac8fc400f21'
         'a21dc6a3885cae2b54ad49c5c59daf9a'
         '4537882f8e6eaf789f3b190c4fe6d0ac'
         '8e51b6ea270a4e30375d6d1c56dc1fe9'
         'cf2d56e6e4ed3fc84cbfa2253eb0abcd'
         'be83070f3765e5ac3f12ff31cbb6ce03'
         'd544dc4c0e95247667cf68f3dd5f7f06'
         '6f18a67fd9b123f2188ba5915f6114e5'
         '6851f91808aa5783f64d13b7effd37d3'
         'd7f212476176c0c7a700d9f5527ef760'
         'e040d064e38ee4ce3c5e37a34bfc79cb'
         'daaef49881c287f89755c334df31b171'
         'a7e7975f9aebc41f0c413487a1b728ff'
         'ec72656c0c9922e054b664a7beb46206'
         '563b5042de6d3b83ff584dee7d0a6281'
         '85061ad710ffa1ff3cc4195057bbf334'
         '45ea1109b44d6055175fb21e770d74cc'
         'aa7ed343a874a49607ee94c197d40c24'
         '67d19f8e2c37b5f4dd094b954b3e23aa'
         'b809651f9eed3049a2f8f063ea5e671c'
         'ae0ef10f58dddddc9ae17268e696fe24'
         '38abd945664bf7d33262ead881ce5f93'
         '47220e259636f80037003b035e82f79c'
         '11a453ff354f20199cbe50247a32939a'
         '5fc136ea23ed6c712352ae4438ae5026'
         '6fbea228eee34ea815672dd6f6db5325'
         '41ef770be0ae6f6d75fe46cf214cfac5')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
