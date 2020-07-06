# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0b4
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
_url=https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
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

md5sums=('4281ff786dbd6767562d9c710f249073'
         '683db046251ef0e0e7eed84220554bb3'
         'de790dcffb4426ff84e851cc9b75235c'
         '0c731beddc0fd54a7698f900f4a8ea57'
         'fa0c012098ac32b2dfd2693c395a8885'
         'c08f3f1a840e529895e9fcf8a18fe506'
         'addc5653aa1e5822142ed49dc1bd44cb'
         'efa3aace823b261dc7fc71669b5a9732'
         '5d8e1264fda439860f12c10817879548'
         '19b8ff330f1a072361619d58593797aa'
         'a18f8cfe3e4ec1a81d6013d6b2017ce9'
         'a52d3a7c63cc919878a101ff1ca8dba9'
         '740c743c718b9796e81de73fbab87acb'
         '39669a4894cb6dc226e7fa5f9e7d38c7'
         '9290a8d9cec8b400a3d6324fe2bb9ad0'
         '9fad6a00322e95de31b987d88c025d03'
         'a6f07f5c78ae6f8d83727a67cfb0559f'
         '1c4972bf90015a6aca714eafd31fcc2b'
         '292199e2e07bb93d4d1acd2ba96d618c'
         '2a30bdcded1cb5ed36fb6758810aa503'
         'b8f8d5ce4626006fa4a4a574279538f0'
         'f2a6e9b0e467743d954f1c270523a04b'
         '03a0e53f2af6124b4e44e6a0af7d1409'
         '8341220639c0f7600b19fc17b2ce5148'
         '0b51359b3d9eaffefbe3de708a045edf'
         '5a283cd9ce3df9be8a4165f390353d01'
         '6437a560724e0324e22ee4274aebadfe'
         '086b641aa4ce67d41cc2200083f2c18a'
         'abe6a4b152a08da7561168ef198e7bdc'
         '60c26fc050a3f981fbecd923bceb20cb'
         '6149a12c203116056c914a2ac70e090d'
         '454545397568f7fb48300d621d8c5ae4'
         '19841f68eef6b8282a8fef95b24a581f'
         'c37096cc1f67958bac23902166f9275c'
         'a0dea2db5052c2c9cc32b802b755d15d'
         'c59a1debfa12d326f5d742092a91758b'
         '1746afa9f3da2ed1bf0114b4097627b5'
         '9e284162d1537feb766844fa1428b2c8'
         '3f75cd45c643f31dfe6104877edb0ea7'
         'b252d36ef62d53acf7aabeefb65de7d4'
         'ae40665adf1a78f761ee454230483ef5'
         'd4e20cd5bec8909230d543e9b3e5e22f'
         'b5cc507d76337ce93f0ef87b0aa5681f'
         '96a279fff6b593b5f0bc76eab8079200'
         'a53eb8f816f775321a386ae2ba99ee17'
         '02241f774fdcdf93333a35e2a0a39cd7'
         '3e108dfe7d3673d8f2c1b8f32154eb1d'
         'ea8f41014dd0c3ec82f491ad4abc2975'
         '7efe264f38079920ee9747900350c014'
         '1505fecdffe189389860b565d85fbc16'
         '7cf646fef373a9eecfa01c8eb7689235'
         '31f2542bf56f1a7065866ac1d0d717c3'
         '5cbbca72959d651d6ab0ff0a49b9bd8e'
         'ccabb138c19cabd03134c6d50e4b1f7a'
         '72ec4d80e5f4c9aad20bdbee7eca5afb'
         '8b32bada33f0301a72de893f447c45fb'
         '746ffcf5e36fe01b0bc26ea28556b38d'
         '2a2e0b6b3e68285ed13c1f54c0d0fb3f'
         'edab2ea41ed50e707c956307bae7f05d'
         'e6110a74015f4aca3c7ca49d5cc4aa38'
         '339f69c0959d96ea1c35989064ae94bb'
         '2c108490de66aabdc85d092627b92fc3'
         '838137d982562c9dc55004dfdb511e49'
         'daed97cb82d58aadf29bcbd5467bd17d'
         'a579097ed3d3db450c255e49e84fb6f2'
         '3be55d4fb6f3169f60cfd973b1ad7890'
         '63bb22273ff158cd7c6478d300d6e1eb'
         '30714e81b36b41b19ac72fe87264f735'
         '57abff6151730055391f39d25b51d64c'
         '11b99b3522783fb6a2618f897f51aad6'
         '29a13c9284a139cc127cf75c54d17c6e'
         '4d83b17d94a837c485fca269d6151f55'
         'd8e18bbab7e98e3522def440a66845f1'
         'f999b59f5eab88c2e0f946b3bb3b703f'
         '9a4d3b72add5066e1ffdcc93c7c1c4b4'
         '5c82a728916e82988a2d1fbaa7ac7c4b'
         '68ef73e544b9ffe79129f26b139f439a'
         'bbd15bb0a14d4800bccd4922eb763b7d'
         '917bc4350cf10cb329916ed2b712f90b'
         '73e712c0b79133a732ee24568febc0ce'
         '5205bac7f364d1ad4bef03cc58e3996b'
         'f52cabb7393108908af4c0ff08e197d3'
         'c1c60d683ab114ce3e9a97ec19431d3c'
         '8caa76fb1d8a0e45d0b1fdf3479dcff5'
         '13f5704373180d4da24d3c8fddf0028a'
         'bb26e2b0520eea7ba0b40577c42bbe5e'
         '7296a19cca122922e902054125b9449e'
         '3448587312bdd33d02120d051ec859b9'
         'cf543833a61e0667bbddbcc434a1c08f'
         '6d920645a73905e7e07a145892369263'
         '16fcef7c4d39306bd6712a4f01d1b712'
         'd11c43be60abf894508041f0ff778503'
         'db7f674db05b6641dcee54c40f398a72'
         'a23be97eda8ac234e83546dc25993c9f'
         '9b4591c5fbda426b29b0e84521b87af8'
         '1aeb0d7fc44c3be9f19464665d296c2e')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
