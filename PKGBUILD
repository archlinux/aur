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

sha256sums=('c63d949d72e97780c819e8cbdfb46f50e342655b89a325afb971efc4d822c8e0'
            '17cd8f39f1a1e90eb8e7d095ceeddc013ee725b9e41163dc2b04f20d81604007'
            '9a9bcd2c7e566b1bdd1160b404ade96688079de91c2623ecbcd732f8ee4bd6fe'
            '5e2deb19b33d72ef17370e15a74f7b3e4c0fed91bf570a7d88dc1f263f0fd835'
            '9d418e5a20aea82f15e5ab16d9bba8bbdf4eea32552ddb216d0f89ebaaae9298'
            '042031cef4cea9befd116a12da1682c32370451c96addf18233a9c14f1f22661'
            '563513a853da5a9266e5d8cb4441d2be16e20cdfe45d695dd0cfbb222f047bdf'
            'a3da66378b9e0c3596de853a9885bc7b3a12c2936238b38ffe7a2215df9b30a8'
            '6de597aedc49b4b07d84e9e7fbf2ac65dba03ec7d941757216e6058082b82013'
            'd02d5ee9f81dacb953ecd5afcfd261cd8522ffdead4abfa64385d601b5259598'
            'dcc1aaede61a93f71bd1b8f655d50c99f300c6f169d371fcc34104297af98f5d'
            '505fc6fb362cd317c26be9a18e4e63bd2de22881fe8b816dfb6ccce9478e6f01'
            'cb593aa7095027b1e08b1004a4902af60edf7abbf50d0947f54fe5155545cb16'
            '0cb58fbac543a41d2d259f19cca72408957e72940f727ee78588e81f3898713e'
            '6cc37959ecadfa2d792b55f337282a495d6d83aed9ba8be3b0dae4b1154f4c0e'
            '709beb5700467cdf92b9ee9d187f2c33d4204c1aa55e2f09ba209648efc41279'
            '0791e913b861923cda1162a32582b6de2adb7085fdc2e7a1e809e7140244d2e0'
            'd3fc1873af3fbb6ef036f6908b6145cb2bd7e52ecf990a16855ff43f9c35b48b'
            'a737705e490673c826391b162e729c6f3cc619e64730c1d39780be6ba8e1e142'
            '3c4d5fc817e9ddb0633084e99d2996beace92163aef71399562455756ff0fb73'
            '96d0cba0eef7d39439776bf84f79c3f6d6455e48b82fec698ffabe8263ba1b51'
            'b76ab48f1ec2390f57f806e6da521294c5559ed91cf33c6c43b995345b9bb71a'
            'a68d85c8101feabaeb3df0a3c49d3e1556adce43f68c7fd644b135bdc6184287'
            '788daad8bd255e4682c7bffcb333108c7c1486c1320e715a5d543578efaded5e'
            'dac5f2af2cc648f81fd7b9b464d8a73f9fdeb59923179e7e784147f3f6e226da'
            'ffb5eb33fdceaaabab03f1a03efdb64d781bd7a489fbe9239c39009b7ebfb86a'
            'c47bcc69ea697baa4ac1cb5e9940c1678c024f31ee533e6dc3d68c3297cc9ef8'
            '136b09d10f2c389676661039a402bd1e04f70925e38347a8f98579f12f7ce59a'
            'ff86112bf949ba1a9eccb4f2401f61def5d39914f26eb387babd67bfdda21e48'
            'b0285c06d4ceabe0eb0e707468113db7c2788802faddd4834a89608924e123d6'
            'f99aa1d90372cd4c434b7ec4630bd19b8c72cb053b694aa44de8f7927f9d0889'
            '0bde97814caea67be113b970cf92a21d8829f7a2ae053252719ee55a7a14f4b6'
            'b0f378124d78bfb6447a49852a9d8033621daec0f7bef50fd71728f2221ccfee'
            '7a720a11495c71ba957cea07c51a5b136c4f0a6ce71498aa7f210ed1f7239066'
            '704c765174ae8475ac97cc0a1a760c532a75355e8701f481003558fa8ade4749'
            '4df5c4923606169bb2915c0dcfed91050a04f030c62a9fc1ccbb1c716cbeb759'
            'db60370bc814d58430780405d35974a7fae834c92fcf15386aa7a2f40bb69ebc'
            'db95eba4be72dcc33a11e6e0b77f368be480e7b2bf48a0b7ee5bfbf333b05faf'
            '708316174955a3a6e9a012105580c1cffac5c28903def5a5e7ffa339ea0910cb'
            'c092d9def3293f654bf040b23f61f9d31d4c06bab62653fee224a9db71855212'
            '775b3387395c8dc844974f2f4b649f0cc032b3e21f9ec02198e7f2d858ab66e7'
            '52dff2096c277563fc865866af3400aa2a7d386253414127c237f390e9855e51'
            '871ed23ac79f9f65f0f09a3c1c30777bf3f2a6d88192f1f011161ce3d9c268e4'
            '672ddec0b1d8f0aa105d77f95650ecefe7ab6a8f10e711556b5834964f5dbac4'
            '1f89d42cd2202f58b6d7a914bdf0ab7a51f7f25f724af620590b2876a7675fb3'
            'd459673eda4d0157851d8c823211d74fc457fba12a939b2fabfefddb9d254a4d'
            '6bfb397a775f67bd3d56d8179b93c43a6eb8ad5d99ebd96ac346534732a34b1f'
            '6932f8f2fb5b9364f1a9e17ee04e74b0a866567f55af2655bbb86513bf5750a2'
            '598d5a433fa8000ab23d114e19eff37b522a2c35a61df78146890c54701e488e'
            '1c44b75af040fb2dfe3cfae119c02b0604b799e51705e3ea3927483d9b7924f3'
            'f16b5643a4634e1da7807ca254b03f9311e67c2c935f23f68875bd502ad9d0f4'
            '06568ed918ef13671895b567b5822f5ade89d9e33f1c9809a622cd66dc79223a'
            '401c983f665cc3b4fa711095e7653d5c4d6a95863feb853ffb49c494b27ddc9b'
            '0cb9b2ca58e82e2c77663a62adc1e30ca4b5d51e956fbebb41ab1396d13c9032'
            'b6336a845d747485df09261a4a19cc5818fc2d376ea871cc7c7c8cb58a21a79e'
            'beda62f44d8e8daa3877b67ae659ede7fd00b5964331c88cbc858cc826423e31'
            '9891f5cfa789330b2ef423dc88b52cf7a2cb98ddec48de71853a91e3179018d2'
            '1a6dc1fb5cf3a400df14925eb4bbdfa21bfd82e77ec28c6f7b962cd4ab501781'
            'b534866e56c0e9bcef63934c840f9bdf943dbbe2787f2b06d300e2cb3e511002'
            '94bd1b06f7e2416569089edcaaf780796629e9aead2d5dc7607b276b5d230595'
            'f7da784415e86d479b682d5ba42df94938d76de67d0ec8e6d299924cf291799e'
            '5dce06438464ed7e640235f11ac22796b1397cc7c1b35c6a2cf5a555a7ebd447'
            '0f085073d57f19a4e39d19f0126c6855b3ad02fbf1f32cc6353e3a73ae60e516'
            'cc10e33a9b04cb3a8a9e83f56a8a4e7eedee1bb6a7b280572b98a4177742a4be'
            '6ca9285fd8e6d818a9e410745b14632d1d8a2410d34bb976020f5e451147142b'
            'f78a2f46196568bb8b02d558746b9c510d76c57cdae685643605dd4894a77873'
            '027e8a290cbf7992b08a9ae5517388e4a1ee91db85d2132d27ee198992443bbe'
            'b94116ff15c232c2431de6e7e40328cda58d8783137db2654a17985caab51225'
            '2024bd1aca4a519dbba271fd71737d915018eb0259118db645df6d4c0796d1c4'
            'a11ee18eebbb9bcb30d65318190e9b5ad40e32baa301069765a35afe3d165fc2'
            '8c4f032b1cd9b9bf7f62466685b081ac5d79243f33272f526365c5e0e149aee1'
            'cb1b67bbcf8db0413da4940dea96c21836c9775247fbdf5db16d0d89d2182582'
            'bde630c37fc95dec260b825215e80920eceb976ee349046e9c494b1171c10df8'
            '1de9ccf823f3282d199a71b0361217f22fb94bed6d83ea58e6ba36293a388397'
            'c6352b126b96bd67d04b8cc53011252aa0c1345609cccdcc344a5d03d53d9437'
            '03fe1f23b21ea9b4d9f6d908261963d6bbf1726302b09191341dd53ded415891'
            '00ffbced68d52ec1d01c5cd3bfd1df95d577c59ebf2d7985f4b214bae5d044e8'
            'f65014686e93ae38e3a09f69d59e2a6cd5d7fa1fa9b5225f68a03e3870752476'
            '065b80bc2d75462232c39bf498478d9f4dbddad4c27f3145a946137983e47849'
            'ef1cb7c72a0b9ddf4007326c58d802932435e0c66d823ce3968b98e2685a09fd'
            '1143ebdc7351b5210c0af4338b037c65d390f4fc7b4e836c172f90abb8ed1d01'
            '80bfd4a9ebb59dab2f910b2357a556451e9812dbcb10e8084b83eb42efecc40c'
            'e4fdeca08ac5cfd7dadbdaa9cdc8b694a643240088e6052dbfa195d7561b8f73'
            '1108bcb5085f8146a039e55a00b79cd123909fa3ec66ccc33f9a0596b81b417b'
            'c7a2a3b1ee6b54907a095f7170f8a23e57a87dd5e6a1e6dd6ab82e27aa539e7f'
            'acc13be095574b05b1508e9534af8c7e50ac6430bce770a8697b6945b4f3993e'
            '290a4b3992749539c38066e79d53a80937ce98d3378aa89a04d67e5701379fbd'
            'b0a94ffe68cfd7d621978db480a9fc00a83316f80f3e0ecfca97a217446fd6ad'
            'e59c0c2a8fd0bf087a6e36f2923c7c45bc2e1bee626764094bb60ecbedf05420'
            '93396e7c0a4ec4666808f41e7eefda6a61d6e9f028e8f96a19c671ceb2b482c2'
            '524c936c50f87a1fcf52e27d9722e4adde9eb658998017c2c1a91a7940176a89'
            'f6bf32d2d45b466acba88f44c7673a9ff265c7e09d6c00bdc3e84b7f5798fc1c'
            '0ac12f06c1dd7115220c89ad2a173a8c720cb6353b0380275330ed55c33c8cce'
            'cafbef17c965a56e10229898ad26482f622cba2f4f1a90618f3a641130487a3e'
            'a379d43cbd07bc080eb927193d0f63c0da756ea564b6337297e948d444e08495')
