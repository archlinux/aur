# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=89.0a1
pkgver=89.0a1.20210323
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

sha256sums=('11af191bb7651fc5956ab00ba5afc46782e809fa1aecfbaeac541bc62854c629'
            '96f84deec8093866549aeaa31d5a8e7291a8e4f0897473d25c7d99d69f6cadd1'
            'c09432c365322da948d624fcd690c6085d720396d201a3a3ccf540f5096370dd'
            '96cfe5c00f8cd0d1a318c62d7d0d4a4f1f0ad416bf1c929d30a45b79f89bda67'
            'bdf3066f510f84739dc6cd56cc1e4db1b1913c080627a2360cfaffe59012bad6'
            'f83943f687d4d734611ab3eb604ff9429fc576417b5009df5741b6fec1a73183'
            '4f3e7f5a1e235e1947d28175ae115a0fe0b17134a7ada7900e6617887a90d0b0'
            '1974b52a4e0190882741eb2ac5ef671ce4c393a8d432e34097b4a1fe8937154a'
            '0d95e7b40caa2c4ae7260ef2288cb37e4ea043701c0ca2ab171e6e3edc24585c'
            'c8f7215d4464096db8cc253f4c7bec2c614a401a12615be4323ae16b3de2726a'
            'cd940de031b35b189bbaeeafbab85c46ae0ef3018b232d5e15d571132bd72a89'
            'e73ccb70ab6c418a0ee23e8488a5eba021d0508843ffcf86d8115ff3161c96b0'
            'e54f90571067138edb79471cd6f8118cfb1cd8f4bb1f0af5af7cd9a6f6cba968'
            'e7f369325c7044729a5b4b0f6dbe3a68e1c0b68ff2c18a8b0914905500292307'
            '842f02f9de7aabf84f7cd8b73a9238f72761e6cb02c2a12ce52e143ed134e7df'
            'e0ef04936d21b707083f4c086aa6702663e94454b698153e176100036353722e'
            '13414655db75ee183435ecf533fb505286b7572e34de90c135fa49a58efaca85'
            '406ffed51171c83f85660f1e738e58d64096bbc9433f28efa16748c0046fd3b4'
            '42c983908ea9a8f3680550a36a95c7d476a824d588a307c133ac7ff253185a91'
            'f9c4c841702942691beb3c5ec1b8fafd8510eede8c8a69ffea5281307df7be56'
            '7a10898eec1d87dbcbde914e4a42c619da5d29fb27c1a1f27589cc4a52abf1df'
            '7c4429f79bc8bf41c3c178efee5c399c6c37e1388466299f8f8c4285fbce4445'
            '2681388287c162ce5235307bd381a3ea38b8004fda53860769bb16a5645bb400'
            '9c332c8402a587bb7d2869868fe8dfbe32454f8d7dc29d0016fcbeb2aeecfa2a'
            '54934b7443f175e8574a6f10dda447ee300ee5dc08557667c25bd1ddc61a06c4'
            '6ef74a0bdf7f0f0502175e3ec911d1e2ec8f82dcd9f55c2b09b8617bd7dda756'
            '3e540ede91661a43805e03d9a00d693dd9b5ff7394b09f1d96c23f59191a65d8'
            'd9643a1e498fbaf60da90bd5a8269076c843b3eda7188f5cb023f501d62914d3'
            'f3e912c3c368cd219b5042f8f037a92c28d5873ce0ed0e27538f895949e01f4b'
            '1300627be5f42345e71d71019c3805aff4ba9b6cf38c7efbfbcc9b31836ff8c0'
            'e4fcc2cee24a68fa199a1c417eec26146de1750f9f60110cd78c9c36d1aea2b9'
            '8d82df1441a557e2aea8a3b0d112cbf15f536f52579fdf579979a10899703d95'
            '2aebaa2c77143689a9f93ed4ffa997d417fe17bad07b88032589b2dc4e90bb62'
            'aad54fd3f70dd99f3254c0dcd798ee3ab0ca94c8a034d8473aaec3cf4d9919db'
            '3e510557653cb7785df32e96ec7d0e22141ddf72a5e784969914ddebf6333b6d'
            '7de57b99ca2810e9d1ef10956024adb66231b54f298fb9d05abab0365840efd8'
            'eace636c3552653b16feeb109a32a08b98a3d879d483bce4c9db9500ea23271a'
            'dc3d877b55133a202936d672c00cdc63a898c87125cf310b407a6c27b923fc80'
            '5aa3a5d900020d99c77ddd1769b89811145878ab1b90730278c8887fcf94d636'
            'f062a1eedff46b8f43da660cd1cffcf495f3e095103d6ef1102ea0a754ea75d8'
            '19e71b0f4b02fc0ae4eca572a93c1bf6ca6d876e8d0f4a632b25a5702163b1b4'
            '19b38ea99efe6452885e99227c2d23992258c4a208f99ec24bc8f034d1e3d8fb'
            'e816d7818f9a718b628060d547be0a80d9d115a3e812ddf7e10109e0de292209'
            '2e9fc5a0a8026ad2c5c3185f0fb58f94a6b481ca0470f953bc3c220f810af560'
            'db3f8893b895632e9768a67299b220379dad19b6ecb13ba22bab14d93f4c9450'
            'be81480c6a679f76bd125db454f356ee406a9576e5cc6ac85e1c1af53d60e5c4'
            '908b3372a7d6aa2799a21b1767d3ba11ea8f4e6c2c10e302de3af123d9b77246'
            'f7cad34012f44a7a4a80320902f389620cbae3332ef32814d1c1517a45c71ef1'
            'a71fcc220217115f9a9b29fd867dc729e0f29dd8d1afb32ac591909cf5d42111'
            '1ba9653eca5af64b02777832113e899d0ac3af21138f00115c9e700f24ee909b'
            'b73afeb1d2c5eede568e9c980309894fef8a301594d946f8b56a85e937d7ca62'
            '5a110b79ebd9471ee055d310f2c979977132f39b1fd7b21b0760ee4a2f4877dc'
            'a2b1390532d20c46ed25e9182d3431e9ee21b8b831a5b6a136d7d4ebd708bfd1'
            '952ad8128d298fd1f315f8e9e625a6f638116b4a9ed924ee44e500749813dcca'
            '66f282bf9e7dcae1db97751589eb52da79355d0d267c41221226fef875f4111d'
            'e4109dee10c24d15d160c97291d873c642f89383bb5b28a5f1dcdeb0356fa1d0'
            'fbbc0c2013f3f51a5a9d4bff1e1d2d21a8648c502b08fecf830784e3264fd3b3'
            '0a7a4412a70c3c94adb90371b76603440fde3c387bb5c6ed4ac25194882ad75c'
            '1141ff7f6bcee61c68429ee7c2de0ccd62ddc9def5821bb499e5550684156ee4'
            '36fabfe0c5542ffad27a6acb5e8dd7e9a2194908cdc99cc8bd7c1d08948639dd'
            '7305f481dca9285a66c1300808c9eb7167077498ee7f83a91ff3de796bb52c44'
            '40b9b62f6a79a587259dd4966336ee29fa56ea39fa5caaf3a76b610a8f6e248d'
            '68a4c079e07634696472b3a35c291fa6ec5e265cd9b129c9b95b98e0a75e2082'
            '1d30c31a6c9780c6c7aed2adeb343e37384227018a2d853c380a92615daea6b9'
            '56d6012e381cefa97b953b2a67fe4fb5aa145a382350de56f92fe9f8e51eb78d'
            '709ca3ae79e4800de49ca553c21fce0fbbd076478336fd6acce694a5f6c15a87'
            'a32a36ed1ead0eb2cd4c29aa9c23d33866dcec52d17ae6ca35ac68b31237b051'
            '07712b08a66e50035bb247e1cb5d6980c688000420d579b2243c428b2be16cb0'
            'e699dcf8ba643bb61376fbde47c5b912ca6321918cbe28123bf0253da96d2c92'
            '69be8ba1f2bd5b06aa2af917819b7a71543c13c1969fb13f32cd1af1b8f87578'
            '410d965b9a5259ab69691d7a8719c56d991b3edf5c8fc35c9200cb0326aece21'
            '092cdcd18f2958bc1ce399241e61f7ce4ecd19ec40953bbffc32e32ed2186738'
            'edc978d4ed4fce4e91215a6ad8b860ce562a473d644c0f2dd5b36b346dff2dbc'
            'ea7725549741fa405a8bc59ff5228c913b45822bea5527f160612f098aeec578'
            'eb5df03dd9ec52a262faf7a2e7b5afe30b6589a1a60e36921c87b0fed9f3964c'
            '63016e731658be475d3c2cbb836acbe9480eb6020bee5934d6d80dcaf1217e55'
            '014fc852d36893a0ec95a294aaad31eba00a49ffbfdd94a6113b6468665bf831'
            'dbe906b02acd7188d40807d64ea6209842c2569de44d5c5edf1ca83cdfd84ee6'
            '45d6d4a430deffea4b87f52ea13865b727cbbfc9f4921aeee85588af396e6f3c'
            '6611b0d52a1148ca0c5214b78ac76a75b18ee6c4fd6b61b4026e919b4fe8f64b'
            '8359fe653425ab574e7d433764bec26c59ed5cb0eba426dc2253c00eaf9dc753'
            '29dc421df57d59fe53258c783faa0069fbb186e908700c3b3ef1550ee9aae852'
            '30bb5dfc69b39ee0468657d5e64bf1ca4aaab6261325c60eb97b22c3580f5287'
            '7280554b612a1a6616173ef22f1f21163c2a863f7ac41114911e4870ba87a4fe'
            '16af35512ad8a358487c05377f73308a1c12d500ca5bd241cd19341f444316c0'
            '89a160947285a1af21d5a1514b403c893c169e01d25243f780c92db7bc7a5176'
            'e32c3050f5363d18f1f969060c1af544c139bceb5aa9b55038f8189b3cf19fd1'
            'd45e3e296a35db78a986fb0dedfa73adbcab95aa3364f070711910876e3a5c2f'
            'b174f2a4f26a14c923b15dbca7f55ac1c3019c8e9ecc488be0cde2ed45c7c2f6'
            '2c1e60ae26edd2310e705a42f11461698d9ba7155fec6fbbdf5be7aa307ae714'
            'fb3f6e9bc58cd91681347e102aba767d3e6f0a56350ceb2d6f30b7bfa1c62db3'
            'cc3f1897664c94cca38f17999ce1c36ca26f3264287dc598068169d426b5ad54'
            '0e13025b9304a94f7880977e1e905c989d771a1fbb19564831c632778cd53e9f'
            '8b52fcd6d405f4a26b1c75c658549a5b717002a3ad73142d5bddf400ee802b2a'
            'd20f12e43e6b0a7e65e55237e6002c9480a2d7d153827fc5ee911dfbc72db254')
