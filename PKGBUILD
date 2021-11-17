# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=95.0b8
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

md5sums=('83ce423b7f3c3657260138dee6fdcf49'
         '5043c7a5cce7c732d768e957f5fd0b54'
         'e98d804fbe35f41b2a8238c41fd6ada0'
         '3f6ed77ad376dcf044293c15e0f6756d'
         '06611c7c9ab0e5f25b86c67cce4984ba'
         '58a4b510c61c070751b4babc16fad63f'
         '232312ce5f30d728fc2e186906889352'
         '5c245f263f8c6ebd51fde986a3fba053'
         '2e2b2fa9366fed5411d5ee6841848ddd'
         'bc27762d287bc95349b1f2211f204760'
         '7344903dbe01767892149bf3d57b7030'
         'b565735b2c3cc1d405d0287f835461d7'
         '9050f175aabd2345abb39f394c042493'
         '994b743b9df35b05c05b99125bf0265a'
         '632e4b90cb637fe3b73ff0096f5db26b'
         'f2951b2496b3a8c431fd3e9326869759'
         '97234eafa07779ca2f57e7ed816448bc'
         'f104229df913c26549df87b8ba0e1a12'
         '619d6a172aff733229043062b130e789'
         'd8cf7a809af4cde5d2c7c641af4d3956'
         '83946c3cbf0112c14350d09c58bd9416'
         'd56236c3d6b50e2906466a9c4e97e9ea'
         '59c46cb57889319bbeae0ddec7943dcf'
         '9e5d1a53b8ba7361432de9809bdab65d'
         '696ca88a97d0f0792eec013d698808a1'
         '0811e2c5098b5c215160d3c6f9d4d1a8'
         '9620f972cc917941558052decbefd9cd'
         '3ad4f6828eed90fe0c3928c5612d40be'
         '668b3f60f8b9adc610e3757412a34ec3'
         '5bdec2264672b094fb9ee899d07bad9a'
         '824505121a11e800f7d9427d22cca236'
         '89498e27abeed71005f8e154bb49199a'
         'b4159c4bf7dbc22f1171ce631ad21e43'
         '62702bfecb60cd49a419a6eefc4a14ea'
         '066306dadb2fc9009386ecd5d59b39a6'
         'b7220df8541ce09c9b77b11dc10c73e5'
         '4abb1d44e87bbb07c36595479c6f70e2'
         '370aa3bf102ba71f2dac81731bd3ba7c'
         '7fad78ee3f02aaff1ab321dbd9572082'
         'e3424a8fd16c88c3eff10948816f20ce'
         'ebf43fa6ceb143ff573ffdc8e9867eba'
         '48169c8c693e96664e13a6ac471739f9'
         '0e82ee4827b6aad078de8efd0b946d71'
         'ac8cf048b24ad5651ec546e25e397a37'
         '0ab8a6c139e7b76ce5b20070ebc0f203'
         'eca90a71de3286e8d514025987ee638d'
         '0ad529b866fb88088a11399ba982005a'
         '71c3ff6796d10c835f7497d6b83fe1f2'
         '78109f87addebb83b374c4d1f58b35ef'
         '7f6d47e8271d1683ce8d8a65ebc3a36e'
         'f4d668836ba277a97c46b81ec7ec7152'
         'c721d2e41a5dd642df94d9f5302219e8'
         '0b3e598ba58dbafb8dd28ec4cad53833'
         '371ad9e0320360468dc721b130a6f22b'
         'dfed8307ba10684c0aa8b0859fd1b646'
         '86457e33b9e405ec886a145f0be126f2'
         'cb46dd74187c7f9c6f2f89f32de1e095'
         'd0b48fe15e9c000c9040ecc1d0629a90'
         '91b0d002d8cbb6680ef982c9fbd3d569'
         '5ff005652ec41f68b5627088b2d908a7'
         'd542c63e73eda8794d84693352d16f63'
         '1e2ff92fef0e3936b1f6d9c67a5f27cd'
         '2e9e7586eb6f25bea46ae9e6f221ebd3'
         '23decdabf5bb43106037a3c5273c1624'
         'dbe5ce76f96280d20f559679fadbe1cb'
         'f3235d8d6498f2a69824d5c8d786913c'
         'd67ba72a591d8d705a709e56b36e0d3f'
         '1bba46a7b2011a81be4d408646d30aee'
         '7c6d4936b5bddcce9a13ee424a4f75a5'
         '4912758dcda2ec620b0af75e6b499b94'
         '7d00aed747d8244652c8a415dfc93abe'
         '2bb186e88dc9bb1088ac150967bce999'
         '6f1f3013d16650ccfeefdf9301d14e6f'
         '5de859d13e5f24023b6a0f75232adfdc'
         '43f4131a4e22cce7c022ba0ebe4dd405'
         'c3fa3b10623ee144feb2fdd91c855f1e'
         '746b2f1dbe777440caa1cfb8b646ca08'
         '9c150606d68ea231f1056d8f892bdb4a'
         'a893c02f0c7f176de700b13163e8658e'
         '166e3e71684a402a64955c51d603b9b8'
         'ea547a1007ceef299a62d9acefb5902c'
         'ce4871ee3a08ffa6b0d96036e7c1c5f5'
         '1f0ff5c52e186e61712a06dd6b4f3447'
         '1a8e050904e7bd064f8062caad50ef1a'
         'f14f1579ced560f2eb774646048670ad'
         'daa6d5ed0dcff3ec4aa89bf358a9599c'
         '62ed8f54ea052260b545e83af81cb12f'
         '2d8695708388421e6c06c3bf146a8595'
         '9f0838c9c41888e308f72a316d031893'
         '33e67be2f3241e69e07105adf570a050'
         '17b530ac596208c82a4dfbb0e75d88fb'
         '14c7055044e207220e26bffa77bef506'
         '10d56a48d86963487384388434d35772'
         'ccab183d74dd7e41dcba4be980873620'
         '3671bc62458e1ecd89779a81e7898793'
         '0a4b7665afde99bc45af50486f72d7e1')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
