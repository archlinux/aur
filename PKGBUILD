# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0b4
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

md5sums=('d825e265e4a5317e1803e190cc3c13a4'
         'f5790a781af3a35e5be0b3256c5ba024'
         'a48090a58f3d85ab8084d96d2684db82'
         'e4c4abb6e09e3065a8a7b3ed463be960'
         'a45ebf59730322f5bcbee4d5c7c08a84'
         '50b4597a06e3bad4121220ad61103d06'
         '74ca0d2f0cda8eb647011ac83b52b8c1'
         'c8e0ad2d86831380664a5e76222cf982'
         '9807b76d2476004ca362eeb2a1c110fa'
         '8dd5e79b78d26a2ffd3f497c666cda71'
         'f5383be61b8036dc26e4feaf0fb694f3'
         '24ee1d445322f858544b7b9f7d10b28f'
         'd7dc9cca567d0a18b002879c4b92e217'
         '57c7020407649c11597f80468c633200'
         '884deb55e5af56bc6c2fa6aefe1b0270'
         '881dd3f67a73173e6dc09d4dc10d3d44'
         'e3f8c0384de58db3d971e19c696ea4bf'
         '0a2f99d895208ba45ac5b66227367d2e'
         'e6230fb59274f6d406e4adc36bfc2095'
         '4207dec423df0c4c8fcbefed145e658d'
         '3fdc5628d4b880568572b56e284213c1'
         '14949165b45ee297a3cad21d0f1ee8dd'
         'ef7ff538c2c5283d47cee9091c8c1380'
         '03380a756d294000e3d68e3a54867a57'
         'e626a0111887997d13a6dc4075ec3a67'
         'cb848e7d6e59dc3deb9ede6648dbb29e'
         '44cdedf2d5ada1cc165e76173dce87c5'
         '7086cfb2a5dba21a8c005bc665d7be1d'
         '65427f59014a9039213ba51093e04f79'
         '3100303205c23be0442e0771f00782e2'
         '4bae52704f01ae797178848699f48b3e'
         'fd4cd0e449e662d94146410de602b797'
         'c4d3fed5a38d3c4f99797a79cabd3beb'
         '77e439b77e32dbac035893c7800c8613'
         '445d8e6e9b255a9d5a918a62aa0cd790'
         '518a1d4fafd27233e6dcb53122d4cd65'
         '6f1e621967a818d28cf97abd3a34f46f'
         'c284da969479309bc5fd95aa5df561c0'
         '79b712d7ba69272b2c17b4659ed026e0'
         '929a5bdf9d1919e0d29a2cff66464e9b'
         'dd5931910812deb10dc69806d124c9ae'
         '8c4889c4fb5a7f7280d54d58d5df195c'
         'fc78512c790fe4fd76b6892741bbec91'
         '32074ad430678604d6888436bcf630b2'
         '9dacd221c3a94219f78fed6b7a102eb2'
         '35c7da5a400753b69971fb61d1418463'
         'c8c0ca6a0b137a184f54c81d74385cf1'
         '0985c13d91e76d54afcfda57aaf90adc'
         '05e82483fda0b8ae5b8e1e817d029fbe'
         'ee2fcfd22d478c5d2563ff2909b45e8d'
         '21ce37f820557030bd7310bab611cb4b'
         'ee28602e6581bab0b5978bc0388e2bbf'
         'b3acd49233ef28176deb36bd3cb0c509'
         '7eca2576f2becbbd482486af7c2d4704'
         '1b9c3cb3a5b4174397427575852a9013'
         '2389c6969795de9209298d4d0ad49a85'
         'f53b1b261487cabc75a85ba47dfc56b4'
         'd8f70887469db6a984f351352feb6c91'
         '0c2f4cbeeaf69c6b49cea6c9685b92b6'
         '2bd26de7a4eb46a29a2459e49e8ad7b8'
         '655d409c3283b398cdff0d90225285bd'
         'fbea33484418c89109ff6a3f79e40092'
         '36561a4e8c596d584e82b7dece75d7a8'
         '4de27e9b3b8410480021dc21655cb1fd'
         '66be4131b1e31a2ef99f3c5ca40972ec'
         '85b6c56ef1dd2d63bdb1c909af4072d3'
         '509196d4383520103f796ebf8b215b63'
         'fb5361058890a13e5b0af033beaa2bd1'
         'ff4de74a1f743ab623f6c5d78edd19c9'
         '7ba5ba64587ab0854abc84b0bb6cdd4c'
         'ff2c8476432338f35a85e22700df70e0'
         '2ea085d948b3fc0025e49f3b154d3301'
         'ebcbe614c9cf49db4479bb95345c3470'
         'a8f9a8d3ac806fd36cd67155afb42784'
         '1c0bd5571e9c68abfc453bb9c9b64e2f'
         'bf2c6ec43725425400acd20444c5c6ec'
         '9cbac501c29635e3b8a40d87d9dbc15b'
         '37d402e792a4d084389afb47c36ee0fc'
         '3b0ab1d0c5765e51566e0ce4f0690062'
         '735a7c5669b7dcc666c9e53b09b04f15'
         'e8630de6bf95d5d38626886427bcff2b'
         '4bf35277913c4e35ca3b231bc53f79e2'
         '8b70815590e6f21e548043211367773f'
         '18b03215db2bc0b0d929a5a5f1250741'
         '7665e00165a30703f22dcd59b06d55b7'
         'd700f6a25c216ee823b8a99e1ae48cd1'
         '38e4de2ee2512b810fe9ca3255169baa'
         'f589d4940c5c63a01cdae35ee4a0bdf1'
         'd78d445da803c5fdf8665b16a3cacdaf'
         'a1bbadccf8f411e1b4cb54c566d4de55'
         'f3aec9e964c0d385b076cb6fc6729531'
         'c9d3346a0b21128e7b1cd2facef07e38'
         '8042211e30f7b1cb2b9d2167112ea557'
         '031ad363f52a8210876e40cf76f98fa7'
         'dd73a270ff8c0dce024f9c20cadf5de6'
         '25c990377a6fe7f857a6212acbf6ee57')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
