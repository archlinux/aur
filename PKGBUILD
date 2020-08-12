# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=80.0b7
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

md5sums=('d493bdc1a703542ffa3e25bcea8bb7b5'
         'f2a0b477ea850ccba61b45cc7ddec9b5'
         '232911437288ab2c4dd37368de579871'
         'ab147c9d349a3f525dc53a9fda0bc0db'
         '0cd1de8e7ef612d15574a34c65786f6c'
         '4e1a89b0e5f857b9fe2d9b50ee3c1a16'
         '187a19effa82bb70edfaf8c3a2a1eeb7'
         '21fe9f2798985543b5b2063ed2f83714'
         '0dc330c30f28c23b02cc97f7351aeaaf'
         '8ffd569fa748ab80c7713d9945b8ab78'
         '294e03823abc6b905ddf48b8ec247169'
         '9294c05411fdc1c270b8e44763006dfc'
         '0adad1b84277567ea5118a80f4fe50dc'
         '7cbabe1356764a77c01b4ca07ec9ad44'
         'e42df97bb735d74f4ea751a64669bc1b'
         '273d6b87f99d9c2fc5b701877e21a7b2'
         '2983ee81d53148efc6928db4e4e68f5a'
         '25de8f59a258d2e61b6ad775ac663c0c'
         'cffdf57a2442d6a7851230db32185de0'
         '2b22215b7a1be4ff10226ed3c3241a08'
         'fbd289c4c63c3ded2f044c8ef527241c'
         '12dd7d4c6b36aef6097e47cc3300922e'
         '3ab9270c796e74c051645b6e0c9cf06e'
         '276fe9fa397749ced6df56918a0d063b'
         'f7a7536b5d71affa1d045133a1b59ec7'
         '04ace4c5e143745208e0f1e8fc436f6f'
         'f813e674d9f6b26c5efa8e8ed2d13f0f'
         '9c4f784c8f2e91124cd54cb2c557438b'
         '5cf29af57c6138f5a815cba8d1ee3680'
         'c8f7c66411d090cc64e8592d00880806'
         '92fab803803cdb87cfabe3c0cf369681'
         '0745bff8083f102b8b022e7a5cfc2c61'
         '2f152bc0cd08609af38a44e679131a12'
         '196b9f58f17f9c366f78e1366b23363c'
         '0ff663e19c88c708916f8c58ec0d8036'
         '21c7ce88d9bc6f35c9a36385f424e795'
         '699e4fd1bad098dd2489a84a1b0bea8d'
         '8f5144bbf88034202ddaf00c49fccd37'
         'd6c33fd157a319a03c3ff5535a60905e'
         '14c896aa6faeb681ab71aead3707d092'
         '32e84ad1f8af5ac222ac20d7096dfe84'
         'c7b0386238b8dfb166dad9588cac4bd7'
         '453e3f8ba7485097e3893540717aa380'
         'f1a8fd7ac5002a7715719a1d33bc4e97'
         '815beee0dc226cc54940533cf940a268'
         '67c183740c9508cbfd2f54765e2fb926'
         'c7b4bb80b0e954e98783c85d208711f6'
         'acb68ff8d5128b9705909807037e8885'
         'eb842dcd8aea297672829fc10d000928'
         '6eb699dc30442c8bccdeffca7b477300'
         '1e4aa20b874a77c65211832b50b7ca23'
         'e9fe84353fc4e7409c0f5f0a2a4ca177'
         'deeb4be9d537ee65929664dae5199591'
         '7826a4f1b5011598b43193fd8192ba7f'
         '44a1dca6d9cb5918d7b3f5e3921f739f'
         '15a246772cfe3cbea9b382b616a216cd'
         '18e090f126c0460a41b335aeed444be6'
         'dd6ba1c5842bda4ed91292138ad9fb31'
         'ced112d63af0fefceda5467816ea630c'
         '7ba2beac78aa7985b842a386d55a120e'
         '3d19d0cff50e3a42721151103be8cb12'
         '57cf1fc3b961d10b0423614f36073dfe'
         'fadf1cbb7f6d8df80cbba5114e117c61'
         '26efa15f54c4d08c87fc02ed6e952474'
         '4ea73c2a72f2babb6e83b8510b4ea60b'
         'a77ea4f5fad27dfb1d932cd24a10cc34'
         'fd8156cedff9c6cf731a9567a07518a4'
         '7d4bc2c5a824c73bc4725e43db6a3bee'
         '0c001e4c001a0c70ebc0f3178b7784e3'
         '25243062bb91843482fe4a54f829c24e'
         'ff4a5ba58e799882e729a254e0e15533'
         '2ed3164bda24a103a32c570450846901'
         '9d8c8ad18ff03840c424afe2e0842ee3'
         '3eaa6acb59a3ded6bc134ec8aba5b6ec'
         '4c3728d1731a58bf246b9a99f0428d8e'
         '20aa4d237a874ec45c1d04fa21956a92'
         '4ec9be24c38f4b778cc3ec57da434fc9'
         '7cd5b3b72b81d9ca0afe77ed1de510ce'
         'ca36dbda2e2c59c88f2c38fa4a8b1c69'
         '731e354637b5818662d3389dc4d40dbe'
         'd054321ce72fc3f177c916e3dd0b2cca'
         '7820b66688c705b1d3449067c5a7aea8'
         '4e89945f8863d6b10a08e9de2c36f3e7'
         '9223c2c1c7af9654a5aab4aad7eb8798'
         '7c858ce2e6273304e1bc8ee92bec92d1'
         '6b439f001d7eb547706dece6fbc13465'
         'f04156abb24f109ec716c721b2c9e2cf'
         '3440358980490e071b8e7c5e08e36ede'
         '2db51dd9ddef58b84c859f23c2d3d0cd'
         '75eda8918daec0e80218be442e9f35d8'
         '85af514e913959cbb4993c32060c4f4f'
         'ddc55bc8f15ffa1fbb0e8756a33488b9'
         '75c006ccba16bef00db5ec740b533b5f'
         'fc5fa62d97a004c380bbd85b7f553a93'
         '3f5ff9e745fe8767ce8fbdf588f8f504'
         '93e4b690b7bcdb27d62026a50449437f')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
