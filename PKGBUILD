# Maintainer: twa022 <twa022 at gmail dot com>

pkgbase=libreoffice-dev-i18n

_pkgnamefmt=LibreOffice
_pkgver=24.2.2.2
pkgver=24.2.2.2
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

sha256sums=('03a3aac148400e807bbb5de0f2ddf1948bc856fd6b55f892d82574a080674c3f'
            'c7d3146c40bfa50869530e75ae88ea44bc573705410a9158c6e6fde134492a62'
            '31e253d0ebeef84f12c59c8c01904b9fcb5808b93130b092ad07329a7bce658b'
            '6868fb98d44ceb7e0995347e0c0b4d930b5af6cbe13b9412274046475f8ebf5b'
            '7a9bd1c9ee26c15bb37af93cbd422cfab47fa36c269ccd44e6c4090fc29b5022'
            'ce66c45b447e94fea3c00c65e7afc868f44767c4a17607de5eea824145c7bf34'
            'e1d9bf6529311e9ee9f7c3320493efb11e0a1be4acdcd391440b84f268d7cc9a'
            '6e44b67a9c8cb9ff7d93a90411cc233230c33915a30f77e586b9fd601790fd1e'
            'b49397294e59b44ee3a05ceeae67d5a623a64a62ba0dfe64c996516807998698'
            '6a2379de48beba9d0f6c4b9d744f382b9915ca7301218e837b07f60d02deb5b9'
            'f119395e88b2012f03e24da90c2f3246a562753713272fb3c1940963981f14c5'
            'aa8ff1c032f66a80bf8c7ea086a57aa4a7cd3496de3e7cc432f1744b0b291a39'
            '6b3942185d3aaf14059a44ef96aab773c32caaaa7819e4c87fb0186be7530a6a'
            '4857e09afa236b4ddff5087d212da498f43c812ffe7e869f1c57059fd3ae281d'
            'e5e781a52af8821fc84626a60fc7cf8dc403249dfb114bd833d52b32339d0c9d'
            '993c4da392ac9cc9741d2bbf87ac6a67713ac932d1d79d9ce3180f8ef2fe45a3'
            'f85bf1bd375533e6852a7ee69310d98cf380d8250f06c96822a9c77185e1a295'
            '0db28b32b050d2fed6aa1a61d1a9243f5c9818bec3e14e537db120c93377d8ad'
            'f26a8bca813a1eae011e16d7bf35ec49433cb46345a2b9983946fbe63f097a96'
            '32c05805d78f2068c87e43c62870a3a25d3a6569f6d87aa66887b1be69706d61'
            'f169296d10c13df06b92c499f409ab3db50a8a35a03e0dc45966e857139cbdfd'
            '8613800d9643a6a66b565a6da4b555ace1afeeed7b61b67d8f4ee1591cfa88db'
            'a3ecbe4a7851699a0358a5f03db5b3ac1e5a90cde5868efa90e1346ea5ff54a6'
            '9a6231c5e7a763aea474b949d6d343d7d6fbed30a07302053d6aa6a47df958a8'
            '5e78015c01aa962fa17859516e5539d65176aa2b8e84299a61729ce3282787d7'
            '19980df80ec8ac63798da42474362f8d3b26479436ecf13bc87be2a4f3370673'
            'e2dda5c9020ab8ae5422f541b6e66034ef44f0dc23753dea51e36077a3d327ab'
            'b685ef29c07de2b7a034d25f73b469875a80589661ee4961c50c51eb92155e4b'
            'b3810235d34ae6eabf2a442ce6da6134cdeb8aaebf7a2108330f09bfd749156a'
            'eafd247483239801510bfe72ad1c65c13d56e7adc4a5014ad974276bb0a1c28c'
            'a03f64d37e8782f318459576d475dc9a9491e38f957eb519c4e095455e5a5477'
            '0f606c4da9fa8b045a8c4ad010cf66b9bcae1d51bcd2b14b188d6bbbb67306d9'
            '94e0c8df829eaa402ed83b268c307d4facca83ba6e58b485e8d2577ebcb00072'
            'f85e9fb235fe6e134d78905d9465c55cb4cd5b0dd5682657335d48dba999af08'
            '2452c456c1b7c4aaea18002ac15294b373224b85c8bb0c8e1513df76f5845cdb'
            'a7f2747d33c3701295e0104478756227a5d7f71b098cfc7c81c6bae5c45579b3'
            'b5a2051ee714007a502589498ae09e5e40920668af93e065f7d3322f82c018b3'
            '14c276729e524c833b9ffc3e77ecc7bc63ffa438e9ec22537da889f2ac9dca3b'
            'f383a45ece9a53e0141508961efdb0e57709cb949d3587c6d47e1f0264afa3d0'
            '790d91beb3d12c967f65f6a47656c34a8c75779665d26c77c5777243ad5cf5e0'
            '869233f447db8bd762f93ebdb997833119dfb8ec4f1ece706b43a663df3f92fc'
            'c3814ec754583c34f05fa84e27ea47c664d2ad77bf4888558e1f71ec8daebf5d'
            'da83d86126e0b6e1078ae0cbcd3491ff1b3dd9c67017505cccc7cd33dce38d7f'
            'e940e6be6e62c346eaa6b8beff854896b71641476e2eeb3246728b1ea0fc7190'
            '24acace0cf3a72d6f6dcc9ce041753c9750b9176ecab689344bf28fc5a2ed8a1'
            '5886977780eb109366140792217c05c2065fd2decdf7b6374434efc3cb7ba931'
            'c9678a80dfc2df500fa3d3c36261efd62b3714c3bf6c7db4d6413eb95984c22f'
            'bbb2b59b19de9982c4776dab2d34bfe343809edbe3df0e2fac7cf01fccbde957'
            '2f35cd8064619f0b89b999420ac84658451a5ec91b769c12770ffd6d51db3eeb'
            '991f9c32bcacf5ed8fd928f1fa80191aeac1c0d8407d407d3bb8d2d404cd8920'
            'e6287e94911e5df7a1166e42b541ba4161136ce3774dc2008c463cfbff62f563'
            '089bdff2c952659cbdc796abd01ca8d06893779df15471b79729a189d37f112c'
            '3c86507d557c36e31dadb5ef63fa17ff14ed1755cb01a45afd9d13eb9d1458bf'
            '8cd2a73527505c98ecb33b951cd2d3a72af735fbf97cd780152db0043a3799b6'
            '1958f92f72f53a6066cc5dfa6ea9bc32503af535b4e3d3ff81e191eac102f168'
            '18d30b0ffa35206169abc6e942699b56c292d0bb38d480aeea1e1a036d5aa959'
            'f083bfbdf8f4e647340b43eda5444b2315ff6a6fc6c674752be70095e011176f'
            '9931b7703674baaf178f65827489416819bedaeeac578a051734a76e666f73cd'
            '9fdfd629315f615095787ac5dfd3c0d2c72fa77fd887ca263b32a4061867dda9'
            '6ca49430baf1d8c5a44b84169b728b2733f1d5f6e1ed466a4424ab5e7bff7be3'
            '64475ef2b2d2041ad927c27d21f5eca1bd8baf9bb7e5b107b2df61be7717113d'
            'f95f3d3d2c3deb7ae6833b2e43c88c2471e6ba087cd730ec9da1ef6cb70baed7'
            '7ab0c74da9bb6cf208454a02f99296620e0291f4da8cbef4b77b3a8122c9737c'
            'e729888cf49778ce9d442e1ef99a9447d927270cf3169ccbaf1d43d04d2cbc70'
            '55def9f0f70174611dbdc1eacd864cbb4156439b5372874a5908b460f0b4ad92'
            '814319b4089326b21bc72199a66e98bd32697a708febf08d6aa306beb20465f9'
            '01de894e09ca63e3103866fefb7596a81916e9baabd77d137445eb9861098e14'
            '4065fb23bfb4bb73800658817ce69e4b727a0ed92a156019947d4d5d44cf295a'
            '28f118f787486d71b2e7c262acc35c638d6743ced7157b7f96c8d7a9f319bc0b'
            '24e91b19834926520813320d45acfd08d11c5c2a3b269f4a92268a3880b26d7f'
            '6396028d5fae92107ab071958c8167cb67724a90a417b125cb5b3c7bb1746971'
            '705dc33bbd6bfb572de802e291a3e62b82ace28d4864ac5cdc123be5577372b2'
            '5ea20428809fe4be17d4628f04ce29145bf2e6df05eafb694630c189aa86f7a1'
            '528e13fff17d1f1e1d4f70987a4179c95295a36a65b48e4fd7691da24ada6edd'
            '87ec0e2dab48a1a812d99e27641906701f8c0e4852e09dcadd5a69c632fc5e68'
            'bfd2ac21ec618a83d6d613ad029feedfe7e2ea9ae22269b9cc313ce4a7061b48'
            'c6080b441ce057458657eb7e9565dd7f39dc69f137603a22c43a60b52feea77a'
            'a1d0a211735b6bbc452d70bf2c80294386c5d9bd3efed4c87845315f6100bb0a'
            '7cd083a327b188cf4c12392ff189ccdc9f37c36dcb1414db12de0507c04a99ce'
            '376c6e351228abc6a6ed273ec9cf789aa7cdfde0dd3be91fe14d7376e703b4e3'
            'cf43e1422bb5f7a9c4317ea67d86fbcbbd44d30f427c8117dd783cfa4452eaa9'
            'b898a90ddc4529560e9cef57b02f7c8f7665c5bf9c1cd8406ef8d025b2c61ac7'
            '6318f9d84434b9f082aea110dc826214204fffb45f4107ea43cd61abda8ab539'
            '717cdbb001e1c47b06a96107b291992e50cac67dd1fcb5a070534f084076b42f'
            'c7b881855f520a66f79616da93754c011a8f842c3befef36a43188dbe5ba3131'
            'f46b2d995d0e664fbd2414b3be8748d4e8d3300e103df9e35deb2ac80f3fc4b3'
            '6500e0d3cf5cbaa8838e3800a71a8af08e66afa12a308e95c809a8d67eb7c36c'
            'b5eced3f992c0921a48f1575db1237c601c74e32453288ed24577a272661316d'
            'faaef72257412e2d548cf3cf9609dd3e6a62e64d146386cbfc463138f507ea8a'
            '8e78905ea10e0d8827cf55e4a2362d63b24b2c60791ac6d516b2c145c8cb153e'
            'bf35aff692dd9b51371c8769050094b26438d849b1741dbe1259039bc96da66c'
            '814624e951a2de5d6d3c7be931490a7f77ff0c478b09d6738e758abd6f761f4b'
            '9d0df285db31837c1a97a15c2a18dd7cfc9e68e4026726c1d5082e558dbaa9dd'
            'e55a308e92b44b97d5cb3412b0f07fdb965836514ba5b6394d0d04b0d9a0fd17'
            'afd46961dec8a1ce7f6760eb44d5833b51527277aaaf5a3648831be0d9ea2e13'
            '4fc72a68384f2eed068b1b2af079f0395a3cfbfdd887a42ed2b7496c2a13a9e3'
            'd70844319872c8c68b34876620e4a1e427af97fae0ead8fd83c5007e3543f7b6'
            'bcd64c3d631952166380ca12a5bb51a07a2ad20c91d066d2ff3e408a98d50220'
            'a4d3fde9e4208eb339b113e07c59c4139e91cc307bb0556807bf812c1fc18335'
            'd51428fc53c80be7be3da22225df07f9c2f20a270495b94fb051e688a45e0b53'
            '54d7a6a2117e9b764a793203551a22e202dc280bd596def0ef54c3e10438acf9'
            '2f886e2c84f3756981ca2652052cc3563a2d934b916651e64d91b63bedb8f918'
            '6877bb629040a46c04ec250e4f66f8e4679ca28db021db8f61486ccd0310f2e4'
            '9a186e41a2ed8250742914651b68fe446111248c003d5cdebd3e35f082b1902e'
            '5512cdce24f83e19fbe875df1412498a027b6856ad887dd342b8cf6f40d189f8'
            '0e9c8d96731f73bc34f9bdcca424aabcb028128da5f1ae86010b97d4223fa8b7'
            '7a78254f16c491d61f9e8809273d8dc5ef6db8543d7aa9af1066e53fc6404966'
            '1f370b41aea7f50441c63fe5bdefee3729328aea9be0db54013f6a6a37870ec8'
            'dcbef76b4c65fe3ac84732fd6414a0d78d76b7311bc7d5ae4e5f0e25b046f2ac'
            'cec3c447e60dc4cd6ca94a95f1279cc38e6c4b2e9e086ef21bf43776a397b485'
            'ce490ab6823d08ec1848ad9f14b2fcd061fc0e6b3bad81420a61dcbada8b46a4'
            '0dd2fa9b957a3ca43394a30485994dea51ecaf6138a6100c457fad478e990a55'
            'c187a23caa9426b345c30b22391586767a766e1e921d5fe1f20e45bf7a5c2a14'
            'f69a7579687f9c9992a34e57da1aa9caf042f63fbdfac223e45750fa1d44888c'
            '0ca3e759d50a479b4766ec49447c2145c1f068f683f0ceeba99297091390a5d9'
            'b2835540ab879b11dd2787d2580002c2183658e94243ce6b57e2fa430c6e4613'
            'bda74b24063864dcca9a0f8b731d71a589fdf3a9ca0a3d99fc3ba7530a47edac'
            '2c6ddf07f2049d718127883096a747c33817f8baae416a8198c5b5ce4a2c827f'
            'f8ab66e74a759634ec160c6cb0ee4a4732361d9df7b7c5a6ef008238f506e060'
            'fc1141d460403df085df17320bae609430678b517a6a844cf3bae17fa709fb1d'
            'd49eee31ad49b314818dc716f3c321f2c33a23fb413acf9e7c367354b3370538'
            '8ada38bce28232f26ca999ecb92f945797da5e9fbe8d5c4fdfdd6f1f82dc1938'
            'e36869ddc7dc5aaf25d7bc9b4d0c43198eba75f4f62e4a7b72f94d8c45b4dff7'
            'ddfac83e10e7f8bc4cc34ec0f24567eaf575971462819898c2b56a8192974c3e'
            '5ec40ded80247e6222ee6119f5377c64622707ea33a9d5ceb717d24e5d236f9c'
            '41d481118d98fe42bff5f105ba67cd10fe55ec6dee3bbd4b980e57461a05202f'
            'b007398fe6a486891c4621ae0b9b16e8bf7e4ae43783bbf10def2125d640f282'
            '592105e0c06b31eeb12bd483a27656ecfe1374faf039afc0d816902f6f7f730e'
            '3c5ffc25f8034208a5f5167f58f850718488ba29628d891faeff36d24160faa0'
            '0335e8fd964aa9d54496eaa367aa966f3efc5704ce6a3094397995a53e46b83b'
            '2fed3a5a02ae414cf897c9ed85df3415cde1504d7a0f7b4f620a8a192a9020fc'
            'b99efdf5b44b9e21583ee2cdf42b8591a5b01d55b9b67749d98936f32524c519'
            'fe216ae47c70c7ac7687437a52c607f10f0cc31f5820d44b8ca803720c410db5'
            '1ef4c64ee0fca16e8fcd5d6dd22c47d0e90ebb5fe8136ee9c4cad06bb8f8cef5'
            '5a9c4e5caa3dbd7d4fa23becfd08b89e2f15c3e986a85fd514981ff72cd7c1f1'
            '02839f7485233672f8d3c1b840c08faeabeb74fa1c1f65480fb1afdb5a1895bb'
            '088dadd036ee560a1046f9aaa8192e377488de86e3369cd474df530b7091a236'
            '8dbb809161c7b4d9a52ccf295f7e5ebb1a76a1c1de08b2159104a9379bd95120'
            'a88ea2c48ef16ee1a4ee44fcfad5028c7cbb824907ff4bf0e46bfdf824ab75a4'
            'f3152a7c7e17672561c16053db9dd6fc19e86253f3b9f0ee0af19eab18f106be'
            '1bdd3092fb693a7d54cca879e321f26cd55d163ebd6b8ece5cf7cf41501b0db7'
            '12721326084a71535a83edbfc0950620545fdf36e68eaa76bad66a3863fee3e8'
            '755a88c7679268571934accb5feef60b15a236fbcda2bd303f1583077b882f29'
            '308537e37d25db31589a8bf689e07a3cd5a761b0529a3f9a54ecb5954eff59cc'
            '63d47beecec1abd07b05ca86a1a68e2a479edc0ceeceecc371e2a7b84478e816'
            '03c1574104dc32f422e79257162f1af659753f85b688c0bc663cd967a57df765'
            '092a9051e0b13644bb61d414271374414191e6adb450a7275f22655cbd288ba8'
            '25d3057712e11ca756fb93229e716e4945ecc9651dbdb317633a7a04d6c978bf'
            '16fc8b4243f0caa334e15e42f0eb4072090923d4c9f09983eecae3494fd353cd'
            'b42f845bc158a45094bca318395fcd5783312d3d9e5ff6d3c24daeaf86a0f647'
            '55788f7b3f7b4b53f9c235f3006d8c6f4fdd1ecdfafe53e716a86aaefb61f671'
            '96761e2e459bade4c266eaff5b592a6102fe6ce47621c13741d802459d1e5081'
            '2452bca74f9223ad462ff2ca7974d4a32d4f9dbef7d541309614b413eda2bdfc'
            'e9158e1276a969843e51397b85c261dd7a7f37d81566f4e147288da134478c1b'
            'ca4edfb19c1e301f273977a59a2ef70ff6ee1b1e56570d515cfffa837aabc8bc'
            'd7932f307c5f7eb8aec07b93a6b6de0c4bd5d8b353ce98b6e38f13998e93d643'
            'cd7d630dec45c06861161fa937a12b663d10d80d5bc6a28fe045aae8740b3d85'
            'b4cf457e5ac07a35169b3d2d7777460c4a16368b7850f67ae50b246e3e11216a'
            'd9da7a741b1d0e866e99e4617d22b32b396d871d73d03952b937d4af30698716'
            '91765316e2bcd72e7e03f6bdfd1b3786e81c3247cd44bb43d00a0515c214cf3e'
            'b5dbcafedf7e07a7f886868e09dd05c365598577e212782cae5dc8820e714032'
            '985f59b4fc81247fc0e79a9845518f4fc0db3d1d2db7fc60d0c8639f9d201887'
            'd975840619042ac89776088d2f0ce0ea5b426a1269fcf74cc59d29067a497168'
            '12c2ee93a65e5eff75e3c20ce6b743879e75712424d295555630c9747482ae43'
            '34484b2313e2553d0e0c2cb12b1ee21e58afb4f7be566ab5594a966497038b1a'
            '425ec817911e45b48f5e5355d7eb9201dc87a7aeebc57141d376e91044d677cd'
            '1f7d840098c542552555dc10255a8fc68e0b706ef3b11f0044bc74f0eb772e9b'
            '3f6bc6ce602a59cecdf57f4e686b7b9f58251782fb985724b4929b5fdf019e88'
            '2b1bd07cf35d4d79acf09de4ee25617a847b3b69831023acb98fceb0a9531c5c'
            '08dd35d607f64c68f92fde758cf0df4aa39dd3051355d1b6113133026ef7de95'
            '47bdd2bf5e76ff705d20da80004f9ce04f5515e9967f2768fe617e23e8344ee3'
            '1323d72a5a2145d4b23bd3888401ea46b4a4f6ceb77f690698727f978dbca4b5'
            '94db1107b56881bdd4ecad2002d8837e2aaf838c6d0817076c90d113ada487aa'
            '33d51a251a44df68cdcba009376633778e6d106ed85236e72134e920fffbd9e4'
            '647cba2e0b6cd4a06bac03d80dceef01afacf2b071454b86206b3cc6dcadf4d0'
            '12e256b398fa085c288935ab4afe790d95738092c4073f6afd9fe6eb5e0c14c9'
            '3110bdc15dca3a2d69af4019ee0677e536ddc77767aca0fcc59ed9cd14a36796'
            '6abc0977e779f97971f2f0abe43d0aa52380f703998c00eafff44dd2e28fb12b'
            '1713611042274086a2621103dab35a9fbdcd501d9941a6848ddcc6c27b34a686'
            '24fe5cfb6ed321d04fe8d0c07e8b4d7153b72207ea0de1fc3fddb7ed1016dd47'
            '498925b9468cfbe5f629bae9938e40816da07f79974d44e3f94237b0f2c585f7'
            '43cd8a551cdfb70fe137d89df6c530c6bb95eea139c92e8785ae4ca8704b4c7f'
            '27936698794e0a66f5e38957f07fb698d025473c3b360d6d4ff04a9e08379647')
