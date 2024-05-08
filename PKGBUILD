# Maintainer: twa022 <twa022 at gmail dot com>

pkgbase=libreoffice-dev-i18n

_pkgnamefmt=LibreOffice
_pkgver=24.2.3.2
pkgver=24.2.3.2
pkgrel=1
#_basever=$( cut -f1-2 -d'.' <<< ${_LOver} )

arch=('any')
url="https://www.documentfoundation.org"
license=('MPL-2.0' 'LGPL-3.0-or-later')

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

sha256sums=('75913def20bb87ba524228473a7ff11fd06d75125d6fc8736deb8b082017d7d8'
            'c4facef329243ae014f9374417cb5106d6d538d8037d423743c2d2145a5d47f5'
            'a6be7dbfc6ebfac7aa80ba9d26c792dc79241e19e344c385d91add484a346e1c'
            '6f9383a48673daff451eb2e31f52b1b0842911a9f098b7d9881eedea989dcc13'
            '608547d321adc03a60891dba8f5ddf2e8a9c342bf3633c94b71a6a1fb9f87e5d'
            '8e33b955735eb41d843bf593d367935500a26ecf2ba54124eae787783ff55053'
            '2fc71c5a0a6d7dec89e059e5d83647bed7f1b7f440500e5ca25109d75cf5c153'
            '2ab1fdc6708a35027323e409ea0bde20229f603ff79ffb78908362c696dfc463'
            '94123a496026ed7aedf7105f461637e21e093097226c10b2cb189e64571d5f9e'
            '0da3eb5970ea3b01673cf66b5fa26680351e807607de7b0f5c8c137b49f21024'
            '64a11a8f2e40bbb6aab6bfdfc952f77b4011d16c49620e13dc40f4142a8b747a'
            '1592e22ef5c1231648b493c5004e1de1f7d579591f7aac86aee91c13861f4101'
            '47508c635d166190ed02f98e6dc41a79ce5a378fe4f5a0b73e595c41b6e822e2'
            'a76537c14c02f156d095d41bf114331c7bc468542c1701862ff59cc06c3bb218'
            '27ec623385db0b0d7e66f1e502051def3cb9a80398e135ca7bfd33f00fe74a4f'
            '330e6a55938430adbe40ba23407103fde384f376dfdec225db098984e150c590'
            '94c8d08bf1669af2b7a180b7aaf78dcd4137caff51d25f2f514ffae7a93f0d4e'
            '878091d6012754dc70efa4278ee516db26feaf632ea7c45b18d987a4013d3523'
            'ba9c4c28f5d7679212b66c386e119b835c38798351eb047cc00e064889e5a953'
            '5ca57d00ae948eae49f2d929005985c11ea1ab3a5a0db72ce13b818a36420a93'
            '6d203e676a8560e53cd09326c8118288cb3f342512be056c2375c27c82703a72'
            '0c41ceb7a405cb9c5d3d789bf78f8d0059a73ab8fa9d11f77aa4a8317e97ca75'
            'ac6fad1ebb611f72bab14db92ba4ded055425d212a0848b5a491faccde4d9014'
            '92055f0dc9242e57df82b5ee0fe4fb5889d50ce4950cc8f9737a0a52a290aaa2'
            '5a394402b8c1c0b6c35451c63bd22950145fda9cf2dbebd1cc5a214d85011b66'
            'd6b015800df134dbb5286665dbe3d8186cc30d663eb436c5272f16afc3320e58'
            '293f2778fe73b08e4421f68ec6a3bf9055be2c8658e5bc46705c2dfe35fdadba'
            'df5bcc62426ddfab97d3fca15bf521f7739622561be27ea546d5b937e2830d74'
            '9d261342dd8a2bf92d175f3dca3761b49f29c987951bb183454387a36c55cd1a'
            'f04f379041a4a00b5a3ff4870dc16d3644749ee0963e0fb8270d5970a1f9e7ec'
            '8e90ff9a9d8e64f01a79bdb67fc549e0b34d3e75e09d4b104ee408851a343c17'
            'be77621f86bb8b2e392b688ebca9e8cdb84fc3caaeacad534bd3d3dd75c1ea10'
            '25e1336b804f310f5e85fc262b943bf72bab09f9fb3fc3882b603df18a1470fb'
            '6621cf99d7185d53a658ead7160fc35d886b6bde7831909d5c382603e13be394'
            '6d9447c9451731a3207bc17beb7cf931f284ae2469b30035f9d52c3186ffc1f6'
            '2a809071822119c64ad9c1b335a4f66df184363e5b24ccca5aaaedf4e2eb77fd'
            '5b7d09793e637cb4230d8e1d26a2d2a418b4e7e557f8ef2062ff28e62165a79f'
            '6adbe314112622c1bbb5dbf9b75847807735891f720f4c518fa2f23f1db38a93'
            'a89a59abf9649f1faee8d31b68250c1fd5503df68108362ea5fe09f26e6626e9'
            'cce0469da414eff26c46d564148bd0245e080c73ff464b36d8e44bcaa7debb32'
            'd98edb5226172acf393ef98877385676d5eb290dc4343b49eba8b62b15ad33da'
            '26b5ea280980535def850daf8628367d2528ea39edd748023d236d44d0ebbab0'
            '24677cabb3837dd7075f14939dfea1c1f318e904cb2fd7e011cba56c0c220a4c'
            '3a404f8398fe72a397712bfb34344f343afa6e69cba79b99aef1d807110e6f15'
            '45b6ca1ed0762bf76a3fd95233c97868e70f0334ffe64a03a4a13b7987d76e36'
            '25aa075f3c1f75953ad82e634a8e7647c14eaabb65cf0b7213bd5154fb8288c6'
            '8080b10bc8a1ab8d7600f199f8d8c29ebcf64d505badf4c8fd7030e365a84f7d'
            '5f8929ac92dc502c0e74459bdb794bb5ad407f0d3ebb65f62a20a3d3739dfe4b'
            '381b88130a5cfbe59be5f6fa628e2f83cffc827ce08bbc5c05c42edd9a9d1cd9'
            '368bf82b77b71e78e7dc3665735ad141776b8679f4d6fa14e8514f7b2ae8e00a'
            '8a802c92381375b8e4b88796fb5146850d2e1f29ff47c36e9b3a55e3d020e291'
            'bb25a6c6563a64b44784bf540519d29e42f79afdad5b32fde0dca44fe981adbd'
            '6c3746ef01e3bd8d8762a86c3cabaf3fd8f0d7df7704433f0057f2cf4955b35b'
            'd26bcb819674da1c5f5471d1f244827293a46ae36a937e053ae5d1e07ca33f61'
            '45a33afb25f7561e602245d8df295fdab9549a65114402feb324017247a95dfc'
            'a8ce4431df72a1fa98b812e7510e53099af5df3c40242596dcd8fda049a3b5a1'
            'f8b6c1de783e9cc70ab80974a13047e81d44f87ab80219d60b8bfb45d13a9adf'
            '98a674f80aec6f804db1636fe70f95e6eec45f9db3c33392373a5171ab8b9bc0'
            'f668a6c79fe807d59813afed95f792066cc3a9f2e3d020860b1d93ff1fe3a297'
            'be04c30c8430100ba8208ac38d4cbb077a70796fd9e9e950ff473d9606505f8b'
            'fb21e42604a347a04c1bb5f48f3d3b98116f09081dd441fd306debc2aeb75718'
            '86ca373fa2c117d340ac9e68ec5733b5f03bdad497f352a1284e5cea01e84bd2'
            '3877a03df63b3626c5a9c264720e367bc70403cfc30332832c083d99b0aa9658'
            '9acad4993bd8e70108e7443794d5c6038b0d09bf9506a0d71ed77d8896de582c'
            '301188ffc1a0367859abfe10cd6a2a721a74c45106a3207d692caf1150afddcb'
            '059acc1bbf36adb01d96cc14cf9c5677d8eb0191b59d953db3cf65b4ae4ec540'
            '40186c2472d6be0bd567e66cd20b9e19df81ac856e9b4ea7a0456a3603b7b145'
            'fd4c668336eba20f09f91d7935264f7fe1953cb60b67229c4b72020cce391525'
            'e8acaa1386f9a78bd13a0f4d8406ce36c47464553e392038694d9dfdb4d7f2ad'
            '39bd8562001a4e6e239ee1d7f8c90511346f4b66ec9726cd2a38f69dfb097469'
            '2d46e97b4b9078a1846df7957b79a6b3cb73cfb2f89373fcc1f4e3d5356c3338'
            'f1f10351370468b910d45fcddd77a388c15bb337c6bd243592a3099656546dcd'
            'a040a61796e5e7a983b483d0a931c6c7d1d7c718df1c7190de8084bf3a2e3efe'
            'b91f8bbd8940cb2ce482d6483b385f5ecbdee530f35f84a3a9a04a628e285de1'
            '74af7de1acbdf83125c0f50196a5fe6aee46e6e278e0d6b2bc318e6e5d0e8e84'
            '9b1aceb5ec7da14d34da0857bbf9a47aa9760942ccac3f7a049f180d6ad0a332'
            '88dbfb481c9d801b193cfd646de3329235cb346cae7d567afad3b29b92b23654'
            'e4135cda4fb52b98181dda75b9499866852dc20ebce0f6bfc06d0cfc114adfe2'
            '83d6ab2767e0cc4e3683a1ab887b089f3e762ab92591c24993212b1dee5dd0ac'
            '4188545c54a66d77ad176032f2e8e80172fe822d93e9b0f2a43a5151fc13e354'
            'd8f63ceb540524112cf1003287955d4e3694878f055ef4ba303f49b11510a837'
            '7f933edf63d8b389599775d9422112c1233ff6b83399302ba59ec763ff9262be'
            '7f705ad09eec631e2f88ad437b3e3ba638eafe8a671de073bf5b4d9bc81cc586'
            'd868fa678f7bb3b13c01d0715b493c873eed62e647334a5912592a123352d984'
            '677dfd022ce8d27aed457b213bd34e5ab19a76900025977bdb155ef6188fac53'
            '443881adceb084df7fdc31d36b5a525f621e246bb9d302cf832d4bc6260cdbdb'
            'c0f532d9cb0198c2fa2730e705e0c5ce60d9ae2bc61cf4d09fa6efb8895d96bf'
            'aff6bbda9bd6df99ee28ea93112337ae4f5e4eb22320600a5b65c30d7e9f8115'
            '622f490cd5c325ec27cc5cf48c57a3ce9173e63b420e49947b311deb42062981'
            'c909fdc9dea6ef043eaa6e1bae5aff93868aefd9dda6fa198f347c73b57c2df3'
            'ff68250a9cff02dd9bcebc406abed62f9dc332bb1c9187889bd0e5275ef759c3'
            'f54bcce601ececa359d3a9cdec1c0a77287ea97ca71d2879e4898247d4b7de4b'
            '31378b022fca0202818fdee9929e438fb12cdeed117cc1a6e360910d3f3dcc91'
            'a302f5029b4b2893f0ceb02e31f45c46686516e14538e673901ad87b2377e5df'
            '6c3d0c164d2eb6e83e0327d035d999c1825723f15b7d0747cb5b564af6072e4d'
            '4d9173d8b08aebe333c09865a5e78c3ea48882310b9ffe7d32cb477070df8d6c'
            '191497dc11130e8f77652168271f9bf9851ff06b5d853208b4eaecf58a80cb11'
            '0965a5b8b39daaf37be1cfa2496ccaf4c05b5848c8c646e4415face91177d2a8'
            '11eb76763db885eafc9c5fded7dd3a02ad6a92277d0af1e30c84b91271106945'
            'eaf5feb3a7e16bd020f2746b1fef60048829a73d4181381d58090036aa9332c6'
            '638e7736d9f024c9c8049cdaa98fab6bde2544328bf633ab25e32ef4bb5c0efd'
            '3ad4c47b27d0a307b5385a7749438d1d0a4fe83e02cbeedcbd5353fe47409898'
            '0a6417944bbaefd234d037e2f488d15a8785fa5795bd59aef9334ddaedc6c88a'
            'd811bc971112426517f06755151c4b086fe2ecea624fc2d7fb51b5ba4d4f6f4d'
            'caa6243f9a016d6588ad9b192e3a4ca6d0264c6b72726fbc9514cb3b189c4d60'
            'b65aac347e527d515a8edd4e3aea5bc618420cfc5a42a111f2e9edfba0e4b061'
            '7cca703dd0500a4664d0f730e2331cdb76dee59058a62304d468289a66fc45cf'
            '6c81facde9ee25a68da39fa8b11911c55ec0982fdcb087e39833fe8efdae56cf'
            'b20e676504e077b864a8b5c7fda0872b50d767bc10f4060996e3a7a6e83badcb'
            '4b0e285732ff6d40afea69c90848659fa0309e6e6ce39eba9ef0f9e63d76554f'
            '821a2792f630a287e6fa43183cf78af37bc2455248708acec3349d0fc3e8fa00'
            '85eff94bd5fa695a9cd2438cbddb50ec1adb67c0fd0f9148cac7ddb3b63ce834'
            '74a6512b6a93e54cace1802b17dd40452734e06b57d6e0801563c5a71d65b751'
            'f5c4549b5a88f52541b5f35a6ba5febd436337d0a9025e372209a1bb19056759'
            '18199ba8d771a824bd5442434706c4d122df16e2d2334e0d2ac112fab33d3a4d'
            'd924732de4df76c80583db6f6e288c5be79287e7f5c024faf261211b0e9ff568'
            '9f380bf965069c0b727b45845695e2b21dcf728bc1068ebe248176186a9a0a57'
            '680e33c26b7675c5d62ce9f45f5c0e50c9962736144ddd921d8cf8f2ec42ed6d'
            'ce94166780bf5ac7b5d76c9c6be849e5e1443d40655965f02cb4ac24f625ea01'
            '206298e1a40c9f6c1f19a1815957346b0baf7ceec0fdc0c1aa37c3b15fc8e477'
            '5957aa1bc000b560e84e74fd0466222563a3fce0553bc852583c1d0b5ad1f4a7'
            '38d877e7c3e2b7597f1fa47d843060779f3299b08f89de7eece27def00b61832'
            '21d22496a7995290600fc1324affb2980258040d470e8790c830bda6a09f2c3c'
            'c36424ba0f255b6c53b2b00d6d695e9b106a692e733f10979e9fe13a4ae2af57'
            '4d279e2cba5698600cff5501ab12d177f3a67b907e065ed6de3c05c39ba9c1f8'
            '649b7b748848c5a643d6f030c9c9c08cad2628a236f704170ed418f5a0533a6e'
            'f552e43029dfb7a53779ee2196672ee5882419b94a853197260a960c41982441'
            '8ef52fcd14aeeb60f2b2443c9f06822c135fcf0e29b5f411fa1f1477e93090de'
            '566cf0bd0ebae549a7f74a9fa7331e95b3255a825dfec222f84b2a4e2feb29b4'
            '107a8c47c903f68ff1cb222adb1afbf8f234782e7fe7fe7f5578dcd0cdb6f815'
            'd1baf1d36f7d0f77be348929d230054fade35f0e09685c78b72c64cb9a1b0b90'
            '39e54b8936f831a25226bdaa02e4051bd9cb5f1425f5d504d90f2d45070ff70a'
            'bf2a0868887f1c79489daf9074fb3552a020652af12ee5f23a2fd12b61da1a6d'
            '04efdc95b7044d6e04a85fbc0a70fae11e441f50db6e4deee954fe436e69f5b1'
            'b79fd6f8de58bae749a87d1782289b6d37ac22ff0f7d455f0b6618c6f6a26d17'
            '6435e15e0bcecca5f43091c420a6bedc47692cc3cd6d2c0e9f557cafec5f4795'
            '8cca06145ab51dda48af34758a3f02765b7867126d5e0be295d32a48a8fbae13'
            '509bd93fe2dbb56cd9f4d2c4e5eb1cf4aef37d20b7dedc4acf4f208d48556b82'
            '8750b80f67839ba7d358817689f3b56321e6098402aa4dd42d759bba93a85b97'
            '5752940b64e58c138dc278c53a36ffaca5240b523b4d3199347efbb9986a66b3'
            'ac27d700b230e38657eb16c5692f129af93bcd2eec7aeb28c795f95d61934013'
            '1db90c87b33298708f0e3baf4e2eabb45c6bd13ae957e8c5072f9cb536c8adf1'
            'ced80b7f2b4477ff22503174d7b63f1a1098d7df08a6561a98193beadc326a9e'
            '9f921d3958fff8a884e803637fc7131e31ff8e7bd61b30fadb461f0949d2829d'
            '12a071da7ac30b760567098d8c020562a35c5b192551668b541bfa79decfc732'
            'c00e0a088f53aa2329a5129b6843d8e0bbfa091ab54b745c7d878913c274329d'
            '05a937ad482e58bdfe60f4c33f2441838de661ea66f05dccfb04632f902d0d1c'
            'd85726e0af83ffc0e4126d4a20c21fcde0a30bdff3f9b197cd76b54b2cb07238'
            '37464683258c5e391d6b464334d996b6cf7b1a72fe10a76c389e698af204f75d'
            'f8d469a45996c4292f137ad84656025bb695934c50155efd26fc0501d2db0a56'
            '2e26933b925cd99914d7dd71f81588467b806fadf84222185e1e226c9b8ac539'
            'e79b573190d98acd621f3f36bc32b3b3d530d1a76d6aff7ec0c4f9be1a43a350'
            'f2a3ee243e8510cf9a73f74be0116655c54eb098549f4f7bded76f1f562a3a73'
            '0333dfdcaeb0bd1239098edbeac88adc814161c38c8d70fe9423ecdd58b37a79'
            '4545d851b41bb31e2bb4190fbe51053c8e8cbb97a4702aa0deb34bd04bc23466'
            'd9a9aedf751b750f0a042260d2cb041f465d74567e6d97944a7af16b5afe9275'
            '501d0e034a588b0f923037ed140aec05f811f0588cf04b07c87841b111ecfa79'
            '439421ba29f41f4720019f8c6d9ce0a18f2e7bd52036e249677ebab0ed3bd008'
            '149a3360159113c0566379ee96852d9d9b078fae688d52cc0081499a6f0a8658'
            '5c0d4f3d3405bc213d47464f2957ea8e443fc8d8fab6d5a07e44b86711e2e6bf'
            'e3ed580eed15d00be2d6dff7799d4086677d9505d243dcb50e8651f5823da357'
            'b2030396fcd08ee168b5a0833a19ebe2eaf102759e1050719228bf725a969bbf'
            'cb92992073e340fbb807a30cc00806254c97f21f24637b45648fd512699ba967'
            '5cdcd77e83fa49bd3139fbea371cc614334d39866667f45c6ebcf124bfd140b4'
            'af9b78698ecdafeb91c57eb156d988bef3828200aaa1fb386f1b93da9e16903e'
            '0a81506104dd141be1711b5215a0de54dc563bc751fd25a700b1568e24cee085'
            '8074ed903783b4b7fed9d47d23e81567a64ae4707f9c9321e66b1ee6d57aef84'
            'fa326b6541aa041d40db6909a2342169c6faafcc0fb7600a1cef9bc441661e2a'
            'c8739e3a54c93756eb1bb15fa530eb5681e4a9b8f339c413bd65fe146604c848'
            '15abea63c5cb759a076b10d29c5935bfe3f682929d1cba70bb64fc6877143489'
            '4f2ea31bf321f7a102a919851bb963c0221b96dee8588c3d4104c5d7fbd1e8e5'
            'e77a4a396d7f9e1df5bd85c270769a5751f17066edee3423b40c400dc8a64473'
            '5aaa91bef88167b6a670e0cee018e10dd3a667c612aa54f2e3a50ceb3f287c80'
            '91a7ebaf65d71419c1e21ccad743ac7e2608a6bca0879c295121341de7edfded'
            'fc2c05d17676b179c485b295614e8355a876dd62062911f07c67a946f7308797'
            '9a8602b9874e11031c2e01108f92ce7cc7514582a4156a47b6a2afd62a945c0d'
            'e718ba475517548acce33df639e591467d56c398e1347d4bad6b242b84faf8b6'
            '20c0b1ba4a1cc74925470346cf8fbedbab2a2912ad69ae3a3e13427a6ae1781d'
            '713134fe84afbca72a8ee3ddf94191be7fe778e940578e095eeea4f6b13f2319'
            '5014225e2eb36ec2d4821d3bd28e40726fec2e8d9624941f44896656205fe55f'
            'b3707b08015c6692e167b33f81ab12a358e0f6a459f69c00d3840bff85ca303f'
            '71db8987d320c74956c3a03929d684e4048a07eaf4997db6ce65eb6265852299'
            '6547dc8e269c9f7bafea2c4379a868b567649a76629184513355c48b08a26d0e')
