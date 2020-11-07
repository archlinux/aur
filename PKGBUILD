# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0b9
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

md5sums=('506815ca638ac0cfe6c7f377560864bc'
         '1018bf5b1f69a92cb8211718da48ebb4'
         '1fa6a38a327753c2e715b74e4a8422ca'
         '66ccefbfd8fa7bd495b19cae95302df8'
         'fbdb9e7c897169e9994a8437e7fb2163'
         'ccc58f34652a29f53b3c058f44f0a506'
         '5b820920c56895d8ecdfad7055d6c294'
         '4948994e86f0b0481c7050f604efa68e'
         '497b6e4fd1bf9845698e6fcac1ca088a'
         '4fc4d6abc80b30cdd2ea165f5febcb32'
         'ed815280820bf2ee6ba39914e7b57855'
         'f4a1636bf4f2ec30a17f17683ff43880'
         '25941e83624090deaee9ebc15cb9480d'
         '17a7e0973fb996e518c89cb1e4603c9d'
         '443e9ad411efc9174d55c295d186e8ce'
         'e15cbe22914ef6afa7222b86e79e5986'
         'c958603896b03bd22b96316ff523967b'
         '3a5b53038c3ad7195cee7000f0d9dcfe'
         '9a4a28c86624141c40e4ede2a2766043'
         '763f88ee00156d77ee8df4f994aa80bc'
         '130d91191f23dd65e85d433fdb3832ec'
         'db975248dbdfed6b7f596fe0f07eb283'
         'bb4592f137d6476bf6e7a70774f8df3c'
         'cb3a81e46d8a9c60914943b7dfe513e8'
         '270ebabd891ab54c07b54c981a647205'
         'd92c68f86646f49df07443eb98cdd24c'
         'eca21507ce1067b754adb0249c648f99'
         '6c0ac4d9cb3b273cdfe2f20669570a6e'
         '0c3e1bafb9a884719067bce6f0beecc0'
         '097395d921a0619fc6215f952c24052a'
         '64eebba951d7bb725334b011dfc03fb1'
         '75bd7f800799095af184806322520fd3'
         '4d58b793e6c572d9d785397efc5a4b7e'
         'c65eafdf2fab04d33d7b5cba2b090314'
         '3cfaa6fcc0cf787d7151fb46f2cfc062'
         'cf226ef8568050ecba3918b7aa31a55f'
         '897acde3f405b1a0e6177b3cb8232cf0'
         '33b7ebebe42d68cff08c2051e0cb50d4'
         '5c59875ada69fbe1928c911385fb53ca'
         'e450f0251448afe332528f61fa623aeb'
         'e46a07cefda37a5f0d5eb29d3d6a6625'
         '649e333c10ebde96ec1eac804523ffb0'
         '381b0f7afaaf215ca7311b74b04e91f5'
         '9f5d36949fa686386d4aa23084a0aba7'
         '37df80475b5587e70084111fb9a329c2'
         'b3edf2aa5a0305a66c9b1d142b866585'
         'faff3c017db025b5ab28aa3603badcaa'
         '5a39ed202475de19a62c4d2e77ef9e48'
         '5a1fa54fdc124a0444b999fe03763158'
         '695d5fcbeaf761adaa057153e30ea1c1'
         '723fd78cd047436332c57970d8404b32'
         '410d50810b0f8f5f59ea74539938718e'
         'cf20f83010f38a763e1cb60932776bc3'
         '4193cc5b6f978151bf901fb263a1ad0e'
         '0f7f15166adfdd83b1770e8f7c07b658'
         'fccc68753b6faea3af340f47ebdbb05c'
         '032af9cb6c6ff24bf9fb3e4694f19081'
         'ad69bdc5f6a9d14af5896a08f9fce00e'
         '73c34d151bc6434dae5734c8d19f872a'
         'aeb5d5148f25e9e704331015b637a6d0'
         'f6450be7ff47452d827d371cdc3b9f5f'
         '35343001ab1b712be35b22efc1997d37'
         'ed048b412dd11863502f4ae786d78efa'
         '41f70989df31f2e3915c62a286bcf850'
         '328ec3b53ae98a0a0694af5b1500d7a8'
         'c65d3e392e19a552b9a19e660d4b4a19'
         'f8ece7bf39de11a64cf6f10167ae5e50'
         '6406e7a48eb4bf95139700b49779e2cd'
         'dfee49a0c656e8f02d99427a97fb1874'
         'c4cfb66470246f2e80f38d92bc370174'
         '9a182e040e5da4b01b1a04cec9a29729'
         '01632f0a170a97ce01aba541c4c4c261'
         '62af9ae7d06b07e38c1290814752fafd'
         '31e1ba0732c2d15b920385110ae6adf0'
         'b23504288b8eda774cac782c3960399f'
         '9beee6e2e36ba6ca1a185c86005775f9'
         '60817fc55a50263d4b558d296ca17a7f'
         'e92e1b8eff6fd9da2e4d02d91124782a'
         'be50ff806d8d93073a0156032045af56'
         '5e986345ab27a396c7a2eba598800fa0'
         'f232b16206587e4411a8f9dbf66f8f7b'
         '7b6ac1caf379920e4ffb0c458cd32236'
         '7d616de0fba84ac369e6bd8fd72e2d65'
         'a56a64bd32fd64c69e9f985e5bb6c567'
         '805f79f6ee7427682dbe5baa9dc899ed'
         '7e92b7f4080db86c0c29de94055d78cc'
         '45bdb97d2f049cc8f6dc3e9ad3db50f8'
         '3ba965c6cbea44b1a542d3285e003258'
         '243fb6d000b93de9fd5f448f59372f15'
         '669ad3404025f057139b273d5c8a74ee'
         '59e8d0c67bd85f763aec901d5a6036e8'
         'c0f595e5bfb64e20b2c3d54681859de4'
         'ea19e440c4a95d83729fba2d5db23617'
         '64e632d2e16dd7dc799e04dabf8556d8'
         '9a47f0e2e5ce633ae62792150df3bdcd'
         '5bd0b1ddea1a832b653c6f6e6d909798')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
