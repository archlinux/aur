# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0b7
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

md5sums=('ad90fc4790b31d5be17734545d1c7c67'
         '7779bd4e35a0492ea71c501406a1e9df'
         '89659fc49f9bde450dc5711844ff1ef5'
         '43cce4b53cdbd2998a1f2d57d163bc90'
         '43fd6743f8835b20a49106d4cfe15650'
         '41c3caac0d6ccf14ba773eef50edc066'
         '44283b698c4b5a58ea67ba70aa56f146'
         '9c47a37347142d62d232a7e0e77db824'
         'f3878842731161aa1ee6ea8fa4168f35'
         'bf73bacfe6c33078d36a8140b9f38211'
         'f0a08592171a0c4a8096eadabb0365b7'
         'e117639117c928c767d1d4d6cea3acdd'
         '41f1444436f4a0ceec0a73eca612a6b1'
         '149c0e1aa99bb987f731bac469db3b70'
         '575ae6fc02b799205f90455456fb52b1'
         '1d6f89f49cd1ba17286054bd591581ff'
         '0ce92c639d46c5c6f0efb395998e3139'
         '633cc42b26f2e40d546b6c8ecef0ad52'
         '4c0ab03eb3a0bcad76c17c6c890c29bc'
         '2a437dd1e78bbec63eb4432610f6b361'
         '3f38ae3d92fd829353dd9a692c73052a'
         '1517d864fe0cda545aeb2a0c4a93abbe'
         '03a16599ca7d8004798221ba0398581a'
         'f7d8c7c40c7ce90e1b3c166650b99634'
         '69d8c5fb967ebd3826770160ff1ede8e'
         'db65f4737802d0c226630d7a7d1b9c04'
         '9bbdc027c9bc9fba1b96da4726f567b8'
         '8c5bd59afb6bcbc1adacc29b736c179a'
         '7ada5998c198dd06751c9968b205503b'
         '70a47cf66329bbeec3eff5e5af982833'
         '7eff4442b1b67c2de269ffbbbe9d263e'
         '35ae84ca3b515aaa45c2332d4cd1b3f4'
         'dae4fba721d6a47d3f3270fde073a9cc'
         '2dc6c4c8b2c497b1985aa35c837bd162'
         'bd874928dfbc4705d3ca9d271edd154d'
         '116e04ed2b71cf429769108231e9b0eb'
         'ab1c5e5f712341e428d0ea2d1a2d3cd1'
         'c75edc9a8d4707b605a3365af293038f'
         'c58066747de38501998871d5cbe662af'
         'b9910ecc49acebe426aa809972b69f2b'
         'bf65bb580b9f1e991f7f5990d1a774bb'
         '958a499c51399dfd113d614ee55c4652'
         '8b151d773727801ab0164b8b8ff20be8'
         '822334b4bef8cf644b701b93d19e41ac'
         '9c0b31240d535cce07bf203bed5a1ef1'
         'a9f7ba9744ca4911262bf84b4a73b91c'
         'dd5d71b866d7196cc459676065056abf'
         '235f28294292d5a53998a5a3889becbe'
         'b0a898b9c8bae39e22f1c992928e775b'
         'd42fc0936dfaa86964a97f402f0baf17'
         'ce591c69e54df2e9569392926caf029c'
         '5faee31359404a9cbc9773b39368e608'
         'badda81bc1590ecaca23e7696e48854f'
         '04f87759f89b8861b7bbbebaca6bcd72'
         '49805ef225e12123a76ddc00377f2987'
         '2d96e410c196081ea8e5f7c90804125b'
         'b15209756d3ee431d6d9c096532b7ece'
         '0669fc12f3aea0a91a1fad2074c0234f'
         'e32f8be232fe4497497c3a4351558888'
         '169ed282c35f6ff147fb866dfcd49022'
         '1e1bffcbb70e39daf2a909110663fdcc'
         '51af8404bf7a9155838e003246e08614'
         '244bc28ecc508157fb13e34fe29d9b76'
         '08c0263c21ac41f9b29fb5f4f6c1c3df'
         'c284efb51274099ce2dc0369474dffd8'
         '4d6b4db6ca7ba47b5c1a1fb1a1d2580c'
         'fe61ae3a32c58d9a5de665c8b8bb378d'
         'e800cc301d6431465f06252bbc40448b'
         '9ac6418c4a35d5d1498e3a265eafacd5'
         '14d6835b91091e4dcc84ef8a31facdfb'
         '7e017e391250d65779cfa615067eb1c1'
         '3eae7cd3601a31fbec201449802af9d5'
         'b5c08d97bb22d7c0a49910dd7daac663'
         'c35614dfa5318c298ea52c1d291d0cde'
         '0459590f34fc892345c0a39046fd27ba'
         'b330fa2729d2101e99321743185c4e5e'
         '1926a33cb7dc0f7a8015db97f10bbb96'
         '03079cfede11e9b90654b538aa3523fa'
         'c81cebc32dc6dc91878cd78dcac7c80f'
         '7d2672341dfe7630cb86381d8d6f1e3d'
         '73bb1f68e7221ba6289457c4dd20c09c'
         '8961f3e699f7ab8b4565dc8b154e1a6e'
         'bb4c0298af18a2af93e9d994454af1da'
         '4f5ef38c3f07ae5bb44b9c45e6a6969e'
         '567280ab5aea8e88b1886b803f0eb1f2'
         'cf11e700a811749fd69875f7565265e4'
         '111a7547ce62c2c1b18c65cf41f45602'
         '0e4144a6fcf67745a1dc4e4f61297d07'
         '4c7030c5d57a24715c38ef93ec9ef51d'
         '1f549a5d2d6ddf6bab7c99acf4e29eff'
         '94acc5c025b2be810610b50ce4113b52'
         'cc2b40164bf87081cab7ee52d534ab8d'
         'b521e299f5f526d48dc9a6444da89ab1'
         '7762fb8ffc564cfa2228a0fc7c94bd80'
         '8ac35f087a11209006f615b77a9a2112'
         'eca3584cb74352330e53d428b4404c6d')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
