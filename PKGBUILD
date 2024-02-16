# Maintainer: twa022 <twa022 at gmail dot com>

pkgbase=libreoffice-dev-i18n

_pkgnamefmt=LibreOffice
_pkgver=24.2.1.1
pkgver=24.2.1.1
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

sha256sums=('131b2611e4ad0a39a7ee8bf9cc57025973d50123ca6e6922ab33bf5b0988937e'
            'd5cccdf56b45f203583c4ea8eec8853b753a4b314eb855ce6b3e2eac06db87a8'
            '609e7c9fa8774e7ad0824193e19ddded779a510a0af34189050c267d6d43db4a'
            '39750c1c74b7a1275e7c7383ab09d2150fe74f0489da648b98b69d62ab996d24'
            'a82e2c3e8b745843c4bc30874d9461bc0d03e8c02b94b9e3fde16b0d99a38083'
            '00d8303fa137ff63e3a0486fa654486e1909fef2e83abe542f09215bc6d9bd27'
            '98b840ea36973c8687af3fde976af57ff9191475b4f8de1c9a2aacdf400d4502'
            '0dd674e805fe26872f07993c85583f78d358d8891fede6e31e9981a6bbf67412'
            '457d09fc1eccfe1ba2d3ef37b2b27fadb4010e68e807d969a5560a35bddaaea0'
            '3e3a84574f7f68ba31dec7f222756c5c761a83561971c953129b05dae432e4ef'
            '69128df4d1b2bb04426ba7961a40af4067ca7ea53bdc671510b45f8e7f75892f'
            '13e938f6d5ebe53c28a8f016443f06699db53e3f5d8472466da2a2af5d33b317'
            '856cf2166306b5c1350b2cb288a8bafee4ddda07fb93cccd38e1683d490faea5'
            '400acf2a131720bf9e744cd60928eb41d5e7181690f8e37d886347744026ff2c'
            '4d1e93d3f4ea1714cf805d1d93871465823d70b0cf32d4f41f8cbaedd1f1ec4c'
            '23f1f6f7b6b5e312d2465a401483e9c6f7e246595b48e6c542e561cf6a458387'
            '9dc47742d83cb8916158d58d95aa6cb4a02c7afbcea8aa82cf69a2735d0bae65'
            '66bc25ba1a584cf6d04d4c8e47bc7177bfa3430f693ff3e1fe9d672f0589ce78'
            'ea61025cb795c82f012b2b0da8b6c1741aacbf6831f1a5d8cd808a383c5b2966'
            '30a00803eef867e45fff964db6346760f9f7083a266e1fe267bbc4561fd6d729'
            '5e94e564cb542328916c11719d07bc1e1fff39e09b45881b8d8b7f93e50bee3f'
            'a9233870d961d217d7761095053eaaa661568508493af3e05952aa8aa1de01f2'
            '51d67b1c269b5ecde3f22b31a3d2158bcaf0208fea3d6aab07f6e58d62725b99'
            '1c9d5d0d4e2647a2440ca6c604be9c6910b81858afad77416cfdf7d2924dfe8e'
            '6508c81bffbe4d3e8e9b99b3daa295ede3a77c2ef2382b1ef48ec83db93ba41c'
            '04c12f7d244620c7212f30aed09f83097e76dc385b844296f5a00d8cb80198bb'
            '22da11370af4b21711e5b1c721fe831539dbe72e9838e4d9dc66aa7650076d4e'
            '5c56bbe8b260cd4ce055c48f855a926997ce018868b1122dac720123ddd80688'
            '0a765056104a971bbd8d34becf113ebade97e0ccf5a1e15c84109b8b6846ccc1'
            '934345183967225f97b04efb8a253f1b7d197eedbba095c3023c4f3ae91bd203'
            '03ea2df389bb6ca07f4d14979940fa9049106d691df23760a2caaeea437bba9c'
            'f9136f5ada5ba141d494d85e8dd947a2eab5dff6b351a183b63d101c5689ea42'
            '9a4d40efb3e2aee65856428e1aa3581ceb4f70024a1e08dcc6a4dec7dbb1e58f'
            '857f9c193ae82c77354492f3976ae928b55e04d63d4cbb7ade65a139dc788dc8'
            'ee7957f8b36c58ba5e5e13c63dc68c9064fba94096d75f7d656ca2abc4418537'
            '742240e61cb204cf1d6e0efda82740b7d23bdc4a1cc25920aa17aa4b5ecbbee3'
            'c9c213a5f2f4eb1dc38b95545ddf9b22ec1ab54e521f84e6696f268fb9efe776'
            'd5e22121ddb821d4b69c77562bea7cbdd9c23ebc6145e883d49d9880429601e0'
            '8da894479b94287eb798c3d86a7d32a7c7964e69b36322e4287567b0c62d3d9f'
            '72cab2a322e118027b1238559edab5946598054103444ee2d28a41282aedc22b'
            '50319b18cf69085917bb992e7c39df162e87fb8ea5b4ccd759a68133b4aec618'
            'b22a0737027fae7375d15de06ed9c68847e9c75abee630c61d62e40ccd822138'
            '420440c4d3a741558995d17ad1f2997091cc97198d2e3c7b37157822c5ec4646'
            '5e94eabb2a8247acaf817e9344395b560863d1be8091367e4c963fa0b547dd8f'
            '8f388191a4ed6a8888d9e01bb0a25741781e127b4190d9ab2f157d49eee263cb'
            '89ca4360cc676940b92be7398dc61ad7a87e03b1582d8b35676232602e4954f8'
            '6223dff29e46c5341f6a8ae3d0d8286356001e1df337d8be06ad82f20b5d8ac3'
            '4c8c7cb7453b36282fd81a0606314fccd1ec5d7eab727542e524e6a128ead309'
            'c1a538c43ed1adcfca18e5b8da2f6f2678f8c48c2ec93b773a294f67c402fc97'
            '9ec36d8d53b19a3fcd1ff0c3b7f7a137bc014e9773cf3fcd93cae216791d535d'
            '68df590c412764e26f6f604558be20a7483bd942fe6e5349ca94a3bf5c007892'
            'e18daa4c066ce2eeb8f6cd04e78179bb910e235e3bee3f6f99e35880d09390cc'
            'd66e4b5b9944cf26b9065e63582bf179c68799e8fbd6bd297184461742fcd731'
            'e40efea7679e021062634fc0f9963c48f7a35d06574743c65b1d64bc3bf44462'
            '355f275ce154659550bb383b6a6925654ff2e899e3017d0532a3d2fd68da891a'
            'cd9dc8bc2605e7199aebdd82063b0a26d11fff9e4d7cc0c384c2307b449fef7f'
            'f5aa7a36ca5b6571b22c0e43225b1be2675a44fb6053b1d2bec977efe2a30d51'
            '7152c6b6803e085b9328ea851ca617ed22114685e9976ddb05c7623ac6a7b8f1'
            'edba097d8744ecc9661592e57b446a20f17cb404f335b969e75f258e24fdcbbc'
            '39ed73b0b35b2e7aabf9616d7897d7904318e0c9a035d9747fb70638c0bafd75'
            '135c72b4da4a2a6f0eca948f71c01867c55983d53a2a6f3fa3a22af518685257'
            '7aa06859ee282fe67c88962900347882f1f0f89ca8f84f16172ac693faaa8488'
            '93a053408d8dd995781d14f188b30f6729827196a8c8dca243ea21e369092aea'
            '783cf68525f07e16b2ceca6e25c13956044751af0b5913b5f6988c249c63121b'
            'a83d2a1dc866f75dcf99383e502c2ba101cb543f6ec7511d88118b115454d72f'
            '29c113e9202292189f39509284ff15b009a8748ecba8c8c3e8aaa9e2a66321c6'
            'd8dc836c2447817df0d198a482d85e62fefa0a5ab0e2afa3fb912e149688023c'
            'b070f108491111a6f429d2356f33239c90d45140c255300cdb57167ed110e4a2'
            'f2c843478da0a56553e6602760225f197320d603d0bb3f30377b38c92a499511'
            'd9bfe009ce0e2246429f3322bca00290e27097458f167218c21cc61e9d407e1f'
            'a98bfe079d7a93f5e7ee0555981a23a301faf68b77b16b7bf630ed7c03a742e1'
            '342ae46b29776cb3e37eedcb968c9d992e03c3b7d27d6dd6d725e38bf052786b'
            '7ea6b9f131013ff5e629b8f8ae026c12b2fe10c1198565860f6fdeb912dca639'
            '485a7c7afd796b86b296b2edecd76a6cab79671ecec341b9702516ad047a18d4'
            '59c42fd68309a12a55e2d82cb3064b6e7e70cb31e3eb7124b1720ecee93fee0a'
            '9f4ffca6fbbfe2a786e9eaec80742c39652a1307dac9d2104f147ddc042049d1'
            '8717f605135e16355a157672768536dd84166b0ccf573dca8b1b8b0a316af911'
            '2c4c8fdfc44d79c917c367a0cbe43780d628b623b4cd8ce9dfdccfc734a56ec4'
            'f7ab1518c746d6c5b0cd313c3c12b7e4d40e54263fa946731e5c70914e94029a'
            'ac0af3c5ed2cf72a3f9c259b064dc815f2f3af6eed6e9de85e2a3cea15caa14b'
            'e8395e0127581d7227e74cb47ca7d78e04edca36b68396b30847d0a59555b952'
            '2a3c060b11b01619f39e384817945aafc18e4234d59363e0cd59d21e89cc0e4d'
            '89e0ffffcc4a0ff2dd9b0d86b300835a59b59f487f6999055fe9a7aebe6f1675'
            'f679eac97a04fc4a6d2b257e9fe942e2c13ed4395e21af05ab912907eab60a8a'
            'c5d5b70658515b8971a7d0f114778a7b757d820b0965a51f9e0b69af902e7ed2'
            'ec2842f1964294dc5d04a35df5ce54af9ab425f602e325e46b7b3bb658bfa378'
            '2adf58d325b35d28d438003a23060ef1dd4791827c7e91921634d720c36a4077'
            '5d5a60a2b7e17655e70edfd28719f9bdc7ccedef9c16fc377f8bdbe85a3540e7'
            '95d32357c864714cea4bf5b08574d560db1a56a98d8c62edebdcefc59273d5f3'
            'b9857ec107a0e3700d82041d72601ea0d1380a208320798edc81bd01c371310a'
            'd2aadfb604d9c64e9ac3e56066cae742f1139de80c5a77e1275fcc24a90362e8'
            '97f20a512851edab6cc9137ffcff8bd803d375f22d7740cd9e4f12e90b9b158e'
            'bcd0fda066434038685aed50118ab6e63f835e21a9daeb83ca4f834ea0fa9861'
            'b55a3c7d2604d4394e0c57f5d1546dffa76a0f04c259a53a5b5010005b1fca52'
            'd12720fc4dc1e4daf8ac1f448abe277eb2e56d6a1423db78a3806b670c408d5f'
            '3273e74abb32f88c92de6af6f064c570d20a1cfb8345e37d1def8abb76978280'
            '488d492f71b325578ea4706c3bb922dfccbd90964c9d700ca64d0e33215e780d'
            '2f41527fa459857c49c3e8bf24503784f079e9b89cd32ac21133ee2b7e719f6d'
            '417037cf0353d9ebe376b613ade28d3906b268518c87802685392d3ce7fa5da5'
            'a708007e9e14c58ce54200495a9527ebc4319caf7263354c14129f1581e6aa47'
            '8bc472a9e35d3861804dd04a77123f0aafb760775449f8528b7a121246b64e5d'
            '89f9697cfeac1047f9a552d21b72bc03ff4ed1b05ae1fcadb48bc5872651f665'
            '74c390de8430af28fa1d174dfe743ad6d042abf4579623a7bdb6589dc8c597d0'
            '90862eabb77b2d2bee5a2681528431658815d994c3b70a889bee0054d21acaec'
            'b881125d9e1b87dd166533c5026ce3475bf3f07c4556b280bcc3711fb756cb1c'
            '0d79ac2f13fafe48f1b9bcb7fcb47169e02bb410c14ba0229d074fead66d5976'
            '4b26756150f02e41952294605e31ff3f3f503d7fa3b2957f2351142b88e86e7a'
            '2c20bfff4d842098c594003a01a59d3154c9bcd33a597628feaddb5828339cb1'
            '5d2b021766d84b588e513288655f7eeb5b2b4545149dcd3b04157dfa0c53cb6d'
            '72fce26de3527af39aa50d0a9aa8bd8b4ce3e904db2322d0ca7281c36968aeb8'
            'fa1131235fa921c1af7ae0f89a1abf3d774ff621d74a46094c37b2024189c4a6'
            '83ddd1f6606b07584ccd585e68da3f9c1b7e96e2f108c934c09ffdae4a099412'
            '76a81e44eedd99efc4f342df3a5b60440b11df45ba0f42ec77e0f852f298ce61'
            '43c41f64e3ec55afbaf1bc4da2140a579d962a9d5c76b5e33f4424a07f094fe9'
            'f06ce9e841e8873920db84584b60283741fbb0cfb5f8e7311d530ff3cb658272'
            'cf102c18a4302555b26ec0f3612c4505901c4d52292edf83e781dbf663db24af'
            '8608211e2b5daeef80bee89ccc79c890bf9bb66f49c429e10acf1b3af925fa54'
            '45108432cc14c2251f9743d93cd25cc3ebd3737f5e007ddc9ea546fa440be916'
            '223f146a00b7671511b4c7d7faa77835333a75c306e82787dd788e4f4ac5ed69'
            'dc4beee03006041b01096330c903e71667ed32ad1c355d3fbb27d8875798f0b5'
            '1c0e3f6c779f56e59529d05f144e1729272645b128239149b3572c17deea0930'
            '7b1e18ccd79b951cc9c012ef8e0ce0055f1aa56aacf2ef383e5d772ffe0fb064'
            'd3760985b2c42861d56e30c72015535e5ef27e8276a9f54c5cf1216927abe7ae'
            'c699589cc25f9d8b78a0dfe5f0465ec11b775f1cc12f9a9c6eb9cfa7bd0ab18a'
            'bf6c3866f368d9233914a27488ebad4849b84c08147de1d5944b159b0bb90246'
            '4e9b4582adf1bfb9ffc496443144276f00ca7c8e750881d8c0b9ba8fbf970358'
            '615b2305b8996deac35fe2078978ac67ded48d1d4253a81affa902e29b03b448'
            '7bfdfbe7c361020ad0671c45156998376474b56b861732a10e5f442d057d7bbc'
            '29a7baed4239122c8ac8620d7fcfb5fabfa4bf5f14ce38c3331cb08021d488b6'
            '822c032f5dc0825c081ab7d093448ff3b81f9bcefb62b1c952a05420d288b63a'
            '0c02b00dd37add8efc15227b4e357d5ec7f51fa8e00a01363de608998d4b6c01'
            '2c7a9b388f8c7faac789c31e11ffd8fc37cf3be3dad5721b151663a1322159de'
            '358d148d70885d60e72d1c0315e0526ad4d46967e90f2adeebb7472dbadc5a5e'
            'f01c3e4f7143f16e7a9ab11ed825044688c95df4468474d79d31d763346f8398'
            'cd4f972ca20cc145a47187030444abd0a66d942c0d32780d31a3699000ca3986'
            '131d92e340456b120f364a0a5f955f2d92b4af69de59361a31e787f4eb045a76'
            'a2c64731c8dbf948862abad04a7074d705d2a9ac486530018cf63d226d1f6d19'
            '6a418fe14647591cfd02d076b8cc602b2eb00a9eed63ef5868e3450b9836f816'
            'bcc1c12981c7252290430a6a013ac80e568e9c5f581e7b86c0d9c2ba5ea90ff9'
            '8b6e39d9a15f1a85fbb89942f8af8431828e1be50ee529197d14cfb9cea51c70'
            'ff316ed9431ed1ee80676c74c3f37dfe069bda34ba709fd1ad09baa2e4f498c2'
            '366eeb3f9933110eb6107c73cbfa3ec1bfd9b91982e1c0c4f099e95e2892dad5'
            '63788c1812026c8b9fd438f5ba21e9712426b37e312d72ef5bbcf91e77d36f7e'
            '32fa897ffb55ddc8e56739c4ae0464ebf85ddaaf5014142e14cfbacca4189740'
            '3ebdd3ee21e1a8f7f4e8e4c8a220a0552daf6c03a4bfcaa26fd79eca4e396ea7'
            '680cf7e956fa4b577fee6686dcd0711093c3cbeb2cad1c7042cefb636b0df205'
            '40ce5884907a81d0c7eeb9855e6b10faf598ea9011cc47933003f5b4469826f7'
            '92c48d5ed5f3691b2d1efe1bb3c8a5b2347e1eefcafc338fec886bb62aae2152'
            '6df33cc75e4d6ed0e172905123526dd0fea8433cf056194390f9cafd6bf3cd21'
            'e55ad87dba10b27809b7586112197e52299bbe8c02186d6e802ae01633907612'
            '45a8864900d6253a3b791c73a4fb373d0c5ce69b198f44b5200f54a78ebef4b8'
            '441b261dad03f9b82a0d25f3622a82eb8c44ddb3a9b5ec3501b09db92b0cab01'
            'baf2031ccb511b477281a4cb6d69b49783950a15abc77eeef527c397234ab9aa'
            '1e603a237cc6cbbd9860bc6c6ed7ce301e57c9c97a50c28d7b21b22562e0bdd5'
            'b3869877a2dabf26455d3747cef10c16a04175e0c3f20a4f8ccf17a6500f8ef3'
            'ee89974a64cf58f6dc157a4c1c3df1583f6ef82b9874c1a461f65cfe34c46215'
            '05e7eca97fba96639fdda1b50275a2aa0deb89568b2e79ea24eb71930ac8967e'
            'b3527cd2d5fb337e2ea69e9fe09e52e8f844e00cce94ee75673c821b2055c786'
            'bdd3c8b7c7a3a0219972a7798b5153ab379c053b40f2431daff9c02b904fdcc6'
            '1e98e16fcac88c31cee6328d44b9ee1e5c2153cd86ceca95ca767429d7b8975d'
            '7df108be2239b64c2334376e73a0f30182f61ee5bbd6256fac2aaf4a6f44b047'
            '4aa56c7d1704c5711d14e0b123cd1f54f413645bdad17ae348592812223ab8eb'
            'd09e6fc640717cd61e419a137ea349d72b5f06b4763d22cd34c66c2732899d21'
            'a5fcd3bdaddf14abfd3dce671c73017542385986c695f45142afa0c2405832a9'
            '0bf3f000ab08f2284f31d62add32ec9ee19470d318ded2e59c66bcdc76cd6978'
            'ef5caf647a9905aa96070fe5e2b85ab6f3784fc6876ad10b0f2d2bc71a93a982'
            'c474649e7227ab0e0d918f672e0240768a732d8b29a22104586876e692cf8e27'
            'ce675431a8bb52dca3f8848707f860be9bf943c78015d0439f8890f2ae2840d1'
            'a261f4f02ebef1c8fa15cec3ce35053ffec5ee346d56b457cf5fd04f12084f7c'
            '95abfa758c489ce23ac2f878d1a57c2ed07ab929799385d11b58df606ffad6e9'
            '184d114c1294b431b6c22e7d9a7852adf8c9adf0f09c5749d98e9d5647570847'
            '82eb154124251b307ce8960f345cd4e07d2ebd6b00a9fd0f1bf265c4b19ccd4b'
            '672b9aa4523bc71b69ea3920a1ea1a4557afab118d516d9be0bbd6bcb997e567'
            '33261d99434a53b71eaf3634d44c7d08ecfe164e4996d9f274cdc79e0dd3712a'
            '768a17f38c3c62d6a552fce598aaa9e2452016fa1c867dcdf350876caa1392f6'
            '93e63d92b0505c035ebdc703acc18f9c7c6e3f49e47378a10095fb7059803d3e'
            '0f332ca18ccc7f7ade1e4719ca0fa1331ed18a11bed2c18894c102d7c4ad0321'
            'a89efcc6672903d665546e5653eee54dad81c946204aa8aaf9c54489c41217a9'
            '46cc0762e815871802d152a45e98449a3771b2d5e58d9f8405580039fb3ccdb6'
            'a14755ec62fceb6f92ad208a7d6a19190eb6ffd6f49998c87a0764bcf1350ab6'
            'ff88254e9b5ca71ddea1d04e6c820238f536d7e510ee5da39ad9e09f70043f25'
            'c62b757c9c45451425348a1553c4d04575d95f6eae952f5a5e663ffee70ef28c'
            'a2ca88e3c3fe93490f6e8c9a553ee25114d805b5e02d6a11cc868991fa3a7179')
