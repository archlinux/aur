# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=100.0a1
pkgver=100.0a1.20220309094444+ha65fc42d14c7
pkgrel=2
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
#depends=("firefox-nightly>=$pkgver")

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
_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-nightly-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-i18n-$_pkgver-$_locale.xpi::$_url/firefox-$_pkgver.$_locale.langpack.xpi")
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

  install -Dm644 "firefox-i18n-$_pkgver-$1.xpi" \
      "$pkgdir/opt/firefox-nightly/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('4d3016d2d679f776979e9e4d0f20f72a48d8f90e30cc0fdc25e02ef0a5d83332'
            'e8f79a48a0adc8164851aa8eb46dd8ca60d0599f56266306c21f842b14602a92'
            '8dcb4afe287f3093dc9cc1eed940383268003834779e01df8f8da8ec515e76c7'
            '0fff64023a9afd132999b54ff965f06480a15e84caf0c1cee13d18c1449d6a67'
            '6a942e0ee339450f4724cdc8984d776c7e93f0bbb235171a5d29300df5d0998f'
            'a921ac82826d729d3f150afc59f95e51e4fcd2afef1ac7ca3770eaaa2523f847'
            '17be8fe8552006897b04ad91723d08949f7e40c01415d8ed8d19f9e09d6c107d'
            'b2dd17a78d57234886fda6cda36ea685a33df67404e388d0dec8d36dac62c733'
            '0b6b61e176cdab7d30bf661412b5acbf25a09cdfa6046510cfb627921e139251'
            '290a8dd2331098c9547cda65e6027bc066d500f15d335b408df7033711907324'
            '5f2b1f1b1fa5cc50edfe2296a5d4178635775af1890bcb5f747d8658aaa263df'
            '88d20e1187989d09f6d5fb4e2b5b7625a9695cfb59a3a9deb07a2087e38f2d86'
            '73000e3e788603e3230a85f629094f2fc46816b6b49841707068106fa4b21ec3'
            '91208c94f7bad51b59f82e4f7f5e8d146c12008ac9c7617715bf234c838e16bf'
            'b9b76c322f9fd6f11ce64aede57140d135cc8adf7667b90e26124b3b36d88749'
            'd4397ccfc111f255d89c0f244909dcd049593311f83121e6555ca2dbab8c87ba'
            '197d4af6e17a57d3ad8f039a93598c6a105ed22c0310268fa8ac82f75cd37d22'
            '50c9ab5beddabf5b38d3caa5cfc66da51379538ca215f944f9fa9458ccbb1b78'
            '0bf0087801e4f70cda0bc000fb7ee29a8f901c291c4f861c983c75990a3dd062'
            '7f3d679f46f1a7cc29ebbcd4b9196e1c2803ef085d846877986d06a715f9a64c'
            '3cc8de790514bd4a78b1f8e3a20caada77dfbcaa300689162db2d7d801053caa'
            '0a7cfb1910375db1db146b861225d5d999d2c9a2bca11c969e5b17c73974ea35'
            '0101ec9928a79c61c450f687c5283fe94e79fcfdf18607ee748269ed062dde5e'
            'fba63100d493fefcc5c7a494c80aa9a4f9ef100304ca328f9fa5114ce8375fd2'
            '9c3a58e4a60bcbe7f6720fce1f92707c692af185cc6f786f2db98a09356f49b5'
            '32ba4dc01401ad29fb216af89960b11923b5bbbb2b3890c20a1b3f31a0d2c86c'
            '99a362bd78ff05bd906d6759f8540ef433a2df9d8b157f5416b94d38a16f472c'
            '49be55f64c5e79bbfd3f6ab90fe3b52b1c4dfad5f0cf060ee9fe550ed110246e'
            '50b343dfbd7bd1415fd14dbef1c64c3f53003c431dd4acb7586dddbef33abe4d'
            '88429f1f142c08c4c0e00c8f37113f4ae73748d492c0fd9d349653f2f6d4ef9c'
            'e3ef7bccfe1056b4572029b28972e63eae6ffda0f4f3f50e50d01ab284ba76d8'
            '33e6936ef9aa53afc36688a0d365d52fffdf50e86bfc1ee4af04eac4f75db1a8'
            '8777143f15cf7a0e4c2b8e5196e24636aa3d4acb5dca89ae05c4b9fcf600a68b'
            'f1ca27614f5b1b12c4f42eb6b793c5b9e1727e01fb06fc5b77ed4a0d5b4bbc74'
            'bff0065e7a5873e6b5281645ff9af187a37cc7189b565a121389a5706ea0a7ee'
            '52e9d834272751263a2f05e7c29a25905eee468b3cc10ad66ab1112999f136b1'
            '0040b39cf6c8889d14d8e127ef33ed300a281db69114da5bd4e8ab1edac41a60'
            '13c6bdd1a42f0231439a0e87e1ec0c60bccb1867fff4ea8ff7b976b115f9095a'
            '19deb7e9b591f4b035fd38cdba753e762eadacf8d6645e9a73bf73887f546935'
            '5b2a396f01f6a6da866f86cfd00025ddc9e2d442523a7f2f81e22dbd6ad18a0f'
            'f1b385387aaff190d9b5e5349912de19f17e9b0b46d4cb52b27f5cef17385346'
            'a986ca177815d4e1c553035c497b4076503be144d89b65c26dfc49ae682e9c69'
            '819dcebf0f3267a1c566d8416ba7a3164d38d6f532df196f47200a668c00526b'
            'c530853d6eabba70ebc243d64115ca5a3c596a8efb8a11c3577f12b24d16db9c'
            '3deacfa17db043880adcbe8217308a200ec112ba88d14b684d5c98b2ae515961'
            '891077f94585dfa2a78ae83382a4fd5d40266ad27ff1471dca13b0603b89e3d3'
            'c77c36cafa00faca8a8647387135eb186ab4c5f9539f9242b42d8c4a44ce9198'
            '59216d7c3bd02382163354e13f1f54069add5bc59fbece92cbc878e82e9a1cea'
            '11aa5209238f47d63ec2d78dab94d2e14b4f3cc5e9a31dc690c69f8d353d7b00'
            'ea27e49993a45541bfbd4406f7eca8f73404ed82cae6233ca6d476be28271b58'
            'b61f90dc288dc80afcbca0cec53cf4799d0e162a45351cc62f79dfe500c4c889'
            '305247f47db9c40cf00101a367c5813410882ccf626b5b755e41e9eb2465034e'
            'f3938fed35618d2d993040325b6aad54faae7aada9863c8fdef4e4f79e49ddc0'
            'cfb146402fc65c2e6b5e35015c4d616308df3e50966d730877fd250478993e20'
            '4c92a39bcf5432b862744caf93b39c96d410b7401822b2103fe630a3f3992882'
            '94e9a798cd7d461e1fcbeba4891c54a438027a065124c5cffd93708d34ca61e4'
            '95b205c7cdb938e36afcb279ef4d0cb8a77a546d508c4bc6884e2737c743c1d0'
            '59dc4892ee8b5693cd10940c7b7a645bb31773f339089a04175643f0b8ea16bc'
            'fbd49a4c88d2e69c6abd90aa5e48b03650e3af3792afac3a83376657b38c9e1d'
            '2277053894d389e1bae5ded229ca0ae24f01174347220205244b46f0bc3b0c05'
            'e75eea0815c020da6e951932fac0e6f5845f99b79c86767f37966d22c8a40de8'
            '997b2e50d230cb6ca0262ffe9294de9096a47090e596ac374e73ea7b32c0346f'
            'a4ee017cd24d6190bc1669c88bc185a907f4b7c7d19a7fecc42cc033000db9aa'
            '32fcd4700579bf0cb3cc02f1318a661a6776521ff10a5387683e924bc9e47533'
            '233459b532a0999aa2ec3e2c34283e73317d718dbd8095dd408c7af9fff4a6af'
            'ef5c30394429efa2cb243376c4b2f22f5944b32a24bf8d9adf23b608f4087dcd'
            '4d5de5bda67362900553be97dfc5d302cc047115a0263104a0cd7656e112bc8d'
            '8635e2abac513cd8e9f6d5dd1ceebf27dd1bbffd10e694174f4fe3204108410d'
            '7af88a4a0e7c270015a6c1f8030de500fdb2dd2a7c700db724eb3fadf6ceb1f4'
            '18b9f5c186ee88f2f47702afda344d06aa4031499b8bada9162a1cc96102d6a7'
            '89fc20e68a3f81b424903609571de5a3efa87135819ed9a143154b4902d658e1'
            'd27fbf7be9ea130401a72dd9b2da81e2bcec0c9e390862e74439f75b90a54206'
            '70c2d03da68380e2af4d07d1ae61acb8dc353b1a464807c7390be0cdd0bcd040'
            '0366c9b549e44eda3d572314a4c1303dffdd6e79e9591c384132264ec1c97f18'
            '3950083149933b062915718fa90a1929bc2a2d9e5a420586f7811ff82227eb88'
            '19afe359b0642c312f80ff0e1daed299a7bf91d04d2a75e37c5934d1af04772d'
            '56ee68dcb514b9d9f409a45469ace3285555920c2d7a01f882f51b2359250bd0'
            'ab98dfb3b475126c8ebbbc4098b649484776ec437e2b959096cfacb7b6c371c6'
            'f40f9b788e346a7e64f3539474634cdd99263e5ce47f59b84d222ed1cfd90e5b'
            '2f8c9c712c4b526e2570f761af31b1206b734c3d30868c4aa54f6f7e04cca663'
            '0623c3e08f4b710c660694d1c0c06d138014eb55c7e563a178880c1b2bbf5ea5'
            'df4d7f2a6b394dfb43219ffd95ae0c02d6c110e41b2a2402351bbeb01e54fce8'
            '7a0102fd3561416d4c161f980595876b7d33da2d7efd29e50c4fadc03a1ca319'
            'fa2d6737d858976d5500846ef3dd73ebeb817aaf60f6f640eda0098a04f3660c'
            'da99764acc8b9fbf0a2afb296f7d05c6a50ad2bc9d30149c52ed777f3fa21b96'
            '211e2cc973c1e165f10badea00c67d0458d498eb028a5e0ca31fd6849d364c92'
            'a2bb0b5c93acdbc09db8e1cad80aa581891a5c70874ff2865704075895420864'
            '8411de8139c56e5567d515ee0050917282cfe525445306f85bbe69c2e486174a'
            'bd943826fdd40efd1877f737ad4273018cf5b25629e3c1268932d9b4edaaf361'
            'f474b8be819dbc94d3ef8c8ddfc4b6a4eb5e190f3661958c1abbf09527ae3ae2'
            'f7267f2c816cac44b9b18c99b0a3d272584daf5b4e4a426e95646130740ec2e1'
            '9215e09d3e89d16f9cc5c215fe01d1e0c400b48e522d88f7d19550acdb361df5'
            'a3c43dc3ab7560d9f8464aa7b55f654fe6e3cd6334fb8680dae98047040aac7e'
            '929f53d967505daf6a00767e851a3fc54faecbf00725493d9bd29f285e11da7e'
            'b1fb7c3dcea89308a85be358898cfd0d76858eba1cbb832b07474f19b8e109ef')
