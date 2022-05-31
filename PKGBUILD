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
pkgver=102.0b1
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
  _url=https://archive.mozilla.org/pub/firefox/releases/102.0b1/linux-x86_64/xpi
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

md5sums=('a400007b04604a90c61ba5460042d222'
         '627e53c60c441d1ba88e929e25c95747'
         '945eb9e1b5025a2006eaa893ac336462'
         '7641b27b7b140ba83277ae7ecf4fd62b'
         '2227437c6d4cb24d6104dee60abfd8dd'
         'e88476679deca8374264bd4ee8114b4f'
         '537a02da0d54384daa4b98efc456a40f'
         '772c1d3d72e8e4b97001a6c77fc848a3'
         'd8a09d5847c5160ee0a49a4b86de604e'
         'a55d65830edec82869a86c8ade5f7b2a'
         '0d1b8056c89847c6f3bf2d46700c3e7a'
         '0fb58d7acac0dda0e0826236c33d0f46'
         '290cfc82acb81729faa7ca69e6a66e5e'
         '2830547f3e1df759cc9e3a61caba243b'
         '69b7491f2ea9f54fb28e5ca43847f1f2'
         'dbf0165af4272d82ff7b3e60d758ada7'
         '3fe6d68c5479283c8d6e87fa82bf11d5'
         '34481a0fb21ca5748d4152855e90e8e0'
         '1cdf8bcdeeef9f153e40d0565bd024b0'
         'b16f4be44a1d9ffc44825e223f80513e'
         '9ed5503dac971bb301e65f2d9b955887'
         'd300ad26d63aba8ca242f9dda68eaa12'
         '6ef53650808c5c093106509a60a7d14f'
         'd7eefde72ea0ddc2e952654f02cf7f81'
         '0914ee53848e7d41a2d5547fd6e08f06'
         '0f62650baaa12c059f5bc1a7fe6749da'
         '19eab4bae98ce23755609d519606aa4e'
         'd58ef32c649b80bde64dd2e6a832cae3'
         'caa064de8aee7990b4b6f1500db04202'
         '6805af90118d71f18683d612106e0915'
         '66eb26b85880ec551d368a69fe5a6f44'
         'ac592225681d5ca38a5f33a3d5d177c5'
         '597b61a6506e8031f65300f70eca54ef'
         '780b3414b6b3b65ec325b80697074def'
         'c2cd23f1f24c617f57f9bce32aac6d09'
         '1f604a1946931e8815a862c06c922044'
         'b588d92d3749c35423045f578ab9691e'
         '6639ce3a84f4bbaac105660b595efe8d'
         '3f4b675b0b736404d835303c633091c3'
         '7833435c9c0c8fc675b68101fee834e7'
         '18cef35e37e15591cdfcc62c2be17401'
         'f1f7bcffe44fd1853be20c7ed122020e'
         '464604733791bf97beb48ee7776213a7'
         '2005e47b5e3f2a027497ee8bc35e2546'
         'da95c9049a32bbc3196dec1b6ebde9ee'
         'db879cadf220e77b5cdcc38171f5b7eb'
         '41760ab1f99f523508b6f1df75ce6d68'
         'd8ac8bada693190c97fa98c2d926074f'
         '8b5216be28bfa143c33dc11e136cd660'
         'e50c99711b1378f47b5a27205352281f'
         'bafa2fab03be729422a8f9d449de0c1d'
         '5875de71b5d20037a56e76441734eb18'
         'db598f5f6a918b7f49c9c5193b1195c6'
         'dd0bdb5c09825fff405be218f603fdf8'
         'b15397d6869e4e1135ca99e3b36cce74'
         'ee39a6383da4d3b0cd156141b4c1da41'
         'e3e5122c2ced184a7f10d9e054e775de'
         'a8629625e6dd588929fcb41eedf6c27e'
         'b209910b4b02b032d91ed05581a23c83'
         'c508aeda8f621fdd8ed620d832ed392d'
         '27a99a58b3d0836817e96f5616652ea6'
         '17b2c07d0b300b0bcaea46995f90aeb4'
         '420c8be64cbd3dbf2d1d30ab72f41b74'
         '3bdec4c4d29aef2075de131e640195af'
         'e3a9f4bacd3f1553ff81ace083360b6a'
         '0e93d5642e6a759cbb3f6cb7ab02c864'
         'e9f3bd278993f13a188fbd2ee489d969'
         '6472f099d7f488aa47abcf9025c37a25'
         '256f55058731ca734649ff8f6c5af672'
         'de2b42a976d6f751ef68a756ca3e3008'
         '49d779c597fd1a453889335aff0bc520'
         '0a7124cd172b554145fb235b765c579e'
         '325d132d7640c97dde4e0bdab0fbd46b'
         'b997184aad16dd2c73c6f726c4a2aaf6'
         '065b116fe2a602f2ab4cce3c26e71c7b'
         '186500765c2b8dd65d4c50ce38f5e6af'
         'e2d44579796279c6476f73c8fe079f8f'
         'e72678ced41ed90f002eb23f331784d0'
         '670d7469bf367bfce500adc64b765e4f'
         'd1148dadc220201006bcb233e695326f'
         '273631afbd8df6a9e38af383a176e160'
         '6148d0138c71372d81d198e88a7bb6f2'
         '3c24471de5592e49470c77e49e7f5186'
         'eaa87a87b837552d875bb5692728b406'
         'a4fb96c6b9fb42a628a223354a0704bc'
         'da4bca75653cb88ebd639eeb665428e9'
         'b529c4c105739a961bff3c80f45a981a'
         'cf265cf2c8d3e687d0c57ff5afb0c3c7'
         'ae8d3d7a5af866a8092186f32c4bd7e6'
         '2301636108f479a9593ee4f06e6a2d08'
         '57a543d92078c8e717923f52ce1836a8'
         'af84179c4b6180b679c67b0a5b488b33'
         'e6a698ce2f22b33236268823b9afaca5'
         '2d301012033ce92589685ed8dd8a0111'
         'c344d1dbfeae85791e3bbe6b0bdd5e25'
         'f4e1d8794535748f78093774a601563d')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
