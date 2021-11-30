# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=95.0rc1
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

md5sums=('38f2922b98eccc1a171c9653067c622a'
         '1ca3f89ea9dcaf2567e1355caa430c83'
         '8859588c2c5c65205a4e51feb5386865'
         'ce1679679adc500b9e207c03f0ecec19'
         'ccda23b419c4023bc85981a6de42966f'
         '9cf3c03de1b31097687110794cbeb363'
         '3f4629fea659a149872af126fd1d5416'
         '5ee0f8d75d7400e78df65c07c1665c0b'
         'a88cc11c19ae3e3fc17560f11e2f7c88'
         'd630c0575ea9d2cbaa3d54b6ecaacfb1'
         'ca6c158a07451f27e745c869b467c1bf'
         'aeceae88d08597eb7acc9e45be444b47'
         '1d04d72c32e1e31cba05204546c2b124'
         '77ca681cada7f434c1ec1a396acc9438'
         '9683e1028280e7ce7181cfb886fa9a26'
         '99831f386e85341c7584f8092f8a005f'
         '934f77beffbba07d44264114a40f8557'
         'c3b5ca8b7e1a75bbc812a72912748dff'
         'de9a3ddef217aee024f2a05ecd0e69cf'
         '69b3d808f859fdf41626f446d4af0819'
         'e54c75592495d895c21d229053df91c9'
         'a07e26a403330a5e5982daae902a6550'
         '1c15f1b53a3bf78e9f24f025f746dd12'
         '90c69223d81dc12e9a0421b870afe258'
         'bc39ffe99963be772969536e2bdfdfe4'
         'cddcac202968ac4186b239e0241f6b85'
         '146fc54989f5744581e6e52d89c47d26'
         '7ab386e5ff032b4c87fed355a0711fd1'
         '6a4672fc3df34e0eb3375aec4be7a20f'
         '64d67079ee801da451fcd9229f1271ca'
         '4d5e52d4e6fb964a0a5202d28ab8c4f0'
         'b7ddd58a312c1e7327bedeadcbf328db'
         '9df1663c0e868775183f03e3f4e5cc05'
         'f8cab0c3ee57df7bc45d965c23e87267'
         '97ceb9325842b147303bde4ecd12ee6d'
         '1139e83f5841728862a94e22a9de9e02'
         'fb73e74f7c09e7821c6a78c3a6480ac1'
         '845cd3dacd6ef561d6135291c7a12fa9'
         '871963b5cbcfd543574f981ca5394e84'
         'd1c614c86b926ee1ccb51c91eea89e0d'
         '4ec2db83779fa9fe5c0154e9a169f7b3'
         'c958f34480e8c8da3d73f413a8bad1c0'
         'd648d46c6f29760c67a2259eb0c4ea85'
         'eacf4157fecc30e249d597786424dc7f'
         '957cb9515194f01dc164298c6bcc626e'
         '2495e649ed83cdd0aa875750a801dfe3'
         'c91ccb5a3528d58ae7211c8c7299c58f'
         '528b53557241f7584e963fd4ff16d9e2'
         'd64652fd096be02a40d80eb812ee48dc'
         'd8fb01d63e6ed2ee7ff89bc28116ef7b'
         'f70e3b96398746f117ea1ecfdcab3f16'
         '6e7e4d186390ace09f2bc7018105b0a3'
         '5cd8472d03a77f00b5e21a75929392fb'
         '44e14fd19e734c73f350d3d5fe4582a5'
         '0cbdc4dbd23a96083fc620c147ed5e78'
         'd175b7e07af31a8edeb52a7f2ce3a542'
         'be394e98765584cf01e4a6ec00ffcdc1'
         '035f628247902f5ba693ff3e88b882d2'
         'abb3e98c6ccf5874abec3cacda2bcb38'
         '3ef031edfb04fb77f84b389fac8a6d86'
         '454c7bbbdcc09e014a631b217ec008f3'
         '0565aabeb76ff572cb6275ff72d15609'
         'b14badcc87f4545d7d02f9972816f41c'
         '5a806a40b8d9bba7a000ca018117dea2'
         '1fdb63699570c2fa9b674175b9ae1ebc'
         '8af34f6ea935eb53afdc551e0cd6b1f3'
         'b07772718c327040f7a0981f148f3de4'
         'ad6c6169c2e25eb28bd905d3b3bf7a6f'
         'a06d6bc4ee340d2af747469c79ef9649'
         'caaafbeca222faf6172c789c2502d12d'
         '9cf998afbe352459432dd7f9f81ec3ba'
         '5a72d89d447d8fa6194b255c21b4b1df'
         '4e814dd91618899c4e3a06ac88fb7666'
         '4164a5fa479876c98602c8fe68375ffa'
         '4eabf8e2c172783b2bce1ecfb8bbbb71'
         '8d8bc6a92e093651984e0f6fb0cd58f1'
         '2bdb6e203a67e83c3576e2ebe5d55618'
         '461bfe5775eee86ecca6b9b79d351843'
         '2db1bb2c7ccd0edb20b1ebd70a6a5aa7'
         '2f937223eef8c82e5a3d0a7e48e4e41c'
         'a8d123d930ba05ff96c0aeb2a24f730a'
         '2f0fec03d4a9ede7ba49834021c13369'
         '8a62fa487a57194e2f3df4bff4e53417'
         'db9f370286572d9fa625a4d03cdfee8f'
         '5ea9788e2a0686a56c4512847416e992'
         'e1bc97ede34c59f19250ed31df970e79'
         '6a6360652c98d279a678ed88bd860c43'
         'bc559baaf3c335dd0cf0ebaeca1c3d60'
         '5cc4fff5c034f84b56b11c9b721f2265'
         '503a9ce62b84a84e85d9a594609e7bcc'
         '78c85c2e6093aa2fbf0479dadeb7b92b'
         '61782deb36bfff8400ef245c7e4a94aa'
         'd35d08b009415874f06dec9977330892'
         'f6dbce70a618240f2585bd9996f48543'
         '646c4d029f5ebd6a138db8b5e9baa1ea'
         'add05e9e6eb86ee38b3a83b2eadb63d6')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
