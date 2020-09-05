# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0b6
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

md5sums=('b0dd987674e1735dbd43e9fb3d3af5e8'
         '3ff56e509dade8dc5c4980bfd3fc1f1a'
         '13e3002c299801081a7f81b78c2cca8a'
         '7d5467e70c87b36cef9bc6cfffaa13c0'
         'e5dd6c6b04a25375c1401d3df6c0e389'
         'e7ab22e1cc35076f77e43dd6e755e67a'
         '6aeb999381c4d8f1476921722a0cf281'
         '24599c4db7c62616f31817b07eafa2af'
         'e2d0534ae625f8ced727634f99ad4a2d'
         '43c24d6a52ba5d287c4370df2afa53f1'
         'cfa361e25cb8933f4c735b429aab2d7e'
         '42f5f4b1443691c9cbf6519dd6bd8bfd'
         '9db6647bad0fc8e8484c0e3806db7c66'
         '2eb62efa191665c3bcc8ab1a4cce1c20'
         'c01ee50a51b4310079bdbfbb2bd3fffa'
         'ef97929fa4d5f0ee36640bac5e1409f0'
         '5b29147fa96140c17185618974d1ada7'
         '131c90552da2a5914815c332c38d1f04'
         '5ccb49c2f096d7a76f61616932588da6'
         '371844d806e42c98f36a49dbee486d8a'
         '1f58a37434060be59f141aa98083b87f'
         'b746a8d6b43488f0d5e7e4f64c840f7c'
         '8a10e2a6cdb301a4ee8b8bed0046c68f'
         'aafd84d427346060b79a0ad8f75d4923'
         '6349ee5174295bcfc154b662d8b3b2a7'
         '094551635d11cf313e507018deec3ce1'
         '6f15e79525c7c94d9e3372ade9769f1f'
         '5bd4a35f4b3c97db505b32874e569277'
         '8073913acd74939f1c6d700e39a0bc99'
         '8df7046821f1bb8138cc7179d48fb6b3'
         '6c6a61586d08c389c13541a0162b2d6a'
         'efe9dc929817ba4eb234946b3fd8177a'
         'be23473adc8c90ca41b08a596b3d97ac'
         'ccf549280d09388ce00d3a3df6c6f5cf'
         '55a6f748639ab12e845219cb540c60d5'
         'a5c4cfde42bc8cf0a56e238c64ef3194'
         '9dc5893ca4a0c3d0eb795787753b769f'
         'b2c3f14e98f0cb2dcd253899b351461d'
         'ecc4eafe8b8057badf3de0e151fc9532'
         '72c1798a13d47499c10fe0b5762286a1'
         '35ff2a8d34d6689e9d142997e9b53883'
         '7310b82b1dc6bb53051aa67698fa0399'
         '681e99830e159d2f5f406301fcab7c1c'
         '4dc1091b4e0e83230f3c883f50d7247e'
         'c0311806da595296e7d2e7396e1d5f3a'
         '8f6dafaef9961aabaf5ef01835772b44'
         '6d4b49bb9cd72f674754bd4b8d3bf47c'
         'aadab503e0ee7644b33ef1da5bcec199'
         '0ec7cc15bf49319d8db4f5cae65944ec'
         '0786dcbcee3012b95cf0392dcbad9799'
         'b5b7f6995b0a38a2155c2b166f93aa64'
         '29d93e587ea59a1b96e19e90a6e42196'
         '407544ad790921f3be7e138d24554dd2'
         '5e87a7ae32d4356d7ffa179fb705febe'
         '3417d5e3bc1b13ec0c26aee238f9721b'
         '85ac96cafc555978e4d55ad626898ea4'
         'aed1fc22f91ee72ace6d372f432bd74c'
         'f1e3ab39f2776b53138e6f3f380aaaaa'
         'c5e9361dc7f88d730df32e4226bab716'
         'af51fdb6310db51225548bcab3b9ac4c'
         '87a62c7bce193cce0e1cb61cecbf0367'
         '410b94d00eb51f542f3d1135fd957ff9'
         '633e4ece3f577e86b6c191cbe7f4a6af'
         'f925a353c956b609e960c8e8b408ceda'
         '272d71f1fed0234781d61c7ce6f4f9ad'
         'c28a7282def7af4848b3c4c8bb7ad2c3'
         'f40073e40df1d77f326a2e3bf41d7973'
         '2bae0395247bf4bb3c6abc89ed057091'
         'cd65a2621e4af28a3138c51dbbe114bd'
         '2bbc6e91815c862da06ca749d109fe7a'
         '17bc8adebe616d9e2adfe83f460ded1c'
         '5302b27b59db79e03d2a2ae42eaa5c5c'
         '7580af17147b7acd6130665124ebce62'
         '45882df3b8616a21616065d15ed9080c'
         '62ecc38a4aa431084ff6e5a7fceada3d'
         'c8a289c169842080e2a1c57c8213cdd5'
         '6d42b54d8a93d1fee0f68bca49307fbd'
         '64c4b5537278aae714ff9a77f678d9eb'
         'a6ea611347ba0857650e74373c9fcf32'
         'cf2fbddbdc85542a27b3b125f32d234b'
         '5355e977935a77508c6ffef9bf75caac'
         '9f7f564f9d88596bcfc99bb05ca92946'
         'ff08ee9c9dc22efe624ca0bacf755195'
         '7eb44a4d6b4efc554c2954686406d3c3'
         '36edd910c0b26e872a2acbe6669e153e'
         '7050cd20ceeed5dce2af83736aaf06d7'
         '0cbe3f0e73f9452ea75c41710aaf576d'
         'ce8cade8b0a4dae04e536d88df3e88cf'
         '2df74e9e865cb380b28cb03969d3b406'
         'd94de3f7a37f276787012731de2ba213'
         'cb29874fbdcbe82b946ae68718c7c42c'
         'b1c6a7ff69e216d8df2d258ae851584e'
         '84bf63c233ca97f22cf9733d9d55a3c5'
         '0f98e552446a1f80bb3d72f7039f0ce6'
         'c1a298f0c267255985d706658eaf2e56'
         '3214859c0a11104b2461494b22907959')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
