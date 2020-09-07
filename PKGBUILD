# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0b7
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

md5sums=('401a5ca1cdc297d9d7350dae90b8129d'
         '177c4d80768cfa60b31c101d1284ecc7'
         'b4eaf05ae2a0486524e6a7a94695fa40'
         '4d1de8e67d1bd96f9672be512036f703'
         '4374ea63929c6ef72ecb2288e49079fd'
         '6ae62e0a041aeafd86caafcea44f50df'
         '8334b7b85553e8ef9ecc11f29cd48e32'
         '3f78bc0ebd31cd78398821ce4ce9fe24'
         '3ecb84c30daadc23b005284b7fd24343'
         '48491b97e94f1ad024a3eefa5a07cb67'
         '69d1bf0bd06b38d95e8e9cf3c32e8f55'
         '2e551f249900daa7d1f028d74ef0ee1a'
         'bc8e8b2c0c5a5b0cbcc2d3e21e5a985c'
         'bb07d40818004de72497ce1c42743739'
         'fe13182417082fdd5b08698f9c2688f5'
         'ba780c10d9b8a7f5a47860f5808d84c3'
         '2a4c64f37535db1261c9ecbf950e9525'
         '8adf1dfb2f0e87349768339e4bb9b4e8'
         'f7d1a1b3b71553b68e4fe5ac38304577'
         '9b7502ab1a95f2aae7edfbc5a37819df'
         '5857b77a320e0d2cae0c47fc63c9801f'
         'ba85d5dd0c3b359435e34a836ed8c930'
         '863998f6c1c38b4f20eadc0d0c3a497e'
         '57b62a911b6cba0c9da79014d6e3a24d'
         '0238389c512aaf6011c90c256beabf56'
         '0e537898c9ee5f50206f1d54a4571158'
         'c3dde768fec1d7f79c4d70a2a7f2b274'
         'c689dedc0f23c768acb46f3a3ee0d81f'
         '3e51f3f4f5dfbb0f77b2a525e663a388'
         'ed27313cc60959efcac63b702e3a9451'
         'f12caf44ab366f1d61774737f01b3b68'
         '50bd551f285b39f9810636e84c477a52'
         '8af91ff2ebf66b5d6460788d7925520d'
         '76338033845dd550edd8fe34f3252424'
         '3ee39f7f09dfa6d225559bf679eefb1e'
         'beb90396e0592d9f2867b827f055fd43'
         'a67ae7e995559c7ef89f24d3c3f5be28'
         '6fb6649cea122f37dc6610c2d6b427e8'
         'c65fd68081fd920d63e919bad9111a6e'
         '3e25ff562bace5527bf49159c5809589'
         'fbb573a43885a07518be9524ec281d48'
         '605bb52753f2cbca5c125a42e2988f71'
         '6d151925d9edab85739919980c058ba7'
         '6000ac8759beca9068b4138a0d728738'
         'e85e50ba20998fc141ff72de05a3bcb1'
         '9b76fc1ee165f191d2a60efe49bc7559'
         '5f1259e13efe6930f20a862e0c1c63c3'
         '93b41b7e20ce927bc63a8203d2aba031'
         'c76a40c7a0f15a44715cd6a324b9dd20'
         '7479a79ea057879c0f0a5a395ab745f9'
         'a272c6bd4b398706c0170207a19ff181'
         '3830faaab7084d1d02ec5e1f22140ec5'
         'c75bc9acdc89ecad805f91a774d02680'
         '57b2a197f8598f7db0aed4d51da03840'
         '27e688b8cee82054e8272f688b14a6b0'
         '365b8e59bc36f8dfafc1ba923baf37ac'
         '102704054146742107d9c2185bc17991'
         '058cafd309012798b7b9571356ada65a'
         'badf1f25e396f0995db429391bee79cb'
         '7c9489e63a6ee0b761cf400c27645e2a'
         '14698ee63fe1b328ed0998057383677c'
         '80f900f5234756f360ccc17a9c7a9111'
         '3129d4aa84d94563ccb8a7ee2dbceaaf'
         'bde582baba167c54122e8b369fdbf0ea'
         'ce5109bcb2ebf05fce8c0250d1f36309'
         'c0af7bc6f001a9a621001618ecffb119'
         'e592109f101724803e53ffea8a816c08'
         '9866a8d4f3afb8fde35c9146e9b687ad'
         'b860728d47fc4c98fc026e23ddeb02a5'
         '3c726f9db91fe3e6f903c7abc6611443'
         'd49a41a7a9cb7ce40623b34e74c5dc74'
         '834ee23cc115f557241df44fd4d91b69'
         '4b9ce7416c2cd499b4de46f584ce255c'
         '156aa923c897e1d5412dc2b79204df26'
         'ba58d6f6d97ab17294f70c2748ed0d1c'
         '4a00e2b91ee792462ebfbcaa31ee35df'
         '5e88ffbda8154f6103bca3dbcd32ec26'
         '986156ce29474d39076f335b6c0a72c1'
         '018bf372978932311e473ca7d6747ad4'
         'cbd2a290c9aacf642357e7a911d083ad'
         '06171e796131b4c797dcbb8b8cce55fe'
         '7829149cf9c68f8fe79724c0c8922c4a'
         'c6d3e2c24b738cc5639d138575fd7f0d'
         '1342e8298488a44af67472860bdd314d'
         'a6b5510c1dcf4138837cbb593d6ac8cf'
         '38ab2dd719fa79f9a2c12031f4285d12'
         '593bbe7dd42e7eff1197262e479a3fc5'
         '8f129d864acbec77c30beffd0cc7af21'
         '29492d7cf67bef207b044cbe7bbc8416'
         'ab8ca12fa9bcf991361bde8433167d87'
         'da3df39d89d01971bd8970069996cc7f'
         '22ab5db6dfc0c5850fa5e8f947c01770'
         '0c151ab3450f7feba1745e8a2652d7e0'
         'af030293676e1dfcede4ce80df9cdfdb'
         'ae4df775b23f3c5683be90bb682474f1'
         '50188d73f533b04235d0a1c58afdd5c3')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
