# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=90.0a1
pkgver=90.0a1.20210422
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

sha256sums=('dcbcc177cde0431a6e931e3d843fe43e727c10e8762fa35c4a052d43c16699db'
            '074f06763328a126fdea85d60bc51edf8dbd29c8cdf8af1348aa3afb1c32e0c5'
            '17ebe38e8f4e006fbb88a4050ce40c196e6c4bb806981a4c306af80ad30715d6'
            'a3e2fa3ee8694ae42f96f783c03ee225f3a166d3816d44aa700d708f583b3dd1'
            '377eec8d89fccef70cdcc808151666f674944a48cc4982bf0f9728c0608435f5'
            '74d67f031f47abf72b6c7293cfc16f722f910906eb77c8b303204ac7a1a6f506'
            '727c9b4e7d221c12af1995d46d653f6291a254de35de1a9c150df6bfaf408144'
            '8820ef49243249e4d44e9e74e4d447842d7e36d2702c2080e98e20166483624e'
            'e4a624269e7279853faac31e23282acc4c42c2fc80dc911390ffec39ddb51d1e'
            '6e0665c73feb1f90d1052616d24545638afd0fd25043e4195ba9717a70312c84'
            '82378191d708c007010e0518d5d0af0dcc5dc146867e737c6c6c426efb3b6157'
            '940a3fa96f64e1df9837e9661b79d34c77dfa434e9d56b86322923c58ba7f01c'
            '00c34cd7cd26f81c55211beddef6b78d0e9efd08ca613af2b1449641ca5f7fe1'
            '82ed15be2c959e026e5582e044c037565d317a2d29dea9930c5c3d067747fd03'
            '5bc88cc30fa1d02480eafce5838cf03e416c569742ba0657cfab9a78c6aac28a'
            'e4055281e76e633f8420e028a263fe676ef0ca6aa2f2a957eeac6ca237d0de79'
            'adcf642c25fd677775b3410408223c5c38a75a1a1f11a012b1b9ee12158e608a'
            '3bcc891ac9e4afcd0e9432534f262f8090782f04b1659129bb9a560e0596bf89'
            '7fe7ef937898f64119b39bd155885066d16a05d8bb34f6ba38e45fd2ae62e1bd'
            'f8f1310ab8ebaf1507d15a4cc641cabcc2b8f470da3e6421138a918cfbd0b7ee'
            'cd8b23385b49e3579610e8f49a1e0c59bddf4957ebe5c9f530752c8671b914ec'
            '39e780f5248c30ae6d42db74041db48b5f98f12390ac7e802747368fabddcd1c'
            '339d5d5d8aacebcdd9ec18241d701a367d38d8f15210fc52bf45c06d80076192'
            'ecf1c9d91f77b3b2039f3d45d1adc008ab1117acfee269d6e3a0d6ae33a60d38'
            'f90ba266e5981196325bce3a69c440834d7606c6963f75303379841f0837e387'
            '9f5dba4707d162ea7a0b2982fd42bd6c7cd159cbc7823b54cdfdd0b1ba367977'
            'dd49df03b596671a91866375eddf7a7202cef9a49bf4f85c78409139d49b0b31'
            '7485ad79bad955600c4a22dbbabe1881110d7240d1a807bdbecab3d6d810f85f'
            '932d710ab8c6e6f88cbd3e3e342e52948e9039161b9020f5fea2018baccbae15'
            '395522514a8ac22c8dbd9a0c8125fb313b4a8aee34dc2bfaee961f12b03b097a'
            '79ca670d7f778667489a4e3fd7857e4c205a089cc0bdf7d0ba6ef809a96eec46'
            '7994d8515b4266755bbf1cc591fc299dbe731cb664e862258c73fe7c013ca0a9'
            '9b6ddabbb3eb0e6f08d1476282f8aecd9e81610a4b610477f4e8e58ff151d7ae'
            '8e19cb5bb97537994cfd88fd4fc6aa71eb0f6f29bfdebf3908594912b53d9895'
            '432bf63429bd1676f738ae6db4c2b992cf4104d83cac312edfdf83f5f5020570'
            '5f717e62059f691a7c022e38e164d23a6551eca5a5417dc0b231c50c7ada8cf7'
            'f0d1817766c9481183da766d722df6f885aef58f1cfffc257fda758938db9d8e'
            '465ed37360e5b7272a9ea28d1aef7a21a67dacaedc2d5f77f3f4d481bbb98947'
            '12f3ba4df4be855ff79dadae6ad8a80bb23f435fa659988b7d32a561d2fe8885'
            '3513130247422c1dbe2434d51646d3db7a0086e335e0b413ddb2d78749690c3a'
            '8b38a9fd562421a431cde1b39edf6743212a4105517b7c986c77200a811febd3'
            '18bebe34a6b305c05e7710b9586ec4bb485f5c77107f9ce601515251f18fe605'
            'ecc1e833cd190fc512cadc9f9af1134579a676280300c004e1fddf71275a8fa6'
            '6d9afb43dd51cd1cbb210e50790d84b54b56abbb50f7f48506d25724f9522287'
            'e4f8595ee2ec07a53ddd94f7ceeb3cb9db543feab3986779447faccc0b5f0f8a'
            '52d87d2d70fc054d54cc5555abb80d98a88c149175772187e5bcf25c791ec78e'
            '14e06acf76e29bcd09b210ca247b1539ef881038e100140806d0f1d94ff971a8'
            'b69e86bff63c7f70f57eeddfa9417409304e7fef0cda3bb5abacaf2f1eb638fb'
            '817aac4444043307ac8d4e2a767df5caa150c4e56103d74552b28a17f09cd83d'
            '866e8327596518c13363e3fb9dfecc76947ecee57b20dc9db955dc7b9cdd8be8'
            'd16d65ace8d9c2c3cdfcce36111ba3dd6f3139c0983918e9a633ef1ead354d92'
            '0adb1048e1a971849a7624dd57220e714241a2bae763997735442ea1c098cd36'
            'b83a35276be870d26b135109db3891402a593c4b9adcf20c32d777eb1f2c5348'
            '4edb21f953ae21a4e25f10dd9687d720730bdee760b31bbaf5200ff02ab38b77'
            '5af907361789953c31a67357ce7dc03b6f74b00de0c315b40a479f193deb96cb'
            'e3a98689c8b1a5b0de90cbc6d8d17d6f0f2b82446f810e13411de195ccf3f74b'
            'b0e44c87d69a153834da0578d4e3ae07395d971fab8f58c0447216725162afac'
            'e414dc30d2d3f8364166edb11bbbf91bb66506c6cdf406c7fc9a2589fc5d9967'
            'd994de99162067f3ce82267f003d823ef3cba028e436265c38aeddaa3506e203'
            '0c07df5ae7d15445ff5d9e0c36180e6bf7c510f1b5a37cff0ebdad2c2892515d'
            'cd3f71af0b0a02f82afc5f11b6ea25f7c5dc3eaf27f9b622583b57b429658b8e'
            '19a9dc4bd4ffde50efb637ac3016d3e404ebfa0f578541ee1a73d48854d1777b'
            '9a61b3fb7bbaed19ac36b9e3e10313da89dc250b11a07b3efd37794d6068548a'
            '31e07eee82ade5c76a0c5704a8d4dd127c730a93fd5f7a91065d8884c60f8581'
            '536813b45d77ce75f91df3dfdf0ebd5bdfed41516b3ec1fe091c2b434578ec8b'
            '5d6959ab83ba2b60c0aecee527ee671c7acbaff81c2e06e8d9babda8f9c9361f'
            '9403e111e35e06c5c44706c91d51b981372236632906f1d654e3b613b41c9211'
            '92ea96d7b670b08d225647a1070be1e2128e80cfd47bea613258dd0b6cb9f364'
            '65c32f4da2c3e0eaa08474b524b4f9118ea3c1b833d9bee5e2fa3877530e3fef'
            'a9f8d05d1cc1f0917ac47794c4760fe2914248be787df627688febb1d368ef68'
            'fd6422bff4962e4e666ad726815cbfba9d01f3972646bb3118dce0ac2b99712f'
            '669af4abd20c1263a0c6974ebdda1e32f8d2ad34ac43a3d6e718f764ffd4d7bf'
            '1d64cb7e515c8cf0427b708041b66e73420f864df3b99a9f26619e14d424a87f'
            '2648887346efe1a87a692db013f0576eaee21a0823953c5d38d88ddba09ab4ae'
            'd32040d640a04979688ae4f0130c824d335d9c57a68edafbcc133a2bfb19d56b'
            'c314a8de83c11b9d4ab20aed01bb800877313ea61b4a11fbddba48ead75cce93'
            'ecfcd4caf4bfb0c696e321aa993c654b81db3e02a9cd2ea52bad0d5b52903eb8'
            '50da81d01ea923433e06b7be3d996e212ae3a3c43800c830042959b9aca6b709'
            'e6b11120ea7482984ed6c67b9a349f5d4b09af60da71d20443058e8b2ea45d29'
            'b364e814175debac047e746ed3a96e51a2ca1902a11a40e08e8f7eed150996c2'
            '28484a8df6d7f6e37661992c45190ba5db2928da3afe04724b2cd83ef5c8b79e'
            '1416445ddeaad37e19a5e5c95e2f753d8560005c538c4dd4c67587d11ecd5534'
            'ce7a2c53f7b648fa0bd504b710fc7f3d1330918bff19bc7e2fab6abe34725594'
            '68c94136f75d9a8ce7dcdb5c20caa22bc3ffc88fbd47332c203af8b96b3ef7e5'
            '3c8afebc9ef39169995476d6b3d4f2ec7dc87db141f1d1d30d5204823cf42baa'
            '8015ca48f0abda03aff95a0a43165fbc4eb569e85927c9dbd74f0ae15cdb305c'
            '9b6d72e7174ba743c0637452724a82a1febf9cf60984d1ec02b7a9efc6f397f3'
            '03ac5c3fde67ae37084ba63d46b6af3715ffba3d9d22b77f81cbd5dca60b8d95'
            'e0412fa61579e400a48cbbe83897602bb950637a518db0f171226f7d7fee4b01'
            'ba6849ef6b1526331da46ae3a6f5cc5551e1e816b8933698a44f5036347cc56e'
            '82c094ae98054bc54c45358f0c90de7db73c12d68a88375303103a6e25d80722'
            '61996c25d81df0b0a6599264db50015944f1c87425b30a7d1aead0b8b7ec4378'
            '5b4d08f71ba89571bd0d4d2f74b752ff82aac935044f05e5d8c11eda49b193a4'
            'dd87cbf7913a0f7b01f50c551af408f4ce08832e1940897803fce3c4cf5212b0'
            '40e1490a169d1c65be03cb431c48b7dd988ae92ce66ecb5f9ecdf243b533ab46')
