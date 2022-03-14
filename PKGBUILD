# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=100.0a1
pkgver=100.0a1.20220309094444+ha65fc42d14c7
pkgrel=1
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
depends=("firefox-nightly>=$pkgver")

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

sha256sums=('d724393d61da17f1f4c50557b0f947f3480702861f4a607acf8b51efe0ca6df1'
            '5bc10a23b27a0b0327d7e1f4463dea997a0e425906947a0e520071661a7a57ed'
            '95ca7ae1a6398daf0db0c7ac0771bea9c1f39a5043966296749b370077cb3684'
            'b8ed5039d0bbbd3c0a617ac57f3835f1a5654b1ea43c9b98a9e2d275c38d8839'
            'e6dedf24919ceaed9e63a906aa178c8b05de6b881403a8e527c57f54de0da278'
            '6a39bd03f8fca626f0f16f14511eacc3a50ffea2257910517b6e4c463b5a83e8'
            '8e94bd79a416c54162cb22c7e5df7d698e7150c7e06449312c7fc90f50c6dcb0'
            '22603206638df0dcbdb3366e39ab50d77e65e66c6696f6912ba0bf05bc982244'
            '3a606e8c73e658425771a268814a3f185cdd96dcd7477aa8f161572d992c8712'
            'b0740c53b6643c02ce01811b0ecff7c6ecfce15a5aa016fe5cc0a357aa79e0e6'
            '629547728d42f676d16ea9008ccd871bbc891961c015a77889c6f13b61186945'
            '6cee4323f2dca92250780b6d043b82a2d2909cc7b56dad7deec41304238d5fc3'
            '98eaa1d7e34d752770a93e0a21e241f973c7e697620aa586c55af6c1cc56084d'
            '1f8e628a425af3d529592465212147439c50801c84a36b176a98c9f219efe76c'
            'd35200208e06f31bc3d9bb5f9198caad487634336ecd9acd86366adf314971a2'
            'e0ab3f2a8bb9d41d73e2c5fc21357319db1daad533d8ccafff30565b0710306d'
            'a540a90ef247d610eecb2efa8078630ddbb7df65d5d94e5b03146fc183c36b66'
            '85f5a007dd06ee0c713a0be4477ae00598fbb8339646ba16f456fd1720b5da57'
            '14f1a90c7b14fb3aa698c4fa88c78d1b89597d8f71bc0ccbdfd42c5cfece6ea1'
            '9d6316145a7dff22d003e9367c0bb079e2d266a63016babd9a416c9f913b7930'
            '0d8e2ff78343e3ee539ccea281427d837fe075c2bd55a2f9371064efcf717259'
            '483ab906a2f16772abbb05fd3998426e767dfbdf102f3817dd490b78b3e0e89f'
            '9baadac539cce4bb1b90cc48064d12c8b288e7ed35c996d0aa5213526b68d047'
            '4d5351bd6c9c41646889d3afef23dc40214de15cb324435c4c40f79f224390c3'
            'bcb982b2a96bcab7c2f2d8bc778528f8f1622e4d80da9d24b5056fb4822a9b06'
            '249cb198a301f6d1d2969fcaad7c1d3a632c0ec4da97c3ac6520337d254272b1'
            'b37da074c9e78d5fbc1b3d913cbebfc6eeea4faccbce2100df737d27c39eb2a6'
            '55549ee11bac404794dbd9272d4ec0d7ec88f2f152cd96cdd68fc6c5ea18aa5b'
            '3ef18b20850cf98a7a5526fe92906cce2947d6ab7e8868f9e9112644bb830290'
            '80c1020025ee9036b538bde11a38b49ca0e2fd77dca3f1881aaf9bb5a9927921'
            '2c4d3a7047072c637b6384b7b951db628f037ff63a26bc431a8ad721e319ce41'
            '35f67650dc2710b1542d35f8fe51be3241459cbef6fdbaa56b6505b38fe33cbd'
            '8203c188ba1d6fa3eb8cba788e54da1e30dd785dfb12ef57c6d12cd2b4f39f75'
            '72858272f4f2a8c376cad56493d4421a436b99e797db5e2ded3a860180bbfa01'
            'aeaa25c12b03bd1820da952227953cd1da8cbeceb26915234152d735058ae4ba'
            '32f0ef27b7f5524e9e18a514af7a661198898b6dbb0b5d03865510e72cd3b830'
            '2775508619a4906d633683d989ab241a94ef4f52165f48b46355f2086b9ee17b'
            'bca9781d67a2edfb9dd5a589562cce9c99ce2c30c2d0c6cd1667f7cb26f9f7e0'
            'f3e11816636ebd3ebce997f797bf56154dbe11682bb6a52834cb0cc8fe686697'
            'c417c1212cb512014311472577076e920e67d5a4e41c821e2c70962b81163ac4'
            '15fabfbaa957b4b2cb0de9bcc5ad521da95b648f9f2f5562e598befef1787787'
            '2dac0a09d882528307a2abdb90d4bb1cd17f2829e8f65d19fbd7e77aeff50fe2'
            '2862b35134d7fc3d26a912a6b6bfc27ca3da3d5eb1e5012da7ca931a4d6a3e3e'
            'c74e024a2c14e97993e59b8a5fe04916ba81175a9bb94ecc7f6bfdac16c0b0f9'
            '3ab1bad3126a78e65e39f573fefbe4530394e349d663ff86645cd20b0373ad77'
            '94202b76d4d96f24dc44e8471e48397e672c8d41769bdfc471a26eae6a85bea7'
            'b58236e19c5b540a69c5a1c127f9448148928f36587349c1b3095e4be531e086'
            '8347151b2dc6dd5788d1ba878d000f61d295c091423301cc4407b48ff618210e'
            '13b26ee397acd97cd12d8e578f2e4fe4b04a021cd9cb8ed210b4715b8713c60e'
            '1518417d04e5eaab3bcbdc87ee7c545a6c3420410a3ac38ceabcf13462dc13c7'
            '21d72c5ff9a6ef1afd500d3603c01027f48f61e0c66edab44662f86ab6c180b6'
            '6932e8a0779139d95a2af7041bed91612bae98c6c1b9660e27b60d652248d7be'
            '21685800d6f3318903a633315738ca2c063cfd32d906abf34a841a46bf94b6b0'
            '66e590fc76075bc8373253008813c8ac282934b3ac92b6fa256131adbe8786af'
            '3dfe26d1e718e70e677e4a54823a1ff691abffdf649e71d71f602d022a0257d2'
            'b8d4ed5fff7e306feea674911aa820a902ba377ac6ddbf2aba37d1122f4797d6'
            'a470e08fdbf104eba3c41a292b06cb8da965fd443a3cd0e607078926893fa374'
            '926cfa7250c9b707223f7db9d9fe718ac0bd541c4212ca6ff5dc2055d6f9c19e'
            '4b5cd5a4ef2267822fbb9d3217d3adeae5edfd78b804856ad24ece1de80c0e7f'
            '27125afd840478df0cb761be98b1e1fe3c86915ac8b610ea6a005c2df1baa591'
            '615b1bb416b531c5b43146bc57709d03e64abd97252ec7f71546688c93a7d47f'
            '34f600af443ce234693e130b7368ca1994e43128d5fcb41ed3e37560d1dc6897'
            'ccbc8688942cd5542a205c931c998760dcdabba3cb7aa08137e50bb86c3d8f50'
            'a68daa2971c44a1df6a7631235c23ce725af3ca5b9a86ce58f56ec4df81f21e1'
            'ca7573faa336fd05ca55beaa411f16a57ea6f311d3e390a7233a055ce86406f7'
            '3844bfdfb72af2f0ff24a3a22ecfe95da05bf2b1e706be0ed853e70a4fb25a1e'
            'a59624115637fa75fea3b1d94f4ac260c4644edb96cb2b9c2b7f0915e89b49bc'
            'da615ecc608e6e5a1e2fc761f269dc5103a31cc42772d4ee3b1852e993c9be53'
            '929a1ac8118886712d8ee1f12b199738e4fef990c0869d3365bb3a4df899d510'
            '2d176fff892ab3175da49ea93cc8a947a06f602d5c1155055abb90bd49e034a2'
            'aabe9319eecdc71ef46ba196bc626b8403e22153f8ec8d2850c805c7ade3b81d'
            '5c1b306373f8037b5990a15ca11e169dd7c688864cc922bafb51f355b840ae4e'
            '25a2db7d7b180118aff7fad80e28e753cfa1453812fc93fadb0af5d5b3911805'
            'b469d581c0381bf20cbcb937d831aefcf8a863ee5c3a77e502661e7ac838a5ea'
            '775daa3522453d37af66a22cb26762658343df6e79dd651b813090728dfde338'
            '44aca63c5bb96dac3875dd9c8d81b679de3f719025e25d07436132c5ccd2f244'
            'd5c35fded9698aee216651719232576c0b36eb61f0db7ec59b384decc681e91c'
            '3c53fea6bac2b5b19180f39327cbefb2c255f996d441c99fcc35327d982a01be'
            'a060bfb000c543cfe7dfeb91f87c41a31a29f2a232ede069e3ff304860c1697c'
            'dfefa9655987d18da35135fd9b84f8c0b96469b9f755b20349014f33354c38b4'
            '6cf9d94748519c62539e51fea546cf3c228ef273484ddda4511d7da1904dda3a'
            '2e3516cb5afdf29a9724ca43c4390c2cd4efcf5aef37395142e6ba4a36c74e87'
            '9c4a63e19f136f0f7c64437c2306a24afd531563038aa47eeb72471d67b6891e'
            '8c9149fe6933943a44c0bcdea0766bae23124a1c986de18fe3fdeaac66b11dae'
            'c0358de650d6aca34615c96b8801fd319933995c747aaf85fd37c2140bf40665'
            '90f930a512efc60a4316c2d8c3b5ab0474d53429ae73212f665fde8818c15aae'
            'd8905957a34012d2657228c11057792351655033649991953ff5eb46af68da90'
            '11ff99d50f67faea88d32dd77b7b80130469ba0db42982f2e0f1c45d619d4675'
            '7414fe94f2a52f4b32ab649d0ca748a1149ce7f1a5f380c6513c41beb6bc4530'
            '8b85da7b1e3e858d8ff43d47af62d37a40584ceb62b48cd61c517668cb3dc7d7'
            '2ce8216f0f2623f7512fc8b1523854f17c492b02ada479fc30ba4fb9d256da47'
            '43ab867538eee456ceb2c70a36be339c8294b90d7651df51a413e3b72ec675c9'
            '86e7126a244f6d98ed9cc206e6b09c7aaa0b396963e90b14c1c82fe931ccb03a'
            '81d5bafb6b6b5599cfdd558446884b6fa72a324511722498584f3954bab2e73c'
            '7ee24d9761e88e7acbe0dbdce14265e3e05cc3705dd44b29f236b3a15f220608')
