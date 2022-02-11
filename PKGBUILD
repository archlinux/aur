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
pkgver=98.0b3
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
  _url=https://archive.mozilla.org/pub/firefox/releases/98.0b3/linux-x86_64/xpi
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

md5sums=('a4752aaeed4e134b578e683853ca8170'
         '38c04171e33ebdfbd05fef0f65e7376d'
         'c321991587ae3f7043a45076dc1f7a59'
         'a63068620010a68d31594765579bf012'
         '994d8b598451b847faacfc0ab0eb2214'
         '9b98ef05c9c8ffd183134b680106c608'
         'ac63a9a28bc50076dc58049e51d09c4f'
         '78705ce4e4f33e2e26921632a306dfae'
         '1c0a118c48089e59014cb813c691ff98'
         '1f7f31e7fa6ecbcb1244c9e4caa95372'
         'cd757967e575771da4a29e3827f3bcec'
         'f05199c383a6199ad29e403703a24449'
         '93cdf9902e0536f3da118db3673888fc'
         '71971721d2d67c0127891d245e10a7e5'
         '0f52647dc8f7fd10e71c6cf50677ce3f'
         'b6f4c417d5671afdf54afd8751d5e227'
         '74102f8b22edd1c49044003d0ae80c6b'
         'bf83b7d6155916563e4b198bca50d100'
         'f77dd630e6859d4037972228dfb28829'
         '9afa861e4725d140144c37ab0e4b3f31'
         'c064dcd68cb6ce8639a47fa32ba08bc5'
         'b754758108d122167257a5b63f3fa7e0'
         'b10f840f1c1c41c615d2340140727c6d'
         'e739dc0bebf2a21e8c7128dff015ddb8'
         'edd902cb01b7bff78c71a2e68eb2bd32'
         '0a491ea94177a239241911d94d7d5c8a'
         'fd602ea5aff42db8006ed82d58e10cd4'
         '5352c45ac496b75b3f04668ac1f0abcf'
         'd6d5c157b85dcfd80482944b0414175e'
         'cfdd6515bd8aa81ec6f452ece670655c'
         '3c24f42827183ca735b05cbbef19c94e'
         '053872b64a9b19fa8f8cc243d04f6b26'
         'aa496b666c816ea243cabc27af4298d0'
         '938f34ad47da3146a4b8c4083713654c'
         'c7f3f39d4ca83ba52ed833050f2eb677'
         '8db9d94098e199738bb8d008fa9ea9d5'
         '586da53d7b3183b65bbe8f7d17354ee7'
         '7e24d44f43dcf94a98e4dbf1e811a3cf'
         'ca3a1be2f1b44b4296f054114bd22a60'
         '72ab255172e77532d4425d0e4c40e85c'
         '5ae9015b49d9ed545103d6e37c2fe15e'
         '9f27f34be60b676214f1f85e6ff454a7'
         '67e57ac4765e4d0fd6947ee74c58a8e4'
         'ad5fe706dbba9217358c16665b126bac'
         'd3c07542d0ad047689ac843af7cd464e'
         '67f44c40998391967bc33e7cb57b70e8'
         '6d4ee81a1cfb6b1bcd60a1bda133e20c'
         'cd17080f0110688451fcb4f31aae7a07'
         '79b23e77efe37d9b3213910dcdc1d5bf'
         'e1da385cea85005d115ad8e6a5689715'
         'fcbdf4094c972093b52f0c233876f5a1'
         'c364c1a64e5da6a3a2a1ed51e4e8c0b4'
         'dc9331ef48d58d21842e8b71ff5710a4'
         '1f102be267bb7a9897251aa1b609ac25'
         'ebd80236d757a2ce751ed6031da0034a'
         'e37c9945f621b8c1646ec2180914ae63'
         '7effbbe6025300ac74fa4a95952d5d3e'
         '7daf6be225a939deff40065d2eabd884'
         '02f1c0ad81a83ce1ce57ef8719c45ad8'
         '8a6a045d50ff6031ee679fba46dad497'
         '7bb349e9c2397dc03a1bc837afda64f6'
         'e2e89ca2f987f902ddd52fef9f68bea6'
         '6763204d574984d47b1a925492668968'
         '0ee995d62b9ea53a03bfe7ed46bee90e'
         '1e31c308a033dfb138df626db54fe0e4'
         'd2f80b2267596d63ec1241511789ef6b'
         'ae64d7d2529d543606cb91085973f6aa'
         '8955f22fe0e61fcbd9bfc2a539275a0e'
         'f9369aee93049197adb75ee959f9eeef'
         '2efee9f82d6bcc80e2662b33c1aa5321'
         '2cced1c78bf4f3373da68a24279f58c1'
         '814191b88bb3c50f8ae7faa57854a00f'
         '4d2258a6bd2eb1032556c1b08b0062bd'
         'e80aae10bd6a10d89af1f0cd52aeb858'
         'b968c30125da4d5a8725a596f8108dc2'
         '65bb062e608a1f58231d2eea69e3347f'
         'eca3335c79a4e0bf291b6205204355e4'
         'a45bc7cad4fecb14b078b30ae7343a09'
         '5bd762b7a0832a2d0a03b80c73ae25c9'
         'cfe2b16ad5ffac52a64aac01d6179a87'
         'fd989bca820f277c8fcef3381e67cb10'
         'b63ac95094392f0ea36cdf489750e339'
         '7653bf1e03ebd0166af39afa0d53fac9'
         '89cdd5348c30a655a48817c4abcafe52'
         'a83b0aeaf375f5bfc3162397af63c6f0'
         '5922dc2cacaa7cd160f767d571193684'
         '4706b9d817c6a2212086cf5e1ec0139f'
         '3502f1e8c44551979a1d6928de74375e'
         'b503e615b72a1a14736360f8c0f6ccc8'
         '2a02a029af40edf60550c2ccec3bace4'
         '7dc0bd8f4f4b5c72119f71952db5b1dd'
         '6817373ef06d11dc1017a005d90e6637'
         '24b9a33c6648c7d783a6c4bca7926ec1'
         'b1078e7af662709b73864fe5ead0aa90'
         '7ae4939a54c3c571a93afffe8df7875a'
         '912d729c22c1db1dd62f778ed1b35594')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
