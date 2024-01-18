# Maintainer: twa022 <twa022 at gmail dot com>

pkgbase=libreoffice-dev-i18n

_pkgnamefmt=LibreOffice
_pkgver=24.2.0.2
pkgver=24.2.0.2
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

sha256sums=('71b1f448197bc10fbe76804eaa2501e5232967e79e3a42af8aad039219c5e1a5'
            '79004e35f0d2c8dbda3c5322b405bce79abe2fe2040e9333cb652443cef239d0'
            '9b785a0adab9619a43c897e6393e643053675759150395c2406bf8a36e4793da'
            '5cf21a95a1edcb0fa5cc3ed01f70d1b67b85c1763283b60d080e9742c9a366d9'
            '8c4a6789e2f675a173f12d6669ca3a542b128d6a216b084032fdb071af6dad0e'
            'a2b1dd8855612557ac1f43b310d4cec47eb2e550646a549732165014c4e9d19c'
            'e7dbd1af3ebeff80b7345f9df94e0b36de3ff2e116fbe0e45ef8826cde4a0e12'
            '8a0fc0cdec9a1c803bfba2eb97fe7b91cf637e865325fa318ef167daa3d5bd6e'
            '0b4b38262d221945db7ecfef765c52663ac716699f2f3eba7ac797a56d14140a'
            '6b141fd298d8bc0f718800dc96d804716e0c32f23c16b877efa0e95a704ee5f7'
            'f195a9a84096d64b9d9a6fe4e5c83d4d524ce5f4cd3e9fa89725185861f4c6a9'
            'a0e5494f93cf08f04471afb724433c3a303063270e6571e22e9ddeb9d9cb7127'
            '64c09629d37206f9b2c6e8e23e5454132e32aefe7595ab1b9ad4216d7fc44c42'
            'ed9a04ea1c614a440ddc4aba126a117f33c0dda8637fda56885c1c112cc4913e'
            '741fa282bca88026349f2d44af16d8d6ef877043e289a30073e1aa6aad0823d3'
            'a8374a3cdb4f556db8fc8b8f99f5f392eca45d13c2f6b0269f3be96962d94493'
            'a17ef31176f2d695cfac386b9fd4ee03882edee9b91c18c1f4be39be0937ba71'
            '3e9c436a986069a36b6319f633df0d3bef7f4770c9e85e685b755b43e2c9ecf9'
            '740ca940e72849d4b3d5c0e9e1bd7fa62e31b62ce5f29cfcfbbc9fcd973be6e3'
            '5b0027db6e5b8f0e66929dc70dccfd236623e95a12eb887d51af2d3437c421a7'
            'cd5eb2c82ef44d909d0dfa39a016af0878ee8ef410c5a2e1b4064a51af958b37'
            '0de90e194b6118fbc43b8343e475ee8bee24843a845036d7e60874fab5e755b2'
            'a6f4704d379607c608ce300ba67b35ac7d9feb06b2fdf944eb35d1913c9d784f'
            '86c649865fb1fa21f2eb051dfd101ad546d3578438df19b863f4f15b921e1030'
            '7f30305824e7f4e67099f4e9916bd4c004a9ecbea9c48175fcdedb04e3e1e7b5'
            '85893b254a0e1e0f61688f932c5433297f5e245945deeacf39625edab4efadd6'
            'd7908e28baba4e3b679b322d16613b25cca4f4c6e6d2f92323d06cb0b1d8a8a6'
            '3fec1ff557c7428728a84984b9e8c7161a3dc3a9e0c0ddd6a1234ee484b5a006'
            'b6d7fbea542e8c2c8af09c14102e625d93d707e455f6b6d4a7a73aea9170e7c5'
            '00cc6cce726850ed86dd080499fd5f431f695cede7ce3514a9b5fb460f1e2342'
            '72353d8e216dd41cb18360220b444f95bf2dfdfabe7f8e2e7e67539229ade035'
            'ccd2a7b62f383cb36e1a7afeaef4464f7ba9191b4ad812350f3ae76bae0bd558'
            'f29ca00966c4e00becbd8b274f2562072173949b13ae7337e6f34dd7c756fe92'
            '25d4a44f638d90bfca3905f6d77dd4c9e553b2e6048066d31f0e551af5546b75'
            '286007e38e7c4191aa45394df3cfc620f61d4b2116dca8983416e91a64138351'
            '4549eb70aa87a0fca95ecab7f49528e3e022111b90ad69cdf034a9beb3b37925'
            'f349d99b94e22d89364437d859ffb9078a900aff8409a8b05bf0cfbf003515db'
            'b7db23b9b8ddf54c2769d32510e404796ca3f3bf7101b395772984c4efcd4d72'
            '320c7282c0fd51bcd1d269aba1faa13ce246c3c4b993f04c5a16e800ba8717be'
            'a335f12a1dac7baec965c40abdb03df17e32737280c6c20e4ae95a5abe38136f'
            '2d8a03d1be2ff4ff881eb3a620b9e6dba1be06d44b10b95f7d159f9679d55474'
            'cb420da6dd6d37ed0a882c22657f85d88a403c5fecab342fa98b35b0bf5fc7e7'
            'fd8d6f183bf4e20179642cd3fc2bd7af325294b2474018b0fc066ec2c4345a90'
            '2af4c7279a9e261664fa2eeba0d7919e33523a36c8e17e8e9f29e50bb2422083'
            '723d8005ae1023cc49b4d43375e49df248801bd5087e897c0ba0751d5d6ee78c'
            'bddeaacee100bf479ddbe1632ab684a28af45277959fd4558f82fef3c0fa0adc'
            'aa3c8e1c43a9fff1624102755b6f42e0605c1feb1693861d94fe35ee04dccdf4'
            '054b67a7c1f71b5fe657fc12ee4c1efa53589a1ae61d9f691ab476474636abb9'
            '73b2c5ceff4c18c61151a6aacab5a8afed8a5538668375696e3f8eec06bb6ae4'
            '732c815ae237aaa5b5b16a3ebcf6ccd135fa91e414bdc1351a0abec6791a4e7b'
            '13e3e9661bbfa8c61b9e60d677096ac50b3ea11fce4edeac679640971c863241'
            '6656df76e66fa4876e8c745057151a957a8806fd3349ed0d5e7fd448af9f65ee'
            '673450cfb22ed7d4412e96804279a240786e810e8fa9c678bc90e90afd12cf6a'
            'c817641de51f45658df9db85f3a958c25d8f91c03a546e90866d9791f057a3d0'
            'd0af8e202110ed852e290efcfbba28089199299610c54cfeaaea02df52b1185a'
            '217fdde59a1fe347f5d448203c0fa80f19376a7f4de754d7b437c13069a6e86a'
            'c14ae41cff3b77a3d2f48c7d36f21b1db1bb4139a0e94e49235ce761a0ce44ce'
            '1905c4200ac77698f1d9da968f4de94820c18dc19e07185f12c05b46d2e4e8ad'
            'ef8b71363a079e8dc72f216e0f2bc5b3292b1a41f9107a423428e1540fd3e9d6'
            'e11f59dd1ba7f9ca048169726f9de60077165d4773db45296b27ffea22cd4587'
            '68ba1417be60c3d2d6b912ace60f803c614951d67c0151e83b54eb326f3420d3'
            'd07aad1e8a06cd7f374f7b8fcf0f03a77c2482136a62e466ecdda789ebbbcee2'
            '33a60afce6e2a6940924964325a66fa2f0aecfa063a6adc7b5c7afcc7bdec4f3'
            '2b123999fd8aa402e7074624bdfadc9cd391d19018c8743b91b70a1ee670d32d'
            'c029733d6bf696f06e206f97ad2613244e3a6a6bb33d8bbd157138f1fde53e85'
            '76f55f807c0eb73dd83efa0a657a8e28761afa051c3b56eb714e0cc6333ac966'
            'fd37c32107be15c15a1b84c9c36286ef6163d1e58dffeb79d6c30bdaa471a304'
            'f187f2ea4d9df8a81ff85976fabce65a33a2ec0b13ed0c4449914f0bc0c39736'
            'acdd83f5b196d6dfa84bc799e56555c32901e3030215114fc34eb9e297789aa4'
            '1b22fdfce51c812363100fc981e228106315962ba78dd4cd8146d4907b84a65a'
            '2515cbcb5727cdc9e746f918085b0db8ceb9b41f6fadabf9a9fdc3f5239206f3'
            '33c14b58b112f30386bda38c132c956e8a4ad8678e39c174647720b16ef9deca'
            '6693d685ea886f4247a5ef520514287da5ae72afc57b7561be8594f55bfda7c2'
            '91e8ff64f232a1cbaec899049ebacc67c2953960ab6fe1f0a6c30a56ed1a7737'
            '9ae8993121fd1e9ea2d9c679ebd4a35a7aa483a7671dd9816e77f3041a0e6033'
            'f3c4b387f06b3f6fa48494093466908e0ac82cd752088290e68a513a93753752'
            '29db67d077a2f263de33369fc4dd1c43e52671b45f535ca01bd98375cce535f8'
            'c5e4857fcc69779d2b9781b7b1ff6a2b45c5cc95899634916370eb2f046b8c7c'
            '5b06a77b77b5027fc48370393244d4ded197bfc8ca25e29a80869fc1bd3b070d'
            '5a6df3a5172cfac166dca79a58363b5814092728f40da8b14ffa089b7220ddf9'
            'b5744dff6521ad0e821b4934a64fce12c4503c28bec9a72740dbaa3bd2ac5bb2'
            '276bf71eae1dbe7ba95a00a64ff8a30edfe1eb754c8ac5292e6ea8daaba7bf0b'
            '2e01081760e6aa16b47d92a63b8e657c1b9376978a0d0739f670f2907be70875'
            'a363ed6d6c0c9908eb1f27b98285c519c718374795a88d698186cdb7c7b02b83'
            '50d4f15f9b6392d3ae487c2914616938a09582a1e4a872669892d77c0e7c9d7e'
            '77ed96566565ca1a2ed9e3d54eb51b57748ee780cac10d7556e07bff685f4e94'
            '18fa3251e1ec997739bc9b3c295836bb78c8d7ff3c45c1cbbb6a79a558264c97'
            'e80356348bff7159e0ef56ac4db3ac360c422d49addbabe13fd0ae2adf489aa4'
            '1c9d09bcd9011dcd89429803c48ea31d921bc991fe7dc8225695abba9217fe48'
            'dedb61bbade4f7c18468d9f851379623d59d5354689a4a2d11bba39798c02ad7'
            'e2cbee3428cfed7ba2a66fc04f8be37fe825160a467ed14d953764ff54546a62'
            '8ce242de83c887cea39a9ebf443eda8e4347b397fa343af1fdd3720d7078a880'
            'cad26835386b138502085aa39d41992d3028ef6a0494203d0bcf8926b4d426e2'
            '56f3fcba1ed206b1e7eb83d9fa9c5012af9bfaa654a13901faf9f0d3d342a31a'
            '775d98941463a4f711c861e64d41e9f015a94f356d4c75586223f2b06222c7aa'
            'a3c9bef363505a8cabce99629391e3f4a39928492f1527d738dbb605e43cb28e'
            'eb5917b4f26dac7f64ac5c470cb946fdc93936d482756635b7d1d70492a9f255'
            'ea522c9ffebef8d07021a5c9574dab7c403c68e4798f459943b1cf9ab79ea788'
            '671ba62a3e521ae1e38aa03df0e6772b8ad609d8e8aac35d40c4854331ddf747'
            '1e4a3cdbe1ca482012766f5c493c380be87598430f6da1800ce8e62c54086b18'
            'becf03f01978bbabcbc7958a750aa4abcedb09d6f65807d9687005134de2df09'
            '4fbd9cc4ec728416ca163d1e5cbf2e21f0681e09f82bb38476c297cdab4e0134'
            '92054d690e5fa3014223e8a68aabf59b7ef5935c66cde823f8c722d2ca5778cb'
            'f43f6730a9e55d605577973acc25642d69d4ae527cc309ea88dd325a9f3247bb'
            '1acf28059e6c123096916c67cdb26c929dbdc80b14c816dea8c08c52064c6a7f'
            'b7fd2da3da3512e8953493574b983e40a0b22f4359655925c73575c6714cd6a2'
            '4681266a54bfe4170f12a221ae9726fb8373d67a0aea0c4171cf9b5cf9ba02d4'
            '94d5240d624f515e6fc5dc60bf028b866625e46a6ffb20eb1f319312748feb96'
            'd6337706298f23a978947c6e812816e32dd2a21c24fdfaca33fa1279c31dd0ba'
            'd23f2d4c5909984614b7b516e98241e35117a66449ff8d68f8c732ca61d46b78'
            '83eb43e98318088ef843c33b29263cf9024055d9d18893182a8aa200ed443138'
            'bc047d2839700d9b4e3ca18041cf90c2d4163d2cfd141ad28b5f2cd9acd8de6b'
            'c6a79f3e065751e14226638c14e1d059fc1c99c8e36f91f1c39c21d3ac671ecd'
            '2136d5e8a5b892abdab21561afff63c7a17a6df3d54e660fb227d6f746aee8c6'
            'c1ffa99e25c53e66be531bfac7d60ef72b85e9935a51e5985e4858ec8a9e3b92'
            'bbbed89cc9cd9798a8ea03744f1040ca8cf586e87d2730989836e9dc5e738925'
            'b9a0b983beb46968ac57cc03fa5f45bdda974bdd7953a1077cc5b15e1bb615a7'
            '284271f2daeb285043aef44d46995baa7af4ee9ef350daa2100fd4585fc8617b'
            '735b67d6887805595328aa28f0efcdf84cd6828fdd75b0d1b917190f68e73b0e'
            '856781dbc8f314525ef3412c5f6482b59e65f2f4e6af7b9e8b943556c8bb764d'
            'bf7f496fc7355ca28783a3444bdefdd5d27d0c0dba81703613affa28994c8577'
            '5ae3094e954c112cfa145ca6843445dafbc7a99303b36b6ef4d40c17370b0fbc'
            'c9b2b3c6d4dc583b00eb0270f6bae843220d0050e05ef0caa2b97f7638a61cc2'
            '5764940d12775957fba1575ba51a9fc4a836ddf6a93e669ab8be57b603745902'
            'f211627b08bca4020dae670b1f97afac0d9839a7ffc2b515a5236086c489e7d4'
            '01c9b1fda6e3e3fc3e20ead53f55c807d0d25c32466aad2c5a12ef5e7452dbef'
            '3b03a29fca2391ab3e9765dda67a293b1f9ee25501e11f4205fdd3d0be44c39e'
            '3f2acf934f08778b89eea5b59d0102fef269163d57c0d0a4d4ed42543f2dfac4'
            'b333d9ff725ba446222d51018b89cad736539c134ed734c19a785a2ad0120cae'
            '4373f8fbe19aa8c27db23d320f5b790abe2eb52edb1f9714cdd8d17c1f98561a'
            'd968a0c8053bdeec432f9238de0b2357f00948149431944d996c7baddcbff362'
            '5dad143619602c723b87fe47ef80ee626753cf7e157ab9e7880ab6fde812b8f7'
            '2d6c9c4ae0d1fa964a4306698c16f8be8db970ec1b0aafba5545e584451e58c7'
            '8fc7575d9808eb19a48d5cd734d165f25f32a1bff7c90739ad8e5feb0f4bf53e'
            'b07e6304d310c03021b93d7ace9aebf51c7d9019f2227b6d924e3e275bcfb9c7'
            '5be54abdae62ddee8cf3215f1cd73e537fbb5fe783760679f24908888ec9f9f6'
            '0a35de4d3c6b4fc10757b74aecccaf5d10e7973328204182f364be076b4aad55'
            '4a522f7e77cf12a60495178df414e0148398e3582d90cdc4b4a5b3a445e1cf1a'
            'f09d2ff69ec0a6f1039a02fbba4430b6e53a9c19b0f6405127656a2502e2e8ac'
            'f06fd9baf5f0026c71c3e6681b9761cc0fc44d258e621d3623852c8b10bb09be'
            '476bb79b5e9ffe5b7ef0a58724c8b39344935473011e1d9420b8f6b282d8c27e'
            '00228fe5fabfdf4626e26e795b1c682c2ea5a69c1d9f4796744e8aae6129f630'
            'ba5ef45514de99f2967b2c0b4835a73f5140c09bee7fa27fb2bfb965b03acbeb'
            '88524e34fa781ce3e017f890eee94e0758227f77984f93f1e3f2007151f1bad8'
            'b8fc3a8c2709cdc5322b2636d8cea4a089a6df2f301bb16c4dbb6b7f49694eaa'
            '464c9b96003264aca2c2be0cad0bc2b68c1a517702f0f003ed2fb00439774f9c'
            '21c53e6639f2ba0f7403f80f384cdf3d1f7aa5b1894e1f98a6444277512bf1bd'
            '44cec6967b727d331c10be79b6e6abdd6ec86045665a0bf5714438422862016e'
            '558dd625d312a7454aff3623fe5d953477eab8801bc3d5c1ef3e018912f8aae4'
            '3b960821c25bfcacdca46c0aca3dfdc4b62c6d51e5f0df4bd1da8ca68be5138c'
            '9d8be12d3df667eaf281fcfaeb16587d1ea50adc7bc051c414c94ee22b7d78bf'
            'faea1cabb2e5003ec720730472506519431436f98fad871cafa978e88fb5b936'
            '62a95838009866ec1f5d0b9dafa02ae02ad9e8a39e25a456d03842a08533dd6d'
            '5209c6b47b75502fea086a0e9f21eb542af898a82a0542ba4bbe6918bb4d11ff'
            'a6ff5b741161b5d5dafec06194600b5270d0728ec5ab3fa3c7438d0a11e6c59f'
            '6ac249fbebc3f6f56368cf07c33010173db262cf3dbfa2e1c9e9e8017813bebf'
            'bab402700489f1ea9cfd6b52dbc8d70579e66e586f0ccd86356f8b206a624139'
            'e9af79917cbf512ca04ebdc98e4a2db25e358823cfaa474031aa3ca6a5acb570'
            '79b9e696cf3544d13b7ce5f36e02bd393e067fd700fd7a180c7689fd80ab88a4'
            'af695415f8d279ceb8894ffac3e1ad53d45011141caf33475ddfff7efd4af500'
            'f9f26be27ef28b85b22821ef874ca82bb5d13257d199ca93a8c379b9959c3b32'
            'a897ef9af797e90ae12f32c129bc3b9654e9e1150f25a833bd28593629e5e409'
            '9b378f6ca98631d35e8c8c287e2ac693af3ec30ed0376768b4aec8ba64ce85d1'
            '4c67c670683e5742a33faf32ee90699948332ed1a6c815b0cc969580296ddd15'
            '9aaff4bf25931e5aa3053c231193c4c72aacdec7681ff856043f7e8fdc7ba564'
            'ecd054878b8b19b005616776587756787a4080bae3cb59c9a801db680f170921'
            '8152dd1fa481f88ee4e502e6502be51a81900906ef8ab4d21ae18663e0063114'
            '02adf2ec21ba46776e7b9c4ca98edc9c29390b76e22c07b0ecf40c27b2580d63'
            '634cd6971a1ff8b19d394a0d3f5913d35c81e8698d6af1c556cbdfc54bcc210f'
            'fcf9342b876cb52e57a6306f85e74a416f7e1c17e546adb577d60087b642d9dc'
            '0d97f90093c3232f09d874c4e50a5701fc1e9d7de25ae774f8d92a23232ef85d'
            'b64a09049cd3d18f38cdcb46f88705faa6ef40b92a84b0e2afb8680e6d456d09'
            '47ced88ad56c46fa5a36d6f77c59cbde63d397504475b7782c9b8a06b22581cc'
            'bb91e51f1e2715e727b7417ec2add4508d98bb4c0c74b3270a8a73829976b0a3'
            '24c35402e32d138c6d9001c6a2bf2a8d245cde91019de48ecc21af66bdd70050'
            '7617a2577ed978ad0e2971f5fc3bf415e2f0328f6748462e077154346317cfa9'
            'c86ad99825434235971826f283fc5b3b9f4631e3b1972c52a78a66c29d176e98'
            '6d8b30c41aafc23f4644258e1b9062957b5754a3def6ab09633ec45ed1663b84'
            '31a9cc6a82a627612e7320fb9899eb19032f5dbd4888538b5a5d5a348318ebc6'
            'e0e123646e590a69ea4d9772b953305bd05acd97f3d9ff01b68c84ee9e72aa69'
            '5e41e29b6d0600bd60e02f7f364ddd7fd1c8921d7917be185ddc6463d509e5f6'
            'ac8b0f2386898436bf6361032e46e737d2461fe0d711755bca14b46de37adfe8'
            '276c920782eb6f4ac4c836b89c5f14df8224431d1d883e53e5e345bb00dc2fb3')
