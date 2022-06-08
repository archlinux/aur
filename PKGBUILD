# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=103.0a1
pkgver=103.0a1.20220604213903+h490469b53dbe
pkgrel=2
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

sha256sums=('7bb2d63ac0b3f2829c6a3ecedd5bc9f8343eeb327a27c1fbffefcebf9d0b5eb2'
            'db51ae4d28d1d5f15c386c50f8675478e69b5e1c05a0d00173f7b2cba8a3ecc6'
            '11d23a9a4849eee1151cba2dd4fffab0ae4b439c275a4586392efb59478102d2'
            '52237e320d5450d7df0a24c9469dbede4662c1ae8ecd0ef87c98904c245fd6b3'
            '9399a4a124cfce7fa7c20b34ae87cc0fd5c19231c2653dc66c92bf85c5a36103'
            'aaa1bd394a32f8b3a3a1465d6eec1fd91ac57b57238a5f95020102c24b232839'
            '4d227759aa8f8c194ea270a4d4359f8d5dc0f2d06f46494e3f7ac08251bddea5'
            'cd9098ac62db8f50c583434bcb45e2aa8af0cf62043acdd9ade38898c30df710'
            'fa48d3413783066d16d3bb24e5d4ee9718bb99518748a78064cbf918b9a2833a'
            'cdce479648ea4f791bce333aa37a273f10dbc08e5603c92c595b51c8ee418fed'
            'e5119561e266abd444da742b650e5e779652fa177b1c616d012f30dcb252799e'
            '1c177b2c752cbc0451ed28e61dd89f2ba2cacb17185c0d4034bd55f6b903e2a0'
            '390347cf950616d4a3a1dd052d5d057cfc212d5ad6e21939c7dd0ed8ac1d0a50'
            'fc4f7e6fa717ffcc9d311da472a05ac2ecb89e340d502eee66b943e0eabac6cd'
            '8f7cce5184882f3cc5dac9ea2abf8fe1dc6d876702a35e6a84cc569c47f790b2'
            '83bece26f48344304a4edfefc0f735183177bf30269a82e06b61c7cc4b4db039'
            'd3741d6e2909cc288bb1bde029a47765c3dc6c99c7a3169b733a43798370ba6f'
            'd0f44c86e60f1034194bf847091af3cfc335d1e448b93c3c31cb804dbd9c362d'
            '49c32b67f97232e0c233ffb1493e59bbbc21bb7b3ba7ce619f443a70c2d587f0'
            'ca5213b45acc421c8206e148d19fb636779005be0e6b13f40713c7891cb8bccb'
            '8a66308d61742fcb330b4613ba6984668a4b1bb240f5219a113a0bb39cdc9e5c'
            '6f6ca8265ef07ccfe92d6e8fdd6a443f5349c97857957fcdfae6316fbe250642'
            'e7f6b0053a0fb241b1fb503d893926e913535e99f0404c8ecb93db805de92041'
            '4f672238124f02bfa0ffa31c52432351e848ab9259eec09e5fe11f42581084f2'
            '6798a678b234db90c9df63467afe0a2f5f7d7f341be504728101bdeb671632f1'
            '772aa27550fad5f15f655d74e4e37be26d0ebae75b1a5ddcb2dddeb49cecdd85'
            'a7a62b2e13f254c6bd15a88b4a81f121c7577ea7c17438aa6589c382d11dcf8c'
            '88361e9cdc77d0b7be103a9062b6183447340b51aa7c29f3a1d4ab911d1b5d6a'
            '6bf376e71ce3cb3d265107ba05d1d63325320650ccc0345d587030ae3a0e3491'
            '3406cffc4ffd509ca007f472d9679c7c6af0446a161fb12eb399f80d578af6e0'
            'e739a2e6ed7e3ffa908a7dca1e94af49685033cf7eb0a1b4afff92f37644213f'
            '10b51205e2789209d64b176bdd9948a79120c9a2d98d965b5062138a387c8fc6'
            'd3270893fc44d0b346686079564b3655bfcb5b6de195efc8e6b69de07f556058'
            '197bee22d0ebc4eff852dbf0d50c8a9b26d78d01e3de16d3b72cf9236c716303'
            'd31865b4bcbe0a02e63e2b5878c1d1942dd7bf403cd35b146188d43e5c848777'
            '52e70aee7c6696f2b9aa0df4c926bca744766dda705bbb0bcfb7c293726344e0'
            '6f5631038920db0888b0722378012c5b48776fb354b9ee79be875a62fe299bd5'
            '1a3a972066f45efae4a65f4b77479f8c5b8f2d31281bf1e1a27774f1ee3cd0b2'
            'b695c6b1b20677bce5486001a1a428a53f08b305f05c28f8dc78d0d60786ebdb'
            'b3462abe83348ff01295ef3e95071cbc1be92860c4b7ed53738a73aa9ae14705'
            '12fb1ecea514a659e66ee31eb38a33aa02751441655e008170ffe2942525839f'
            'ed364dc75ecc26128c4e0cced4d1f680369baacb46c1c9ea3a447cbfebf4d485'
            '15265fce390a17d73e61ee89bc9610da3ae874758fad9dd917f05bb189236573'
            '9bc4bf611ecf3cd8a99803e790902063225ba3b8f2ab84dbac174061e15a3f3a'
            '2c75083f3e635fbce9b20dfbb80b03a513265e32f4178683a0c695169e68772b'
            '1f667587be3ad36ce6529695cd59ab50131861d3b5da09714356b2989bcd1697'
            'a7ab1136d7fe24ebd4af97f2cb14190d67321e19b3f04518af69da81f7fef76b'
            'e7427737de5b15d43056132f670ff2d0da16ab4fe2ccae20e1e8b8d63d424966'
            '823d162a7a2938fc603a4cfc0d8efdefa3888112bcafcca6dfbaf60d43d5e845'
            '43299d30ccfa0eb3b1613a8a44b234471366df68997a4c7ae7fea3269ef77b55'
            'c567dfcc6e89da76328fd7aa762a42ca9390fd5972d3664cca401687eb88815f'
            'ee5d357d87339a7afb5fbd2467aa9d84942576c9d74c5c11577a17b3ff226e13'
            '8b09b93e6b3664364316421de4e71366c6048d474f508723f8c0acc40d121c8b'
            '6fcb1da291179d33cfbcaa2f9fdb224363bdc4d068018c2eb31cc12bfc1aac8d'
            'c85bdeb69792d7ff9c8b03a188a431c6ee6b73d8011c1fbb5c2abf8d27e561cf'
            '168c41be4f70d2017c1cac1e48b8ce1b81e151803683f08107d5a9a26d7d1f85'
            '5a9b29fcf5e48c2d6cf4598a37b4048f7b7af4c8eddd138d5fa8e4724eeb73ac'
            '9168cef2a17c39fe81e90a9f72e6c56a0b3465c82f13d3931cfe26fc1e64e844'
            '273b330762e7bbd0869ffefa1993186e33c5e865f68f13bc29057c0fbc6e8b49'
            '14f69e2a4b187e38802a3b3e9edad0254ed78ee1672f111588421d9c0f36e407'
            '77bd56cfacac91a02e24a67252d4b7ae2326c58eeac6f4a9591a3f987d63bb35'
            '771dab11e8f90507a92ef833d1d296ae00add099e843dcb99273650836347571'
            '2063644c23d6dc15cc37e7683d1d917a9a3e6b9c9e80ceb9ba58c5509bfa4d87'
            '987a16d94adb9bb36e0c9599d31f6f26297d169768f466ca9a2b4d55502477d3'
            '69a2ff88ce0500fad9ba433eb82689a4bbd6aef31eb8123ee83d84e3242a5ea5'
            'e19bc77113c8b778ff994222c99facfe290120647769e8f9b19e9fa8662255ac'
            '69fd9fde86e92065c2883b5b0ee8fcaf30901d774093274c62529855c4a62d77'
            '519edf7a63e3bd63537873361917199d4a5ea2426550dda74358fc6826122d2c'
            'cb8f2ca99a9806f4a5c91762c13a0f739c34b2afb7f08a6a25ff9349a53a4730'
            '4c0192354f33aea55b58c9db6bc54d73b6c455b479b1d6df9d34a43c6cd4227f'
            'a630136f8d2e136135e5409869d31d5150dd0714d571368cef49f82e32f06d1a'
            '743ddaee2f0803b644ec4fb3ff9dcc7e41df91fedd06aee4101bb5c0ae182899'
            'd19c6e7286c595f35d19098df26c3005786dc6924f63cceccce39f5523351bd2'
            'ad28facda22398cff95171d061b706a30b17247b9d8e35c2142c47fc4603ece7'
            '2a69a914069590f49491bdbf4fc405bedee606c5e81a666e53ce5449e7d6b26d'
            '5909f6316b0a4940a12287e3a43914385a8a61e4e9f29351e0242532656f82a6'
            'a099f5a2a9ffef3f02677eb47687af3302a8489f7bfe76f0fb8f8993169ed9e3'
            '554daf6ecd6c7be92fe982bd5baf128f2b7cf28c906ca543bb00b8a973d845ed'
            '48c01eef9b7eb1a08c4c090719a19da4532d3dc55ec6b4fc69ee03550019935b'
            'ec25dbfee9ff2598dbf4e782ca9b808dc4e32f696bf8ea223c2e689bb5e9ad7e'
            '5f380d2301b548fea342a2c4673c7ff35020ae7ce66767e1f34ede81408e6b5f'
            'c1dbf03a3de33a363f1095ae18163c6d3bbf15b1df7806a2d65745378658bca0'
            'c2f01d8f4408f93adfe54486528dbff5961f36e9fe60b6d2a7bc1b1795168943'
            'f113829d260167a3cfbb320c6f6b025039b9bb21cceca8b4113c339b520cf273'
            '35b958904c2a0f6794221c83534a1098f38f4f795cf0d650a505a8ce9c0be85c'
            'f0b10fdbda727de9244e880ca9dce8786b7b70a3cf3fa0716290f008b49147fd'
            'a198f6a62015a53c89b4f822567d4bfa4ee1543933efeaf7090834b378ef5d77'
            '2944c9d682145f60f8d0bc86c87a6a7db8ea0d230eb4883f40f6b13f6f0e361a'
            'ded79f44f80b5cd9284e000e49b299d453f1b8c2bb129a5fde97bf09dcd80b02'
            'b539b26d5ebf701f8dd7c7a151b344e3d8c3cc7219b019a8308ca0f71e1a0fcb'
            'c35b876b58569a769a5b2e74b142e079756511c84bd2fce1197e8ff24ad25735'
            '9eaf692ff2e7f466898397dd313a69959e9295acb639d1296082c5bb4cc85883'
            'fd9e86031fefe10ca483f375f596e39fb40b532e6e7e6c95f8ea5cc29bfe2f0a'
            '4333307667d172c7026b8b2cb52d657692171ceafa73f230e9e75c8fc41ccc33'
            '87e832cf17820102482c97e558b78d5f9547ce757d2fed27c773187c79716d64')
