# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=86.0b4
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

md5sums=('2bd247f42e24351a708e93f26556b57a'
         '225dbdf21a7bcec9db4638d8d207e53b'
         '54f1d24df0d47e0a47cb89afc58c52a8'
         '4c293c99047ad84a3b9ed5c882d7301b'
         '254dc4157fb7fbf10f669a1f91d1c8cc'
         'a786e30faabf292ff0b65a77bc16cbbd'
         '668b808dd5c82722b1e039b69bb9d568'
         '94f72499bfb0fead90ce68c76d75612c'
         '1b327a50d9559dabcfea0548a92411dc'
         '06fb29638167e1c43d99a3213a3393fe'
         '88718f22e3eebe200106cc1fba28615d'
         '320ff08e089ebe8239978f03537019c4'
         '20f6fd6e106adc754cbfd9622a00732c'
         '0f62dcec0e2756abd7aa83dc435a9626'
         'c49bcbc351aa889b64f1775f80539e8e'
         '7eb6f19698482507a92d9f8fb85f88f6'
         'a8c8c9546d8d00fbe8ff7e4553368c65'
         'a9b29bef89228f73d557bb02f0ff5dca'
         '43aa2ff7b958e741361934062ec5c983'
         '4882aef872ab3aed4802d114e82c9fd2'
         '3978a10a25a77c9987b9107b56cf74f9'
         '6f46f63338ecf072283d854f377c4d70'
         '76b0af6a195aa9f02eac55a54670d777'
         '14ae4d90e3a68f9a69f8224272c93985'
         '892acdfcd4a12ead6570f5eac82777a2'
         'd022ab0deaa02e3a9c5ba45f7190b0ca'
         'c3c3adaa23c097532978501482f9d830'
         '13461c0fd54b45b1c64d86117e350dee'
         '9c330d046a0288379492d1d3f7fc16af'
         'd965b343c3f664bf3392c9e4d9a95ae8'
         'bf3be134fdf001e58968ed3285750b4b'
         '0ff6aaf63eb78113c8f6a3b587beee78'
         '8c1608dafea781b0595bfef8d24f6a6c'
         '455c197d022b226daf94e5570002c045'
         '1987e383a3391497dc0b243d5b7c4e68'
         '231d09d53e824b87e29aae37c63de760'
         '6d0e15ba9e948704763b45b48db78eb5'
         '6aa310a6810928e5d4161914caec6d8e'
         'e644518506639f205832ba6edb032fcb'
         '7fd18adc4e6982d3903fca326d193267'
         'c98a93a273afaba14ebd01f21d4ec778'
         '432c9f559713a3bb5d8fee3f72ff17be'
         'f210464850185224d2f3c8f276c2e9eb'
         '0cf996c450e4867afcda3bb9eafb62c0'
         '86bd183d3888dca563f06209eef9c19f'
         '8acd4d4eba54ce5b6c9d32541a084efa'
         '7081288bd1df84e2b850204934781976'
         'a3ef99bfae6bb19cfd045ecd5dab216a'
         '6e7f51cf9e531dae254065a59d173337'
         'd876967f047f8fa54acb9e4177c90c1a'
         'e7ff99ee50655bf1c393b130c420dadd'
         '943d9aa1e235c91663554b22ba69f1ea'
         'c68d983804d46ca87fc8e605bc30ae1e'
         'd61fb031822d4b4490b5b2326d9134d2'
         'c841f8619f4b1a3977062669b723f106'
         '20942da6a81a60b6c369739e85cf9662'
         'df6ae2f228a357180169aa689bc11eeb'
         '918858dcf3b40930cedb4026861ca6e1'
         '18df5c4b894a1584606f5f76ef364a2f'
         '1f442fbc9bc3eaa7c3a01a605774e63c'
         '7deac35ad6666582f0b382d6edb5317e'
         '547344511cee3d0ecb78212abf3d0eb8'
         '2fd4bac18d4eea0b52306400a0116ef5'
         '0a65c942239c5b7d17f4ce96f59936c4'
         'fabe99b4ff5cb31becb2a78ba80cae0b'
         'e01d9ebab287e4ea15b534c80c085531'
         'ccd0732c7b9587e83d2aa1b1355b58eb'
         '6ef5c0f891e29abe9db0410affbb176e'
         '1783f8bedd152a21ac73bc3cbedfaaad'
         '4e8350dd91887661878b7773ee271843'
         '5f89eeea6a1fb6d2f963a8ed6d0a6722'
         '04f225bbf661e43718aba7ffea634840'
         '52b12ef196c5c5fafd19d0e540b81a47'
         'e858f4557664d14a30a8e3f8ab174bde'
         'bf02525ae5eb14ec5745bb8116fdde7a'
         '0850e9fa96bf825afe149db858732f64'
         'f0565d71524e55f94f6d17504ca24c4e'
         '7c0aa7825003b5ee4c3e873ed4d7e0cf'
         '717d4579f6b9c00f647a4aa3e63c0318'
         'e53fa5e5ec5aebb292032af76d5dcb9d'
         '38f18e15dc15e8e1d58956ba015275e5'
         '1780b62153990ed4d53213b5230e8aea'
         'f3dfadf17a5cde1da245d0945085c0e0'
         '09af7ba82d275e124e3e534e361214c7'
         'cb78e7074f332663700e3c61a25f166b'
         'f093e453fa23b5bdb59b5cbb7120b72a'
         '0e5c84d215af8c242971d7aa1943a997'
         '5eaa539f35c52be3af186af82db101ed'
         'ea17022c58ab478b34195b715409682b'
         '0307bfd7841dee4d20b325294cc4dbb8'
         '55d1493a65d81bf582aeafe6c7dcdd4d'
         '9166cb4cad611f5924b582ae51d6ca73'
         'e4080d9f4a12a23938dad985f9cf08e4'
         '5b8cc4c849e672358bd71f34587057b0'
         '2a0571a594cdbf23831919f4457825c8'
         'ee623a70ee30de76375d02b57a372e40')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
