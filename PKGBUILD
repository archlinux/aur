# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0b2
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

md5sums=('41143a67b40134de8d0bf91235ae2cbc'
         'af1b2b0dc20580fcb9270cc1a460095e'
         '35ab0a62ddd2fda035c4fc6d0cd30597'
         '5d0ad9f95b089bd510204b174889c213'
         '7675810e2a0a920606510c7463d92975'
         'eb9072585dd490b07e965fa8ec2126ab'
         'd0206ac2249249710feaf488f908e321'
         '759d9ce7238513ef51298d716fe92e29'
         '7a4c0306c617a6e6fd83f0e73348baff'
         'bb41828216055dc62f6b40e1b489c304'
         '91ce6e15096d30309551c674396f7603'
         '32963aeb1986010a942fc4e9f3f0044b'
         '1ee931b5c8f7a3d72133dd51e8e95a7c'
         '48ef857e5a47edd7d7c3f69eb04c7595'
         '5abf043deb83f508d463ffe3d9fa920c'
         '0f4d9da6325d92408fede2908175bf5a'
         '1c97ee19cae0f49de12a3313352a0c49'
         '0f0feeb72a7a8981c9e1e08454bd9fcd'
         'da62b83fb703d8fe8de764a1926bc86e'
         '2eab96f96ee08becc910e0278aa21913'
         '3bb5e46def55cee27ac854a410dcfc8f'
         '3eb121a9323130b8e6e637e2247221c2'
         '6d1cdfd7f8ff4693db29ea1fd7ce9d51'
         '75fb6f030b5d53fa4654d648f8e10665'
         '750d6b080ef0a1555a490c02eebdb5da'
         '6fc6c609aa942f8f4c82ed959aa29291'
         'e0baf2ef7605159b02623f704cdd3dac'
         'd11fb8380700f49e3e4e86085a30a9b8'
         '1fcb0a5b3d2a140e64abd024884ca69a'
         'a56252c39bec2f8d39568b46685da501'
         '0e53ffb77252b4f98d7cd97a2001ebbc'
         'd0d33a4452797c473fde5d887a95f904'
         '6b1388af6628b0eb8432f653db2cd6cd'
         'd1e25983122cb8b36e71d5571dd17f38'
         '2a7d4107f65eccac06aaae033b634db9'
         '74d2a3ab9145163d6cb54606eb675d63'
         '335dcf3be2ebffb1f5864b5a1a227ece'
         '5edeea19c9295b0ccb92cb10efe51bd7'
         'a9df2dafb24b468b9c44932f0e46034d'
         '853917c2f2b7f95c740b0d9ad62550d2'
         'd9b3e9f74fbaf2a82e37131c9ffe51c7'
         '646db119a8d81d1e2cc243211d86a190'
         '903f30a6eefe520ff9b437cbe629c096'
         '14bbb82b66d9c47a522f77e7846202f5'
         '232c40feb0e01caf0c4104b7db1ed330'
         'b9af41a14f190029eda132a36e28969e'
         '8c90c046efff9dd0cfc384370da6368c'
         'd4d41385ec69825c113e6790193619a1'
         'e7f7ce5f9c578d58081195b242a74a59'
         'e5c87e43ea1db3c778ab310aff1427c0'
         '700039a95167a9969e28be43e743ea4b'
         'fe6f3eef20307c1b85cb29dd1196aaf2'
         '71109acef2fed67a9697812d896a5cd8'
         '974b83b8606cabc658e6d62105ba06ca'
         'c5b3734df8c3adfa434cf266d0fd7960'
         '411ebc2438cc535c11cde08ff5b99ee7'
         '07a696e59ae75042865c637f87cad566'
         '8ee2d6a78fc09836d9b6e7210610a8fd'
         'e57183f36aea9e012a6608c431db484e'
         'c69b3d4d6cbc07c65dbae767fa32735d'
         'a4d171cd726341d08b7c14baeac0db93'
         '0204c7884682e181e4be4ef8b324a7dc'
         'a7946a423ad9d2c68c6b71e8345c1316'
         'f62682b0e0afa28942ac2c1c712faf41'
         'f58a2f258c81216fab36c76a6c567e04'
         '194ba309d5ec08761398a6b82a378d90'
         '4f3c2058f21374c3afbcce4a60095138'
         '2e2689465e7a8678e87b153061209dd2'
         'c623f97f2c185a75c5a6c4b558c8d8a5'
         'c7cf1a749fad9217f0ae3ed35f32f966'
         '54cdfa2bd398e8bafde3988392c5ebef'
         'f0b8c36a05cba0751463ef1d4d419776'
         'c7a77744fa64fe489c1e999946ff81f3'
         '0b5f1cd095e4683f3b9e97148caed58a'
         '6c93642cd44d8328e6c081f06e4c00e0'
         '0f57d21d6a9de49537e8556d742a9f27'
         '2a415dfcd12ef339a101000e18c3b49e'
         'b6d625db1ac71e735daa833101b504d9'
         'a4a9d9228f20f9652365cba5e0accfd1'
         'cc164be3bd8e1cad0e346733c6def5ef'
         'fc666a57c133c7088bb43e535ad74d56'
         '7e19d4e55bd0f8eaff86ed74497e8b02'
         '973e0bc7f5ce7bcb9fa324798597836b'
         'd47cd19e6ecccb89b0dd26f295bfac5f'
         '92014e3887a84a797b1d5dcb2020905d'
         '3997e504df46c132fd1fe4eeae1713a9'
         '9f874a2b6a283db005226a562fee371d'
         '2a9249801ffc9c675cc4ca67e4fc2fa8'
         '74275d186be2ba259d4a1dbcfaea9a27'
         'fecf8f3a2e69bbf16bda4aa78eed4f8c'
         '96f8020a964d72ba7faad133472d64d4'
         '01c1b02027b509eaf302b5ea7db8ffcb'
         '30cec2e70cda63d95ce40dc64e6023b6'
         '421d4d5e41e51cd9caf55e9982c2ec4d'
         '191e384d2749db67463ca1c63d2987d5'
         '640155ebda7d7ebdb8849747243badd3')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
