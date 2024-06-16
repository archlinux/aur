# Maintainer: twa022 <twa022 at gmail dot com>

pkgbase=libreoffice-dev-i18n

_pkgnamefmt=LibreOfficeDev
_pkgver=24.8.0.0.beta1
pkgver=24.8.0.0beta1
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

sha256sums=('9955ce1804cbb7d5fb8d6863cca4eb4a62bb4a3598948eb43247c7d6cb20791d'
            '8c88be5f53e5de39fc76e10db4fcdf5ffcab16c4eb829846b0afc75a57ae309f'
            '38397363a1767166f9b7a144b57664a6ff1bb8c08a51f94fdf2dd5fd932c74b5'
            '8e292d9badf09e2182ef7a0767c9a053969f5f63c9834bd3c8732799e9f5bebe'
            'dbda7c1c7c63729c1087439084be306c23844431e05e30298cc888598dca8628'
            'c6b57bdb8fb9d35ecda3f45d6607424e8b465c405877e4fd961b50fbbdd9bbef'
            '541fe0a59ebe6cee3dd3a073dcdd79636e1b32c6a3bcf62f5f85cfc92f07c55f'
            '14a40260bf4a379cb97ed6e8f945b3d0a0d746645ef4611e58efea5711649936'
            '768784fab042f68b7264008e323f557b98da03302273d3be28983ffc909b0360'
            '789152e2d129490caa66966f2bcefdbf3f44125da5c5e56954e93943943726ca'
            'b6eb81128292c725b98c0fcbef6ffb44fc4bb6873ec7f0c17831abd1010d2f28'
            'f5976cbff0b442631c7f95ede42c1d89d681ccf6606325dff8839497ecac7431'
            '9d0da0f35bb8b2d0553eafc9dd47c6a3a93a2ea6b40f162e16f6ce1c9600eb11'
            '8cb857cd32e390b5f00385838cf63396ad8e71975605f92847029c51964a1eb6'
            '6ae2a5207450e7922f3dbee65ddb2feda252a5d6a8283213130b97d3f5c4a720'
            '28768267bc8a1aaf164aec1a2eab73d146345ae8b089ee73ac4370466479079b'
            '80e3688a166a2445160053db29f5be9accdb45795a39281f756cb040d0a0d650'
            '2a47c96eb855495dcec9fc4c8843a3a97c4a55ebe4bd226b3afc3d041bb6ff0c'
            '2d1dfac08cb0cb1a26f9bb4f127acf085921c580fd19b6a829ad518be29d09b3'
            '25b393d0f93bce3f487bd05a5c5ad3ea8c6b53d467bd71fe26c29776b7d5cded'
            '3bfadb002a49fab193e718d2a89e294df985f3316c0d1afe412181327cecb0b5'
            '5d3437d2a5b2f32a05357179f99051f2cf045e12d7e3688c3cd48a4a73bf1fce'
            'b00c1906ae7d207a50a09ed776cbfde0d7336a425f4d85916cf37f8eeafb83f3'
            '7794be575badec068f1baa8184b7cd0cee7f26567615f739970f944327740173'
            'e8f6d1c7d9b8bc78e0f7efe9d9fa4f64d2b725a273fc7a9aa19a40df3d441de9'
            '2ee618469e7ed28d0827f2f228f338cdfec5fa834b788b2f2813573db81088fc'
            '53c2667fbf65d0deecad15634762cca2215678ae2879a2e5bd7cd802ff24c15c'
            'f727f2ee3512a7790136119c1168ac16c97fb8bfe556ba322f89d672c3c056fc'
            '6defe82595e03caf2955909e3e1f40221d801a0ccf84fc4ac134dd6abc68ed0b'
            '774418e229284840171a51119e403a4f47251936b1b1119e43316dd56438c7ee'
            '4d981c63ddc81d48e44427e4007453dc4a7de442b2154ad44b81517b687ea3f7'
            'b2d7213af3c7ff222141c078fbf313fc285069cb76f53e3ef7aaadf9d305f346'
            'ea7342387627528ec46b441b5a44a4d90712d4adba44bbfe64c511323137a1d2'
            '9c9834e8b60052d4e2aeb4a6e49673871418b4de5b74e0c5d2bde5913af32a23'
            '9956714559ea57cb7e1658f015b84781a4f1602ea5fbc843a9a658e640dac7d1'
            'bb73f1348498f4827d3ca569344ee5590e28d553014d5824d3a89740e85a3287'
            'd166d373e3e58c723db331f24584b27047829c92476dc54e973d5aa927978879'
            'ad47a404758b8f2e41e760c62fcc337b04f516f7a47e840fd666d4c3aef28928'
            '52cd6c6ef90f1044bc2eaad6b7da7d73fc91f281979aea798bf51daa6ec8c191'
            '9cbdadd16a6b657046644c5b980ffbafe99b86080374acc4757db794ce1b5fbd'
            '9d77c848ef03e932786c6cabe0d2c8321148f73a786f0dff8184009b8fc8f80e'
            '1392d28964bb043a84e2b99bac2afe5df5ad7352eaa24de0f265d123b8b4fece'
            '6bab7f062fee42dfb17510bf7612fd26b9d9142bb8a4968d029bc8649c45320a'
            '540a8b09dbf50d60eb9660abf3d378e3c15c33aa242275211b48394726b27837'
            '3a17c12dd29f7f4b447720cf1d4b71d993eff1cfec710923886e834420c0de09'
            '51a87f3c55d25a355145913dec544e34cb7c06a46b9f6ea9b5116f86f01cca64'
            '10b1c239ebb6c9876534b477a14ddbbed4b0368b1d917074930e54325344c28b'
            'b6531199371eae176f22ff3c87b6ab070723dc5977dc59fd91f1ee817951f0ad'
            'c6a1fb779b99a66081556121eebef03d20addac6b84a774aa76e28e988676eb3'
            '2d24ee3d1b510099e18ad966ee7430883856e579fabbf7d445e35f0d4e2319ec'
            '7ab79bde5f2ed2f2be4f4ed925719fc0569dfd06775778ba192ede62ced2c5d6'
            '5626a6e3b93a4a93d10aba87da82796d8fa3510c39421abd03dd1332c367eead'
            'f655c21b4afabee57a20b0678c469a9fe29730b7aa4a91e4c7c5bab3069dbc67'
            '922c3a6c6e75ae803ea5cb4150175fbf327468c137886139bded2f6db8b28435'
            '86e3148812ff6ce99202ca3f13464e9556dfbce9758ea75ca7c08c75502c3aab'
            '25cb0b332e5a2bbec93719e896ad4aef5f1351c6e5dacdc1aed1100c547d3d28'
            'eae50e01f809e8e72e4ced07dda194bc8bc1e05c081815c0d0f3c83d4fd49556'
            '296c3f5a15a12302b06139902bc944691ee365e940fc352c176e5840add2ec6b'
            '1d417464f73dfb6f783e2d20ec1fe17b611c6fa7f26f4ebcbe8ae31b187a181c'
            '0e053595159ed84941773e01a33d663e9583b955ed6b05147ad643dc36426049'
            'a72982ae1e5e2d358bb23b919fbca310cdb04dbb46c3e5ff3d035742faf30a41'
            '930b6b3a31f1d49d9635ba56a02b7ac06d9870608c5f5992df250b91bdc56b3e'
            'b150b5b152065f936664f996687214246d856f45be09c66fc552cf17b23fabc3'
            '6b8fdcb906e6196527066451aa5b50ed377dba43af8434d022670f28855fbb64'
            '8f8a768627a1fa88c6704ffeaae65d21a912f108410c9b3664ff0889aa92b1de'
            'c07483b492f51eb655f71dbc042712d39ae952b6c4834681ac42de3de517a276'
            '40a22d5602d03a17d7f10f89adabd7d7e24a5814ac7b575fcf6d0a102d032728'
            '220533b998c5d90d3882da18d91b9c2b1db962e707b9d1bb01c22d82fdd68e77'
            '2a72deced8f9bc1ba005cdaec7e440479d239c59fbbe8e6566dc7995316b9cf6'
            '709a18ed8068040d402d0d089b1d5a8613badb5ae7bf2e2a5ffd5e921e05d6cc'
            '9c7fe996fecf0fea6381db37774eb9b27d547f5142e475e5533542f5312d858e'
            '136ed04fea437e79c106b46a189ec71a2643fddfbb1fdc5a210ba7542d9e9b71'
            '7fc32111e5347af78f1ec0fe611975169c2f14e6f0fe46417637f55743989a2a'
            'f1ccdca6fda36e4a40b625ad51cb145c748f7017236554cded9f4f646e09c4c5'
            '0794cf43844998747a541539a97751785ae1aa7e07d89c29c45da79b938faec6'
            '6ea8d967aac6eb06a2d8a446d84658590f3ac61ff754a5305a41c2631d0ae5a7'
            'd26a2137ec74e964d7dfa5c49c73ca34c1b0367e067d69c624c04d5fac67b59f'
            '497ab54313a45af7debcaf92d783e5e38751e81bca1ffde6616a7f59b0423bc2'
            'd60171efebea26fd0e87532d32d08b052041a8dc0e31a8d33509d1f547eb6f24'
            'ee03d4ce11317c815eb2ba800cb26b4a032bea3b982e8462bd93aa389b490879'
            'ca18e9562cbb0e44c3e1a8b2be56f73387e944742795df9859ae21498cc8ab3a'
            '2d5f91a70b2c5ee5730d78daa16eb0ecd4a12378f216ed9b09677bc4cdf3c572'
            'e7bc9d45a9a13063e3b713396b59e38e69ea3de3cf493435c6b42f4ded20ae9f'
            '6ac6780c0efaf2bdbc60182f9334e03aa2b06968024cbfc07b1a17682f928cf4'
            'bf2dce60d1ca96892b91794e8195af95a75966d0fe0d4cf2ef9943600d6af1aa'
            'e637b40e0c87781895fb13865f066d1bcc4ab0cf68e4556fcfa181a16bfa8f7e'
            'eee21204ace971648a2446635c9626f4e35f5c37d206f856e06c9bcfc6abdf7a'
            '018d9b64bc3de8bb9bc91091957f7f519414090b8771b1e2021716a0a38801da'
            '44901e47947571e0ab3c88186a886f0658b4fab585d0887fe3d265d0760aa27f'
            '00ae42a3fe6bc5d0cd213c50745f3e5acf9001c4437b2a3f0f4633a8cf4b961f'
            '825a0c833b2686059a1f494e52cedbdf0887d0c60420d7cbe42d7e97bb65f377'
            '861341a97aead603f75fe797d65cf1a3d7746f71a9a7d5ef28921edc09bf76ae'
            '73f834ec292d47d81940f79399e9ebb047aee00e72bfdd949ee93681eb8e9e2e'
            'aee431f9abb66d1b9953377ad3af2d523dfee06468fa6f324c9cd10c71f1ee7a'
            'e1b7ac3f7f6ee6e6df15d18b3208be818f6ceb73b05d90e105044dde799367c3'
            'c92f944b5fc08ec5bf23b1e453616cfa51c1bb009700e07666d4fa379f269290'
            '5a332f39ec8e3b9862a65614a483ec12b1a372429a2d4c6ce942675797006f7c'
            '0b16aa29ca1cf4445aa84aafb988ada69bc167f608573c7d381c458349faeb69'
            '37e4389a045d2c8b887529d294c8cc87d0605d9aa3f8860c1471f7318a6429a6'
            '7ee0739b2e7e623dfa0ee1c2b06b773dda1e13269b51cebfbbf7f4ed6612322b'
            '25e4dca6e6f22779a38bd9b6ba08790d3e57b6055438d7e887d6311d1b04329d'
            '0c64133da3dd30c61601e3f625a5b2fc59bbfff215d1aa8cefdbd15b7384261b'
            '7e4400dff95a5c700496e668fc10724b5a62a30fb8a98c6f11f67314ca9b51fe'
            'a1427b150de5066bff4e48682c624b8a9630fc455c837cf7e69ef0c77f459706'
            '939e89d11aad0658ac69f7034e811eae8a7e47311b99f9472a6901ecacc39921'
            '797747864228565503789eb383b0822746d068c4ccd91102f8fbd7664e5c6b3b'
            'be4bc7e68d6da9273230aa9429f230d7e09cbf529169a9cda7e66d263438488f'
            'ce81b115f9538e2fc5c3b98b89c3c8ef6624ddd9525d0799f82e921ab06f0de3'
            'dddd2a8df57442809ba100e4a12dd44f6065d85a4dc703d3878540e2ec6d40e4'
            'f7c21b577b3e258c2cfa3d535b055efd318ddc832dcf18c3d4c56eb39fece5b6'
            '7e829fa849e8a933202c2322c0c2646a77d391cb5b7b384fdc83649212e6af93'
            '2bce8d082c99eb278b5fcb88225a9c6b8022eead6ad44d245180293adf9eaf48'
            'b1b46886eebf95fd469e51fe8994b7a5d03a4f651c8085884a2045b77b3e40bc'
            '8e301f9e80b2269d8f327079c23810ee47fcdb04433b5571138e6077982f11d3'
            '4c9cb3fceb46c28d81e669795ae8071ea5e416da33dce18b624475dd732d4298'
            '59bd10dc4ee833d6dca34c5a2da96dfeecdf1e2d749afa82cdeedd8fea4b2a1e'
            '695f17c6f5fb5e946fb8dcaf5bf90a59cb5901a2c842b419bf03810b1effa068'
            '385f977d1141a443d1b7201dd9e670ee9d895ca55ed075de87920eaa1f0a73da'
            '312f0655eea95e6027811c9ac9cfafc1676f713f6effbaf4cea601bab1b0e5ae'
            'b9121a6a016f6c89ed6325fa4abb8dd506ac0205528a8a6145706063385d0f5f'
            '14e4f08200dee27932aacd3ddaa00410ed07270ea3d39aaae32e17df184aa936'
            '4c9e0288c13c6e8746e76a879efc5189b6c487937a849deb3eedd7da02ea94bd'
            '26bcd9725a788bd0e983957477e6d3a7b6b9a6588dd8089859ad54a9957b394b'
            'a52b8221a4a5b72dfe9495b376cb7bb8f80cecb369d922383ef0f9003acc9cd0'
            '7cee6bad348a711c787dde470d1429cca4475cf90a48bbc7599d87fcfa77939e'
            '649466d7e03a71ad9919a00aa9c97db6cb8d8ac315cdc891ca8d546205cb7e8a'
            '4ce1dd63bb1c2fc12bf1408686ce063254c83b40a1800e2c46d1b57bef9b397b'
            '73bfd6f229bdff5c5ff7b263b9106ebaade9ca17834e7d8ad2fd65f60790a58a'
            'add8e1b8231ebba584fccdf87916ff6c5394e751ef473a059172bf9af69af619'
            '3e73d77bddb7928413ecc34f3bd9f2622e99cb1d7e29ee534f438196d5b4b3a1'
            'd83080481fb0e295df19e8191bf8e7894ff3329a7a004d37131d180d1b6dd75d'
            '27ff56d45c364a2243ab7a2a8c2f69dbaef72f11cd8679fb4f1dc0b86955f525'
            '8920f8b150b0b6d5f06f292fc11a57608e68c114dab6924d45aa27695321d1d2'
            'b5f006620f145e5361d1d6cc80724d962f226a69b151affae3ab01946ad165de'
            'ac5480013bbd11981069135db8829bc7775147cf85bb5ef6444dc6bc44e139a4'
            '3fc9eb4663da3e2f35726921758fdc4fe28edc88803e131202045ed09fba34e5'
            '71b0e0ea7bc80d1a4182d9758a57a48ffb3d3d2f9203811d0593a98366cf634d'
            'cca743d42bb0e8db911c234c1dc467dea682c563e9b5e4b1b820234abac6a694'
            '2e8e8d649c1203106dcc68f1fc53c0762d3947fbdb4c9595e7bfe7f3159d6f2c'
            '2444de264cb84714759756622cf3b706b288c424d4b8ac2f25c8c0e8420f0ef6'
            'aaa3b72793f8e53a1d8ac31fd1f0c6baed1d46f7ce40a32cb5bd243278ba93a5'
            'c2da353c48aec92017c0915bb8b5d2ee0126d6eefa8a8b116514609f43469890'
            '362255eb27b1aa40c3c2f77ec031f9859de3401f3576d4c9b54228dbfad4c641'
            '7744ae54094012d41f6da94eeb3c1ea175d080b316c97327fbed755cd96815a8'
            'dae7db826dfbce1ae34a9adca3f0d22b71433df3701746d2649daa9e0514fc2a'
            'b591c3f30aff259bdc53fa14866d026b2ee71407d0a4344913d8a7de1537236b'
            '2f7fe04c418fd86756e6fc25bf90b23228cbffe889c9c7c1d62b32a0195ee427'
            'df3afab15fa3089f46c59fb9b5f870596ae3589a35debe559621e69ff1f28cb8'
            '00f76e5f9e78e6538d5fc836274c287457213c1a534a64cf65c9a47a71810397'
            '67fde03b237a310d905ad069c1fd451aa50463f0552a8fe08258ef59a8b6d34c'
            '1f870ca1e05ff380b4d6cabd994376f6c967d35bb6ca27e4c73f012fa8126d7a'
            '293cf40e426edacf52f041da315d878b7cbda11043d8407cd7b493a846f2526d'
            '4e5a5a11e30f2fa91fb7115db17ee3f9f24be1bbc52d5c0b03ccd306b75d0b79'
            '69cdd15d7eb7f8d42e7168fc229669578fdf42ba7c3482569131db70b8b96761'
            'd6e73efaa3c6a8fb2be7dee18da34385d4d5ca088b1e867db6ddd31010191a2e'
            'cfaedf099583bb35656845c6c2112208d3dd6a24b68b3e81c1ee9fc51364fbc4'
            'c6fbd181c8a19bc3f9e3909fc621d19307a40a05fd541d53f26ae16bad9aba0a'
            '223b33ee5453daeae3c8a4b17f880a58e090560e610c7d696a709a8490547421'
            'f538063c62cb0fd01ca08d135f68ad6f8d7df71cac57d475d76a520ae1e1f2d3'
            '8102ecac8d64885c3624570ec5366dc92be4450812aa85ead9b522ac1144569f'
            'd665bc5d95aeb6fe72fd4624d8cae8e5d4099ab12290c2112a567e002b3d4cbc'
            'fda267dd9479807cb1a4cca066df6915d9cc6d2d9eaec7a0fbccf54c1cee04f9'
            '21f548bc45d1aebd909f9f02a311df57f1c9eee92afbb35d46d4c8a2e42fb385'
            '3f987a5bee5602039e7058e118d6af30a4df1384edd0d0cddc5914f5283565a1'
            'c84d99bb811b89cc7862a9158265076ad5a74a911d4508a589aa5b93e550bd8e'
            '1076745af8f66a95d3ccf54a500e99e5226d6f211a3fd55f4fcd765f10e87c49'
            '204ca962bc9c1a14a68285cd5f3887662ec59f9aa8c53ea5a30877ec97aee96d'
            '2107ffef7611f44be42bcefc2278423743160516971c6c7552b7ac7aecb539b0'
            '5eec72cb0647a4173f7e77804ce4a989589fac92c328545d6b15e1a3daea149a'
            '4688b25c39cd66e8bac25fa4d298221b3b72bdf08a100e9ba528ee66bd490c6e'
            'fffc26659bae6f261d3b5e94ed92ae49fc98b4737040aca7734ff62d2c0e59d3'
            '573560757ddccb59322830d84b603bdb83d7727531b5dc004799fe9b1d477f85'
            'c93b71a1a855490d4c07aa28bb19adf116e9ae900db7ad21ea4da0b1e9137b0d'
            '9b8813313b6a17d4ce155d104922073f3f8f3c21ac60b4ff8e3288a9f4ab816d'
            'bdec2ae3d330337e2b9181a5257552e16f14d65748e7e8ef6b5833da3b37b7f8'
            '983c98871ac53a691465398cb3fc688c7c6d6e16dcbb13af1f24e08c94a1c6b1'
            '5831a94644521c5fb272fc575346c45cc1f0705b505da05b111fd5b6d7ccf708'
            '4384cc19cd6a35372c7b77a7b0ce3e8201eb4deacb73f3590c99fbdf0f05a213'
            '9272bc40a919ad2a02ca86d4877525021e52763fa13ff372a7124e2fac9d4b29'
            '087e2cd228391667271b653dd1f19614b556255574955a4caad093a176ac6349'
            '5cb26e01ba6d59605012ec3312468c758b4dd1c40c601a99d033a0847492ac18'
            '591c5947e25e85710e2927d6ae53c948fe93d101e6c184ba9d1c8a0cd95204b6'
            '37e01666be27630cac7773c7ed373c5114fb5e27795ba92515cc0ab97aaa8a29')
