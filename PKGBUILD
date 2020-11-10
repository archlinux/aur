# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0rc1
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

md5sums=('2bd51284bbcd84f4074390c3c9aaf886'
         '95cdfd112805cbe452b16f11e25f349f'
         '56f2716b850129711342a7c66447e8a1'
         '62d7bf389c447658bae718c713053dc1'
         '2bccaaf818e340a1d7571dbb54e1f00c'
         '257024b36fb7bde9cecfdd790a9ca665'
         '897799d4f9bb4d6624af86344fbe70d9'
         '67e7a714ad05d9b902688eed9abab33c'
         'c33e7326fa04b1973d090470b26e766f'
         'e5c4a7588cb1710df196a5071d8a82a9'
         'ae85312ed60bd9c063d031f25f2a695a'
         '08a7cf927d5103a87a77feb5181b9648'
         '71dbc062d39f00e348c638266d0d9ee9'
         'c2fe86e118999ff1f362f66105629864'
         '52700617f7c93680a45da2fbac70339e'
         'd27feb1cfced3ee40de65f74e130ec55'
         '9fdb7a6de51df80690b14b6d2a45ddab'
         '99fcfa4a4c7b07aff89c1e1d5eb4bf50'
         '0b6e5bbee8f3d0c4cf352ef96e3b32d0'
         '990feace7396316bef304cc96577fa82'
         '26044bb03cc2b942ae843d6cf0488fa1'
         '07085d15beab82a5c02283c710949473'
         '01414bb97ee7752ffe55db038e50a24e'
         '54fd7da1cda0fb8fbd04281959433928'
         'cf4e8cf56cc83769997dfb55b0413ccd'
         'd19a4ed51e72f7c0f1b1126cbcd52dd3'
         'a8e897b310fbb04bb9940347b74e41bb'
         '0310573f9be1869b018d7cb937c969b6'
         'd726c38e0bda2ba6dcfe75aba4f3437e'
         '17c049dda5ae00370275e81c044eaefb'
         '48744ecf7f66473da6fce22f6a488c63'
         'b31920f3b3ae14a17056b3e1554fee29'
         'c963f5b017dd62405e4b57dbbd6c196c'
         '22ff098189d4f0ce0fc6b761ec8752ca'
         'aa179c7cc5af226bc1418925bc6cb8d2'
         '7f26454695602b418de4b643d1a9b23c'
         'c7ac4a4c2438738d0d46ce01446f46cc'
         'fef451cff76c960b23b23358a682666b'
         'b0ab42a3b39b2eb29279c36dbdfab54d'
         'e517d5ba6397a15eac48ed3efc360c60'
         'dcb453a16b3a9a526e654dfab3e4533e'
         'c70503f20f0ac0115394425d8b9a92b3'
         '1de4c030e94722bb05934810f669aa03'
         'a29acfe55a897f0d47594d484164ad21'
         '3cfc0d493547075caa805f81797f3275'
         '553004ea28bbeb37bec44e28e3764eca'
         '401f1cd344821409aeed9d4431132a0a'
         'ba09082cf13abc97e0ea8f8d692fb784'
         'e93e993f69a2be71aec0cddd8df13d64'
         '61d18b72172c80a895356501917dc4dd'
         'ebfdda58a0213bc1e7a770d1ff5319c6'
         '0a8334d434b80216cf13ef30434bf94d'
         '82cca320763b12e8b42bd742d1573b37'
         '6cf739e98fc9a2db48f929b0c5d86020'
         '9d225c6c68e6ed18458b50e73b9c6831'
         '7a6370a927e9da6758a72dfe7d35d44a'
         '6d79067f36fe32b689f6d52232ba6d7b'
         'e80efe37d5a01ddb96c10d1df58e7fff'
         '81d34c98e1e369544be6973fc3d16ff3'
         'd88c984270917851a1a548a617af78dd'
         'd38a7145bc258f30797f1f2364548389'
         'b0fdccccb4737c6f418b7f8cca76c1e1'
         '9eb219519766bfec9f30bfc7dfa5204c'
         '53aa23c6deae10972f0db880e0d0043b'
         'd2c6c975deffa6eca510affe72113117'
         'c004f3d40d97ed21a3d16b40deb33bb7'
         '61fb8bda8a052b7e4e2dadf6d67ada7b'
         'e46298f31d4b21755a9bddb3033d3868'
         '8f3a788a2e7600ff38a0044c92fb191d'
         '97796e914b1f4211ea7e5c799220aa22'
         '7eea383fbad2fef1677fd9b583714319'
         '0050a3b2e2e4b7b3c50aa6d312cec7d5'
         'd41d099da18e884d639af339092e7ab6'
         '1e86c5f363f7de5f47ff1f755937f811'
         'c7060d3f1eae33a80573a80eaf01e24f'
         '0cf93c67331fe1af439663998cde6a9f'
         '42c055ac81f44d51623718c5c8864c60'
         '97f1000d00e1594e63af27cc89af7b27'
         'fd60d6232a5465f8010c834d8a62a4f7'
         '6c5dc1a934a979bdf57a806c040264af'
         'f283d89e7e303e62574dbf46a2d405d0'
         'e1be7ecd0c30658bc08fae20120d9bfb'
         '169efb34dd7a0019c3a5a5d93a6d01f2'
         'e37941ce906a9c3c692036b6eb0c3d2d'
         '2d0ee2c7186970ad45aec42c7b1b5375'
         '31470ce67e347774bf335c2d7f57a0ca'
         '2156adf4528095b9f8798726c4a4e20e'
         '6f04d80cf19a4f01412f8066d279f58d'
         'f4a2ca6024d917d890c6b754f03c4b6f'
         '94966904592340fe81cf12d9d7c090db'
         '500a9e243bafc49bed406f54a44dfb76'
         '3e0b11270f4fd8dbb62c780b98ed1c5a'
         '50d1b43027aaec0de951883ac6ca0912'
         '388c921159632ca32b3979a3bf247e51'
         '864357e20be1095d7050c65275903daf'
         '0ff6274101e6b8eeaf32d5194b38b559')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
