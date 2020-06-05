# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0b3
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

md5sums=('e0e9035a52b9500c163ca67689b6e0d0'
         'b5b79390b63d552b86dbf708fa9c3e61'
         'f1696623c7c1de170c4d65e1f5a71e89'
         '777ef192bcddf91795a6d7e7761fc136'
         'f8102be7d24974b6d768316215ee97c3'
         '8596a6477da37e01dbd5c5b226abf232'
         'c2ccdaa9ae36eeb68db829484469125a'
         'd246d72a52d0a5e777825b3e03a1d709'
         'ce8309795af171edd0526f433bcd370e'
         'e2163795f163bd2604c41814d99f2038'
         'a33dca41211c220e3c6ec1c648c77cd0'
         '043fe5fa3df6b7a5ab0c8e961fd8434a'
         '958dbbfa5db86e989bce1351a98324ea'
         '93b5343a24cc42ad8652b288c6bae810'
         '8e9b9a2b219831dc596cba4ba12d5d01'
         '19c1acefa0ecf82e25d73a9559a38ef9'
         '24f4d26996e4e180e7bdb5d17a20c7f7'
         'b5c804da3239e60a67c5af9c11715599'
         '233ed98e553102e3facdfc37edc8619c'
         'f1616f8c10cce62eef3f0f7315175d26'
         '0b353101f2af2113073f6a75099fa687'
         '885ceb0f207f3cbad42d4f4b5ed0403e'
         'beca61a85cc60269269b2f625bb16651'
         '8cb7c6421efcd0d212ab77577df6fbd4'
         '26a5200ebb4c6372f16c95e316c7fb97'
         '98af8a7a7a5cc8a86f76db9e71c51496'
         'eac1abc8de43b09913f6189ad8d0484e'
         'afc97422892d040be04c7e9025c3c118'
         'a5ed07ec8bc312c22179b1202dcb059d'
         '154ee6e57ffe756f8c742527b28047e9'
         '11d6640157540ffba47e6e172efb7323'
         '1afa65ccb11482457eafe69eac426ae8'
         '5e99aba685fa4a58e551acf22b99e8a2'
         'c517785c33207afbc1e3e9a5dbb7deaa'
         '0e4d3544220eb63df9cbf2c91b9c81ef'
         'c5442d819bac2389b6732f007be7cf48'
         '60d13013152b5eed81c96cf51f35130e'
         '80c8eff71973bdea87038e5b7746ae54'
         'bb757ec2a4abb3ff7baaeed4052e1cf6'
         'acddfdd24fa8c7926d21eb04cb7c7524'
         '9adf245014c8c441de57a082837bcc4b'
         '2899df84f44077e5c0c59202b1c29519'
         '712d8130c7577ac9da13b0de796a1118'
         'd80e3e99946a63ca7cd7f26e92275ce0'
         '54c7f3741c066f9af3f083ade8415632'
         '6ffeddf1d1cdfd630d44d91d324881dc'
         '9b1637ee7b472758fdde014b175ed75b'
         '535d26767277082530ad25102d28e01e'
         '6295e09176f8d5d70759c4bbdcdd229a'
         '59b8803024cf8f164015580b7cf4ebab'
         '65f0a234aa429c6cdda17a7e433313b3'
         '03f0d37f654509c6ceaaba07cd55808d'
         'bb014e550a05cf26b9e24991ccfbc41f'
         '83ee95639706b2c07632256ee133b17d'
         '79eec9cead0bcd50502810b80b5cbe6a'
         '9bdb8f188faf8b491653dd25c051359a'
         '83b4fa1842b5c508a8213930ed2890fc'
         '726df34cf954f0b697da5128705c4a5c'
         '051e1fe6d5e1180ec87d7e18c43227a5'
         'cd3657a097cb3b361aa7bacc85015c45'
         '9bdbf032725aec1c04ff63bbc675757e'
         '029c203b4891d624005fd650079dabc3'
         'a8430840d9bd96d6823e1c82e839e660'
         'c4dd32479f123afb192412fbe6d05a79'
         '394e8844e63b7377e040f7de5f8fe08c'
         '6a0067c1368cdb228402f075f20b8302'
         'bc65d8e2007c7ade03a70991ad6b6331'
         'a0cbb806db1132ba030e094ea39a8268'
         '1739d428c1aef18d4df2a512b342515c'
         'b90c9bc9a612935a11e72e896d601c15'
         '554305a87b012ea53c773e49395d2387'
         'e768bd18d8ce553ec70b51c56a4edbe5'
         'a7e110ec2b83d87fce7fdba53b4166c3'
         '1740cb037ffa203ceef52973434a07b5'
         'a60693fe029c95f8a06f462b02cc27cb'
         'f9c8f82c630612768dd1326fd0525975'
         '232c20c114aadbd70058387979c723b8'
         'cb399c5f44fb4d2a21af39eef34a814c'
         '937c3f76317edc07ba06534af185f77f'
         '0973a9b5d4a7226305ba4bde32ec40a0'
         '99bb2c7da70194b2fd08a517485230f5'
         '71f1ee4f71ed5b0ce634b907f8b2ef1c'
         'e7fe83f50449cff9314390e082c55ad3'
         'ad3cab4bae74607ffdf103e861806342'
         'b3eaab915ba063873b28af51c897fdf9'
         'bc8354ce73ce11b2743281a6902599c3'
         '7e4997249540454cb09e35510efaa04a'
         '82307f7955e167638362142b99d265c1'
         'f2a6ba02f30a2635840a7074dc8d14ad'
         'cf3ad4bab4254ad67472d93c70311a3e'
         '05a0068158235001d1ea6d937d85d4cb'
         '736b7a8d473a2a7fc925702ef11569a8'
         '2817d07d5a476f4f13e58fa436efdb3f'
         '0b21e82d6219e51ff370f25c549385fb'
         'd9b522860ffd8918dc5d2c5102e9e412'
         'd95824542dd20b4d166ee88cdb5b720b')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
