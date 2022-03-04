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
pkgver=98.0rc2
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

md5sums=('f30aedcfde94b27b590e6ed85fd4980e'
         'f2cd477397f2bd38ed65acbc645a9794'
         '4fc1c3493cd30b16cdeaa3c2a352c661'
         '2acf2be541c1632d96695c7aafaafd48'
         '7b33fcd330253956799c27642983f832'
         '3cf55d3b094d770a3b1de6a0f2fb6b8a'
         '736154dce8d6a7132aa62959e2fdf541'
         '49c6ad16f92545e626d5423071f14467'
         'b4f36d53e9699ad566f3151a8fd239ed'
         'cdb098071fa54c140334b4f31cdfad84'
         'e31fbae59708917f625e3c381b7af8da'
         'da474bedb2c8036210d5931b10e8dad7'
         'd724709507ff5e3107c5516fa050e2c9'
         'eff325e77029eed7befa9a7e0bb7f9d9'
         '4ca92575f59b15d9eb8d3038e49b2074'
         'bfc47d78edf0bf65c036d3bbc6c463e1'
         '3e3642309eab9211c8d72a933514fa3c'
         '56f1924cef554483683fa6d620576180'
         'd92c0b3dcbf24f5bb61b0ed219b2968a'
         'f68ffabc0130356306b97ca8da901668'
         '0177c746d48a305dba3879c02cafade3'
         'adc1633db748363bb017da08ddaf045d'
         '62d2738115755c4ac0c065be47696ace'
         'eb821acccb15d527ace6bf9dffc36bbb'
         '5ec0f0ccc84ee877a9b8c480b9cddcd1'
         '6f3909b19ba5ef03a609dfc3430eb6f5'
         '0c0abdde90f014e168f33b33fe6d1916'
         'dee97663c71fa6c335ddae91a5fdc3dd'
         'cffea6ea49b3a7d0f02ce6ec1a03fdd3'
         '41e465d0976f92650912e254583aa0cf'
         '5a0610879f1211030286663cb2c6fdb6'
         'a13b6871fbcea096f4592d1b3aa9aa21'
         'db493dae4b32d42c394bbe9a77aaa6c4'
         '48a7b2c2a4e5aabeac7bede608c3af90'
         'f89f260808665fa8c87b3f7732a9633d'
         '3724609a257ed373c967b239a68eaeb1'
         'a8598105f5c627e349d0ba2fef497cdb'
         '707951d6a589f7221e2de76b3f402e85'
         '0f601d26367d542acd67253d253cc514'
         'e6704608a9427edea7c9f8ae2971d9fc'
         '34df9c3e0a90939c34b0a15ffa44620e'
         '953c10039dbb923022aa64c926d9b617'
         'be0a7fb6e30b86d90ff9711fe3b5f797'
         '455df15c710a731d85639087a3cc0e0c'
         '870b6979463a09558828ea92d2c0ce14'
         '243da4792247ee0342187078844a5b37'
         '0063b335dc7191b4081c8971c759a1ec'
         '821781d73127713b16d0dc58a43ceb64'
         '92d349268eab99bae1eab41eb1d13a6a'
         'f122353f7c242bc48146b88eaf791e01'
         '80495b1734a83f9b9b8822e5840f36f5'
         '0881e19387c31f5294c8ebfe3077c45c'
         'b76a034eb1a761ab5c57f5ad7b3fd3bb'
         '755a537486825bc5d20d99341a66e2ff'
         'd8b58377560aa9db124ac9ada5c917af'
         'e66596ddadf0fa0663d323de9785a107'
         'a083ca4be7ae365e810137199e71f572'
         '0c9befd7190a67e97a05f8c18ab53a55'
         'f45f18e98965815f9e1d942c2173ae87'
         'cee0ef63e02f3a9b02767255957fdb6f'
         '16843456b594dafd6bf2e763d2bee0a1'
         '82e1847bc23fb6973ac230914c4877bf'
         '9267d3e1955c6b2b722dfb7e718a0ac5'
         '623f910d871b8be469f39e62010729af'
         '212e5dada7cc0c46968a8a3d00ec1085'
         'd35f9fdd78060830ab9a9db327213acc'
         'a2de6b23c78714ac110a34bea940b515'
         '709bf2c0a844139446c2e846f5594a34'
         'e2821b0141037eacc6fde4a712004719'
         '45d4528c1b69d0c54a1365538db1e77b'
         'a89bd0111ff3d26dbed545060ded0800'
         '734c408775dca64aeaf33b62e61be028'
         '8f2dda64bf03d63c91a9cb1cd7098ad4'
         'ff093ff1a001801176d625d48e717a90'
         'f00501fb56aa3bacd5f3e926cf5d2b65'
         '67532ba06b27b19d5c7b89afe1657f1d'
         '2a68bfbfc43cad7cac81789b82a9b6f9'
         '86aadd0a870368189cc135b5d3158580'
         'cabc8d41a7c6f94adb63a906ca680ac8'
         '2d51e1342d71184a5b764a625505bd44'
         'e6f809c12b3fc1477c131f62b7ac6a74'
         'babc4edff541a451dbaa7f376b5729db'
         '94a5d7db0ca7f68738e01e8eaddacb33'
         '8041a61ad31e910ed2ebd9977d9a8460'
         '6e8ad5cfe504386b0b9803c6d8e5b04d'
         '9f133f7345ff578367691c4ab06b4654'
         'b6987344df7c48b42fc543c1b0cbaf6b'
         'a775485cbc6004c3db8157097531a979'
         'c1f86ec89e259738cb21c0bcafddf5c6'
         '727f7603c7a991d1d71f751eef4601f2'
         'd2dba4183f2a91cf68fa33726fb88a8c'
         'b9da15c689836f9e0a09385b19ab77e2'
         'e73dc971156b11a1222d621a1eab0b5a'
         '5b86b582f4ee0c04d02ded96b9a086ab'
         'fc36c88339a60ca878675a2163d7f0ed'
         'f8e8f10008b8ed61aad6a8d0500cfb09')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
