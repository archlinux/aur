# Maintainer: twa022 <twa022 at gmail dot com>

pkgbase=libreoffice-dev-i18n

_pkgnamefmt=LibreOfficeDev
_pkgver=24.8.0.0.alpha1
pkgver=24.8.0.0alpha1
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
  depends=("libreoffice-dev-bin>=$( cut -f1-3 -d'.' <<< ${pkgver} )")

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

sha256sums=('23960e463109d7903c1da6ca1dbe5372e115c370dad4da563d5504f4216a97c1'
            '9d3880ff3297432e8d3f28b5bf007b9a24b2ba9b2dc182f3db73e12b2a0b7081'
            '87a0e3ff304bb3123aa73149d9b0d23ba2e0e6a60f038aa8ca12604dcfbe2ae4'
            'a914ba66d5bef0769948cfffbf6f23fa2ae5ae124c5c03f1cad80f5852dd25c8'
            '5956b7594aa1c8d3bdd3b8b5acc9028ba9c895272fce1f202197f81f8eec222a'
            'af93ff822d1b5bbf79d96ef088167291c039bd056da2bdaf8fd16d5af145c87a'
            'ef0dd53cd136c2c3cfec2f30ff718f4c41b8e9c00830ff716ab1775048a35292'
            '693cfe9c3bd92461c989fa5349f990d76fb6822b32b3299f3ec4939a6b9c7cdc'
            '6cfb9dc7a8f294af7cf39d05b37fea5c2031b9782672380605d9fdb98ac40d2c'
            'a398b7f853725e87a8ade1895e391696c1af0dc58e7635068a7f3fb861e5e4ce'
            'a297db83a08e9c09012d373c6aa240c952b6da6da743610acdb7131efbb2c8e9'
            '1c085b308013d8997fe62e7622df41d77848bf5884a6ae0063a97dfbb36b9852'
            '42e1f37108e9551be9bea2e933c6067207f28db50f706a7749a56674b87f93d5'
            '5eee01e594cc84fb9fc2e7eab18414a6846048e1c8a5a599e8dc7e23da7891bb'
            '9e596ce411056e1fcfb32d90c64ce62b4647f4c0bf56138c09bf67de901636c5'
            '8f9da0a9d1e0750fd1678c30c2725d67a9b976db8509fb60e89dc7ab38350b8b'
            'd2f1da7281466954a1ea32f97df37acd5b7dbdf8f456c88ca7ec74f8ab34f167'
            '6b5ffc411e5d4dbfa4c0d560011389ad61be88d9f1e7059e4d6fdf4c6ccae8c3'
            '30385500bcf8e7bdb35f9def9a990dfb78f2d15dac52d633311a35af5f4e1a9e'
            '9f474318feafd8ee7088402e58c8906bc47bafcd6339b6966c669035bdfcc72a'
            '916bedb935416b264e989f4e2314982ae027b12dd4f8fbf7713e19844fc5c1d8'
            '18b5d31bd653b885a2c4af93a32125cd1fe73f574eff29cf309bfc912a38b4c2'
            '00ee0eaa486dcaf447cf930d4a4107107d5bb2c17f9e2043f5288ae57aef31e0'
            '7f88c2e7fce09f5bf97bf1db5fa8c081dd09bf590079fced6db26bd5eab0d288'
            '9e2b4ef4d1984552d4e31eb35e2208034d47abf4678e84a3711076aa6c772ff2'
            '712eac25c7aff4318a3b293cb29939d2b6a3cd2128ad346a8080626b4a84724f'
            '19ca45d281aa704a5fdda73d9918f83eb9bcac1c927511e1c30fc0bcc99e5d01'
            'f16b7e36fc053528e81c8e2528c9dae9987026980fcc1382fdab2ba570ab6ad9'
            'a73f352580ba829d96289a394c029869e996b11a8172a33fcef9d49c2702daaa'
            '0036144e30857f25799d368c94697ef8bf1b8c232e1d6c0ed8d03a02d6554675'
            'a0d4f3650ba0975f3f7c6afb0e97d13669253deec3c310f6fc71bd11b7c7c8d1'
            'abadb2b0db2d3a91f5ac38d7e0bb37b99f05a82881250d0cfcee13f4222a7b18'
            '3740afaccb1ebb6f33af4adc8fbf8105b613a69efc407e7fd5f1e520a90aa548'
            '3287536aa3eac9add3b63f5a74fdaeb009d2d528a368275d7ea38343964cdab9'
            '4f27dbed5b7a7ab144ba9a99d161e64be381b5cd60153ba05ce1e447490ec0a1'
            '0ecb0c385314f02b98a264d29c5615e2e59212c84c33819065f0bfccb08c1a01'
            'c466f16b2caad239711820231994659714fa80469e1ac8c570f582737751f197'
            '149cec9e001c9ae5290e7f6f52dc95810458f26582cc9dc8334a4b4bdbbcd39b'
            '8fa69980a01411718909ead054eb615e7436ad4da91e0109920b714680d94dca'
            'ffa70e553a88fcede5124ef967405c77a6ff1040853bea3c54827c083dc70c54'
            'f91d8d258bf770d7da118aba2637d50cd5b95dc5e196f03f3b85328673601fd6'
            'd70f44ac50a6165ba3f85c2c4cf5cf21c0a1f5b0a9dd5a90f8a4f99814b0cb13'
            'a76c597de9b330e28cf23f17dfc9bf5afeb5fbeeaabb0fb8f4fbcb41e12645e1'
            '62d19803e2a9f34bd8c3072efbbc5cf5a93f56e9a80b4ff80b6c8d06238aa7ff'
            '800ab7b9f8f145009f6918259a066f38f1105c082420e29e085550095160b14d'
            '41b9fc1bda8e8b291d800001b6dc93c8f198f63d0ff8bb720f2d699febce4af8'
            '43214cd8cfaab48cbb56a0eb9fb99ba529555d5441ed65e119e89462aa40d567'
            'd9240bb2c4b35f70133a16c6666b0aff52f6c2d5a9da651db75524eb364f3448'
            '6c87a372313154645d9f17ae0b8f4bcee27ab53c30e44f29d7ccbc96377306c7'
            '0ebeb714f2aeee93363ced691d2041e04f57d91bcda5b0ca05091e949e7c4d3f'
            '375036f15046754492ed9dcb313cdddac96a046fc8d05b1cd9ccb3a15d996846'
            'f263a0e44acf237fa06cc4a6fbf385f6119cd5b07bf964023158f133ecc3498f'
            '0f2b57db7fab7c18752461f6e193aea3066353a5109fcbe0e7bfd7097bd8c39f'
            '2de480e2535a02901affec632696cb75f5746bdb78d22c063dfb33547558ea4c'
            '2d2b2ab8976e02cef9c2e66a793c85fe9d369f2144ce38770318a6f483a56694'
            '0318dd7738487486812c15eef63dc6b47c931e5a7e34522ef9f94ea0d1eeb377'
            '0415af99a8126a00f51ec45099db5549ef94ad8e6f170396f3a92890b9e6f7af'
            'a17cd109098aea0f82f2e36ceaee6d2ee6e2c6c2cce7376dd38702f471cc4846'
            '7eab8ab1a4a79b87ecba13f2b1e26e64ac7bc80aeb71ab26319ac29ea5218afb'
            'ed37f086b07522c7c59d7aa59b361d64d9d5c978ec3d9da91de4d98929ebfefb'
            '06e6db23cdd4e5f341104774bd7bff66aae549e2def3082d761b290db0dc5eef'
            'df8625e2fd080d900b95f391cc37c3cbc8a8bd836989a4c0231224f08cc6579f'
            '89e370c4984d619770ac587b0dea152a660e6a28c21237e0b1c8a5e5677b0f93'
            'bab08f426ba2dbc5ad343ac544288906daed73a3e4e7256b5dd2c0fef87c8f96'
            'ce78b519369ae78f22a99df2d9bc367560c891d579319a560e515f130d1962e9'
            '0dd7d71aeba352038d29cfd70c0b56314606f2ab2d9986f2f8a6e64647d41f23'
            '934358f63cdd3850615a24e603c3a57003801cbbfb69418eae02eab1bca3976a'
            '14bfbaf8e45ab615c409e934d1d49004f8b5fe95756b22e1c54553a3de875f75'
            '70fec9788b58362484feb8ab099ecf6e561c7d8e02eac421298d7743c0d56821'
            'd897e6acf0c3da5522db28bb7efa124d214dd37b4bbe2339102c2f3e1bb416a1'
            'bb90ffaf9f22001705377682669bdba49b0e1aa5b462efeea715375b4458ec76'
            'a9f13bc34fec641d761cb3560c163446b26aa6614b59c09f626b5cdea138b6a5'
            '3d2504da88fb47d7483da29966b2e53431f30effb40c799b024853cbd99d4172'
            '26c990da53e008d900c7e264d4e7b9fd3811f3195bbbd13cb0b7bf60a6e5eafa'
            '7c3f4c862f8f416b07c8fbf410464340e75e8d144fa8f32e3fadabe2e9bb2dc3'
            '0c471c18c38ff1cede153699bd049f01d26d7d1a80795f8281cb5cab7327ccf4'
            'f61bfd05a46ec1cde49d99f991d1b97c807804c0abdd7228dfd4b70ce6ebadde'
            '212c1915b09aad66972a49db7749b5426f45d8cf0997da3adb0823cf5c565f03'
            '1bf901539a2f7afd5267b470a92b2ca7387b60ce555776a4805c364319bf5897'
            'e1ffc1e412e14227ceddba802faa10c7541e1d8a270a2e2d258e48e883af3986'
            '285f6e41ebc8d9ff928a4c5041238d6493ee4976418030671a216cfe99700ec1'
            '0345234c0e62f4d8fad688c7e8bb56a14fed54e1ac2eded3c303248c6d3448d6'
            '8d90a465274fee8fea9906341a3b160e62dccdf7a45269eecbc6663c52b1a471'
            '51bb933ce55e56e23bd271e3ef6f2b6f4c3144f16ce8a09246917044b0341500'
            'e73321f987be452c99be7bf5f4a599a8f1b525c6813571fcc7e68c048c171829'
            '769b7348491809eec0def6ddaec322e9ef64e45af107a1a910efe2299cb0ca2d'
            'b2ed6956a50ae936f13c90ce49426277afdb506755f6e42062d69ee61512f8ce'
            '2fe468fb9ecf9b499c1bd1abc419f41c37b4b0fcbbed75acad196a073e4a67cd'
            '95d9b557030ba819d84bf9111f58eb6bdf2f6375c392111c7bca7494442824f2'
            '1b0c2e9418cf2112dbf77b361a0a9bcb425300eb2af7619cc1a706c0c9fdb49b'
            '5d9a893da4c1185a0b838d347946b770b9cce024ef347973a5c6cb306c964f79'
            'd62fa5f9f437bb7cb919bc931edd76c5f5b7b63e29ad599f3cab824b3d1f2ad6'
            '24fdc5e800297a79aea5edd54cc3cc34d60135e30ea76f7da1caca024642bd35'
            '178217edab632bd7c0abb32133738a56bbf297100d44e319ce7b8bf7810cd879'
            'f574d5506755c4606945dfca540e96f29e5cba515c6fd5dc36cfbf670865112e'
            '7fcf6f8a6ea7c2d90cdf9af1d60265c8a976ed92206db496e4a80c3b897ddcd6'
            '483d7614f7ee70a2343e732e21f1c1c4163e9e4e5e69ad8c8175b14570033a3c'
            '4488a5bb740b150ee98e455380e90f1132af5ac0d203f111bb340ad2e6ef51df'
            '478078f9237aa12198ab8fd41e613896179f535dbdda4841685e112b16e925e1'
            '8372b13190d0912229455fc09f0a9472c20ccff8eb3eea1beb12541eabe28cfb'
            'a03ce8818f4cee3c8d570c40b3c485bc595438ab230edcc3b176b5b21683372d'
            '00ada102f9e1009db8ee8bbb2ea7b270d47f12b00d6d884924626e8089e2fb62'
            'ecb1f61641222e701e9a85c213f03fad91bd198a66b956f31bac330a638e8c23'
            '14a13f2dd0563d285e91e9a566b747ed2616d40a1519d497b6cb79e4ad4182bf'
            'dad04591fc7360a6114b4dc184f4b8bbb4ebc69faca71fca6149dd2945fcde79'
            'e40ba4919d2e6e82a9f8eba6a7cd4333c13d76b89f68a7596cbe9a75d2ffa185'
            'bf15eb71fb13361117cb532126da7cf3b51446f461b293b5f070e7272ae19c71'
            '453e08bf3a53e76399de85fd504526e59250b0e6ca3f74bb0b17fd1627017a51'
            '02b95eb34e6ee5b8a638ccbc242d4ec38c64dbfeda8d0d628c0789a9ba2dfa71'
            '41cbdca36a0a13300c7eea82fb5d87c657c3289342418be394c9dae37aedb16e'
            '51d7ca3978f33de9c6e9b864ea46337d5cf77d3d99112109a97d1aff3a467787'
            '0672d84412c7a7810ba2d4dc54dc0c79b4ecd1f1ae3a8fee18be8947ee2bfb37'
            'ff07fd1c5dbe5c33ff28105edd99dbe306bd4ea733d4bb8cc9bbf61dd3f76036'
            'e98cb5cc853e747d6f0ad5b29f1e1c4b70d0bfa301e52de13710152f7d147f6f'
            '010ff17b4f101ea712bf57b7e6d2caf2f1f9ddeb98533dc1a58fa5dbf79ec5b9'
            '16269375232e3d3efa86cd184566d3df4a118c96cc811a931bf52c238a55714c'
            '134c71c48de330caa6bebfcc02e3981f8dc58093fe05527c660bdf0cc9f1f608'
            '24020ab00c0276dcde1d4664121e20ed0b7aa80265287faaca5a3434ec7c36f3'
            'e376e343c64047ce0773009745437e3e52c43bc49136e40d8a63952713a0b994'
            'dd7fb0c4df1e5e6b4dbcf743d1e5a73d4136277e04472bdfea49163d936f3647'
            '8faf11c854a46cf880fbab40718485e650ba63de5a9685ee395de4baa9c05ff6'
            'e29eb344909e30f6c0a83ccee0e2e98c714056e218a562e9d48e7bd15b194f04'
            '734c031c836b956084cbdf589e9063d8f5d483d2e773ec30295c3c5ba05e6ed9'
            '47c30e59577d1fb20c8ec48be24b3ca5fe140078983fa7b90eae8cc8144763d3'
            '97a067b03c0aeec3804fbb5320c03ade78127e7d99a7ec755f0895601df15a9e'
            'ff4f973e7b5cf1e7ffc4ba62503103b6c0c98b38ab8db75c5307e0f02e73e0b2'
            '815f266cbe37cb9aea447d2c17697e0d86224e6ba717df31a9969b082923fab4'
            'bed1a416bff8b631acee66494292770bd882eb24d8a38c5049daca1ab10b9400'
            'fc1495c56e01c92de5c4c3637f674373250ef2f42fa4924b31e1efa17036a012'
            'd72499f01b31019588324247438ef3ac97db5ce6e3159f3b49f7df20211d94a7'
            '31106e9a62292554cffaf3c8fbb5710aa59f7f44bc4dde73210956cf1203fbf6'
            'e3badd83a6b9859b542ff1c0aa36b381cdd1d65a682d32dd9f33fc9aa96bd173'
            '8e9207c9c38102852334388ced404f246848149b4ccdeeb17b4e3025a6ed8553'
            'd63a916954573dea4d841bd32f5541508b5bd08b730a4213427c8d47f362fae3'
            '16f29af5d73655d21fa77d24cf4a26b3d3c7441720fa81306175c339b99c71d7'
            'a456ba1c0f7a23f7090cbd03b31c0acab9d7129b0957b65097f1d298cd654020'
            '0ecf663bec04a58c1d1fcb52d8e4e1d52186f8fc7c90030b4fadc2d64678aee3'
            'f258b798f550f663aa102554c5ae187b39e1bddbd21ab2ab4597d3d7ad2afcbf'
            '65539afbb36e59e5f48305dcddb1225a7a5a4e2aec1578f7854176389b0c993d'
            'a4ea6b6514e19708252e33e81040fcec6afbc574859128dac74feeaf5c1fe7d9'
            '6ef9ed75ffd27fd61a72a6991884db86bf32d21c0308d7e9f28414a87bcf5c3b'
            '643271644ae2c6b13c74be5cd4ef1914ed80ed564891f5375bd357ca79406d06'
            '095a3b5530b86e4c9118282874fc7b638674509d4917a4605db18eb82534271b'
            '7afdce306c231bc64a0ea3c02fee8c71e9fa60f2dadd3b2144c21756010b48ab'
            'b162a02828fcc921177b054dda9ef9dabe45b46d27b7e61aa6479dc32c7dddd0'
            'e53e750c7a942cce55fb63cdb8ddc39cba9cae8bbc934cadcd3571248d64bfcb'
            '7edaf123f8ddc0394d0d53ae05721928b0ce2e4ee4fac78e0b6b3161cb5e8245'
            'e6f214eac391644c34a51b864086047a9fa8c512204b6e6579fda8488c224d5e'
            'eaa963734e889f3c094b414d28ac8dff61d0873b47a518a41466222e99fb649a'
            'd933cdda47ea0b68e39babb9168526d88a4f0bdbbf618aca6f01cf8514bc957b'
            'd4ce4273d6e2c23cbbccfce94e473e9cf93438dacc920e79478fff8fa4133215'
            'f35a877ba4a34bffc4244e142b1fbd1b1d81a52fdbb38e977e669ff380147234'
            '0fd5b82c5a8ce22c85e08d67fac47218d14df18a72684bfa90b93a48e323f68a'
            'dbe232ce45f177aca423c811df9dc0aa62b7145a1caeb0ea92574eb2347e048f'
            '253b836b4a5b823b588667bf1c25af4a2de2aa220a9f79096134f87f352b593d'
            '9ac986d7185a614457d184a675842aef3388cf67f3a530cd4c6beeead5febf83'
            '3d2665b8fcb4bce78f09744bcbbd2150869e287403fa1e80244f6eb34ad696e7'
            'c19962577285aef8d8ba775fc7ada06aaca9ef431c85675b4e6027ffe3165447'
            '629efc13ac2d04889f9a8961f29e5ec3276650500c2a29e4590b1ec95af8db92'
            'a839961ecca085e01f202d0eba088ec86d93eb466135f01e827baa49d48a8eda'
            '0a51e68360ec150b1de2e6430e1e4fc555905f336d2f7a28ef667317bd1d53a4'
            'f13ee468c895a0ab7bf7b842d303756d760fe4cfed273e9e9b33e39d7503f782'
            'ab66ca76db8aa872e6ff36c7071ec7f06aa21aec1d811689bfc5f9c721a42e06'
            'c80661ddce43e0a004bc98f9c30ae56385d0c4fe8bcf88d8b3d66f0b914ffdb4'
            '613122c7eae64fd6160d6a589427f88a3b537a8f244331534957852477239cb4'
            '2abd3c4a391eed7c96e143b5126ba0eec985dd5f4783b4ecab605b79245c3655'
            '03d83c9a903d83d28e080d6c008da5de66bf20602ba4599ff840068a0e658d06'
            '56b2e4ba89edcec266b7aa2a4e2c6d0eb3713ece2ac98e2dcbe92b584f8a82a7'
            'ecf38e8fb7cbb2b907144b20c1db48ab0a4c18ecf10b53148eba497c15f686de'
            'f574e45078dde9e8d6f20be281e53094c3e78234b4e5e5206d2750f53cae22d6'
            'e012a1a9db2ff3572a9afa93f96349646c8a199c447c0308b7d6ad1b379d5da4'
            'f50037b4ac6c7600b8172bb452ddb53bf70e80c0a5cd967faeb99efc802c8f8e'
            'ae7e913361da904c8b9489052f7e7e712a413a7be22ac4a5d994b2664c558af3'
            '93d43ab52092519d4acdcc5d753df2f6fceef6c02c55c013ddaf31fb1052a548'
            '9fc5dd56912d8f9f662349a2f7d47d8b5c1ab8b0b443e2d150375c8f77fea3ac'
            'e195bf98ca9f1156add2e8e679f1f224bfaf16fd24cb792fc1101bb17ba7dbd6'
            'eb4941e11c6b3c90a562c09b049202565c382791b584b037d6d7cfd3370de95f'
            '9140701b9f0f0ea17410995ed7f033c4cba4b8487875c27a7d401f6b669d3dd1'
            'debe3254caaefd6bda35de07df6190714d576e103d5fa533d597cb6333660cce'
            '475c33c980fbce14df2675b2f7d4d010883ef6e8fb2239643176718bcd775ae1'
            'f98f9b4082d153b8a43e106b95291459f9b55b845812c9a46f29636dcdff2e7a'
            '1a22a4e1d073b2f8c795df2f1739f6d320f6638913cdaef2c5a954948f62a5f5'
            'd435f85091291f35af119f94dacf7ac5cc3a69aafa3ae42de5813febd36c3d3a')
