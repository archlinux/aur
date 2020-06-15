# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0b7
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

md5sums=('7e1d5d553f34274ec61e86f6edcad882'
         '29de2474d7e2a33b359381ad8552186b'
         'd4749def9470ec78af887b0b36abe714'
         'b1d442051983052d3b615b4624ffc86a'
         '9e6245bd079f8459cad284d56e9f4e4b'
         '2ce965f6461e0805dfc6dbee785f502b'
         '791ed0d48d5cf8fa9070419967e92438'
         'ab1d7e2b83fcd59e55a222b0db29d5cf'
         '7baf7c332e3dc823baf9da9d1ff2a74b'
         '4c0a148968e2985a986b609001da8c9e'
         '3f4210f4167d74cfbfe1a49cee7f291b'
         'ed1975f380a4a11b3986e1e3636c0c2a'
         '127f1e5dcd76bde03cc28e2b3bf40f7e'
         '93f3021f13481e3d4cd030eb8527a4f3'
         'a126a68252480420ff8145e71e59bebe'
         '839d5bfadb18bcc1bb8f1522111f69dd'
         'f8a35185b62f90e81c47e8ea8458eac3'
         '4ca52088a423e4782da77960490a0ce3'
         '0c860f1c0b60c3bc728ad57adbd2bbd8'
         'f5ec697e27fa1e05658b562085f907a2'
         '03ec91631758ab7a46778b121695b044'
         'ab2ef0f8c58c554e2887324d6f76ebb9'
         '531e19e2aa5f2c4eb16adc1efe6d0ed3'
         '3eae38549dd19bea522cc053b37a171f'
         '610fd4bb5f3d9a5044918bf3235444ab'
         '0b330d7a863f1e012a81f470f81637a0'
         '1f40326359aa22d062d6a2a1b2c40aeb'
         '78c91bfae20fff8bb12b4c002ccdeaa9'
         '51cb86083692c8c3ab2a2244edbb9f22'
         '6a4ad6e2b7be6c1ad8d1d0c1f8cb882d'
         'e54c5d3059c3f8c8e909e3fc7543151b'
         '3ba32aebbd3d90ca5fb006ecceea3b16'
         'a4819fdce162398e537de51d1737eb9c'
         'e3cc0e6b58436035e19d72bd311c80c3'
         '89d427a5c5aa7cfc48959236a3cc4d4b'
         '0c3336d9cb979028e25fe2b90be7ab52'
         'aaf806f45b07509ddabb156915f7d5e6'
         'c86a65ac6c62794b218a0cca1ec3c8c2'
         '340fe387527c78763754f8d030d55590'
         '2b9a2507eaf8a91147fc544ae0bca5cf'
         '9a6f77b4facb5d7def7648db3d086971'
         '525c1aa69cbda821f82db70d4b45a969'
         'a6859f7cb7dfb1d36a76727390f5eb30'
         '709c679f4319e9b254df04472f7b0c64'
         'ad094d0bb896c1eaedff7c4e31f4bb37'
         '5d81fcc1350aa4e883f5f6c1ed4a065f'
         'ec5ae5763cba22c27e9712a23125cb39'
         '8bfe0a6d42814e5915cee32f4ab85e4a'
         'd8e01159e38475d8cc4e6aaea4c1e348'
         'f772acf78481149b46e90baca1461366'
         '13f0107a50ece324616fbadc7a320af1'
         'b67f5f888cda90450935157f52646394'
         '822b9c254bf7be140aa19c13de9bcdc8'
         '5b83576876b5fa403c9b08a1a99fda2a'
         '4ee70caf86841b6727772878ebd61cc7'
         '03d6ef5944312c4873d3547b71c19c83'
         'ad1e7f67c7948443b191e37a004f9d4f'
         '3222fe251554a783b7ea94d6f9116c75'
         '06b367e4a0335df497ce9ceed0e45319'
         '47c31859a95f8b8322dc9a596386cb10'
         '172d39725e9fa7c9afa0329b1cf1f241'
         '450bd256f07559d943b8a9aaffa06b9e'
         '50d28449504928cb025be7f602b32353'
         'bd36d6978faca22b23cc2fb496e52b2c'
         '77464cf738973fedbabb0a9113a42fb9'
         'efef52db7144ce2510f95161ad10332c'
         'd7b7d60ec8ae4727c2f335cbe6705c62'
         'f5b239e8aba2255ccdced2a51a6d6387'
         '959f00eb7a6fe6d533b4155c7094f934'
         '9496ac8d3cbdbfbf2847cf3237605118'
         'bf7523c027bf41c7d3208e064761b70d'
         '07826576ad6824525f2fb30106d3d24c'
         '932f840da15445a4da664362faf81d0e'
         '12c0fd3b7315d05b2c565650f0b3a5ee'
         'b6de411d132868848dc456ded602b09f'
         '847ca350bd23c4955bd74a1d80624cae'
         'f3b7c95c820b8827d48226b8c7786752'
         '53974174346fcac238ceb5e37aac2284'
         '88c52d1dd5070915da9128729f719fe0'
         '71c46ae2f850328002af0d93957b28a3'
         'b7ad58a2b8fda5645f09ff6764827430'
         '340ec4ceca99819850a36a274ad06f23'
         'decc6c301496437253ebc49d17103914'
         '08e2f7a3c20519b345ea9bbc98d9cbed'
         '3920269823967b1b09e7e482626411eb'
         'ba15ed3235b8b0630ce9891d8c1d997b'
         '61c3c30d438a63aac920c88f42c055d7'
         'b4f7bd3429c1b371161d51a00c85fc5d'
         '837a2641214af5b6138ba6373fdde882'
         '7e2c109720631f09557c4ca5bf55d579'
         '4557b802a22daf8835907be9e6276603'
         '976b17f93dae81b0f41830fc74d8a17f'
         '372b9f79d362f63c4291d8851c555679'
         'fe2468493060a15c901b4a72a1fc4f74'
         'da307fc4988be730a216cda8ba69b5b3'
         '55260167b0691fa2cf7cca0cc8e5ac86')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
