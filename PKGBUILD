# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0b1
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

md5sums=('67d3bdbeea1f8943dffe2c0e1b818d54'
         '2bee2fc02e0819be501acd4bf8ae78bd'
         '8bb44ea6cfc3686877aaa0c758a7787b'
         'deffcf53fb42c1476764dfb276e2811e'
         '5b4df59488347a23f7619a00f74f2003'
         'eaa36512856bd0d9b0eacc15fb9ea85c'
         '06b91f5792627b0d67bc7be40807a2e6'
         'ae3bcf15ec44765849bb987b15a4eaaa'
         'e6c3eb55c87fcad094fbe3d3a76c419b'
         '04e425c288712a5d13b04f24facdf186'
         '24142495eb110e959cacbdb20d77d22f'
         '743a00449452106e14d07437b15be833'
         '7ecd20ebf486fd3b93ad7b15c56b79fc'
         '85d82092a9f3d88149fef75fac82c73e'
         '7b6cca87e3bdff360d55b29ef12d00ff'
         '3a15abc674c5b8c5ac6ffdfcec024885'
         '39d3d18d502d75c9788511bf8e350690'
         'a3155236fa5179f8c1ff407d49220039'
         '6b13aff65ac943af6bec4ca243155f58'
         '884c29ba196574d8cfbffa65664b2d71'
         '93031b734a58c3b1903f2067ac31e9d7'
         '757eaae1de232d7867842492664d06bd'
         '04497330aa5851c9420e3467a8ba7a9b'
         'ae4c4f2cbaec1c48c777b12eee636e59'
         '627636ff2bb58c55cca0eae63123a33d'
         '4d0134f950ace228d2fffbf1761a1263'
         'ed131681c75a8b4ba0c4664e4a413a1e'
         '7dfaac8d3b606207eaf9083b2e48ff9e'
         '8656c62d09407de7dc9f5ba39e1dfafa'
         'a54441e788681e46307003ee897301aa'
         '95ef0d2cccd45e89411f1f92c4deae1a'
         'a3627753eda42bcf8ef4877afd7cac21'
         'e62fcd33e82ee81b2a2a36ab4a3a5cfc'
         '72a4acdfe153637a8d0d63a6909f8b33'
         '90b8692ff351d14e79bf533add23c6fd'
         '971e69dd089ec0af015ad692c6d2c43e'
         '86adae6371993937a157a58f77318cde'
         '60356c1fd6bebd9cfbae9e816d1165d0'
         'b8b62b8fa37b1c29999e8d97bdb4bfae'
         'f0888d5c988831d52b928c40d37fbb23'
         'd9ac1b98f2ca1c0d0279d40ab443cfc2'
         'ff77adb5cc7035f440d925ac5ca6ede4'
         'beb69197be8294e13f745b84e0c40b66'
         'f32ce043e8b2c34a32b23110ce035022'
         'f6c5f365e0ae91c025e5e6b9265f055e'
         '68b7bfbd9b9283cdb8909233c3e7a5e9'
         'e13a4c4d31e70b61712650182991e3a1'
         'dffa6beffbecd9fb1bc972e6e8b24b3d'
         'eb2fd38838aa4a218171e51f591b614f'
         '51a55bf1f71076d13f070f794ab4d788'
         '466ea9bf9166152625d1d27e66a6e207'
         'adcb490ad089e3a2a903db85b44bb983'
         'e44b73cff85fe23aee75538c4ebdb196'
         '3f3741018163d7265e51995d8ed99f53'
         '4137042b5ec08bd8aedfa8701417b86f'
         '4159dbe0688bebdcf05082e6961382f3'
         '877fdf65de446965d0042a4dc17df4f3'
         '43720edc43d369cf63e1b1033ba6b578'
         'cd64e71011d1c6ba51035f30f1a4feab'
         'ce53f8640c03766943f537e677dbdd60'
         '233b5709e4c38838fa9010a19a50530d'
         'aa725893fec7b978e34eae460fa5ff9f'
         '391fc9b2879fa2007d907a494a12fd3a'
         '08cb537ce842218bcaa85fb97e15af54'
         'ab5a491a046825105ea126b3fd031d91'
         'a3bf55a54eeff5358a4a58d9e29e0e4d'
         '70b1f244e85f7fdae07831c9ab274256'
         'ef93c8006ed90b2032fc2b14dfd6efe5'
         '44dc0031e186120725fe27a7feff6cc6'
         'bcd6dd94a9619c4432c758d07fbab117'
         '944ba1dfb374eb03243881903dc6c820'
         '02f9ad3e8fb61e08506e85170a9213c8'
         'b0bee81fab1cd9f0a5d26f3a7b92669b'
         'd79f3581df8556f220128ab063b85ea3'
         '43e7ce09688caf3306b7cdfeff0f7535'
         'dfed3445d4e742964d37d3fade834c22'
         'd12380641a40a804c10e00f6fbef4a8c'
         '88312cab10a3bbc9f92c9a0e15db2582'
         'b0e1bd6d3049d8d8d062286da65e23d3'
         '26d275167e403ce504a9f51b5ada4564'
         '31293796d797f3691952e493b094efb1'
         'c8c856ee6a0c3ea9cc783ead9fc0178b'
         'e7b6b8eea70a16ed81972d5260aee99f'
         '1213872824e37f9a4fbc6b40a37c33cb'
         '54884220deb758b010fd914c25ac72ed'
         '9b4b343fbfadb3fcb2ba53e7c47713ee'
         '6a8a0a6cde126abc3276e22978c3aa04'
         '5320bfd99c4e3654253d3f29820204cf'
         'efcbd3bc00bbd9334b99baebaf3cc095'
         '5e8e03d8fa9661637b3960889793563f'
         '3f8fc5dda1174b8c88f2a510c6bfae28'
         '136da78db3afe2a1ef7f566761ac0bc1'
         '077f2e46a43a02344637f1586b539969'
         '5954837381490d2e5d313aeb4d0fc294'
         'dcd4bb0d295913d7648b1b18c74ce248'
         'f5deeb5ea242fdf44e51ba67326e6d47')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
