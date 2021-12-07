# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=96.0b1
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

md5sums=('f72f308cd113567f547ab07d6d88d621'
         '830d155192df23eddf93bc88ebd02b99'
         '763cacd7aa72c100710a4fae55199773'
         '7efc98039198ee1e2a04cb70a0ac8554'
         '49420e1829de3396a8fade67b2cfd17d'
         '066a021db86516d794fea35f4b92a35d'
         '0b7d132d7a862d58ed6d8e49691a584b'
         'b7802795720869da3ff2c4f9f1b9351c'
         'f12ccbb5feedf27a910171c9f4599789'
         '3774152a36092ee4f6267928d69f0ad3'
         '9597cf330155b5e276194280a5c40198'
         'bbf3b713578d99deb4a14bedf9d1857b'
         'cec7d53fadcbedcdc4c5f62b9168794a'
         'ecdc29ef030e8d1301a3e89632b53f30'
         '35f35b84fd46f9535e754883b6a4bd08'
         '7c6f5f93038c688562368fc6d8dc7e12'
         'f2bc1bf296d2c11833d01a44206d9a58'
         'cee3590c4295f7aaaf07627f0e2976a8'
         '9326b3fb19b43e3e321d4750d0240d3f'
         '6b79f025875679fe4b968023bf3f39d5'
         '7561ea2644dcafa2230a48b42db79cef'
         '3afd1a0185727c50ade1fe89d187bd57'
         '396c9c5e6cccaacdbd29540492e9f0b0'
         '3bd4bd335e455692a01651a2cb170f66'
         '53913f7340d2a4614a47879828dd693f'
         '3494f05884c48f9212a03ef769dad44e'
         '9906b0bd83ead1b07dd4148bd2c95ef9'
         '05a560e010d8d1fef7d7e38d47a7d636'
         '0d0c7df9f506b1a0f8af1e02df829284'
         '0feb6e6048763e555568e7427825e641'
         '032a21cf5ecbd42237230e57d3e63113'
         'ac036b1886476fa29c819c242a17aad8'
         '378db4676b878002befc192474e411d0'
         '553df9aaba3397da2acedbb1cb01c9aa'
         '16b5f319078477177d0b2ad7ef7efdac'
         '5aeeb5b9fca3b64d96b50f2caab64557'
         'e3242f4193fc7f68e5aca7f4859c3464'
         'a176e78d8d78851726260760a13ded38'
         '8b728cf5461d5f8d75da47e212e923e3'
         'a0bf12e2d573ec289c748bbc1d18ca31'
         '89d141c6bead0411ef26d0e24cc3ed46'
         '51254e89841311ed79e1693766600926'
         'aecbb1608b4fd15534c5078fa7afe696'
         'b3fb45a10f3b1bc45eb1b52a6872e9b5'
         'a9e6cf44bfad87e2255a71889ebb4bf6'
         'a3470c5898def46ae1f5c57f20281cab'
         '7a4308a02242f661acee5f7ed65c2620'
         '0c187baebf9a8d302e71cb0ddaf2cc5d'
         'f4298061b4850e2047f6c9815e56d0f8'
         '164e2b264450b7415bf31fb6cdfa2cd6'
         'd463f39bee84e6271f888b547bccf37c'
         '3e4a2ea367277f31174822fccf942e2e'
         '4056f52ce511b80b686e8f04e1c59d4f'
         '1574c82169ab12d937bacdaa4cbec2b5'
         '389c8db3ba9b742ece9c519294e54064'
         '888d39f6ddb971ec6bd2fffe411788c7'
         '1807a845d9d8387bb2feb8653c213345'
         '8fdc957dd2ce6f97f2977529d6526539'
         '200b59c3339e4c3fade6d057f3275e12'
         '26b05683c41e09dcbdf3221521891810'
         '4234709b06d5dddad5b3fbbcd5b7efca'
         '41a1aeb5f743c4d0bac258b746cb32d1'
         '29ab6879c3148debc9eee9b4bf1cc531'
         'a0f42621e94f4c6eebcd191c926f3095'
         'd45fa794ceb344e95f78c0fc06d11daa'
         'f386f022629e77e0d91bcca0a5e5e0bf'
         '9ba3eca1589d9cdf7f1e821873dd9293'
         '646de05fa743913a06e146bde02d6d43'
         '97fd14e689a34a19180301e038e33b06'
         '3b8d08b5369ff275d90cea3252b96ac1'
         'a1f8cdeaea1cd35d81165cdc35782c81'
         '2780d36210139a3387eca51082be352e'
         '8f0ac6967503fdb8c1e051127fb92a8c'
         '15b2e94aec2bc4d2fa937226748a1b49'
         '029aee191463059d00baa36b31ae5d22'
         '436ea7c2543272ec28d813839d21bf3c'
         'c91a6334cd873eba148d0d7560f3654c'
         'd854168e4275ba8a71be93b206246d2a'
         '6df0a51709f65dd6540e2432fac12abc'
         '393b3d627582d3952e59a98907634080'
         '6da532eb0888d1e37578f0bf5fab9c79'
         '74795c0b6cbee8c6d2ea239a424f955a'
         'a1ef0a8b85db50dcd11f3523de108c2a'
         '08242a9594a27e4c3bbe6efc1c6dabca'
         'eac9ec1058cefc40e976b5bf93d0f0b7'
         '89f6cc7ca606927c38604e663ab4e8d3'
         '96b649487152427fd125e27ce170dde6'
         '62f4bd4b8f54bff1a36a6d59f05c9ae9'
         '771cc1ef6479544ae6a46b860087a80f'
         '6a113bc393cdb0087c82f8f48aed0112'
         'c9badb635da6ed01c8456d80a84d5b36'
         '8e03f086947bc609f8edcb2eadce5ca7'
         'dfc28f8a8b5e7098a5fe9544c9c8b4e8'
         '0da2cd8bb2c15741e267f50aacea70f8'
         'e22857cb61d7fff11d3bb63c41e31405'
         '982eb86aecbedb355cd587b725880c3b')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
