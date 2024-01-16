# Maintainer: twa022 <twa022 at gmail dot com>

pkgbase=libreoffice-dev-i18n

_pkgnamefmt=LibreOffice
_pkgver=24.2.0.1
pkgver=24.2.0.1
pkgrel=1
#_basever=$( cut -f1-2 -d'.' <<< ${_LOver} )

arch=('any')
url="https://www.documentfoundation.org"
license=('LGPL')

_url="https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64"

# An array of the country codes for the language packs to build. If empty, will build all
# e.g. _build=( 'de' 'es' ) # Build german and spanish only
_build=()

_languages=(
  'af           "Afrikaans"                    0'
  'am           "Amharic"                      1'
  'ar           "Arabic"                       1'
  'as           "Assamese (India)"             0'
  'ast          "Asturianu"                    1'
  'be           "Belarusian"                   0'
  'bg           "Bulgarian"                    1'
  'bn-IN        "Bengali (India)"              1'
  'bn           "Bengali"                      1'
  'bo           "Tibetan"                      1'
  'br           "Breton"                       0'
  'brx          "Bodo"                         0'
  'bs           "Bosnian"                      1'
  'ca-valencia  "Catalan (Valencia)"           1'
  'ca           "Catalan"                      1'
  'cs           "Czech"                        1'
  'cy           "Welsh"                        0'
  'da           "Danish"                       1'
  'de           "German"                       1'
  'dgo          "Dogri"                        0'
  'dsb          "Lower Sorbian"                1'
  'dz           "Dzongkha"                     1'
  'el           "Greek"                        1'
  'en-GB        "English (GB)"                 1'
  'en-ZA        "English (ZA)"                 1'
  'eo           "Esperanto"                    1'
  'es           "Spanish"                      1'
  'et           "Estonian"                     1'
  'eu           "Basque"                       1'
  'fa           "Persian"                      0'
  'fi           "Finnish"                      1'
  'fr           "French"                       1'
  'fur          "Friulian"                     0'
  'fy           "Western Frisian"              0'
  'ga           "Irish"                        0'
  'gd           "Gaelic (Scottish)"            0'
  'gl           "Galician"                     1'
  'gu           "Gujarati"                     1'
  'gug          "Paraguayan Guaraní"           0'
  'he           "Hebrew"                       1'
  'hi           "Hindi"                        1'
  'hr           "Croatian"                     1'
  'hsb          "Upper Sorbian"                1'
  'hu           "Hungarian"                    1'
  'id           "Indonesian"                   1'
  'is           "Icelandic"                    1'
  'it           "Italian"                      1'
  'ja           "Japanese"                     1'
  'ka           "Georgian"                     1'
  'kab          "Kabyle"                       0'
  'kk           "Kazakh"                       0'
  'km           "Khmer (Cambodia)"             1'
  'kmr-Latn     "Kurdish"                      0'
  'kn           "Kannada"                      0'
  'ko           "Korean"                       1'
  'kok          "Konkani"                      0'
  'ks           "Kashmiri"                     0'
  'lb           "Luxembourgish"                0'
  'lo           "Lao"                          1'
  'lt           "Lithuanian"                   1'
  'lv           "Latvian"                      1'
  'mai          "Maithili"                     0'
  'mk           "Macedonian"                   1'
  'ml           "Malayalam"                    0'
  'mn           "Mongolian"                    0'
  'mni          "Manipuri"                     0'
  'mr           "Marathi"                      0'
  'my           "Burmese"                      0'
  'nb           "Norwegian Bokmal"             1'
  'ne           "Nepali"                       1'
  'nl           "Dutch"                        1'
  'nn           "Norwegian Nynorsk"            1'
  'nr           "Ndebele (South)"              0'
  'nso          "Northern Sotho"               0'
  'oc           "Occitan"                      0'
  'om           "Oromo"                        1'
  'or           "Oriya"                        0'
  'pa-IN        "Punjabi (India)"              0'
  'pl           "Polish"                       1'
  'pt-BR        "Portuguese (Brazil)"          1'
  'pt           "Portuguese"                   1'
  'ro           "Romanian"                     1'
  'ru           "Russian"                      1'
  'rw           "Kinyarwanda"                  0'
#  'qtz          "Weblate Localization"         1' ## search for KeyID strings in weblate and help with localization of LibreOffice
  'sa-IN        "Sanskrit (India)"             0'
  'sat          "Santali"                      0'
  'sd           "Sindhi"                       0'
  'si           "Singhalese"                   1'
  'sid          "Sidama"                       1'
  'sk           "Slovak"                       1'
  'sl           "Slovenian"                    1'
  'sq           "Albanien"                     1'
  'sr-Latn      "Serbian (Latin)"              0'
  'sr           "Serbian"                      0'
  'ss           "Swati"                        0'
  'st           "Southern Sotho"               0'
  'sv           "Swedish"                      1'
  'sw-TZ        "Swahili (Tanzania)"           0'
  'szl          "Silesian"                     0'
  'ta           "Tamil"                        1'
  'te           "Telugu"                       0'
  'tg           "Tajik"                        1'
  'th           "Thai"                         0'
  'tn           "Tswana"                       0'
  'tr           "Turkish"                      1'
  'ts           "Tsonga"                       0'
  'tt           "Tatar"                        0'
  'ug           "Uighur"                       1'
  'uk           "Ukrainian"                    1'
  'uz           "Uzbek"                        0'
  've           "Venda"                        0'
  'vec          "Venetian"                     0'
  'vi           "Vietnamese"                   1'
  'xh           "Xhosa"                        0'
  'zh-CN        "Chinese (simplified)"         1'
  'zh-TW        "Chinese (traditional)"        1'
  'zu           "Zulu"                         0'
)

#validpgpkeys=('C2839ECAD9408FBE9531C3E9F434A1EFAFEEAEA3') # "LibreOffice Build Team (CODE SIGNING KEY) <build@documentfoundation.org>"

prepare() {
  for _lang in "${_languages[@]}"; do
    declare -a "_langa=($_lang)"
    _locale="${_langa[0]}"
    _helppack="${_langa[2]}"
    _pkg=1
    if [[ ${#_build[@]} -gt 0 ]] ; then
      _pkg=0
      for (( i=0 ; $i < ${#_build[@]} ; i++ )) ; do
        if [[ "${_build[$i]}" == "${_locale}" ]] ; then
	      _pkg=1
	      break
	    fi
      done
    fi
    [[ $_pkg -eq 0 ]] && continue
  
    echo ${_locale} " unpacking..."
    cd "${srcdir}"/${_pkgnamefmt}_${_pkgver}_Linux_x86-64_rpm_langpack_${_locale}/RPMS

    # remove dictionaries if shipped - we ship them now in separate packages
    rm -vf *-dict-*.rpm || /bin/true

    for j in *.rpm
      do bsdtar -x -f $j
    done

    # the helppack rpm goes also into the langpack dir
    if (( $_helppack )); then
      bsdtar -x -f "${srcdir}"/${_pkgnamefmt}_${_pkgver}_Linux_x86-64_rpm_helppack_${_locale}/RPMS/*.rpm
    fi
  done
}

_package() {
  pkgdesc="$2 language pack for LibreOffice Dev"
  depends=("libreoffice-dev-bin>=${pkgver}")

  cd "$srcdir"/${_pkgnamefmt}_${_pkgver}_Linux_x86-64_rpm_langpack_$1/RPMS
  cp -R opt "$pkgdir"
  chown root:root -R "$pkgdir"
}

for _lang in "${_languages[@]}"; do
  declare -a "_langa=($_lang)"
  _locale="${_langa[0]}"
  _pkg=1
  if [[ ${#_build[@]} -gt 0 ]] ; then
    _pkg=0
    for (( i=0 ; $i < ${#_build[@]} ; i++ )) ; do
      if [[ "${_build[$i]}" == "${_locale}" ]] ; then
	    _pkg=1
	    break
	  fi
    done
  fi
  [[ $_pkg -eq 0 ]] && continue
  _helppack="${_langa[2]}"
  _pkgname=libreoffice-dev-${_locale,,}

  pkgname+=($_pkgname)
  source+=(${_url}/${_pkgnamefmt}_${_pkgver}_Linux_x86-64_rpm_langpack_${_locale}.tar.gz) #{,.asc})

  if (( $_helppack )); then
    source+=(${_url}/${_pkgnamefmt}_${_pkgver}_Linux_x86-64_rpm_helppack_${_locale}.tar.gz) #{,.asc})
  fi

  eval "package_${_pkgname}() {
    _package $_lang
  }"
done

sha256sums=('1e2c84d2957e7cc75f1398a509101a0a3c8b7c25d2ed60a744225f22dcabe2d6'
            'aa0f830679847a22763ac544be4ed7189c2fb2ed6a2d91f446afa5f9d92d008f'
            '0dfeb2aae89ea182ab2feaaf932a201f8b67b66972f14062d2594197d942cd73'
            '410a30993db5aafe1816f97fb6a066a1b71ab4c163a9dae49679623b86703237'
            'ef9f888b67be78cbe242b128829712c2946d64530a3692dffbe77d86fa6936fb'
            'd9560eeba1b239b000de84365cd84db1c500bc3998f58a91cd9b3a577adfa52f'
            'a57e47113fa03d3de1e5eb54339f8de9e1eb26d84a9cda53155d664e07877a04'
            'ea9b4edb332197d2670aa42ef0e5fb0a6c86bf67f25708bbef2aaadc3b2fba1e'
            '20c0c2ab56fa5e002325fe39b3af7476c18f56361b3c76a91f2d0a4c2f781f0d'
            '247638ca5af4b1ee05ba5b367b4b1483a6edb06c6cd0b93679f712ca01ca667e'
            '404792d48c314438e108a98178e5fe4a3e2e7017d8c57d44c9d84a2a64a1b9db'
            'b8a043fa3bac88fba517801ebf95656d99d94cd0f817c9546b419ef0bc542a06'
            '47538d8067073fe1d1320401926be2949508b5948998b43bc35c84fce67fcca9'
            '166dee09ad818c7b90777cd1e062869e69f8477a7000658084b00f46477138d5'
            'ee38c719c9ad690f79162190f0521a9493f21000434b39adbe3ca031594f2119'
            'bcd422685e6956d01cbf1bae4737d260550dc36dd6ec097126e0b65cb27ef88e'
            '29bbbc756edb790c2a8c2ed4b7348b5a1e224097060606bfe88f731db141c3d6'
            '9c736896ae0b01afd94a9730a07495b543107d43e2193afa5b3948d8f0d6b8e6'
            '1ba40908967797c3a2b2eaf349693a0c2afd302d21f2ecb44e4afb148e36f21a'
            'c1239109dba160ccdc4dfc078fd5db3bdcb7324587be3417af5e0110998d7823'
            '184be512c3bf9de19918cc330f76108b3260eff6c136efbc6eac9de48dc84a92'
            '6b60cfc73d225c0c7de11feafb0eebf25b45f2bab9ff677e5196daf1844c6f39'
            '3edc5236bc75ea3145860511f0cacab7e9ee78e76272340b76225884bee75790'
            '0ede8b1e4534268d0fc453e1b11355ca7b2a984bd01dabdc14e3ea5c60cffb76'
            'a7bd4c28c7155b8c8b65e6fa445d60a723c96d0e59c8183d6d62df301ab80e0b'
            '3a4db7a09dbff94937acf24bc3668a040604da86bf4fe26c61135222140a99c6'
            '61ffafc0faed624f1bb707c5fcf947d35fff3d2d3b88c8a6593f2479338761e5'
            '2c37e59880b18b413b7cba27071c034d7c889f1f8e0862275dbdb6d458d10804'
            'e7118f9b05c38cdbade0d5987798d13d7ce6ee3726d47dfcf9f367edce961bc1'
            'b2eacf0d8f9aa40bc699472266433b477df2a8f84ed5c511d8df0dcbd168cb67'
            'da6c8d36f7a010093428caf321966aff11dea16cb972bea91f84a6e9de56975e'
            '481cbfc2c3f63815d04b437c89e6d81416165fa3deabcc21afb292fea209e228'
            '340d2020fc8144d54de757d06aafeb616ea8e2ac069770092d8ee79050215c04'
            'a46b38c576eeac60e06b53f661918cba979b487de4ab84b230518eeac3aa205e'
            '5bdea7294f5ee3797fe25b25bf313cf4ce7e50f36a544ed4dca0956987945bdf'
            'dff8fbe4b4f1f0197813ca49f70c9b1a26ab5d3314bb8697081764481bca8084'
            'f23415ce70f86cf4340ae9e1ce7a472a89770b2da42f689a6fbd892d2498b444'
            '30199a66bc83c87ee699b3bf0beca878db09efe0f7541574049b7fd42c3616be'
            '5c2ed85ccf2d088a3cc79d1649d2e58e4ae3f8f04798923906bfcc418279e3e6'
            'fa6019029950b8a50f1fb7cb606b2aad00a68c2757cd00932d860f7daccee172'
            '9d1292a7e33b92bf60868699d500faea4cf2de5c461f2374ea14c823ebe2eac8'
            'f4bb7f8db3f05a0c634eaacd44a35788d77cc624d55ecaaa4776ef6234c67b84'
            '193082f0898fd0d118b7fdc8c41242e95d835fd1e36569e92631e0442ec9134f'
            'd176d0b8fe9180ab7af25b9f1d3f9c6e0d9610f7333c9a571adcfc48507e871e'
            '4672f131f123c564b85ac6b93e1f7ddea103dd21732d85ea640fedd227732393'
            'dc14b8018d3a3a2d04254f70ddae02acec827dcd7d0cd00423ba96035eece2fa'
            '078344e63248662c04538e000b59b4065f3ebdd4a85947ae23306aa38a701bd3'
            '684e2ec3ba729c93392165632b9ac3b8a4b1fc758c6a08b4ffebaa9bbe2e01b4'
            '747ed682aace0e331aca3bb170b5b57dddfbd828c7d9ef5bf54b367643d6c62c'
            'c464224b7db7fcbe992865bea32c0aa5dc3318e5c31b73679909ec0117a96b5c'
            '94df1ab52579d5d89f36bd5500f4dfbd46773123a5bbbfb385a547bc28b3f8db'
            '6cc86785893acb8f2506c5418fc77bc9bd57c890713f4df27de005a7f84b4ee5'
            '6e5e31ca3894f99b325c21ae29fa6ed85fa1c3ef05c93e072c7d649f36e9511b'
            'bd515a7b19ff0e04042e646c71b0b6da14753385d22ae9dad6e0fc76efde31f2'
            '16095f178e1413c6008ffffc4d9390dc5cfb076de12062fa7c9a3f08ce7b6b1f'
            '0caa0185345d26efa7eceee1008c2c994d82d60cc37accf844451ccf784c831b'
            '22abc1cfa6bb4ee23a5a19f3eee60160440a4bfd0eb544f5f90f4dabb1ed94d9'
            'f149c20432a496b1e2b243d6c7a55f3391091e9e91bccadf5a82791d38806eec'
            '793c5de4364abcd33aa166a7b91ddf7aa11c22084fce3fa58e6dfa7e18d6fb0c'
            'f6330dc2c403c007ff90190bd1ccc7b8be38146929f79e0aed3c49b9b86021fa'
            '52af5d30d2fe996099f89337df0247f8e67b5a1b4088219f5288187a54f4f37a'
            'c47f190617552c0056ee209b96ddf9a10e53ff0320b29dd46970b925527dbd29'
            '047ca15413114d119698f964134822dac72e6d1d7972cdb0ebd38dcc9fc0c0d4'
            'b0e18321a8182ab316be49c703bc8bb40f6023f6237a5c935bf6d9ee9967a678'
            'f190dbcd7edc55efb4fde8dafe96aab8f7289afb9f92b01767fcc8da9c5ad267'
            'ced7b25b3ed468b5a3039d13ad047e68ddeead1095cf0c9588f6dbd79cdd9dee'
            'd9a573d57a2890d44751cf773269adc03ffc2a9382e0cc9d622361cfa6cd07a1'
            '5c8dab018675b281828a49a2995b91fc346f8b60747195556a4a2b7f169a99aa'
            '5729c886270e4da3679537bb725040fabae60c51382e5c194a99f8fa1069021f'
            '2330701d64f5f2c053131fabf6b2fff716c907277366f5e2b5c4448affa79795'
            '2f3953230438fc3958bf00c4f23d9c3fe133bda0bda54b0d74844264a9b5999b'
            '7d26234ca785494b42d34dee488825486c68951e368e84c57971702dc585583d'
            '1d53900232443a2a4123f9885c5455a6b4aeb08a87389d3cf6f06e8428b519d4'
            '93c35c4c9d1d48eb249837ee804dd78826fd91538dc900695b8d5d85d966539b'
            '667e3fbc7de727f4f57f7194402b59b99dea924599bd6b57899a52d8098342a3'
            '09f0b97d2be9a6a22f1fe8dd50a0138d782385559182196cd0a18c9becee791f'
            '04b41c557948456f27faddc4df94b2751a31959f998acd4ba68e757a57d29f55'
            '2b2c119529c01e8dd3c7bb6a61831eafc6a3af0d94a328fbbe3684cd74f0b684'
            '04fb3c15a04adc6822f34fe091c6fbdaf31d148a51804812943f584503288459'
            '7716b1c90331865a50c0205dc551237df8fee5c1ed4171091497ae4c9af3e3b1'
            '28cf7aaf4d71611e1007a824d6c6c2611814101f5c78e0414b7304558dd36322'
            'f5f077feaeb51d327188afc5e38d459ae66b93dbcb1e55e79097669c90265057'
            '2f2e70f0e27521ed08a9ee420d64d179a967cc09df86796df0716c46638ba44b'
            '6e3c85d3862c3f7cbd8a9f7c3d448a65c21c5e764f1711393d364227fc7316cf'
            '421f57bd47110b2fcd2657a99978cebe7807d6091ba325b18e4792809d54bc27'
            'a28118a71905199abe0ec84d8a22c7cd787bfc2d205b5216ff4cb3f92709b9c5'
            '4ea109fbd7f3d7116f31a34f1ab9e572e7dab3bdac766cb167657ef250da4f7e'
            'da5e729a433c25b8459408b4d9d5c0bb9eea688a2efd99da9effeb7ca0d30459'
            '1a158b249ffc60d336d7e3ca67ff2f453067f9719374f2d4197a5d084885924d'
            '179dc2434014c620621543027f4bf3711f29a3abde1c4683f16ac6f9cdd08350'
            'b66225c35f94b50c5c22c295d8f6941c55b95e073433337f2cd9a68849d222c9'
            'a65af6452ae5fce1dbeb594c1171898a3f3e764df2b7ebc81eabd5c86f1610e0'
            '443104efd9992ef25802aeab8fad62dda46718993cd5132089d21debe9b9e0fa'
            'f6d24e9cc942f8d0f1cbda4cae8ac7e1fce79ad676a021854c931a47d2cc8a29'
            '0b84a5307449cc5a5ec0ca2d0fe091142dace6692dd6b662845a613ec171e1eb'
            'f498cec85bfc2ad625f59e57e7cadfe6f2b0d093cabcea609c71a95705f65e36'
            '08139bc9b700ac7d701af29414ceb7bffcd2723d2179406612184fa48ee74fc6'
            '99bf03f0a830360c03995b5ce2b6f5e27e820b2b4e25656403f9c576cb191f24'
            '2dfb7defa79e3aa1b6a2c1bc545b30df7dfce490d67b2953b3f890fc8982cae7'
            '1c36321ef5188b7dec0cdda293a47018d17e69253b18b0bd7fe07d8749ff740c'
            'bf2795e66a8ce4623af5f8a09cd071982a1921550d411cdcd7422c04fc896f01'
            'ee3f77b0ac9b7556d091a83ea587ef7b4c4491fca4c8847b404f7bc79ec47f52'
            'bc2be9e763ba8288645e4dfc38071d9547b556068340683a441fede99bda8a9e'
            '8270b8c3a2b940ce4f5927e7a1c8706bc03e46a56092ea8305df43e851605de5'
            '5af6007b6fc7119c74698902048283e3907ae1d11644e30eae1b55eb32eadf99'
            'db1fffc94fdd26a9325268b9a62755cd63ed5a0850c30722b68e3249d5b09de0'
            '302bbdced0ca19396573749c60a85c2a6aacb014bfa505386fabd4f99fd573dc'
            'd78cb142f3d4b39b0210672944813ca4aa578d8c3468f6a26b014fa76761c32c'
            'bfef5ad206a8cd93602c921d91011e3749fed929254849a096f631bbc8febbe6'
            '9f1169d2d4b9feb43a305131439f9fd28274290f78533158434d1d20532a8bcc'
            '23f7e34f62e5f893dcce02a0f05b03ece5f599f75af1dcf08490ba958b52fddd'
            'b30bad75856e392aaa97363f8df530ae2f49a4947f0638f3c3e75294ac5f300c'
            '61ecb96031bb1bca0cc6d7d6126edcac2cc6a6e3efb289b86e15f17ad623a8f2'
            '14da5c80f71abff3acb9048ae659c79fea2d81dbb1955b3c2c8668ff886d918c'
            '68c9d8012e32b08341242b3dbb869aaadcb2e2b12a246f5314a217827c1210fe'
            'a74f511f352bcccefa036664959107cc8effbc8016498a82f7e3b6d75f8dc914'
            'b4c2c8fde5b4a208c8fcc1657cfe46458ae1db3144be9fea0068b12451f5e6f0'
            '5c1da00ce92718e942953d0410ae47311798a31d91775045723ed7e7245a217d'
            'c188308d2604100e49734abdd05d6aa7b72243af773340f8d7b39917d3729cb6'
            '1d44994b545bbfdec2c8b070d3879c3e568a93592fb64636aedf37b454ebad85'
            '01c941aafd6b397d28e36d3f82bfda683984aed6311c2b2b288808098838b70a'
            '959b7c657cec4a74aa8c7a6b81fa074128c5bc0fa4a66df4d2cc3f3642070c67'
            '09a859d33397785de967666235ae9a8b2fcdcdfd6d6817312eb69177b6c9f54a'
            'c1bc2878c9c0b7ebcb0980e011b726ba0938c5f124beaad2f1ce219f58f1792e'
            'd4495f6b20e7291d93d35c5c10ca1e80204a27bda76425e5e6f9cba3b05945ec'
            '4715f792b2ef31017aa6cb36be99a58426d656f8e8bcc2e8d597555ed2dae049'
            'd6d05b0ae25a3d71c4fabdb33caa9e28f401e2f5ec9fcad713187de13584814e'
            '8ac57eecaae46ff63b5fa848f7b9f4d5c5c71b48af4536874056184ca46a39e3'
            '4284343969c3b567798fc922c5354fcfa1c06d6e178fc2316e83e99400d5f8ae'
            '2202b4417fe984bc719c64c1e9d1490a5ab2a5ff1928b53d720bdcb991e7c1a2'
            '11ad85ffd21e5a0de5e85246c60152efdac0c4613e653b7e2ff1a4882359eced'
            '392973f0433602aa3308ddfc03af616b53dbf71a86289a13ef2b1b14e622c815'
            '3654b1b7a711870bee69ab9da463f77c35df16b3af6bbfddb3e74603fb33bfcd'
            '68a8415fd900307cf2caaabfc24787fd5f245fd5daa63e5a0e1e33f8632829d1'
            'bee480492ae71aa2733723937ca757c4affca42f44e865c742c881feb94f8f91'
            'b951223139c8672950af362722f74f7b9d5b0f2cc779367d53e02f50ca1ff96a'
            '252d9b1c5f8802632f671d0cb183c1234b27dce27edcf06556f9942cd3d40fca'
            '907b02fbe802a89aae0626d8c68271935355a218451663e071d3adcef198f027'
            '2f1ac62fe24b3af5903ee39cf0ba5ba473cdf43ad038dd329906af5004fe56b8'
            '77b1733c813959a06efbdf486e3031bccab2b1a42fdd311d62fcb3fd9df890f2'
            '41ff1dca54902fae54a45361d816b7bacfef081858f093d34d942a2de9efd1c9'
            'a6c4ebf2292a33b90de710643aa430b44fa7152d4f0057a7aebbf22aafd18be5'
            '7f979147a5bd2f8ebd9d3d0130028b9a1f4507ad3fcbbc4a6abf52d2947135b6'
            '286cc5859ef3d863ff516971b2babb439a3e22c1cc8a5cff6e3ae59a917e4299'
            '49eb784dd697550ec064f62914f4e90f2bdf452929ab24cc44b12aa610931db5'
            '213a837d84ca85a51f06a99a9f2a320c1541897c3ba9b5920edc7dd9662d1439'
            '649aa3cbf419f34f16fc1d4bee5e741411ec3e0a4705bf33b42620869fcfa712'
            '14f3e7d961cf548f2c73617e83a70f22bb753793fccbda0081693c639823bc08'
            '395bb81468490f4993fb0fb23893e42290c24718c5db8f781c16c4fb8af79f0c'
            'aefe12b4a8c83c242ca9eaac1022565e2312ac24616ebe0fda3d18f90d43ae4f'
            '8f9a2c47fd0243a612532b4a5f6d7c7abe5e584ce27ca4a933033c2a38de1b45'
            'f18d72747c75048ca0fdd8bc0f803b1bc6c1af6042faa002768995df495256ee'
            'e8a2a1b0b2b33665474e7499ca9348e7bfbcef6822b5820e80dcc89b2141cf6c'
            '376fe8e97ff528b91713aec71fdd2ccdec62a7061159a42049853b94a174338e'
            '6db2675a8bf58b039aae2ccff2b7aca218b0c48aecabadcd523aba5a77758b63'
            'd87e83f5a59ebf83dd192531de5cda89ee6fbb0b9074126f9f3ee8246662ffaf'
            'd4bed5ed7931d58e21dbbe26156166ab57af73cce61da26ff25915241018320a'
            'ea36af60dee3652c39a130ed99f32b677819d4d38f66dad65fd3bdcdd5ad2066'
            'ea3391da8183481ee0adbeb5b47c83dae8182df31d2eb158335e2bf1aad4f8d0'
            '64100e5675fa3e7862e07f3fffab19084364fd18a785adb69480ca4ee3dcaa6a'
            '26667492d86e6afdac8a2bdca4375a10b1e7c894058d4c9c306fa80cb96b6f0d'
            '2ad652842e9eaf5563ee99dda65f1b314feec4ceaf1c5562229516efbf0dd69b'
            'c47e464bd265919ce299e68fdf0c7f946b0b5222c15869f778917c59d1c4f6c2'
            '73c3e01c9d3cf3736b61076d1308f7c2558e202c9e7e80e575ce83ccf4fa53aa'
            'cd3b5138b9d5e708e05e1401d44631cffbde84bc93a5e54d5e7245029ad28a14'
            '57e74a76123c79ac7a266a04c08d53dc2c8895a5b194b969eb1a24d977e5d16f'
            '7a4e8982cfd22df0aa241ccf823d05cb1afdf9e4e3563eb96be8e26ab46b65a2'
            '956d28562e8d08f375183780f5731500e5cf3e7d384debfb308dff2e143163b0'
            '1847c3f890f8dd7615df714c942550a61e36402d53aa9f2fc2eab05af14c8367'
            'b4a4bebe79293d1a5987dff4861d61f7c0a503a270339a35ebe7d6a3e34c78fe'
            '69126b165899533dce1f5ad65f6c1b807c1bea3a1769c629db445edd5feef7f1'
            '55f6b0d0d73c79ad46cb9290d477db353c5fad2ee15af1a388eeff8d43a57385'
            '9f0e70c68e98c1fdc607f29d0d6f60c03a29fc7a9555bd23bd9978c4328ff1da'
            'ddd22dc009e7aae97581043b81e09cdf75d07b725603207dfac5673a5a82f18b'
            '9c7da2a6afa7db9f957f469512ecc5c93b8e5939789770e72d0e0d72dde80b45'
            'c13b25770765adabdef69150c526ebf5abfbaf2086c8ebf94486da7ab54fa483'
            'bf77fcf31a3df83a03e9eb524857d27e2ea601bb90618425be7dd739bacd7cc0'
            'e24141e1b32f1d4019c0e0e8091b7e693d10c31dcdbfbf71cb46899b453b436b'
            '614cec2502ac87ca3dc734fec2459859ee3cfa2ca9afda06375b8128d1f10f4f'
            '5f8b793e593d5fbce43af5806cce93ee7ad370b9e74572b554c7710949bc9aa1'
            '70dca1e4c3153a56f546133f2c70676a1e3ffee02c23e4bdf4a5bc2f03cd513f'
            '4807efe03f4290b8f1e162e1e21a447f25d150bed864ed7e6441f046a0a531fc'
            'f07169d955a4e6b95d029a6ceab444acbfd442a9bf39583741f75646bebbe68b')
