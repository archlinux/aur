# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=92.0b1
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

md5sums=('8fef2e0f75a16480a394abb1b23cb07f'
         '918aeef6429306d0fe492d4d3bfb4d1e'
         '73b6a74b2375ae0506d7144d39c3ff53'
         '7d58ba25434f4c4a58137d7f39b323b9'
         '6c92b08f025dd9632e368847a6e8c7ed'
         'fa9f075f5ce490d1df17d8bebdb95e4e'
         '58fc5ec7fccbd758314df6a37e0f92bc'
         '6d486271f493c04b21f67e8a915334e6'
         'ecf00da6a3ff025a1bee083b052c4287'
         'ff6ca6da41f2c424fbac53cede675709'
         'b87a5527b6d9b2682ba708d90565efef'
         'dee0c68f6c6df9f97c372033d350b9d4'
         'dd714a995bdf847ebbcffe3860f47e65'
         'c11e134c1b55866acadd5592e3d43a46'
         '36b5e2eae20cd981cd520b72b35aa728'
         '320e28763b0468344be275589060665e'
         'cfe7d30ef7603a6eeb865202aa9cb31c'
         '48eb1b0d33d666c72c16fcf1b5aab450'
         '2caf51d22ed8c2006ba551c19f4ee3b0'
         'bbe62503f8f813dc5bf9dcd35bf6a412'
         '6d7a5dae9e2f42f2604aa63f9b4aaf56'
         '783bc48deb2b39fc490ff40d11e3d89d'
         'e5ebad6deda196101872219f710dfab4'
         'bc9f31915a09c77987d0fc2c2326e621'
         '8503a01d17f03a5f31d4dcd79f7e90c3'
         '318116029af0014d59236bfb07f5abb2'
         'fc0ec547565ffc1d902af7d69f70c592'
         '52706c3180bb8e519ff8bbea937edddb'
         '24519492590a7b7182e991377b8d6bc6'
         'dc97648ad75a196416ab059c3398f109'
         '9514ce41de1bfdeb6c0acec3c0ed8495'
         'da13589b814a2e5089498af92eeabecd'
         '088d122097093d7f9cd3e631e9afa5e6'
         '2de932fc9b07a191c7f956ef964c4c60'
         'c1f9835dd2d0998ca0e1956add9dde08'
         'a1b7dedcfd82ee275fa9e4c6858351f9'
         'ec8c5a1b007ab6d7ceb94d0cb5117f23'
         'e21641190eb8693b9afe92440f096bd5'
         '9a5d54987411a3072dd59f5d26ca2c25'
         '3b6cd0b451f1d523de28eeaaefbc552c'
         'c90f56ae1e4feb246dd6b0da484ce3ab'
         'f4aee8ff37c5c244b65ba2dca9d36873'
         '5b5a17bea90d41ee3eee064fdfc86867'
         'abb4ba5f7090ad3c6d710d93c555fabd'
         'a2b25800681dd607d9b7738c31362450'
         '261c1320f36cd827d46abb7a293edc41'
         'e22186793dd2137a39eb9ee23559de83'
         'e63c4acad73b3e4684f459065046a512'
         '7a2f4af8d5feb08001a9aeed6578d8cf'
         '35a06c7e96a5cdfe05e8b886aa3c3e88'
         '763eb183003c015123bd68cb66767b1d'
         'adc6abde7452782d61d15d58587a423b'
         'f2796ac62344b6a691d5d284a63753e0'
         'ead76958e09df758f1470c2bcab5f8e6'
         '4d3cff326dc6a8fbbaf6a796921dbb42'
         'c97a312c5c21b169d65392a54f052e59'
         '587e82751ed270bd1ab472c7690a1ecc'
         'a35edc64826d526e005aa2c1899f2936'
         '66c8f2d784670837d77623f09b917af0'
         '72355430a8f0e1dc64d313220561e2e1'
         '4e8d605223c480417cd14d21d00a914f'
         '2885f996570aaad5e1a134df1ad5d2c9'
         '3db574a01a7e7666c563f3db4f16fd79'
         '993e8eaf4a461d7df36ece6d44cbb785'
         'c4f844fb284166a2228c38d4dccf8fbf'
         '202a2aef53d3d7e79751f68131047754'
         '6f0765107a5988f24b1ba441fbe4dc33'
         'aefb72c36eed1b843deb69c9fcd4bf33'
         '93b143f4a682328cd75f1843368c5614'
         '769c4a24fd35e35dc43b0f369a24f663'
         '3b27ce38d5abeb0becc301493c1f7b08'
         '18bb27be04bc9d9fa634faa734961321'
         'ed0b52a3baa180ce1154b65dbfa8b986'
         '58a5cf07440a0bff8a7dd9a2c1fc547e'
         '90240482c0b3ac0c956d5034ebd4f512'
         '09d17517ea6a30c6bcd638012d8b3827'
         'b71d7e3bcac404ffde96044c75bbe165'
         '457f27287ba039895087585d7f8eec2c'
         '98d6a1cb50c751f9d26525fd464534d5'
         '08af7236e156b551b5c37b1b71d148ea'
         '74997fd5070143fed83f5e3407958db7'
         '2d1ead2a078b1b0a6bd18f833669a7eb'
         '520938caf19a7645e66c535d7e82ff41'
         '2e3e995c120a3b57fc6999e779b04afb'
         '2fa39a95b616f7a7cfe9879504911019'
         'eed0893ea04d17a5cb1f8cbb0eca0a40'
         '5399a91f3a2357cbe016589873401c3f'
         '715a93262c32e87fe10bf233e19ecf9e'
         '7806ba319c7aa908c26a9905d89120f0'
         '97d7f9efdac6224be5a93e0fe92cc49d'
         'f8978563142e78e96c27b4b9e8351fb6'
         '2f113670df6b2ed4b8672ff02c5b8220'
         '93ecd84b740d4aa8eed2636f82da0b19'
         '612e7265f608fc02db50074ee4ad919d'
         '9ebf662aaf2faa59d8757fbfb9d65a42'
         '1ae5956277b48bf9ee558edf9d6f194e')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
