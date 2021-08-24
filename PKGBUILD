# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=93.0a1
pkgver=93.0a1.20210821
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

sha256sums=('e74203e0e7b797da18a3fb11b338cbc322328156d7d9abfa093dd2026dfd8655'
            '7891a207bf5cc0383f29120d5b6a61df509ed938ec96ac4cbac8985fec4ad7c3'
            '3c0c3dec546182ee60eaa5a93c963575f50d3edda9fc40ca99c987b84265c310'
            'a2b2f4cbc9626374634c29b6ed6bd22c81d223d1bd2b0d6abcc8c2686498eeb1'
            '0aec8d15d01aafea746be6068c5ce4dc29aa3611e2a64d6309713c70ceaf03b7'
            '154e58bc561f2da3ed13d75b5022e410ce9f8cabf29792391efe625bc4c955d6'
            'ea533e96e1a83d1e17a2746c9099299dd7c22205d0c518baab82e6511f5ae401'
            '197d61178614d10e82caff914cf4a97c60b00370b669b00b3bebbe77a6c17b07'
            'ea4ca9f50aa42b9fa42cdbc655835383aaf415f45a2a36d86b3fb4705c7ac53d'
            '825ffed171568cd74f06b9b3d20228636108c81f425c578ffbf608a7bade9c19'
            'f59ce2951471cfe4fa46b7b55c1451784a5f6cb3cac54ee6004042f4ab51303b'
            '73e34100a938b1434f43155a8f3ce2ff8adbc3817efc01c071efd1211b8cd477'
            'c07265fda50f98d0c0bcd542c1dc5dc54e74af26e0666134c84e26494ff4620a'
            '71c016961c840ae7d6531ff9cb1fee101f28ec5266ab771c02a50f3d1b1650c6'
            '57e885bed5198903d9097788809c6efb1e687def64bf602138e2bd7a509d32b0'
            '5c81d300264a0cfcf68732b9a3db5ab3baef00942c36f524aafb6959d4a9491e'
            'e97da9e8d5ad46194d428e4a1d5bd9f02b767ef0a7f339fa31792ec8ac39728e'
            '001e1d257e05c2a505dc32c62bed351ae3b94174514a490a5fc66c6e48f97b48'
            'ec366dff09419416e9c90c59ab7a433588f6e61329388bea90ae1b3f24e28d32'
            'ab705df75222ad5850566693f0d234a76b2aa27dab18400c798b17c42c452dea'
            'fe6cdc48324b16a9bb8a6ccd53ea606f1e83b484a47b6630e55a1c85c8e6b5b7'
            '66281392267a9fabcc082d4aabc0d28352e65789ff41400d52a47552f31b067e'
            '3398f2174597245aa9d70e7971598fdae65bd6c4ae4f800d66909e765cb3cd33'
            'b3103136416fb9c82397df0075f90b027b9ef83f6ac0e5b38bdbf0d113d1d9e8'
            '614b7e312acb6ffb0e1ba60b7bf11844be02453b3b7ea853e5ac167e49f0949c'
            'db397be876a2bf8dcd396287750b626f19edb56a096dfd9bc36cb51196af55ff'
            '100811e26cea4db65829ba8964899213dfcd2894acb90455f4a9f5caffb9633b'
            'a26a6694c1b05bbe698837ea2485215df23ca49ed414aed3191cf31d31fe7e52'
            'e94ba55bc8fe9273583681df950cd64148d9f31f86c29553cf846c100d533a27'
            '13f57b79723fe4c2f975c9e14507113b2daa0efa44d8d7ff476074c63051455e'
            'c22aecff37048fc9838b9888a8ebc25b102208fd1d453be25b7de56db9495f0c'
            '87f1b5bf2025960b38a616b6d127053b57ed88065cc4cd7eb16545d717d1d6dd'
            '52ceacf0df5ca9691a30ee6c91ceed0687db6a211bbb47d9a0499fcd516cebc6'
            '227c1ba542130914ed2915d7115d1171925e562f4b659d68ca2dd67b9ac18362'
            'bae1498efd00165dde591beec11a595cee56fd4205bc6c1d0c4ac9d6bf9fc0da'
            'a8b588928796ca869de7f3472af31ca772f2a4da988cc2db330f554ff2ee8a5b'
            '18a2e949096124e951fbbeb7c8dc429f7dec6cb1471c6df4674403f3062ee452'
            '0ed6578be5d26e0d0a9403e55a73812c83303d2a78ce46f599d661c490c9536d'
            'b016b9663c9d2e6be2c246b1b535636fbb848bffb093bda64a2aef40a22a6db8'
            '491a07e8fc0320c0b9738a9f07f4abbfe5e4e515d5e2c2d558667eb1874b0798'
            '0ad86e6f44d03f7088fd15912bd40848c9cc629c6bd391c3bbfa8a1a01882c68'
            '823233a6ead0eca763a7a6c8acca3a1bc95c3f24b46ab408698557f80ca64dac'
            '1b09279afb7c903c6bce984deaaaede21b37813a079bd177177cf2a5c7075d49'
            '65f807a649ce7c4562fa578416faf3d8fd93844f6d3d1a101a961d5fdf59273e'
            '0e4fcf29e4f7d637a9f4c4b7388c54267faed84616a254b24cf37145ce6570ed'
            'd49ba3cdf9487f9812b671dbad3e2bc721d4c202854b7dba5327e433948364e4'
            '4784e4356ee5cce7133a410029997219406577c6ece198b102a3d3a51fac0ab8'
            '23926d28fda505602a25f9047911c2c99d8acd2d59b65f13d76e771d749ae25e'
            '0f1ee81a5b1e01cdaf418bb45c0f90c8f283efb3c899032160cd1a64d5348e04'
            'a6e359a693db5c594757c7536dfcf8959ce85c9375e5d7d22e8a1014645abe98'
            'f6ff19675bd4866ebb27e81e46aba8e10a714ce9c429a24c51443ecd5e428924'
            'f89adb4b3ac1a74b376cf097ec3fcf773301ce7d31d3d8d3587b776748a74f6d'
            'e9500c2db605166424e074c4321b1eab6375158ee25ef103c0907ad146ae167d'
            'ef71819c85b357f4414eafcc00acf344f6938a89386b02c4d82974597ff6fb44'
            '2f1c764901aa11de7d7b5e5515ec832e2f2e4140eeb6efcb3fa6d26fc0b575db'
            'c6c1bf73616f9775a55c51232f29584fd435cb58d1202590834631c210e227e5'
            'a7822e57b58060503631f7bdf8236e6cfc5509d90547d14fa2a44c2c54ad8379'
            'b27a8a21261851e6f944dd943a896221d5f9739f0d27fe9152107b37f7ad4690'
            '02c3231b1d35cf64e46489952c6fd06703fb7916ad8c33d22abd32049771ffa9'
            '7c16fb9e51c9b1d2611c993824f45a4925fe45343c10ba328cf1e7460f917be4'
            'be9e6d5b05250678b64e37be5be5d9cf8a9226557df1f303e8f37499b47311fb'
            '0995343f13ddd56a96b4b7d51d93f282636315460b743af5a0baab6da1e16cee'
            '8f03076213346d60a369763e90428c12eaf88eb757c13d8befa98f9892a9703c'
            'a492e1c32149fdf602bed67f40c861c79bdd0d929d7535937d7668702bdab872'
            'f53cf443b212463846baa504091df83aa26f05549a0502cd3ce7cdd026a5d855'
            '685e79e2563c57dc3edc698cc33c1ab306883b41209c31d7c76054a36ae4a1bf'
            '4469c87b9c1b2bbf2ee34915943cfd88306d42dfd40f1aa13396dffbf390d4d3'
            '97018592b317f26c405f5440e2f9f9612972a601f15a640cf1f1f169a238ae6f'
            '125d9db6ad1463415ab82adb0e9b74dae53de9b4e42ac162721cf12cbea0307d'
            'c08d0dd11251f94011687f046f23f72cb7b00fda47a7b0dfd3a45b48be0cbc1d'
            'd0adf1561099b58c8af931b9aaff90b66b551da2a9e0a74da4e475fe5d5adf20'
            '17ce3289d420229f52eb24932dcbdf0918e2e6ffd4a1f4999ff27baf0f5a38ec'
            '827e1fc9338a507ed188f9e488a03d2b3846cc147023a23b8233dc2b15111299'
            '835f4b3e7d130600f400d8b862dfd8bcadb38d923fac7048d6663916f08c3361'
            'a4166c8f55ad744e51a30c914f8f863046e016bf185f974ea23fb9ba9433639f'
            'c8472524418d2b1593a723940d8c1fd8302c5e145aca1e686701474ec1c038a0'
            '272d79fbba7440030c017681b6e8f9b69107408039118b74a29104562d48a267'
            'c275714ff2983c44b8d9e2d629e75b14579dc3b606dd31b87c8e6fbec65b34d6'
            'e5fa4db95633feb6c69703fbeb715bdf8af0bcefeabbcab57ef7d78dfbbc624f'
            '98f491a20ac7a60853137eda5c1c593806849f49de5a1359712c22bcfde8325d'
            '8aad76037d6af9886b68bc51c3ff21a99b47937579c68e03f2360c9d3d01d267'
            '50136051d591fff7e8141310414e6f6cf77a151e834f910f246fba768ad5ce7f'
            '0b21bf21f728153c4bc707706bff61f501e8e9f21ea9ceaade995c7e2d6dedbc'
            '07948948ea1f20a687039d7c146a16126edac768872978cfab745c585fa885bd'
            'a555b6addf11897610c1b6113a42084f3dc6e3123656712b0c015c614f8e2ab5'
            '5771110f33274d301291cfc8464ce1827814d2ecc414a8fee9400feb64ed7194'
            '2e5cf820217187518829b97a4eabcceca795d65b9e652d1b79e9cc94e2f53522'
            '5cdeb0e6b02a923e5804c59d0fc5f48c94475666135f196c30c717b89341943b'
            '968ce86c1c17d7da0bfcdb18789f5b47f9be3073ad9a41be24a9d7851d0f6d4c'
            'cc857267b83b63f0035a1b27849fed95c1092ad1d39bf1bb481fcc77f404fef8'
            '7fd0dd8ea5012789b113c4795fbf21d85b52b1653506cd8426c91d1de5140abe'
            'bab3dfa38f795b3657dcdc9cad1856b8e5f90c0d04d402a8da8103508113f8ab'
            '7e14dc10948281b90dc23c174aa48c16858790dd7b18565bde811b0b5a572403'
            '6368f491dfa743120521463e34fcb5d5c97fcd59270ce3b3fd992021760aae6b'
            '440ff3066214b91a099ad0aae89a7cf08ab0394badea95b03e67e13e170b7ff6')
