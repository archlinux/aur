# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=87.0a1
pkgver=87.0a1.20210127
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

sha256sums=('a98f6eee7c9ac0ffb4c3aa55fc0b017c78e66187b0b0af39e83c3957e7c03b1b'
            '3b94077e05631944bd6585680f5edfe451b81a5c8555860fb1deb1a2aa04d1f7'
            '92af08b26e544e665746f82cdb91b800e4f3dd9f961d8a9dfed0522541978842'
            '5f0989c89e252bbc9b7459dc62dd8ade163d85b560cc2404ffb0be20f2b8ea7d'
            '455070a8bcc244f629a4daf5b5372e6d37ebc5527cfe6722a77427a1a3855de7'
            'ee3e7862a816e9653175d6982657902e6a0f5f5f899334b397b4d247ca2a41af'
            'd0e4dd7df750c45f6b6b9a812d26666e99eb4ee36bff65110e6b2025e4aa8c65'
            '5bd70f1cb55cce6dc6209f4b2ef2abb028271621d72783142793b410b7bcc005'
            '7f6fa8adc1596b91df1b61b46f7538622adf228ee28ff44dc140cc86ea9f63b5'
            '96844c12877bd3da46702c836d4fd056efeab8924265daa83de8a1834ce20674'
            '21af1b230c826d0424d2c05db10112d53b6697c2298e54897f86531917f95dbe'
            'caf8f71cd2b512c1feb3df4304c280f5a145e8eb9ba2990b1252978ace9791d7'
            'a3b81d07eeea9fb8e0b8e6ac901c9974616ebd7c3ea672a4e3391e8b1636f34d'
            '7e1953460c8b4a9956fc0ae841bc62206276fcc5c04d162592679a1d39093ae0'
            '7bc190d6857ee17bf764be0331a38c48444cc4b5dc831bdd8ce39a5866cb9fae'
            '4380052fb300e21d80e981e771e28546d2643313ad6cfc898a6c7faf103b7c09'
            'f8d119d6969f84fa2479fe9f7db44191ba7737bedb0b89ac248ca6f29a0bebd4'
            '392514aa08a202f260fbf28cce1fc691f26d80ee9d17e38d7c22ef21daf9c0f0'
            'c0a0d3099d524c7eee19dcd04f385dd375c6df73f81631b6ff9f4d40e18c3f96'
            'c3ddce22d478d22d4b804994b09798b639d7d1f5f4d56e84eeaed41bb437ac17'
            '2ae2b4541338161cfc9e48faece934c52d6b31cba8dbf79bed9059562c84f433'
            '496812d32ed8afc169ae507e2b1327cbd868c6e2006bbfe79a6b2c06744a3382'
            'd3f8f8e0605cb4bfae81df2b80f8057cd29e0c9184e46100536225e0584d1c56'
            '3a24e2c9dc52e1868af8ac52b2b06fb59e40f3f157325672708acd1312b8efc1'
            'c840e9d05c4e7f4d51f2e4f7beeaf906e87e3e5ff00e716df0d26138609d810b'
            'd6362448eada12bab69cac5c0f331aa404ecd8a8244d4e953e277a577a4b8a0e'
            '47a6b091f2bdbc3e5d14c5293367668f70300063d1a9ccbcef0bc106a23050d1'
            '5e7dc9e318c5f0462b5946732131e825d3d24dd92cf9ae172bacff40f2a6731a'
            '8dd793bd461ecf8e10ef015c3b85fe4898d45d42cb5d47461ea9d1ef1230e037'
            '3bd2a85b6005bad30243aea452b32bed775852c45b26e0bf311a72c4f2149682'
            '8e9e7e85d761d37a6dc0fb76551508afebe9c5690150972511b78f330a9bc462'
            '685b6368e153f1cfd8b73228397dab9624f68e298a8147a780047ecdf4998f1d'
            '95b556db5cffeb7376cec19d27547b2d0a659c49a88c40a49b59d5dff0aaedc6'
            '6ad81af63cbf312adcdb9aa4cafa3942d1edec0f1a0cb48708c99b9e3c029b2c'
            'a99b48e6cfa4711b2dfab77e7797c4194e73ccaaf316f9123b44c4449bcb0f28'
            '47547818e6f494a3e303266378cec9cd39afc1db66d28297a6407a8618aab58d'
            '3ffd1580c9dbb5a3d075482faa8403ffc7f8cf4834428ca74d0ea36a4d820f5f'
            '60748bfd45558f8d65cf4ac7e25b9703d03f19389a9a780fccfe81553f1202cb'
            '9e7724184cdaabca139123c1953693ad5f284f7f6e93eda49a4f762d567edfe2'
            'a12c7eb562a75fa7125d6174705fd1194f2b9833a4f05f08f03dcb926a62a7f7'
            '1525e110337d588ae4a05ef32280694e2c79520e6e004ccedb5262ff5aedaad9'
            '2d0bf80c1f61e8348456825048c079205903d5b06ee1f076fd3e24f5bb378dce'
            '675528885b63a09b0e282d987039340295ce61ce161701d18af45ddfe612fb47'
            '4a1159e20aa5cc946b7e2a1125c0adeaa24f8385184a382b6ec4227b08ec184b'
            'a30b82e86435fa7bda252db0dfe0f1eb82e688903cafa332518890e037dc87e2'
            '922285559a44e5ae1f47d411eefe96dca14409be4392f3796dce69a500e0cff0'
            '0e00a93da2fb00d45e6dc6efaacbcb417313ac6abd729003a188be03f76035d5'
            '8cea9df29529ee1bf6f3625c9164e70d544faf756629f4d3caa2e32b746b8d5b'
            'b722ba7f0121a675357a28c2e7f00920ff13745e8cb927f72a2fc620be4ca94e'
            '7316918156a8f2888790c0c8bbd798e9a47bb1d2ddbaf814dee668468068f2c3'
            '5bf55c7c1bbc60bf75e10e11ad8e6cfecfda6e332f5d35d8b16f287eb6d2ecd2'
            '3e0afcc98afbd76c27e1e685f399b7307b0021db04a4d81925b85f63e7b3f950'
            '999143f171b3de32ac945563500b52111eff2b2f2095f889141a55a6052fad5f'
            '6e5bed3c9c3a042fcc62c878bc56ef75fa191b50f8c78d154e838d266cff27e1'
            '59cd26bee27f82352a2d5aa92afa8bfa408c9b87533ec49042d0ec47554dbba4'
            'fd8f539df2ce67b92b037ab70765c48514ce38c51022a4d483b0e252231b6a06'
            '73ce655e19e51b6d81d618b52a4fb577d61ee9070a85606f4a81fa46aa8d1452'
            '7b6ad3283f35fee362004aa87acc581036f9314c38509aa16f7969bc36396e0b'
            'a83bf00556247d2efa633879d85ee00781cb72f0765816eb3ffaff05154bc84a'
            'aeb1aa2fc14e4a83e4a0b7c40f75fd56025d4616f5f12d24f096b3c6326d9b9c'
            '73fa48e3ff79bd2e35e5d8a476c5cd3947fa0d45d23edaaa6aa6040408fe1c1a'
            '6e22385ee66c36c0f2a9939345cfdf06fc93b209176a0b1bf894e23019150a2d'
            '906dc42f4bf0b02ae21515e065d517bca60fdd647d3cb4aec83930c2fdf8563c'
            '8e70269f12a6dd06fb6e40c6f9dcd3660b3e2398a01945d1918f191b011d26f0'
            '1c339560fc9a43ef23bc24f105f11220bf7a06e68d5e2ffa3588cc743f8c82fd'
            '78a079469c635f683bfcdbe2a005acbee46ad9e3d471f773dffc9f6dfa798f88'
            '817ff55f16088ba2fb0ae9a899c60e849fe17c1cde1819d38a2c43b2861c801e'
            '44b3bbe01d0bf7dbd9782368907fb7de9a0c2dd2e79b0eee41ab4314fc9e49d2'
            '3bfb95943a9462f204256fa1a84e498b88ea6ae25e953424b5948e3c7c40c6e1'
            '665bff1ae524dfefe90b5ab0364726e4d44440050294767db4822de267e229d8'
            'b17d616dd31a15c8f677a3fcbf1b46a229b3a9c3bee1706f13771fe92ff34b62'
            'bc97bcc85b6f5bd0aa794d9cca13cec9a510ec15d0a4759477fd63c777d47559'
            'edd32b91de63a527e0a7f52580870782ea6104b3244c8ad5a12e3f87b9e95c59'
            '922e49e80a126feb938d92fc2c24043d605371d9aa09556531ee81b83bbdbc96'
            '021257967b6292fcf9fac9c83b5f8a209b857fd9183691f945740f1e2e6f1eac'
            '6a54d9b3af02c803ae426fcd78d262c5f84f45a4428118b4c892cd1e314b6104'
            '2ce7dc7cb6943a6d2030ab8dfcf723348f483bd79039e4bfae6a67d73562c5a3'
            '1328f85eef60cf74ceb554b6b823d5b29dc669c92c3b078a0f82c59c4cfa57e7'
            '12924a12ac3bfbce48a5e0edbd6c11f77d91d77284e0ad4037b50051c5be14f7'
            '01f8ca4d70cd791a0cbdbb5f88ba4053a8096f0825cfaa5707a4387dce5b98b8'
            '97aee75c6558b9d288949ea59eeb95ec28efaed674d67dd2e19529e3713ffbc0'
            '910cace1fde94f15010f82ea4c29aa16cfc62de7cb791db25f291205e4435b06'
            '0c8882dd809ba9e27a477c1c64ad88cc4a4105c9f4c652c593818ad0af3fe150'
            '86cb3b409cc340a6122aec5d392fc424733facd8d9965441f25bfba7ecfef36d'
            '43f12f3b2b914459b6391167d483d0741fc8322b977a46283adcfe2e81b94b97'
            '2df34989c6d0fbc45d82695f759bb740bacdedc138a9291b48e7501a0afee82c'
            '1dea4b74e4071aeeaac29b061c459e185c0379d56ef8b18b016077f7148b6df4'
            'd0a26c7528a4866c570fd6ef6dcb25926c3fd0f46f8c4d70f183aec8978fa0c5'
            'ec868555b00dfe13b49b0c6f26e38f37e939d0ddc75078301630243eca57dd62'
            '861deaec53f049e5c23ab13d798fe04cae1077b42f56553dc63ae296867d876d'
            '8676bd19b05b74d98f1f4bf6baef0fd93392c129081a529d08a790d8dc1fce21'
            '750dee194a9f947cc3c76850ca135cdc6684e6986c9640d62cd25c108378320a'
            '019de0b44319f1116f48565e11931c193272f80b9ac5e29e26cb4eec7a386637'
            '19a31e2cef7073b1439db5ce3b1e12e9f5c308df6c397b346f26ff046af6d46e'
            '824b862f5c1931d47515e8fe9a20cb77eb2935cdab21c8658dbc93f852a4abcc')
