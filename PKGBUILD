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
pkgver=97.0b8
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
  _url=https://archive.mozilla.org/pub/firefox/releases/97.0b8/linux-x86_64/xpi
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

md5sums=('5dbd75dd6878dc73f92990b4f08da9c0'
         '555eff229a7de6152fd3606f1b6c264d'
         '3bdd0ad3105fe7fe0b4118ffaab0334a'
         '2996fcefa57f7b9864933fd938e2c05c'
         '1740b2221a6736bb23be4b61139fa4b7'
         '20a44f2fc94eb36a025399ef0333d1c8'
         'c17099bdfa602f4e321cc23fabcb5b94'
         'f60c19c9a03e864a292a681f7c811e1c'
         '3f0872fe4b9b9a642df9fa86b2b5ffba'
         '204a8cfb3b328c99841643e9d6deb3cb'
         'c89c8bafa2181c9a0cc837ea750d489d'
         '7f16ac33ef2a4c5ce5b123dbe51acab3'
         '68d992af6bf211bfd8859910d18cb651'
         'e759cc34e2ff715cb5ef787b0a15f8ee'
         'b56707593c51c396567a46fcc906c480'
         '57759cd385fd14632a5ea4d437c5873b'
         'ddb3be2af4bd6d03afa3ce8995f2dfff'
         'fa5cae699fa27cae955c3b1eb659f5c0'
         'e171424488cb818ebead1bb45712c65b'
         '9be1ae0d18faf045acc752eb154aedbb'
         '8c3e6c0259457de9c5b67dc9478c80c2'
         'af5f9683aa0ec739940cdc120c7153c5'
         '811c780f6f2a953bc45e435e4e86f7b4'
         'f34689e2302afef4973e646fd372396d'
         '5ec2ba0f124a6ed6a33aedac0b82ce56'
         'd1cd750b50d1d67d107e43550a487676'
         '915abd8d919e94781d99c1c7f319e80f'
         'b6d0d64ec770e4a2f30b58d59b924385'
         'ef02c75e2fe761388841c4e71f1bf9eb'
         '23664bb912e3a0657857af2e10c62192'
         '5ab97eb6233d3bbc8001598ecf48fb03'
         '4cc00db22b6af94585b3bcc17c00be33'
         'bd56b140cf6e20fcaeb3f7b543b6d4e8'
         'd681f371fb578cd968b220e533b7dc88'
         '989fd148963f8735ac6d56bd02bb3b60'
         'e437a2126832420b27e38c57e26dbc47'
         'e93d733a226f26910033b5af63f3085b'
         '7e7d356631073c74a9f83c9f2a2999e7'
         '9d69f2cde73e87cc60f763144dcc49d4'
         'af870fd69d0e4ae3ba1c7c89ab8468f6'
         'ff9c2be3f9c6c480c5e6fd8a63683c0f'
         'e40d71eb7d906f94a2f5ceddebd4a65a'
         '8ee0cef21a0c0a67c077d017b3563a6c'
         '6a46913fd0c60a9b47e41019735a3623'
         '79f95d6b7646e5ba2e2d0e73164a7e76'
         '6104d20cf544e97edcd699adaca8f6e5'
         'fa0268abc077c29b1df680b8e25c9658'
         '8317f10dab4165ca453ebf300c427d43'
         '9ecf859932e0e6eb0ff9af9f3fb36c4b'
         'e7af29c7c1a5e61689a758e4ed9e8264'
         '105e582c4e093b9da2e9444dbbfb892c'
         'f41986b76caa4595365a2c58ff4f3ece'
         '28efb73787be2375ad873b891c69f4fc'
         '17ad9e1fb687a3f037a7d5d654e847e6'
         '67a27ccd28efc7f83b63bbec314317c4'
         'bffceaba36c0abf49ac059688f120951'
         'b5b717a7285ab585cb238fc6101531a1'
         '5f1e8ba04a50472454d2ca05f2ab2530'
         'bbe80e19f849f3f26e0df62f9fef7d7f'
         '2c2c05b740a6042f80cb24ee5d0a0d05'
         '561ea42ad63bfcec1a0bf684b03b5574'
         'c2ad3f56ab47a898649f7184327dde07'
         '1fb16599e49f0d73d415614a245f2251'
         'e0eedfe7c08345f158d4024aec5dc6eb'
         'd22ddd24bd460a58c7fc463f26c827cd'
         '1d4f79bd20400a9988f39e408dfcecfc'
         '2fec0ec2af50942dda74b61270085721'
         '705347c1c0e59a5ea33c6a79faad4b6d'
         '5f61755a98b39cf4f11a6bfcf6404006'
         '9927ec09cbd25864504844c964a8241c'
         '001a31a9d3698a130fa5d5d5cd3756f2'
         'c291d95639cb588afdcd1344a37bbe3f'
         'ec991058115f8f45ad35a75803958c0f'
         '91a1f62c4487f9872fbd471ad46f8fba'
         'a8ecd745f89fb2f0978899e5d7216e7a'
         'b5b60ffff2b029ad6cba2702bed022bc'
         '42bcf903287dbb2733ad17e98a497913'
         'a7ee5c231e18e251267a0ca12708d1ff'
         '9779475f50150b2df4b4e2835b597929'
         '503bb3d1ca7817643ed14a97e109d38f'
         'a67051eed97d82e6f8d4f79786b1072e'
         'd19a3e74f5eccce580e12340ddde77ea'
         'ee28f874644fd423c05026fb7821b19f'
         '0a3946d60f63076446eb7722f6973375'
         'df873ce51768a2daa1b0919d88d11080'
         '439e4b7ba828feed67a24f5696c9cb78'
         '6a02248bd38e0e47fd1b02edd0083c4e'
         '525938609a08a8512818717a32b8e949'
         '8e5413baabdcaa88cb60ec46aa6276ac'
         '755e6dd7c4e1d038be39041fcc98bf94'
         'ad77af68ac88501cebd6025c24a9df21'
         'fbe6b2da642d4219d5d8c17244c0dda3'
         '4f8064869dab94836673ed01aa85b65e'
         'f0659f5fe481b16fd9363e18600c4223'
         'bc776f90f9f2c48965c6d9f38a00e565'
         'fdecad68bfc193978b78400e0b514bc5')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
