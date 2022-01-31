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
pkgver=97.0rc1
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
  _url=https://archive.mozilla.org/pub/firefox/releases/97.0b9/linux-x86_64/xpi
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

md5sums=('1c116a00022c460da2b7aacea434eb69'
         '6cbf8cc13325178a39fa75467c6948ac'
         '6dbc8a5d9257fdb36637837193ae3a79'
         'd156b904a7194e002d41dae9cb886054'
         'ac23fa7e9d7cf95e96524615fd82f6db'
         'eec2904944389fb58e42ed2c50f0e978'
         '74211d0cb576497e498ab446cffa36bc'
         '304a3af04ac6d979e94183651036e4e2'
         'e82476de5296a7186cefd1b9deb8d128'
         '49cc27d4044c41dca6b41666c0a6554b'
         '7992210795527ffd2b122f5ad533560d'
         '17648c3364ebf0415c9815529922a3f5'
         '6ad32173c25312594efc2caf960330bb'
         '92ef1d11d838ff669e1c6e5bfdcf6b77'
         '2110c0b89f867aba490222016a8d14ae'
         '2ee8f8f0024f938562ca2f8430669909'
         '1f98fe5f9baf13add8c8cf3dc307414e'
         'a68b66679596df907f4f2bd46a6ee01c'
         'cb2e776611acef43ae5bca3234b1ff9e'
         'f7a3b9c9282e70823fcc1c5000098eaf'
         'fa33cecbe98bbe1eb99dd3602b4b088b'
         '8877038ccf59a5c3ca1f711cbfb208eb'
         'cb57cab371715b89439b697fa72e3324'
         '2c7c7b483443a9ac253ceeea61557087'
         '899c2c8965751c69cb19a097a1e8a149'
         '656888f20f285e412137fdf9fe825a65'
         'c15bc3eefce0634d968f68761f78bd22'
         '19ed1ebd79d337b3db9d0c4cb4dc045e'
         'e02bda02602498b0953c85034626dd54'
         'eca87cd4cc4a08483c8fe12f0411b787'
         '0b78a5fe857542cc663938ab2e078ddb'
         '725e0ac7552f7f2cd385e25b327c614a'
         'b7221d51aa2df1ad1b7cc1111ef6537b'
         '2be9e90dfcf64893598357257cdf35ad'
         '1030ed87b16f2add298e2875bd4a3522'
         'c7db12f4ecad6f8c4b71bba89d63c743'
         '693aeed6dda2e163433fea3778d2f600'
         'da8bbb04c2901bddc59a8e877f508101'
         'abc0b3b0183f9f839f437ed8b9e6c614'
         'b568c0d14c2e19a105b95ce1b6f07c61'
         'c4a7ecb77db0dc96b5cd5bd2fadb9a61'
         'a88e0e05e7ff7f8fb5152dcb3bfcb098'
         '074023776327ec3e8dba2e33af0ed6fd'
         'e69833e51bdd6a365d1b36d186674fd6'
         '35decd4f54e1cfe322203f68975380cb'
         'b4e39db36b7d983fb2ca05b4c1b73a46'
         '5ce089d39a9f3a485dac4cfd91bd021c'
         'c5e77ebfcd5df98173edb22f3f485fe3'
         '99ce77a7903bb7974ea50c25ad0e1d0b'
         '6ba3001a9f38a4c91dfa719707abc146'
         '350f65fe696ec0d83fdcf2acdeb720a6'
         'd3776e741cf4e7daacc9575fe4115e4a'
         'bd7d1a0f14b6f588b70b2e283d4aefaa'
         '4f4f6b5b4e155bf6cccfaf18c9edcfda'
         '417f4d5824e6110ab563233e2317c634'
         '0b77cd510f144ecb55191a16be5f5734'
         'f883e1dd9a9268ff526bfbf24548bd13'
         '0053728eea289aeaa8bfa413f35f3cec'
         'd48f8aaf97ab9b31f32f3bc80b973256'
         '5972f0f1e8382c9fdff1dec3ae2e6cfa'
         'e29c15884f6269ad50b928c294442ccb'
         'c2be07959827d43ab027868929a54a2b'
         '97e1486bcc51a09adfb8a62a91464a5d'
         '1ba7312570e7b7b3f12c0ed65c52e20d'
         '21d44e7a14788ab1f7b3a273cae1216d'
         '6061c087c2959824ee963b336cdda127'
         '260e64135338122229530664de359a77'
         '24e4d3733530aedb5ad183cbc8fba7a7'
         '71e278b32faec4c7d109f1fa9041a582'
         'f4793bef48196c345d38802cb2c7ea80'
         'd6c4ddac2a91b6b65611eea24b4cc0b7'
         '8f0a7c8dadba2d2cc21519c511714c6a'
         'f03d7e718d6739413d0116e264d56045'
         '6cdadea09303992ac0faa39dc2b45f65'
         '38896be49c1310c6bd47be30b648d115'
         'bf2713211544cbc626fe262cd82b6b02'
         'cb6085884389396060e449869b1140a3'
         '458f0771b95ddb4176fe6425ee390d14'
         '9cca1de6fdb0b37b03dca10daff3ea85'
         'd02c2d3721554eeb9e22402eaebdae72'
         'c9481cce517d102dfe3f9e973a64423f'
         '8feab20da2169d7c5cc69bb4636cf4f5'
         '145fbf1ada8213025423bcb2759e0928'
         '237438bb2c91a7c68cf54cb82e2a0c41'
         '015255110069ffb8bd0d7557673ea42f'
         '4f72c7ef79f1a7eaff6f0f188f95ce3c'
         '49fa173c448275c0d74fe77075c3c9f2'
         'aedbef729e210db777dad3333214811b'
         '4527df3f73bd0e24d0a51224b1f9fab4'
         'd58943425a15ae84c198742b17c3c704'
         'ff5b29d1ee8d67dd55e018c263e9da14'
         'e34b577d143af3924585a2cb78f04dc2'
         '0fbc5eb876d0fa482399876dae67b89a'
         'c287b034b09eba937c96826db54a26bd'
         'ba25591ec872a808ac83229f7e83e8bf'
         '67b5c3c0bd754ba5ad267707e9fb8671')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
