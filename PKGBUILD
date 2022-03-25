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
pkgver=99.0b8
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
  _url=https://archive.mozilla.org/pub/firefox/releases/99.0b8/linux-x86_64/xpi
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

md5sums=('51f5ad6ec06398f8ff31ce96ff516cc0'
         '9aa925c145fd0b956b1914d6f1492963'
         'e19fc72c6fccc3d5498e79a9f125f532'
         'fc016eee59e3648097e5a396540be697'
         'fda476e65b1c8a8dd806c0244d28e869'
         'b22c125f415c036f35547605e5ab39f6'
         '29241524236f320debbc2e0a8a5b7669'
         '09060630996892fc706939aeab5e14db'
         'cb74525a33b2ef133680104c553430fa'
         '022be53208cffa8eefa33cc9dc8ca743'
         '7c93242801be527e8c2519334b63f7e9'
         'd0e2190362714cdf0ddcf077f4604b3b'
         '72fdde43bb01bd5181a58a6aa2657e95'
         'cc0dd51398fe45ef099a6bd13a8aab3c'
         'cdf5a09ba38323f18be40654e76387cb'
         '8a69dff8a08039b21c45318b63c35c49'
         '11ff19f4fd46668d113c8f270bf7629a'
         'af35356a7ef0f1cd674603c2a70204de'
         'd8ac96a34f42e581c8f7cd4c59f5c330'
         '5d46362e20f73774e041e85dfee4a2f9'
         'f3e9896e5eef5022180008c2803d5872'
         '373acc7683957b0e68d8bb02336913c7'
         '53178c5e4b3459f529165a23f148ad1d'
         'de455c0f9aa1694366666bccd5fcedae'
         'fad90aed4218d4a7f1a5751e205e1528'
         '97c53af71163ad178a78335810a927bd'
         'e8cf0e821caf325c0e4e8b090731b187'
         'd4371f6d277fc15c3e69563ba39d46ff'
         '088012af3b5d998e69796bb12994a17e'
         'd84d895e9a44d10b396a5560a63d2a51'
         'bd96ba506595200603dccf2f11150ba4'
         '5314ebcb031f014f95ab003be0d6b964'
         '5f3f763aafb2b2cfa4bf54d303637eb4'
         'ec94462d3c90e71c7945878c18764e1e'
         '609e2d7f03e9e16d802a06a4217347ab'
         'c09f196f2c6dce267c4d9e7881986443'
         '6191667b9fd29cc64d24deafd7a4163c'
         '6925c180e53f0ee78c89639249779891'
         '3d2642ce33b4e70dd879d2f3f9b15454'
         '0afaa8b9f3d5f798acbb9698e099bf3a'
         '8480576aad462004ba7259e7e45000c6'
         '5e340dd0dcfd619fc0378b0be8422d6e'
         'f7004f926e0113f4dc53de5ad89c17b2'
         '34636445f06c7328a6039ecfaee1c9ff'
         'd965c0f974f7c5e3befac8491778a2df'
         '73d8e22c686c53118385760ea732ade4'
         'a53862aca7722fbf8667aa75afdf03d5'
         '59781a80c62d2ed6d3198902610a40ec'
         'e319acbc3d28f155f0456ad041570494'
         'c8e6ec8983b08edaa16612b8724abb75'
         '22ac0315e14539b159c98cf44099e95d'
         '2b0dfd549dc7e1a034efb4854d9ac109'
         '9c0eda5f53a1cb67b1aa6be8452a82d9'
         '8ee8f152fdd4f613049be39212e103ae'
         '5b150cc42b8da4a2135693ffca197cbf'
         '108664ec43b7bbdca24bee442acda7fd'
         '4b448c6937a8b155d1e63298f34f591e'
         '455ab2b8e653938f6c5c1656379a60b0'
         '8cfb9011d56908749890aca18e235582'
         '76346405f805746d2c3a7757e61fe514'
         '464e0452ddc101e180b04c6a6642196d'
         '97f19c1947683f854884266485806430'
         '490851451f6373cf23720ce7062312bd'
         '625d5eca097ca2eb7386dcac72ccc4fa'
         '47af24093aa2a4f93eaa6c7fc9cc500a'
         '693b01bbc32ad58cd6d5643b0df5117e'
         '4b7a318c4237c701f2b49c4063d133e1'
         '1b06d8d6d67c601709d1b1a2523ce53b'
         '4dba4efbaeae4bf544e74c23cb017060'
         '38df27c37fadb9833df2aa87ae96d004'
         '21a462856ed80159a7b935e454d39a9d'
         'd2cf05881744ed22c9215b62ce2f5c69'
         '65def72a2a503f5cdd088c4291cc5a6d'
         '473e1d998555b828267235d883a74737'
         '609fbf8b20628aa5e37a23d6ffd43001'
         'ed9ed397dde530d131d9739fe193f293'
         '9ad6e5fe5e88b12afdb1cea99efc9624'
         '865a182be52788576ce6338e050fe5ec'
         '3f5eeb70dc5f3f1d646a5a644cb966a9'
         'f141ed9efe2953959e0a0af1a84e11f5'
         'e4d30a628e6e6c17a41904094f438929'
         'e2927d619d7d4cb79bdf90ab27680610'
         'b85465d6f77182ca714a4248bf4a5e4f'
         'da10440e20155cbd4838c8931781e2df'
         '3a472f9fd5272757d65a31c8cb287ea8'
         'ea0f64b4c8c7050778825195d8188070'
         '7520f745434377a1c4d0f7d92f730fdd'
         '4c89ef980d0d35a6412dedbff6ab5ba5'
         'ed128f3fd4c9fc8f19584f0292c639cb'
         'a0ed620aadc73a781785fe61c0c8f01e'
         '0a616a7b04192a2a89d337cdd32e04dc'
         'b0db09d5ba8dd950c58af480d46178c0'
         '6b52587c7857343ed7b96fe409965361'
         'cc43273db45f91e18b897f51ae60f819'
         '3319db46aefd15daaf87a5f01e623a19'
         'd34bd106a731593e0f074a5d18347991')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
