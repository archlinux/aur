# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=104.0a1
pkgver=104.0a1.20220718065908+h2426bd765f8b
pkgrel=1
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
depends=("firefox-nightly-bin>=$pkgver")

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

sha256sums=('14ab982c1a06db9d16c7677bf37e843b18d3b4cbe090325a3bbd0c09917d9560'
            '259a526dd258626d1ae5e6534132827ae8c673606305094ac704b274b9ca54c3'
            'e5406d13b5eda1a1eef776e779e73b38a8bac663a4d2efa1ab79f33d1712c4ee'
            '79aad8a609aa9c71be9dfea645ca73a9d3ea977d3583f5cbad446a8aa9402dc4'
            '6afb6b847953d2a2ac3c7d86d1b5f320776e5befc96efb8d0f0fe87055922052'
            '1f91b6393dfd3b3e1ce8d33f0ee81a6e3dac0c47ef9003fb004e22e9628253ed'
            '08a277f50c6ca51bf5674c62efd654e1a99864a82b144fcf2f05f3addf8d04ff'
            'c1b309b5e67aa60dc284b52973c4c17251aa89c4ea5a209e73468269f437061e'
            '444039f60dc36c904821f40adf8ea3fe4c20893668b94d69c1260db3a96f02c5'
            '8af4c6d1d4ed5d4ad219421d69113054f2a37bb7a70d7c12ed7d63a57a533bae'
            'b2cbf9e2e157c93c9e1753615fe1386b80f8b9886d5b5ac4012b31f32f213c6c'
            '25b04e09d83d1bfc0db1201aa7b46bbe6094b353e13f1c0d6dff32710d1bde3d'
            '7807c985c9d2c55252f50935ec6084572e8ae5ec7ad1a5cc0a3bb96fbd79d190'
            '476fcdf2f7303c30e07a8634c9680d7a8a9e89105382cd45885d5aea739054eb'
            '73f42524f6ea4700ed62fa328ef90e47b13c0dacbce73ad5189db07d65f0af9c'
            'cdbd4506ba57f72ca91a66d3df2adcc358f4055cf7b3c4a4ec0cd2a08eee1100'
            '32fbe16c71a605a98685638cca6135297f372ac894d686975046d17efd6d7856'
            '5c1e11744fed2fb322b7fa32f15154967af7390303213b795b64c1e99f38a5e7'
            'bb540d114e9a3e4dcc45d215136e4da280211b6ad96ab6c8c4a2a1296e6f610e'
            'a493ead9befe17688c5c47cc6ed9f776e20c6e15418fcb16db6715644c3d0340'
            '8149e4e4c75b2dfbc30d1a3a3e05b86d3e0e257e5897328e9c4351855365c190'
            '63a53e82592949c05937dc4c25e8544ebb7f2859ca26824e3aa31aee6a358520'
            '2bd8a40b72ef9aecd3e3ee0c5142f5c754463ad83b1d0e2e4300dffc378880e8'
            '5641cf6346ae936005fa28f3addd5968f96f9bfeb56770aa127ae0e35e1d8142'
            'c3eae61e87085dccbccea709337dde18d9486211580f5ac6dd3e624ce3affbf2'
            'b23a0fcdc17ba3b270bf7e8a6f5762eada67d103b6f4b09782778ab37bbdadb2'
            'ac47e86f408e4950155a3e6865882d982a4914dd76a73abd93bff34ff9592f35'
            '844418b9472b8feeccca0d7fdd0f3c1f9b98e0f19eb5c2596ae16c6b85d94293'
            'fa9924eb9e2b11261bf1619023a91b3e08e64671e0da81c391d012b7ecff89ec'
            'b53c4ef13064ff39d40d04132931f0ade09873be88cd4ad2616ab80085bd73b5'
            '437c0a80906098e4c52b0635097375a2845ec83958505aab4a5b9499627de504'
            '26d8935f6b576c3d6d22dacf3d06ae3754c84640205dd92b9b03b045fc23155e'
            '6f866fb3d9d51bbf313087e922e1c0edd8c434e731efc47e0eaaadec9327d2b1'
            '81b0bd486bb48befac77fe73899238f63d13ee7b158b40faf8ea6e78cd9e39b8'
            '1d39fd2638259174ec178c7b0a6ac218b3038e2be1792c3fb09dd584f8559c5c'
            '89c777260d3a2be93b379bf3c5267aecdbd837020f986e5547a6362eebf78a2b'
            '712be2e8abde0444c98c9e6beff691bd34b0122992268b7f0067975e99b0b956'
            '3f606da4f7503062353cf78a106b46e20e1f1ace066336a12ea20a1612ef5fb2'
            '44312a012a2cc18bbdc460184f7f16a1519bd9a0c5d15023863b2b6c44843546'
            '98e71e60133d4cd594179005ee54b4ee2a57d413b2462ba564c6bc499499d866'
            '1f94ae6c416d456e4f35e8bf1b7743024f231f469676989b30c940583bf73382'
            '0a052a739bc536805979483b5def0f34c2fa46fca742a3ca2b87669e9bacf0e0'
            '191ca25e645e943933961ed6dc917952023bccc9d0302ddd4dec0d6ed32dcc07'
            '948c28172111efd9045975a4048a104a77be25e3cc91f2d745de309c41e30614'
            'e75a239a833d450ac391e6bbfe9cce3e1509dbf7ea0e45145c1422b36e0c9606'
            '1c3fa3eabdac675919d9450fd1938663dfa3f3410392af0c0e17591582d18814'
            'b2e362a9ca80e005ae7106a4d697069024b19b438abb8602e59a11951918c5ae'
            '8ac7562ce22346fa073742d7c95c7a53bfe3783eb19d1bfd834b2cf36999d185'
            'eab60a278d167ee8dc93a1de0587a4f8c97eef9d488921adc88c43e18aaaf889'
            'c206a2dcdf74fa96b6c84a136df50e868f235fbc15eea4a0e0b92aa357a49e95'
            'e2cab54a72596890ba75d4e116300eea2b9d72939bf981f6cd461e9d4946b81e'
            'c55bf08f00ad0d6277ed398d66e7875b1fd58e6e2f9f6990db495cca0df0d97c'
            'f5ef2deca08760549ab2a956bb53223408a5170aa712b24ed2ced56ff985f8e8'
            '4278a6bf769821c9b13f0bb606fb013b17b6133c9b39c6bfeaa3dfe851f296ea'
            'cba3ab7a960b491be94e13edeeb622bf5cfdcbd0f2d931d5638ce9f71e13191e'
            'cc365759a55a3bddd02ac8e943d90a4b86f9f2ee910dfefb14ee0fff1a4c6fbe'
            '3da4a376ac073ba0c40f42fcb3ee7579c04ee49a4d875a6d1c74712f0c830496'
            '0e0500d8b0ec7ce7fd2ec88985cefdc337cef5a18f862041a85620fc661da996'
            '9ff63985b640ab40c1d91825253af87338c42603db6d00ff582f176a58a9e123'
            '9ff370792a2fceba8b29ef4ead678192802354106e0a76fc13ebfbed4f3ce4d0'
            'fb78a3f7bd5bf3c1c788bbbe35036961253294a9dd990f3754e3e11a86b13924'
            '3c5407f4bcd98b25eed996f9dd17ca10fc35cb638c7c95b4de06ee0b8795ff97'
            '0c34088dc6c73f226f73adbd2b8a537557fc40d682101ccc90a8ec5ae6d5d494'
            '689bf77b287ddaa106a8db483e950f9515e8ea0d8adb9b1bcfd8ce5fc0fc5222'
            'e9b398e87c5b9290776ec5cbc4baa0dd13ac6c7119fc8181cff7a34337b62b1d'
            '584de3ecd53930dbbf87f365a65c28e389e49b37409eeeece9d323c61bc92c19'
            'afa6c1844dafd95cfc3a97797f710f58151c1733393f28269465e160ccc110c9'
            'e8a1cda7d228d5eb274cdb593d63779f21ae597b7ac17c752e7d4071b3a39e02'
            '9270c13fe275376092a7da2723b7f08cb94abd3184a6434fb8aa47c14d9e8be8'
            'ecb8e8099a00c527f504cec89337ecc8ad0d584fec1d6c0c6b86134c497ffc9c'
            '85d9a63a4f8fadb41f97211d1a73be3cae1a602e18800ac9a4e7e12872b9d2d2'
            '88e0daaa228593de84a90bdac93a7038fc4b10f20db87748a0ba561c118fef61'
            '1b43456bdd098d27901fd606b5cdf204db0ebd1e17e1082770d5681d43b3cce5'
            'd78593585b583aac6a7a6ea71feccdac354a3815246a60a2ad4df6f2ce5543c4'
            '4d407d7f3b28ca7ec67efd223b9e964552e956ad132dfba9541f7044f0673e2d'
            '7909d82c2dd2f762036580d8daced3e93005c89e3831586ccd01591432d88905'
            'a9848789c228ba0c686d70b07a31351da139c8742abba451b97616f11ade0748'
            '1efb1dee4948540e34010f0d5a241417c615ebdf801feaacade21295a03e35ec'
            '28ab376d5b8260bac15a6b8bcb0ad360f0b31a76d3c0c9af278756c815b44ac6'
            'ba81ea0d991dba6ccbb9b23f1888238e86e89a71e4becdc8697b6e32ad394249'
            '460e7376013e425ea155bd1b659a16409322cff74e4722f0e4ef47fdd84332ea'
            'c516128777845727ee6c2689d2061df769b5666faa976fe3bcf291e55fe8f723'
            '49d40d192b3475be04cb1433c02c6e425fab13092791a596ff95f46166662941'
            '4c83343a1629e0b1c26c6d3e097e0c68b9e11a830f6d727088b1263ee9588938'
            '47079560343c94dd0ee14a6b1224355f16e48beeea5c0fb902c29221eccc648d'
            'dabbbb71d632142d1643b438137609ec86892174387e73360b40d390a3b1054c'
            '31d3c5a3fa68bfbb0c4121bb90e2c5e837835a0b362a7c11a66177d1098236a5'
            '1d55ee3ebf297aaf903faffc00eeba1c7f347dfdf897bacfdb9ea3a99e3bfd5c'
            '0f2d5eaa418fa58fc5046c1d7b8cca903cee575404569d0642b638d3103c11ad'
            'c3b6dc2099c12881a77341af591ef59a4a49e6e4ebf4927a3be275e8f5fbef18'
            '9982b1d48dc24b92b03a2c04e8112b3b6ae16362fd8c51d7016b031c06bfc6d1'
            'bfb60e1d12da02b33df82078da8ea92c2bbc155add68bd972a4d75c8a47514f1'
            '1f9991ac0ef0fd8b6a7f74f433a0ce9375c2bbfa632618bfa0a3cfac215dace8'
            '21f05214e4954d6a35179888e25103b101c9ed55fa28036b9067a2e5bfc4ff6e'
            '65d5f01922372d94649619016c6392c327cf2cf93932cf64febc6514e2dd2aef')
