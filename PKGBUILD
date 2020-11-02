# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0b7
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

md5sums=('9d254867b95d38d24a2ab92e2f0140f1'
         '21b5db74a9fed0e8a0d88cdc469e7c06'
         '5f1404d4173eb52bcbda0e3b8a2024c2'
         'b6321ebc667d1f6d10cca791667343a2'
         '87203b20a9979f08f36cd6c020367f47'
         '2a4e0abdaf32a994a3e0314719f2a4ba'
         '285c7b87d99538c0704d521a8cf19a54'
         '7a4ce845e31707da35b7ac34a31f2fa6'
         'd72ebd48e7dd792eee2d9bcd3142068c'
         '680b14e64c4264c607f15e82edcc725d'
         'b8a63e799aa462eeded181330ae95cde'
         '9311e8e8bfe4781f139a1dee6d9e7638'
         '0ed021905d576271e64ae4844809b4a9'
         '47b715343c3a4c8a27f0e4db6f94e9d3'
         'bd5b8307468fe4cd13aea11fa7a3e775'
         'b27a97d5e0ffc2f88b4c7359141f2c65'
         '8f0302d149b8eb4a7bcd9078b39af5f7'
         'e51be0eb966d65b00a622da91efb8373'
         '5835d8ce51f646ae1193ff109d929c38'
         'e6141ecd929739a42a76126910562594'
         '00a43e0432013952af985a0c7990ad1f'
         '84314d770cf467f7f094932879b4fccd'
         'c6c728ba26251072e399963db234e63b'
         '740d4ab744faeaa2d250fde9efa99e44'
         'f53cb758a0a2d1539949746d3eaae041'
         '6fbd5b45d1f4148305a0713f9c9201ac'
         '9eba94cb7206c300fc2e5d31c4a46cb7'
         'c424c384fe6495686ac0c618e75d48cd'
         'a7f50a8b84f773b6ea194d841c09ee0d'
         'bd2ea7c68970240690bf01004e34b7e6'
         'a8bca5aa15b685a58117ee0556505455'
         'eba5381f5d46be225a271f603b728945'
         '44b4ca0c4460b2d394e47cbe4545f955'
         '51f9b916793a3c9d4faa5f4bb63ed0b2'
         '4a0abe7a6c11d390660529ac1e613876'
         '214ff2b85118a2572e8bcb43b112b2c8'
         '89df4da44838438835a6f5313bcb4600'
         '69e0121478f11fa1ca1927950cf1022c'
         'e7b94d38dde19e0d1e3ef4378bd7ae76'
         '2b4f51a5f7b82955153c262b7fd47a96'
         '95bf190fecbe6063960f9f0f7b46101c'
         'e81c46361991b0a55002adf3f9674ed3'
         '94d5a0356aaac4aa81c81ec0bc0ca818'
         'fc4428924d510fb22768dff2300bca7f'
         '2ed528d03c0eec64e3ccd1b94b3e6df9'
         'd538c7c099049e2cb3c77835ba084052'
         '92b34d4494b7404743b8e58f0633a40f'
         '9d7766b787e2c7ba126e7d53fe46f02b'
         'b53d7f11a0c39d60322f0cbb06968bcd'
         'dbc442c0712340cd26ac2df31037d377'
         '206361fad842d67f70192b4ed65407e5'
         '2cbbc26b3a582babbcbf2ecb42b3a362'
         '47c35405c05471a2c3a1b444e5cba2f3'
         '8c7a4254445a63ba6e1478f6f1b09c70'
         'e43888404110904a1340d8ee1be2428f'
         '3a146f68d58705500595bef7d0027456'
         '3a8d607cc9f2ca28618741b017e2668e'
         'f2990039a7999a6036e7c4ff5329f27a'
         '60c3865e1e18e3284237dc73c692f461'
         '0167b111f4b53f5b739e3d5483549afc'
         '76b863122e4a226f001490f8ff9545be'
         '97d7981fd4b784b3714acdc7d1d8b949'
         '3e80ba5d5416191c45a789632a1c2e1a'
         'b87533c6ce79bb7cfb96199996b64591'
         '0a98fd0db8bf3e16b30c94b891bc2446'
         'cfb5c69b2f8cc924ab2fd32654dbe452'
         '0c2ca1f2ff9028fa50736dc5a41ebd5c'
         '270ed8583fa62dc81fbb491705c39d01'
         '34c329799d987df8009522dcc0fa43b2'
         '94b3d6d2fa87217286fd5d164baa51ed'
         'c7c02098aaaa4a2abbce533d54e54ca6'
         '4f7fcdddb8c03f1286b9704f3dbc97ab'
         'a7bc5819b9f56fd752e3b4cf1df57e36'
         '92adfb9226b0a8827760f17fe5d34530'
         'f28f1ef42a8216bac84e07ffb7e4ccdc'
         '58e0022c6d07ac60a06ad0479477a93e'
         'c30c66782e860a3401e0f4ca4889c5eb'
         'e0bb9496af054159ac524c91f8a8e169'
         '840e5325d64ddd3a028a3509d807d0bf'
         '56294c3813395f861e4c8fb958086357'
         'e5521f95dd199ca4873d120d421318fa'
         'fdde686ec3cc5b8c30a22e3a004e1e7f'
         'efcaf06a239b9f7cd0b91be7050f07f6'
         '66a1eae0ee589f1f9e373281a0291e1f'
         'fc2410c0ee9dcff359c1f0f8b90f5c16'
         '8b4ced77081e285f217116d023f71f29'
         '549e646678b826e27c46af1894b2f017'
         '1e096d4ca80497bdc306a216f932e7da'
         'e45f52716f143d9aebbb23709b3399bb'
         'ffd57b23a9f4c3c18dc5a8dad04385b3'
         '976ead512cef904eb30a461cf073f332'
         '22f1c0e8af16e7b9841b31c4b66a0114'
         'c98c87a8e2ee4e06a929a3936422d3eb'
         '58a0b0989b9e7deed5df416cfab365fb'
         '7f9d99fbb145f3e7636c85d8595ab4de'
         '084c087d98e4c7fe9eeff671710989cc')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
