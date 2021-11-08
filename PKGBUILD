# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=95.0b3
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

md5sums=('f1867d978a95c85b6e71f68e88ea70b7'
         '3d9c497f664ef540d2f7a4061ef94de7'
         '0f9a5c0810b6ead7a4d0eb0ea040934f'
         '6f968b49c4dbbad1953ec2c95710e8f5'
         'b0770aedc425761cfe79dccfe1ad3a62'
         '5bc1f0dc31eedaef954de535fefb9a88'
         '2015d7bad11d76caec3bfa9f92c2e6b4'
         'd7f34fab619583899b8179186309806d'
         'c93c0b600155a4d26e713c3b158d745e'
         '4b90d762f800be1bb65a89bca278b3ef'
         '37417573c77673c4d8c4c5b4882864a1'
         '4e391181b0daf7e8610899b055e3a27e'
         '4b221ba596d301728664ba160c50ea88'
         '08404b837eb56b25314d49a70415f731'
         'e41553057688208f764f2e520ab3d01a'
         'c790938e74988dbb0fc155c4121c12fc'
         '5911d48286196e182dc40ad941cf2f33'
         'c2b2b265588c674f7280dc7052cf4646'
         'e304b21ddcd95a534d7ca028cbe1cdeb'
         '521eb79f9b26f62e491f92b55ad5b703'
         '26643c2fa76331220e0934d96ce887d8'
         'c06354b3277e562e828143657a311524'
         '7c93df9de5d7869f337e87cdf65fa954'
         'dd443f1ac22552420d3d5650a57d4220'
         '57f0c71ce69dd1c133910f88cdd5e39b'
         'f1c740bf18434e6b350738ac2b546765'
         '5f4ae3482f1c017212d719264aedb3ef'
         '311c30fa05b68321c83934f3bbb8f894'
         'b9281dede13ed33e8349cded0ba6c2a9'
         'fb0b4ee28647ac66b97b31719541fd56'
         'bc8dcbc4077352cc22ae93041e18a4bc'
         '73b5b4127f60a6bfbdc6f458f1741092'
         '42a074cdfc78512f9fa3e646519430e8'
         '6710f1e2e1bfa0dfefa1f85b1ebd1432'
         '85b65c0a46d3ab9b13fe29539a4139d7'
         '747e44270c8cd2e8b11d885b5ee03385'
         'b916109c227a9bd1de2b160311b431d3'
         '4498b50117ac7eea9028a5611253d481'
         'c1981119208fdcf6d86b711b41bdb295'
         'de5ae8950241e441753d345a680d44b1'
         'b73080512bed079d726a8c09e890974f'
         'dca2626b4b8f6116cb5fd8bfcf88b0eb'
         '487e061a408a3ff2bcf40d30cf08fec7'
         'd5656d6130c4bd36dd3249c6ffc841db'
         '1be8ec06d52e53ddcb050246b05871b0'
         'ac0fbbfb30995d718c1b26fd60de8b3d'
         '5dbd69fbd6b5f8437f29a2490a8e74df'
         'ea5cd031e843c73ac29f3436f5577e1f'
         '4578197a4aceaf7769362afd8287b56f'
         '7ee0dfb66c6f28629b84c53ce6c73e3f'
         '840b85afaa21d18c35b23668aa8311d5'
         'ced3eca67389f871da774ad19c101ef2'
         '1ac33b43cc0b6cd19456da503ed098e6'
         'e6a382f9805b60e289ab6d55b4dc865e'
         'c470c9dabea8bc9865c1f6df7d489fae'
         'b2420a18ed63dae18d4f883c44f9ba14'
         '0a8c39b0fe33ef89d9593b92dba977ac'
         '4f418b6c776c333a081a3d14b83f3628'
         '06a6d3146d5f1b9ded9326b00e4a3a39'
         '3a0a461e62947e27f025df5e462d8de6'
         'e7e8a4fcdfb3e3d6f27f820b2ce196d7'
         '7269aa84c68e276c7f175cf036f5d7aa'
         'de7cbd9a5a48ed483247cc4b1e63a1bb'
         'e29eb31f4055f8fc242d37a131cbb63b'
         '17e808d0806b7943af3f2c3727047bf9'
         '959d7b3d1af8b162d8c66b727e5d7a11'
         '26fdda36ffb4729d8e153ad09908a6bc'
         '217f39af3a17e1b46b0c10fd1897a43e'
         '1ea52d9d8d062e6dd52bbbf38586594b'
         '6d0d461c72fb6de34dc184cdcd293b26'
         '86d54b0ddd362ae2aaf18921c8e0a557'
         '2c0c09aa35dc8748d09254f89e17bf55'
         '4e9ce9a4c8de8cc4f4296bae7bb856ff'
         '65faf349cb9b39bd472842d55bdfecdf'
         '6e19397692c706c202c8f81c13c3b198'
         '0772562e843fb41ac8563b755e45a03c'
         'dff6c6a88606e2e2135d289355fd4326'
         'ce155bb97008284f5b70902d4d2e450a'
         '4877be5e5474725c2d26c320926125cb'
         'a166e1a0e476578e0500bdf7c8d87f77'
         'fb0ce9456285cef6b90868c2897406f8'
         'a5e5c23601f4b0996582bff99b4566af'
         '3851c348b811392fd708836d0ce91621'
         '7612b1e03d38ca0ad0d69fbb99cd7b9a'
         '61a34636df9d27e8d2a90e0bb078c186'
         '4ba66f3d084b63d492cf2180db644ca9'
         '950a14fb65ebb6fbfdafef9c41d138b5'
         '1984b4443c1f1944f67621fb08d54914'
         '083baa590186a6b533fd27f2400219be'
         'ba2d997c0d2b6c4a76ef07e69b064f57'
         '7e79f14cd83af03223c7b6a2a895f6c8'
         'd68e1739b27da2249f1cf152263424e8'
         'a42fc198dfa73689e6cf4fe083713552'
         '9e2632a714dd462aecbd0e4aca942a8b'
         'b66043e518c4d4f8a022f42495bb8789'
         'a2ec0115a8b71bc7a630ea0f93901faf')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
