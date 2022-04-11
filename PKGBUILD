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
pkgver=100.0b4
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
  _url=https://archive.mozilla.org/pub/firefox/releases/100.0b4/linux-x86_64/xpi
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

md5sums=('ce4e9d0e6be124585efc2145d14f1474'
         '9d627986c1a2e62b5ccb8c61c1735e10'
         '4d8faec0e912f8922d1739b8386d4d6c'
         '581f03f9a670870629ed9c87f9ae8fbc'
         'a682f44cf899f7cc596623c81effa8a8'
         'ebb5f63831b2f81f7d79755253f8141f'
         'b90592725a207b66c6c7c9a064a20134'
         '60f4b6026996d689c85002e3359adc01'
         '68eb6ea59df2243aedd7cacb6c31f4f9'
         'b8d56f460994720ef51272d2f2174110'
         '2655f5c675261b46dc8cf2b6532a6256'
         '7dc680a896293e2d8b627274d1ef5079'
         '741d5c0219c7cb7af2ec6b34783a266e'
         'd1745914f38813399095f64731fc2f8e'
         '6c8c5ac32abce412e7c9066cb749c808'
         '701026d2562aed0d127001d6025d0f81'
         'ebab85439b59bbb9d00bad078e2abdb5'
         '5d63cd775894cad48c6e3b6eee51b160'
         '39c796abaf768be561fe374203da0525'
         'a2a5ae33fc60eb63c1c0f2ace9b1508b'
         '4ec43a8b436c29b626d81f59a9129887'
         'b848fec85063686903ae935a8f086fad'
         '73389d403f357c043204fcc08c00ec62'
         '47c4ac68310abdb18b999369dd29bd45'
         'a87fef61583982ba92aa43d523d7221e'
         'f3228a0dfad3b86ad77d03a3c0d7ddcc'
         '7c4e4695e22a10ab198d81d129c28473'
         '41f8bd61d25d269f6c2e10aba1628a4a'
         'cf017ebd8a99a6679bd7bbb6daddfdea'
         '1019afb5efb961440a67ca5102b8c290'
         '7333eaa6194ebb408fa3a1f1760dc5bc'
         '1c583046ab21e20ceb55e1bbe38b2f2e'
         'a1bd2b3c22fc35ac660c9a2e03781c62'
         '7bd5270016133e6fa3775ec458c896a0'
         '9a3beb76593df120476f5d5fdaf17686'
         '4647926f337e07f5f214f09bfb9dbee5'
         'b04e2050b9be631fef787bb6e733f98a'
         'c12e11212ea59d4534fff5462d894cc6'
         '6ff5c66a3f829f090fab7bd156eb236f'
         '457935c4fb54c04044b1e6815da829b7'
         '02d178b348e56fa1f4648d28b86dc698'
         'eed5dc41f2cab2201ecf712678162556'
         '4a552b48c2e04a121bcdd89d7474e490'
         'c6bbb327fe67b188e9167ed2fb1411b0'
         'a11be33ab256da69e83595f59b8a8f43'
         '61083ce64a638557b98a6a53873aaccc'
         'dce3c21bedbb714346061e052d875b84'
         'a709ecbbc7ee32be02ab4512c68ca6a3'
         '4ccac1192ebb92ac6ec031efae02b058'
         '566591ebd5e88acdd97078a355cecfd3'
         '75baf9fe440060272ed50f46625d4e6d'
         '145139789296747423b18fce7b5fc9db'
         '0e655a6352e0c2bf277d3ab57580a435'
         '60c885c997a8941bbfc5e9f586042fd5'
         '6670df3af29399d1b5c4879ff67e25d4'
         '0f7fb2b66a528e2e426cedd8f3f1bb6d'
         '5d69ccc9ebdb48449e491518cdeb49a2'
         '5ada7218396877a18fd7ec9caafc4fe3'
         '919e081eb64c7fd088733ebc2918529a'
         '4067cc84d51f387f4ef663cfbf7efebf'
         '7f62da355f9c98ca0cc0bb295ac7f74a'
         '8597969b3cfd581df673a4ad9f5a14dc'
         '86155267c37432344905fd46e625686d'
         'a96d09be5acfefb82c7e2f5311b65885'
         'b01d67f6133bc9aeed6fc6d5c027f079'
         'e493b7c6259803330b6f88562bc8929a'
         'a68f34900da51b18ca1980721ef19f91'
         'd6cbe241ba97640c1008ae1de5578c76'
         'ab0b27a6eea7599d997efc0b0a543259'
         'd1343792bf3a5096f3e326ec17fdd777'
         '01a69f5d66b5214c8db1374723d51312'
         '4a7743711632d39283ac203dcaa3db0e'
         '3273ca794ccec26d26bbf73f2ff157e5'
         'f7c0e9ed65b900bce23e4b5641fdc64a'
         '545ef50d02c98aae18d6c6cdc0a7f916'
         'a666cd842c6a82a6a5dba0d7e962e57c'
         '66c915ca79a1a1f7a67a7e6a26e03877'
         'bd6f1c8ef5c83b7ec9a4072a3825d5c9'
         'c78d2ad53f59987a46d4d7cb08d94a82'
         'bbda97877a451b24ecbc4670c3be48c2'
         '68cfef8b24f9de34996bcde8f7f75dca'
         '87448eead58d0f9197a3540363dae9c1'
         '0ac6201f4d3df225ec1f6e3725fa14ac'
         '695cacc46c98964bad0dab04901d801a'
         '01c4e13a28a9638c14b9f2180fd7f307'
         'fc095d25cf27b66b5e16e5c92b5feede'
         '6f4c31685932bf343041b7436f6dff17'
         'de2d4cf4700ef3c1763de54d8491afb8'
         'ae33cd137a0213d2db6aa9730a410a17'
         '2753d806ca67a42c1579d051f899a3e5'
         '630a7b178cf5b35e3caae7946523dc50'
         'be0d1752e7255fc3182f2e8f4fd5eb34'
         '9606c3bbb7d3e317fb90de9664103bd4'
         '8c97ff18c9c96f9b68848ee404c07da2'
         '89335fd3644b826dba3a8db2c3bc1582'
         '3ba64411c22363d4fa0f9f631a3486d9')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
