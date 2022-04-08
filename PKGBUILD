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
pkgver=100.0b3
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
  _url=https://archive.mozilla.org/pub/firefox/releases/100.0b3/linux-x86_64/xpi
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

md5sums=('13c25892929d15e815100c4a5916f618'
         '3bd56cfd9215083e0849b4b8224d7c08'
         '97566fac8184def5df2b4698f4f7e2e1'
         '7217c7e708d39d51849bc86e4d15471d'
         '2995b88b2d023e920eb69db7c4a8496a'
         'b4ce9059bf1ecdeec8ea2cf1d607e4f4'
         '4d98d767c0570e983ebda843b854a28f'
         'e29f3256cc89df0f741f7f5d59529341'
         '767718c9d48f6a8ff782aab58706f742'
         '566f2c8bf8b0a7dd137081f7f7a79d03'
         '374cbd6979bb536f453727cc30c9c16c'
         '5fbbca5cbf4482bd9803af04ded3f775'
         '06224e453f39f6ea14d0d266ca1ca734'
         '7d740aa8cec4925b0d1ead74b281cd00'
         '69d957385323d83b20b50cfcee8f1175'
         '714d457dc21afa3e9ed3468f652898bc'
         '37791f02acf97f08ab33da362f8dbfa7'
         '1505697ea1c7c5fc963a2f89fa07d40e'
         'c68c2472ee236b44d6e555a54a9ea5b5'
         'a4afb1abb6ff34102f49663b028c9622'
         'e6c3f056c50c2b21dcea8deaa654a2cc'
         'b101faee2e9a35f08f60891a70d0be15'
         '0e07fadf0a0d1ddd1dabbc1a15567f69'
         'd36067400711580202c93c2b3940415c'
         'ff73c11e95234664ac21c2a8bfb502c1'
         'd4fc9ae3b293bbb6fefe80a108242692'
         '84e8901b230a2f81b3f4e82286cc2eb1'
         '0f442fc7a44469bc5132aeb9688e4797'
         '221f5c77da79b5de1eac25025fdcda78'
         '59d45168988c4fdcbb3272385c09a5e0'
         '86c5482c8c02a388b9682d6a401a0622'
         '3c6a6a52eaff744ba0999040b2e64b07'
         'cb033df153860e84f43548b505a993d5'
         'df583d52c9dde9f9efa9002d844977fc'
         '250fd2cf8578894b30a4f88930457192'
         '14ba7d990812844b2dcc663b650aff4e'
         '59c3a07410a1ba0f8a1a5a6d8f9de5f8'
         'd49b702d37becb43050c4e5a3cfbf172'
         '2444fba21cb51ce3d8d66c83cc9552c6'
         '795d9adb5d692374a5ee701687137480'
         '2d2600ae11ea4f51b661f8f4f175291d'
         'd980371e9977d22c6dee19c42cdf16e4'
         'e1c55afe8ef327f2462e09c3f541e3e7'
         '295a1dd8cc25ade79da3fe7be3656229'
         '30a454d8d02512135d2c5e212dc189ab'
         '9490ef792e4c2ae5b10ae42b8146e214'
         'd93f088548962507e81248f964dcbddb'
         '6b9f2bdf0789dab0212930526da528dd'
         '36bb74cf70b355564d7610f9d1e957a3'
         'a4b4c16524f8aca0e386fd2840d47be6'
         '1552289b454aa166038816988bc594da'
         '36d638b45e529b7398c18753f4d05918'
         '89662459040a9d210cabbaae798efc66'
         '617721c90c137a72abeaee4567c28297'
         '538a591131fce7ce91d16ff080227df5'
         'c22ecfded16bf81f271ac8b018f43375'
         '0061ba66d42c7d0629dd6b90eb09c26e'
         'cb5d35081e189e9aec864e924a5b4989'
         'e6326a274126012ce8a9f03563b921b3'
         'bcb62929547ab1a9b656d114837843a6'
         'a5bc9aea7a425cdcaa6c9db162ecfa7e'
         '22d2aef0589603349d839bf1c0fc79d8'
         'ca671b0c79385bf288d1cbcc68162157'
         '5b0c17562f6c1500c595140062046857'
         '9710b41bff5184fa99a9230213d56dd6'
         '4383a81c63c3d90a6df3359cc4c74280'
         '2b14ee9c88857ea03e48bef8e36bef4d'
         'aa2c0b6b6fb0f3e2189fd962b32a1896'
         '6d3636354a68cbe596f12e75833b0093'
         'ceff10e8d911c026471c367b1b648989'
         '050e4bf4214f01dc05f1ba645edbcb15'
         'acd4f0d823f6b55cfd67ac9d6e783841'
         'd5b3000d26498e13f5ddfb9d5aaf6391'
         '52bbf699b42d474b845ed36262209665'
         '385bc5955dbf36d1e80905cb2770d6c0'
         '345120682d23c43bb00af6f58d441080'
         'c25c78e159632e41eeda977cf9bad255'
         'ba4e7c59c5ac2f7ada88a065ab047bcb'
         'dca6b1f97e4bb93d6bdbaff28c4a39a8'
         '51c50362cc9abf37b7347c0103fe7bcb'
         '4256ba93c554858ee02eebc6bc6bcf6b'
         '069a68a2c15376886bd62b1248549c9c'
         'a45158a134efdcb439ccc705355ae88e'
         'faccffe457314f46525e4f7b132f4463'
         '9e21622e1e4d941d08bfa4d5393e7540'
         'f4451b0bb1a1701657c7a3e4d4209fd9'
         '1ac2a69fe321b08e4a6125adbcbcb48c'
         '1ede5594196d7fb32bb4391bab39b0eb'
         'ef7cf00620b403700155fec1032ff874'
         '405ac745e805a7dd0e6d345aa5cc87e5'
         '5397941f6b370e337e72970e0ec1756c'
         '9f46a40d02269e09a60309a694c2e291'
         '68fc98275d1abb735c649b5e0690a99b'
         'b330a1d07d6a105e7e4dce8b731622b7'
         '4671ed2066c35571e382eb72f7a9f8f8'
         '7ff86a7485d7a662f67f90357e804966')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
