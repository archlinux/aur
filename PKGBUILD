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
pkgver=96.0b4
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

md5sums=('13d55cb805f175ca3101c742f93a7fdc'
         '7c66ae41d5f8ef309e8f5f43499dd421'
         '7d56c9fc909f314f4a236ebb2e113e58'
         'f8a3de35604629987408851884241bdc'
         '7e9693032b62874ff47577584b3707e1'
         '1c31582058c4f5754ce8e836c82bd9e0'
         'f5e728c744d2f50217bd7cf3a481df4a'
         '09fe188b467e6294e96038062e022bfc'
         '708f616b6809f0bbb9fa3ff4970f793d'
         '517d95221d1559ae649af20d7e3a27a1'
         'ca46d03972024dbff346019bb530419f'
         '136d2196320603d37544d4df5448ca4e'
         '5261f73538e6e37f513601e95d63d179'
         'c321944a118507c3cb6c365ab3b2b136'
         'd5238ca81638240e0b4838b1a8b10e57'
         'efdafed4c15626daf34f56a884fda78c'
         'f133465ecab44d4d3ad0d9284d718a16'
         '419c3783ff2ba04f789315b31841072e'
         'd9659d23a1b2b6600939f7d68830b86f'
         '0ec6c433f5671e365605385f691d2b85'
         'd24e5f646f5a2065e36c4139aa55c23a'
         'e96173fb12d1d6daba36463bd9e5b577'
         '8acbc2b0c65911589cd8cc7e0e9101e0'
         'c4ea5dffdecf078e7cc44a0b3347ba17'
         'cc6b7fd4023df5adb5c48034e9f70314'
         '786168a7666234bf937ba81014b5a1ba'
         'e0f2bb7010dd767095db9c04486365e9'
         '1befa0bafe2510129a139542c97e39aa'
         '430d1bdfbf0b9c3435722c410512f8e9'
         'b0555aec9e38f8b29e6b1a4b2abc7a7b'
         'e0a679a8aae3ee5d904b9fd2e8c3af36'
         '18f9d8bd4bda9795e5dfe7015fc70bdd'
         'c84934e5dfdd45b5c0ed2f25f6448fbf'
         '8596441678c016e2d1fd3aa7e78b63fc'
         '1a834587ed3f6d0c45ff98170eff31e9'
         'dbe2caf4c25b7f09ceb82f90f0650e3a'
         '60df5d8bb47fd0cd61d4a1d597f4502d'
         'c4664a240ff05754ff09600f4568c055'
         '958bbeb2c2a38c4887cd229f239dd9d5'
         'f27f32709839b6452b49578620d4c2c3'
         'cd0c26f728d2a982c265841641b4e6e2'
         'e64e89f187a047be3ee01953790d7cd9'
         'be56e3f98858de15c91713392528831d'
         '4fef1aa38f23ced9b43a01c157e3815a'
         '90ac3c09c8adb5aea62bfd052dfa7a64'
         'a08374cf16402f4acbe738ade9df3828'
         '57e561a687e38ade3af1445575b9c24f'
         'dff9ce278a22d98305116960fc1ff4ef'
         '6ccb3f899c103fe339e9aeeb40ff5315'
         '38ae81d47417d6e18d7fbb812e5693cb'
         '22447e588ca6f93323c39a035ee10941'
         'a15e41fc18f6bc6877b9ab1051627801'
         '220c8c8ed7e3961de4117d3f0321e696'
         '042da11f887e7c221f1e89c5af5ffe41'
         '6129aa88a4e4d9a452957c47c50b1378'
         '46a6c7476648d92c3c69578d7c9019df'
         'e69989bf3c13d8a3e67068f89884737f'
         '7facb2d8ae626e5ef71cff9a85e53d86'
         'dc4dd28ea6ef0aa11787b94fcbe91767'
         'd8c00c1e3485df4f7192a84fc4087ee8'
         'ccc6109664f82f72e92fc82f21f922f7'
         '33376708c396d1b60b1e37c830306fc7'
         'b760b5b3c1f5514062bd6d85be387008'
         '8fe5c7c42dd5d2062560024536301532'
         'bfc28c24107827a3f51d8ae01df55a45'
         'af17ab3b632b4d8d64c20e558d965bc4'
         '6549b7932c1b84f164d058b57bd8004f'
         '77b73bbe6615456a22c32e868485a9fd'
         '272a9a896d513405d8932b072a06423b'
         '938a9bb4abaa525266d963d4acd9bd04'
         '6bb5315f80adca2d38342717d04602dd'
         '4493e48c81dfc6ba62838ae078986dcf'
         'a9ff9d752bb47949302c9ce82dcbae60'
         '3b0470c42659a8c6fbd0f8d77c93bc2e'
         '2a49ba955796004b5fc388bc9b470553'
         '0b61a6e9818b2f6a0c975bbe3ba98cc4'
         '79cfdfc02a32719a249df50fa51f8d6d'
         '854e02428311fb3207277a54f15769bb'
         '8cb580e2877a130d94cfcc14555f3a4f'
         '3330d61738f12c88f9b2e9be3d601d43'
         '2f9ba0e2273cfd048f1db28795b913b4'
         '11c8c2376fef9e1b9819be66a149f179'
         '54f5815b1786fa50f02e3783c719f4c1'
         '8c798b497695533f6e7834834eb4d088'
         'b5722543ef525dde41f96a995c0b511b'
         '26489bf3a478c0ded7e3b0574b60c22f'
         'bdaa82cbe345df15ed8a00ed90850c12'
         '4845e9cf2ba97f1478053316f8b153b7'
         '9ce629e08d7a0e4f0573678d7f14193b'
         '39f4084b54f8f0e3092e7a758fd5b7f2'
         'ad80d239d47e2f2d82816d6db44390eb'
         '746de37430cca21426e305caa88cdc16'
         '1a349de2aff9b58313a5f20acf1a5cee'
         'af69f0b4fcc68621a988496116492b8c'
         '1ff8c3898b118d87390c49ab3c69ff81'
         '12aa6c152f908e07c3e70b1e49e535ce')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
