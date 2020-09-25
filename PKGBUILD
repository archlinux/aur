# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0b3
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

md5sums=('8b9c930e30d74c28ec8c31b9ef2c6d2c'
         '443b66c1f8547a549dc62dcee0ccebcd'
         'afcbe6208bf6800648458c7b5dc4ce51'
         'd4bc5d4ef8b15033a890b504bdf3d206'
         '5f5f38a853c59c141f6844dc9fb00b6d'
         '599a074b9cebc95e138e87dd7b3ee996'
         '1b7395fa8c67be6cc831b31e47e7af33'
         'ff3138414082a44b7685070f45f024d6'
         'e06a6c76847f697e9062b0aa2d9417bb'
         '68be842e6c29429467731e9b18eba779'
         'edf84beb7dea01e1bbc647a65e28febc'
         '2d02dd03c325854801c92399938583bc'
         '980b5579693535f9c638789f974fc259'
         '37a1409dd27d490d30f2176c5ea0df1e'
         'c4f7b6a72173a346ee2019efc0a2775e'
         '3c01eb0d2dd78d027bcaf78458b7bf66'
         'e2c0b947f4cd07376f72d397c9a22121'
         'e014e08dc70640d706884f24053608ae'
         '19b62d8da772713b2d4c48c627b03410'
         '4d6b10623fbf3de138a5ad22a2f9e6fe'
         '2a00a594981c6c0009021361708abe04'
         '0c876182ac973a89cdeb08c6642b9c9a'
         'aa0f83971c8731d1a9a5ca549857df6e'
         'e1c20b2e2cd50a1b7c00f94ae7043a5f'
         '51aea6f904d20ac6f45864cc39bbc656'
         '6c43bcd28f95b12853685999f7d5b347'
         'e271667e4ffc3f3b07cefde2baf5c9b1'
         '4fa3e44401ee3d3a59a0621c84b1e7f5'
         '1f3504263b78607b7d5aa30b3460fa2b'
         '897a2ed6d4e75c9e684ae72381d37a62'
         '837ad0eebb45066097362de1951ba8e2'
         '416944f39f0f71a6541c18c996f6da32'
         'a3ad66af37b673408aeb3f80909e5863'
         'a857775c82189d981deb73a27cb7f992'
         '9bc4c5535afe64a4596c46efe3dffbc6'
         'd50009d30507240bc18443390ba4bb27'
         '8ba0e981b097047be3ea16abf2ed1423'
         '7ecbbda5ad9c31f389a8fb2b9a506e30'
         'ea70133fbcd6a17df47d9bd77f561501'
         '24ec2bc63e5edf8cb6f7828108135c9e'
         '0917e0f27217779c3eac240cba3c91bd'
         'c7987a5e2bd27c27c367a65386f8ded4'
         'fe97de20ca7072309b5a24f70e3424e3'
         '0e049b7b93fc397af03ce5c737f28bcc'
         '06e32782bb33612425e4b2e1559ed41b'
         'e129c51570b7b5e715382371e5609698'
         'f6d6bfa84fbf4fac0ade5ed4888bc1d6'
         '0f7dd6b8503ac200c8ca4e8d45e8fa0c'
         'e05df0ef5b8075ba51f8d80a9c379b08'
         '998643ba93270c67a6feb34776743bd3'
         '8fac69380e8689db2fd879a16f8793a6'
         '87253149b58b780d0f2b16d11ba0a216'
         '5d00d33bd89c0e2c81e41dc8d917b4ff'
         'f263e10e98b42841e9a2baa38398d962'
         '65f3c0ba2a888f5d8205b204b4877ddd'
         '8f84f656d731b6043b5842eb115921e8'
         'c1b6dad06a261950fdec83fa4634dfe5'
         '548f23e5d0fffb641e75de95cf8564c4'
         'fc4f558163da7c4a682f2601f6921d8e'
         '8544aae0c5d789144d9f06242f52256c'
         'a0164f75ba1c48875e806003f5482633'
         '5531b71aefd2f4084706e9afbaf55940'
         '7105873984142842f362e3d1bdbe9262'
         '9ba7bbe4252af0714d2a71411f3d00ce'
         'd1e7638114158b363839f071b4e4a6fb'
         '9f13b80b234874879b3f7770943af1ea'
         '5c5ec58a90097c2892dff527b3915911'
         'd2f7d16123a04b95e0ee050219ba0a60'
         '5a12b9b9261286da065e49f990957364'
         '2f07d5c017b4a69ec1ac864f4bf526b6'
         'e5f44cd777f9f8d526b7c9ffaa12ff99'
         '6245515c2265334749ca83e52f0e7e7e'
         'c0babaed83b52e36952af0da9ddba469'
         'f675eec5fba86585dce2c1928706c66b'
         '1174a5b8f16f51349fb418cc2989c52a'
         '11cf307e45a1f6b5987f09a2dafd31ec'
         'e43f5f664737b07caf56bafeebcd0253'
         '0e76f4ea60bc02edc4cf79d5f011b615'
         'f5ab0575c68158fd2692ef5c2102fedd'
         'e450ead7073dad2c083652d7860f9222'
         'e743768f32d4a374ce45d87e83d919a1'
         'c5c66dc7c47d1546f0e1745e0e32734c'
         '4f74d4d899eab30bb335e87fca785d82'
         'd59284c6e41a5e776347d3d6451a4a64'
         '7c94c76aad30f035d4746b0c6fdfdcd3'
         '2c367127c6be21b3c70d045d03cd2203'
         '4b292aa4d6e518f2cb44a9131100ce93'
         'b496726e57346843dd73ecfb3ea0228a'
         'b76b2c5996fd610e7d59241187908b6c'
         'ef08ba3dfd4ba77a298937f20340f427'
         '7f50cf7972fe73599b57c335e287afc7'
         '10dc1fcf7daef3bd6e8259d640f5cde5'
         '76bb98b5286639e8713bfe7aace49597'
         'e47a018bf66c9aba53ebe58446d7063a'
         '0dd3d8a8dce77897f2c937dd25c7ba10'
         '0a5fc29db8a218cdd496e602e1bf6ae9')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
