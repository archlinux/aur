# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=99.0a1
pkgver=99.0a1.20220208070047+ha25fb4010591
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

sha256sums=('9cd954d85c7f590f2d6c61cd966ddd2404f0b7fe41ced15a0d0a353b37706133'
            'c3ae2bbc64631e915cf04170bb769b9ddf4d63ab7a03b71c9c7b650eb051660e'
            '77cecfbebea3e36a83f2d12eddbf2a59accd13eb2ed3f96ddb90944761ad21c6'
            '5102759b5c36dcbe798be61478477ceaedfdcd59c14e3e02f67776b5238578be'
            '7e59b5d6a01907d2378a19d7518345116f911033aa746b9a842c2e0231f62e6b'
            '34ff36ce01b33cf7b9d7af8de819f7d3b0d292e13cabf181ab3545231d9944bf'
            'ff42828ad0e923fb5230d883b7562b560385dc43f0acfcba7e3ddf682d533293'
            '2c9cb915edf71042d1aa13a9861d0f278f104dd023aac5081e9d92a9849edcf7'
            'ef568f9176c60bfecc13f3ab8a1db349113f88ca87e6a0c214ed4e9cc4122048'
            '57e81c9a2ea6952be2255cc07d72d7072d5eb241b7598bfc18a74ac8428378a8'
            'a7adc2ee8b1140aa3e9b835b4a9b98ffbde56f7edc93b2eddeec5b32045913fb'
            '579d8fb4f4e28c023e2c6781626de084c48d6b2bb8cf66ff2031a6a03ca15787'
            'ec757ada2f0d903a0f0821357659eead5206edf63782e392c7de493d539c6baf'
            'a9d1ef0f8895191da534e3a514483b35f7e951465fd45230fff07f70ff44aa21'
            '7c801fff1628fe46b9a2d05c4dc2fc4ddcdfaeb0db47557bd6e01036a260ff27'
            '806eb6269ef4ed7f5434f14c3713f57cad349561577023b7091c4d1d42f8d000'
            '38c45fdd1a1a1583651b80ce3302080f337e434bcf8e3785910e2df646ed9865'
            '71e9fad395a22919814de9fbd79755eca9b62e875f793f800312b0483de09884'
            'afc12b8db9634d2effe572b56bbd8531dcb28615c16e041502d70ca195213cdd'
            '2fc5e1b0a2cc241d01c31cf16a4291e03c646e56d85b439c0dfa526d46c3e6ff'
            '01d6a0be7025b1faf0310a1c7340f54e32813e4eed739b73b684dac05ebcf6d8'
            '14c7afc87bdfb0c79f3815b3e9dc4484f1303b1290c9cbe72a30de25fe33ce08'
            'aac5e7345e25353282c932dd53d61723a746a0db9bfee2993b698303cd87d085'
            '0767a5ead0bd0d2d4c8b8293ffc8c8f07702634e4e669032e731a2d36e026aea'
            '8f4d1d07d0e98d238f9043863ecf6d8b35ce09b61ea1b50f4a14e794fc2db138'
            '07d3c150346884b57e898b63305fb62798fba24251d827076f7694f6219f24a9'
            'de93272f47ab2d5a273e92234c9651b6588a60f1df3a04bd12e71f3901541405'
            'c0fa036e903ef2544b6f9092e256238b6c0787afbedbf76881ac96f155b8fa44'
            'a43cb83db9dc71ac931311ce3fd1ef3dbe80cd74a9cfbcbe45474d053eb9bd99'
            'af714b8b3b2690a2801662ad4cdab79ade49a97abb95c96a998a1f2d5e6fbf20'
            '6aab147ae6f12a238ca5187e483aaee0bad250c84e9080852883ce71f21711e3'
            '1d4594f30289acf2e98ae8b280b05975b035baaa691cc7fb00c3a77bac2f7229'
            '61aa7e649012cc434529b7dbf5703fa332e77ed698aa93b8663941adf56d4da8'
            'cdc440c675821ebaceea8c621b9d77eb97af298034b92c4de471c1f0cb1d5ba1'
            '951a770894d33e66c3d34a056b422f0f958a7022eaaa7151908127947a79369b'
            'f240db6621bd3bac119dc73359b547d5173f6cdbe51de8371491fcd0e243f9fe'
            'cdcff9cc13b45d812ad634263bd80a76bdbe5f57ea63282d4baa07fbe31ac2d7'
            '0251a79f794198fcc707dbefa7f112e9aa9925ffb5dcc6c9c3f34af87d55b883'
            '724053d11c32725ad56ead68f6e7e0f1bc1738a875f9cbd353dd052096e28813'
            '24b617e058e860d0e84580c288c3fb2bf0f2d3c1f89693281ac0556938787459'
            'd6997fe893a1db82bbf1949f9f951c45a8cabbb24ba4ffc0736259297eeb20e9'
            '152d6a6b90c5c5609b34225a02068f81e715efa150d40e6f100c7420c1941545'
            '2892c09fcb6bb526e0551cd468906abfb36e0694424ccfbc0969822fbe7a8825'
            '29f0f375770edce234fb2cd8591a1699eb7a68d2d76916213132cbbfd6c2d76b'
            'a6a01cc0e9268c200ea5581502301e58205f2f1a0732252ecb332316e74026de'
            'ec5e7e4914cc6c46677e0895553038e537d396d0c0fa739c02e68d55bf07ba85'
            '6ac30203b3fe8dffd3c029cb23e51941038ab4e66034d649217d25478a791a0e'
            'd2ba98bb018eb5c46d5a381cd8de3c3208e812f1e05c094a00ccd62ca67f8d9b'
            '760c663d2b8af987af59ccfa958d0b8a3754619b7ceb08c33397948ae8b3894b'
            '0e4483476bc3d1baa6c308be29b467f3d3e6ce2f182022fc1fbbfb3e99511aab'
            '9596e27b1d147a13fa3b05418e781caa3efb2b7b55d1aa192e0b96f2bce9ef8a'
            'de4319ab121090de79601e890a0ba454cd7a9feb061dff476c59067ee7cc9f69'
            'b3cbc7f27c68bcbcb09ab6fa55c3f6f71e3d9e552692174f8618c570fc3d8ef8'
            '1ed4a78b36991eb193f851baf4a87a850debc6933f939e5f706efc771833f6f2'
            'ad95b38fe18c1ba61ee0c18ff391a5f18abb2a275e8568ae45162f43e85763ae'
            '317b55944bbba87e64e034aab1c7c73f124a01434856ee03811f8ed9fb0d5389'
            '94046b48408c5716f4cbae0452ea5b3c84ad5ec38708b5dc1697e39d7888cea6'
            'cb323c4ec5d74c5b9c062f808f6bba683849733fa90eb06ed2b51e9086963c9f'
            'f5da6cf687d06152eeb91d02c406c3dc2a33f4c02d637b4f17fa93f32a93e4ae'
            'febdd0cb7e35b26525c007f3f3672f910b957d7ffbc55ae3ba149b2730fd7cef'
            'a36c4612932f7484ae7337f34f3859c9a971fd43d8a5c746173f7b1c167ca7d0'
            '00b80086a72aa9403ce4a5f01289b970796df454cbfbd79fba8d898245c39f3c'
            '8b19d03166e7719fca8d2bdbe00be79977b0a41c262d3184a7339ccf784ef51f'
            'c8ed2d7ce5ca221417ca0752573b16c9136b845a8677d020c998075bbbc73738'
            '86c7c4fcbc35e0e54ae98f46035fd374d2f802e1e1283968606e4236b2c40f61'
            'b0fd09ef9a7aba9ccf25d33c60c3d5844bb018ab66312863762916ada49427a7'
            'ffa31b9d504bb6e81e760d72e1fcb6be9dd0db3aece6b42470f317d78b322cf4'
            '3a4ed29f318dc1f30ceeeb115fa0e4f596347fc427dc8b86ef0adb753fe0f3a0'
            '5737b4c53c7458ab6c74bc0e23eab2650f716a5bd6d4e64683c701bd44b00a3b'
            '1c06b0f050d37650a4026360adce9d10ead449bd39a242ba353d9e0556602b46'
            '9a442f8c5ee39c33f404c121ccc0cf93e2696a628b9b1eef65d717e37b83724d'
            '73f800c52436fbda5912337ac43e3a9dfe6bf91697a7692e26a686b25aca1d72'
            '9b3b4420f60474e165d400a307382b85cc18737b8154858b5d4788eddf01d307'
            'c679ad49755d2ea03aff2eaf347bc380b2ddb41f4d120308212a2145ec070edc'
            '22cfd29ac731a40be39a066af1200195e3d55130d8d562405f6ac720a61b597f'
            '2dadb6d2ca019f120bab9b8b217dc96afe5665f372cf57b16641cd317e00fd6e'
            '744383d63c3f979b16deb4726c30a378aa2003788aed20a4852c0288494702f1'
            '8e6325b2d021337b49edb99119b7c22d0ce59dcc55637720e4d28ca0121be711'
            'a270d35f5558c635bb2df677e44fe50eb91d199488a7285266d62d74ce3ec681'
            '3966b5bc741738a67dafd2685d934744aee83e24ff4e10aa94c17ed38fad0b46'
            '488d476f6ac7f580746ee0dc5981921f63fa61784af54c6e948764c4f2b19a62'
            '342319aabb687dc55f5be97c3150baa4415bad8d5489287588f62e8c4e839450'
            '51d0f646d32970ac8b7ab306914fad1196e5e2aef32a740446e590427e60731b'
            '13fd6b526dbb122ec7f74d6ab4cca0f1869cc7334de3b06441855ad2064d01f6'
            '56fe1175d6ea5efd4950b3ca0d6111af18db9552c488a074c296f08b25dcde65'
            '486d3ff439af2e79e43a6d04418f3da9a9cdba7ece9835e98fa82bd22e60e7ce'
            '025a5235455e099e0462bbbdda52c73009d2f7a00cedf568fe661d8e6198f042'
            'b7ead94a03493ce5e0c6576122e3c315da01262719be1e54cdb6eb77ad616812'
            'bb41e21c4109b19e05a85a1d001b0c61ddb8e21dbafdcab9d5c38ad7a766eb69'
            '9ee6151dc81b6a33ae2a5e42d46df49b8eeecf5d18f49b7481a289154fdfc52d'
            '09420aec564122f2c7c568a0adae2e572d7eec2af0a62e3382e5e66b266038df'
            '213703670d72c0071de3a357629dc6966c0cc3881890a599a2d61d2c85cbc327'
            '0e7401eba564ac11406930fc30b4c4b20ec910f8e8c5e17f12c0386ffd8d238b'
            '2656ebc576c03e145f25ed0295226ea911b9ae5f2f536b0c14d6679e3a107716'
            'b7fca13b9fe7623cbbdfd9f550654ff90f9beccddb9d3e54d74cf61fff66f4bd')
