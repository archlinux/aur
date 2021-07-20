# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=92.0a1
pkgver=92.0a1.20210718
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

sha256sums=('d1ee072d0ec4907b79a3d5d47196ac9bec0489ee92e012b6040ff2bf7b1e0fcf'
            'd03438263d4b026b42e5e446d103d6cfe266b0b7d59d942680a2107af30f52da'
            '163f8de2fa922a186490ed5218fc4a9d1d84562a28ca9a4e388ef1560e864f97'
            '4d9a7d7e47e6bf82180ab2d1e9d028b26ea39c668ddbc431e9d6d6836bd81d3c'
            '9ca45606c7775f3ccf935eb53189b1749e33c45a8502c82f3caf7a20eaf4539b'
            '67294ef4d5ac5d01e2eeaeb7fb57a46eb2a55e87b2ca9a2c1fe1bf161188fd53'
            'b8961ac7cd9a215d9995c23e3b97c5bedd8ba71814bc8eb8207f34dd1cdf6f9b'
            '2edfe630a5aec666284d62c5eab61b900e57bd55bd80f97d3c86043684c5e9a5'
            '44352c41204aa33245602510b5098c7e679b3f29fb496244608eea1300bf0096'
            '96295b6437908fc9b04f2462ed5c229c9db2604a502a2d0d28b3f726cb14b57e'
            '47ebb032753080f437ac6726cf1e8861b68a81e6ef77c9f4c9a0a052d14d0838'
            '74f2c6ce9f76797fb00b74beef3c88decf748d41b53f252985bcadcc1eb6ed00'
            'f9eb099ee9f76be8a0920487856dd13fc5bc55e02e96bef8fcb299c2b9291501'
            '8289728feaeb9c63fc6f2c37a225ec8f250a710bf26551f2a46cc0519098233c'
            'f67ceaa12e4c142af287ef1f5bb283bf0505176e14ac90b20b456e6ed1e15ab0'
            '7da385957945d1cd5af781b1aabdf8cd0b1c698ec78d719cb2c4fb68ad47ef9d'
            'ae2101e025cb28da26570f9570e297b4e4d2437c00a82bdbcaf16af646addc83'
            'bd917eb47586c5e0baf5282984319777fdad065aa621cb763b8822edf7ee654b'
            'b9e9c730d4a9f9a0ee192b97eaeeea4fb74f2e049e1a450e340c6dfb2db4a5cc'
            'bfcc8cda5c03dd3002a5e0a3d315110857305f23dab5d4554a8c191de22b7d48'
            '9a886236c9aa72d5e987395adb00f31d419fb504210be79b113c0a464adae12f'
            '5380729663351d671a7b0a567693db48998309b1eeb9c8b8fdeda2fb218ff2d5'
            '5f32d36afaba74a5c955aca5b9d7a7e2fb92d159510a066f31ad8e9f2792f02e'
            'b9f1cbb933c8de08f7e9360521112420a918c0dde06cdc2914a59c2852a24cc8'
            'db56f5cd0dad39297d26528cc065c6addd1da396febd12927d913822855b3cd0'
            '78ceabe9a2b8088d1d82084ad174dcfea409cb263e956b23c1b51e8bcf04f8a7'
            '44d954697c1dea4719b43410e0f9e48e88915f25315f8ad985798e69afd350d0'
            'd1135f0e9e633015946e920d9f933d08725224aeb7bb3a9a633f5bf002ae15bb'
            '131f358f1e41f78ba43952d51c5e5ca0cdbe00e2e7408895bb2b7cc82fb83576'
            '16b6eebdff5090a38d49c5afb0a677182874f33d6f19c87ddc97cc27a8bcb18d'
            'ad25eb87532f33472b730bee5d289db24086054bf267ff2c9b7413afb6deaa42'
            'd03a1cb20230fa457ac061cdb2e9820ccec19dc42ba0f09444998d730ad46a1a'
            'e3fe624c926997c5873437a439d7c10f0d97ac803e9017e33fbeee61d75146a1'
            '0b206d7fb2db86461b90e42e4804bdc25686d903a36fd47065ab861010e7a452'
            'd56a4aa09334b5f9f0a5e521fe339bc32510adf76991563b99f0cced14fad080'
            'ab650579518f51759799144bbb50eccdd31c2174c4ade25352d137890e72d210'
            '525394f1ff43fb87c37fe2662e53fc500a7d8d8e63ed1da6f5d6f4ba9abeff58'
            'f1da040bcd92743b3af623d2b4b61c9b805b800207986742d9c03dd3ad0e2308'
            '7db4e07fe8112d8f402e979ca2a0b9ceaf08aaba12eadfa3f414105b35b1eb70'
            'a9591e8281d18d67c63dfc63996480270a80d42d94fb8dae2cc24cf1afd5f2b4'
            '1348c01224cd669ee2550503202d0c1321a428203f74aa76e29fcfc8fa5bd89d'
            'dfe08f0d1c114ce86b8f842664f304a941092dee98a2acc67b3ba3f1efc2de59'
            'ff5ac43fa5b4bcb62a5d78f449d62958432a13aec0c94a7554daa46648290318'
            'd647876a9479fa2b5d5ee2df2ec4237b92d080de755dcf65020bcd700133bb04'
            '2f60c702273c106eab7c459c99fdc0858fd2d44e9e48d92b334296440a5a5dde'
            '65c21539301a130794a6791689cb24c2a68c3cb42994048bf558bfcdb93c9ae6'
            '99090fc8b2d26aa553e4c8191abc0091d963ce759dcf1b169f59c07b31510973'
            '9ff02cf2bc845acc4dfc61f103f6fb5098f275a0119de125a1dbfe4bc67a53a0'
            '3436f27d3dd2fc63fb020f559a02793d633bab221c501c55ea55616f9a672fb8'
            '7ca7609991e221fb7e4582b0d4c5bba7abca98322155ed9abd4121f31ec831bd'
            '62d57d13ca3d25c06637941105d05bb79cc56b6d31ae9c10b19f85d91673891f'
            'a5c752e27fd5f1999eabc62d45e265a7714647acea0f0aa53ed5d48ba588dcd6'
            'b8bac4e4e0b594e38beca7d2c0df0ab357b10bdbe40dc71491e1f392d6775df6'
            '40a8bab9834a546ae66d4f64e4267b91155f2fbf99b9db0c84360d932073077f'
            '874f46f1cfb1bf0140b773de6402535b85767d297534c09e8b098c27d5044aed'
            '4c3c004629c449475b2ca17f50fe378ba08c14e38c9c006db5fbcaae07d82883'
            'e5144c36ca287b447b70857c2b502dfcdad0c413eb924132dd8a771585b40d00'
            'f0e4d282a6e6a1a59f2e970361cf8eba9b2683f9b97ae5801fc913149e3f379f'
            '696e5f2190b6b4d9337e15045dc17fc534c2e0b8cfb25eb16a0f49eef290c95b'
            '59428a10febe08efed147fc3136373da660d7bc649057423986c599c83093664'
            '2f8a0705769009946d0f88cfabb50d90f6b3ff7c1ef117ef6425e904cbe92f78'
            '2674b0880afdc090472f35d278845e810830cdec6f54882a4d556645455efa46'
            '1bf2dcc152cc64dc9d18e363ae163f5e571dc80dfaf18149d2af84dba335c1fd'
            'df8d02f21d201c234bb079c6bc084052c6d1793e5728d7c0722621db70e69420'
            'cd3acddfca077e4135f2bee00ad4430bd6a44546da0a5daf580a023b17606214'
            'a8a8349ebff0c3a02bbaf3107f3e2b28a18a549cbb30a97a8c8c336dcf28e35d'
            '629c153e1e5e693d473661b03d55df7c033170bfd4ac2dfd9d5d04910e578b4f'
            '4d23be359832097cae0436a77770d51c4e1763dad78ecebe792ea39f5880eb0e'
            '4b1d4ad1ce62408e3fb1dac4424a91a2b2ecd8d09e8fd810a5ff03a10b89a30a'
            '9d650c52377dccc5fd9d847cb6d5994805a8c32d53c82c3b441b85b339b91c1e'
            'b985c6a79d0a5cbf2e8ae533366d8719c7b18135df4503087ca859c2e5c052c4'
            'd140c45e05e6972b2066ef9ce7372b766f729ac6fcf875cee1cf345e454f0e43'
            '59b23daca22a9756103d48706090af00030eb26ccad446a6734c68ed257d63c7'
            'f2874717123529ffaba6c45f0a03094e38206302cc8db5963879d21b5699407d'
            'c02c1908f27b73d5f7b134f08f909b9ae05a1311ef8f9a567c7811d7b5f13a85'
            '72c21a50c3f6522602f4c9ad62e1238043ac7dbc6c9c869e6595ea9e3deafe71'
            '86d8e9721a0c3a1441b188239b69520fea950b5a1ae23c51b697da4bcb383933'
            'f2aaa3b772b35210b8081c670f61d344d3320a7f8ee8cb5b8f342748d93b40be'
            '24b0475412fc9222fad10f38607d70af715d6927378cecbb1d3c795691ac1adb'
            'cb72e51abcb62c845274b4b14da36957ef00b22fef7a0d1f692cc2ab017d3207'
            'db6ee7c211b44d7c91c6d9a46b0414e7d255064eebf4de35f0f8be921b7024cd'
            'bf6562c77226df20f0c35d6d3146c208f6026f4f2617af2fdd8799e59a9008f8'
            '40c61d6a37b6910e5c0cb92d335fdaadcfbe4a596d58eb1c6d9f7e478b90b67c'
            'c689c9190bd2cd1d96151b49397434fc86eaadc2c667ff221710098f6ab4fb2e'
            '52a0a5b949fb8837754ba5c144215567c26fb261163b8877b1576b214a2d85a0'
            '11b2d7cd55f114e0bdccd7fbb218598d3d0e3e243174e8e83267096659ab6daf'
            '5343253b5abb57ab814e91e84ac807bb996c4b6004a50ba1c1233aac06d98ccb'
            '0c714ec789fd87cf3830642cbefafff171d5a05715b37aa7c51e7a73e5370251'
            'f219ec6d805c03b915c90ea7731f194a7831f579eade396eefff4ca08c29705f'
            '785b31864167273339e430b42ae9f70e40a3e3c068f9bb078e300948116b2678'
            '48476eb896351ed653f7d0b41889fef4ad792eeaa9894972fd48b8a718dea328'
            'a3832492fe2062a4647a6f9e2237efeff09defa9c82206b576c2fe1a5093e36d'
            '5261551b41e2335bc6c663b56c26db990fb38615fa08e8ce0363e1f082842e58'
            '606bfdd48a8eaf72eca2bbc8387509b95af08d48e8469637d95f6dabf032f2f4'
            '69d1b6d7621ec8c35949ffd32d0406ac760fb95996bec9962ff70e568c8c12a3')
