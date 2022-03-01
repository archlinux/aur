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
pkgver=98.0rc1
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
  _url=https://archive.mozilla.org/pub/firefox/releases/98.0b9/linux-x86_64/xpi
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

md5sums=('35766ba99a4dd3f85be4ef11db9e4a75'
         '2899be07d125c1a9080babceeb7c8a1b'
         '0243e340575c56222cb5aa55c1f9e9ad'
         'ecc9fc816969cccd7704ac73d345a2c4'
         '8c3057216a7ebe2fb49aa7610faf95cf'
         'c64e528c598b53f3f2f9643d49e7cda2'
         '8e9d1c2b5dff57254e84e61cf9d5c802'
         '4792f399939d7a6f1bdecd517d3ae970'
         '2c4169b22f2d589353b4cb11ed342880'
         '164fbf400fc3387318ffb76b557d5545'
         'b018add7ce231aeedd4554440f77e394'
         'e721eae2c0ea8f03a5bf77381f485a80'
         '5cd1543fe8ead2aa7167e969c52021c5'
         'ea7d3938f7e63ff84eedae0dd70afbc5'
         'a2908b60043656ae57736b452fcb1ad7'
         '6db3b615613d509651417aa5a6da2925'
         'c9a8f6c9088771b70e9e14f0e93c7b53'
         '21fb0253be65059f6ca82f7fc6ecaef8'
         '11ac4e67fd7c16825f4fd9744ba53cfd'
         '1ae63c989075600d6e96d0d3c317dc03'
         '87112d8853bee964c7cb8c3874d8fee1'
         'bfd9bef4f237d3a78fab80c475ade39f'
         '9d51514b50d11c6957d36f7a6fdbcef4'
         'b995e21b50a94479178b861d22a19617'
         '2b4e0767e56894872254e08a91bea338'
         '8da36fcd0522775d763f16438b396d2f'
         '625c0393700bee3222d77806f4058cc6'
         '90e4258d6ee132ccc969ab7d4c5b2377'
         'd1b8c4382ae27f389db11c08269b6ccb'
         '4e0aacbb3bc5984f23776a62b014c373'
         'bb59229b6c12e53e97a2572fd41a3e40'
         'ecdd6671472257e79dc48864cc6600ef'
         '16ee67b9ed59e643fcc5de091098b097'
         '2632f50c3e8394221bda7ebce9f4e700'
         'd8af5c8b60e2ef5e67e4b0632cdba829'
         'fbabf9381ed8c052422b6b159391e162'
         '6e99b170ab5edeee9d4b54f7e4eae0e0'
         '942aa14cecc8636240baf4fa920784e6'
         '7a078a90f55052fbdad674fa0166bf40'
         '575c3215d03e01e1bd3e4fb4a3b38360'
         '23c9472a17ce7fb8bfd1b36998b43c49'
         '6967a10507bbacdec39558601147d32a'
         '17202d329d9391c77eb574b00758974b'
         'f4299995f330c5182395bce70c90d6a2'
         'b59a386a377f0da9abd9c5fc28f7c538'
         '70c9726a310a55124d18a4e515db6249'
         'a9ca87d1921b0727cfd02e16905b6062'
         '17528ce6b41971b375f7b51e94df3c54'
         'e8d9d0a53aedca2791e954e9f2eea772'
         'f27d78964c74151f184168ecd1b8d427'
         'be5b8ee7dcdc8c689ee99f0b62a38e1b'
         'f426cb97456eba0a26c2d3defb9a028a'
         '417866a3d37a8fbfc325aa8065fb0923'
         '4acb9d6e4cbe9ab2a262f5d24d148986'
         '5ff0ff68773cedea244978056f6101cc'
         'e1d68807f4c7d6eeb484b026e9554cbd'
         'af1317b4b5fb7e81aa2a3a380295485d'
         'b936bddb1ecfabd316539a553d560882'
         '3e1e9c81502fcf368a78aaef8048784a'
         'ffba3855785fab647e3ea150adbf758c'
         '591da650501c57b657480d1405ea2f4a'
         '3306f0b44db852cddb3501dd5bbde5b5'
         '1995451f6229e52b0bda7f698b98f8d3'
         '90be1fd3cb77dbb44d35be73c09d6b89'
         '09a515586d56f45531312c9cca9f7647'
         '2a63f98ed4cf2393df43431e68caed6b'
         '52c634d965497cff02398918f2cb1e51'
         '349aca79ebaaeba3fe0d5d40e1b5b12d'
         '9dc49bcc31e018ad27152978bd15e6c8'
         '2beb763c4db79b66adc6f7c5a3fd4993'
         'dd076a833c66636232e6375c8c9d80df'
         '3807b0a791676da44691c6005f36ac1e'
         'c3050e6dde2cc59bdcf03491c69c93fa'
         '8cccfed08ae18275a1382127b54b74dc'
         'a08a328a6c8bb5dedd032506689633bd'
         '371ac5c1a9426afd623465139a087613'
         'a0673a1807f3fb265d9ce8537e94c645'
         'b7055d5e99963895b9bdfd9e233449e7'
         '12f589f5390da41f780990ce36d1869a'
         '6d0fa01ecc85327fa990ad457dfa5b3c'
         '2c349e08d6228bc28340dea2c3273632'
         'd771bf4a747556f7125bdec1f6926c0f'
         'd9d31a1abeffb0f110499296474d134e'
         'e1f87f83a75f651d7bc4b93c7698cc0d'
         'f7feb8c59efac06a86eff8bc6de4c458'
         '18384a96abe2838e5f76d1a7312d5d2d'
         '5c954822d6171faea3e4c7744bcbb0c7'
         '00fa06ae12f0a441e91b2d90feca9373'
         '696389fd3cddab369c41e7bbfe79504b'
         'f6fb8a38b9c441a129723cc5a8a85637'
         '7e9fb867568bd446790aa562d63375da'
         '25a0261fa43819a0a09e0756180356ac'
         'c77a2a7820f66f782f51351946ac9903'
         '62d29202f234e5cedc9b57f39d739423'
         '393d9768b952839e7010b5a4338fcc2e'
         '8b0e578f801bff004b290ef1fb24b57f')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
