# Maintainer: tioguda <guda.flavio@gmail.com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgbase=libreoffice-dev-i18n

_pkgnamefmt=LibreOffice
_pkgver=25.2.3.2
pkgver=25.2.3.2
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
sha256sums=('8ed83c6e382d93da78474142d7e09d23666ba3750a112b983af3020357fd7553'
            '4a4c6199dd1f86b30bd34dd99c3b2e3b1687c67be9d0b7e55801cb1b5bf7b9b6'
            'c36057f784cc9d8442ccbabadd853322136148907f395f6063e21593812f0c79'
            '95231efe31f4718f1eb9d473d2332a14dcdb94c53104c63b0e82b8d4c9b90efb'
            '1f673a01ecd8678354f82e9cf86c764df20361d08710d07fbd7586817de45b67'
            'c0b36569c02aab32ea82d9c62960f46d6c765bf379e9c9070fa91b9b681e9f16'
            '54a94475af0f584fda675db2250f6f66d77bd720c4c32e8eed4d80d1692deae9'
            '0b079808541f38bfe0f418e5b5852d909b1fe9b988cdc8b8edaaab2fee6517eb'
            '6c03389d753962b4f5f049177f2904c8da966029a84df144da914f67cc230f21'
            'c7b81f51b8ec9969a76f6db8667fab664f36c286542df11bba81245dfb76a234'
            '9119adaa44b81ac34f594c774cf458ad0f6968900272c3ea7c881a2c0eeea241'
            '9036892272c9695e111be7bbe3b04b78ff84305c99f49dee4d7633215082d621'
            '9ad7d59e708e8dea6af1d2e0679586d912c865c3771f394c123012687ba5ac26'
            '27a9b16be7d4f81246187ada4fabe56d42428ed51381e802cf2157fee9368d57'
            '18ca5c37dd52aa02c98e72060cdb8407f8fae9fb1cf139cbd7df0caa5468b966'
            '3814b90761e9e03ae7bca135f9031c6fc56496a5e2a9aed55262fa3cb2be1b54'
            'b057603e19f8df16ed7d07001ddedc2f75fcf2ce3a97b5fdfb43f14b72367a86'
            '3a4ce67190f0e905c2572a757b719eaa37b2efa580eb75e6c067d6c4fde56c35'
            '7d2b0a70eabc46fd6db002e284e4ec594fdad7c86074f019ed61a6bb33b3407d'
            '45568a00ad67143ab49ba7624aba60f312e34b99df318c8adc09268ed665cbcf'
            '717844618f622d097ba2b23ac4771d8720167f95fbf29f2b5d3149cf0310cbb6'
            '2166bfe8c160c37fb5fa32d2130594cd33dd3ec700d3e67ba6b40d91ebd815e1'
            '533476d07dedda0d91438e8aa0ac04772bb732ce7ca5ade196bb2de3f2b019a9'
            'a2cb746446db6622235b551c55cddac28b3c8bca85954cfcf045a50c12d7cc2f'
            'eaa762e4a174c62b5d61d94d560d99bb017ed03e4f1df49f4d6767270f7e08dc'
            'a08d09268cd396e08ed27a4d5a112a934a0bec749ccf5c47688c082b421d1ae6'
            '1187767e61d56f4b81600a3151c4da4e9905685aef8b77b85678d8e239ff3895'
            'b5aadb06df88edb98ae700a4cc332728dc8f497837e7d6a30c321e29544b7ea0'
            'f1e122e570a3b6d891b464c13d812ac7ff8101f040c2b104378c4be2a449d31d'
            '859b043d339d3e16a083f7a7fc95699aef74dea10fcc0fd034f9cdbe1863bd21'
            '6335984948d42965ea74964d4c3dfe8a9200365c0d214057dea3f1fe9ef38e4c'
            'b80dd7d12343f3ade9b97082fee9c4ba86902fe85309e822dce75841ed3f0898'
            'b3016ad44cd5aec38c96fa9cdf38f5ee9fef30bf0b59044c1891ce2680ab5485'
            '1070fceacaf9d47e9a9253aee94654beef11fa9a3284f02ba0a8327b6553778e'
            '4fbfb4ba6bf5c27dbc38b73af914d25a2b85b16ef959f3bd81c46a4b4d889e59'
            'cfdc90fbc51dc544427a852a84f4f9b104d5abb87e1b2bd8d51ae726d0734012'
            '6e64058398abe19ac7d7033559efdb0fadf13697a4549751642476adb71e7721'
            '2a8fc7877bcd22a1a350d74fe3865ba18163b2980c9a9158d7fab11ee466ad4f'
            'd6bba5a4056560930f45c3be1387d07db05481f8d19146e6c13371c9aaf33c58'
            '3711668f35433f3174c082be428be24cc4ea30aea8d67836cbda80a3c282ddd3'
            '2608f39b8e5e5c1bf47538ff478d3ff2856895e8f2114fa72f441682bef0dc0f'
            'cea3cd2711af2a5dfe27651cca5ba9fb44b71396f8def903675805256b2fef16'
            '4676803351459d85a4bd543a56e27e4746a4c03b516517d449284147708f9c3d'
            '49fe1c8bd0bc9c53dccf5790f0e757f6567f28f740a5793b62bd967f64300cad'
            'd900b8ed55802e8084ab2a052e58c2e629698bbc1c9ceef3823cb42694ea4e90'
            '3a72580ce40bbc800d4ad4b5581f7ede4e4d41c445b2d18a586c4892174dfc35'
            '62e6daf948eebc08a170edba84c65e2d0065b2f613c2e3f885566f7ab32bb40e'
            'e453e0d7ea1901a4c7060bc6ca2959c153626c71b0dcd0b66d8a8f838854ac7d'
            '14cc364abe8146e16dc24a0bcaa22d97dbed8b83e93eb9c026696c5e4c5d3f58'
            'd1052f93abcc934b02537f617a303c5dc973ae90435fc1dc511dd2753762f18c'
            'd4c4b422a27413b8aed4f71559562db894a9b219a21d96a217f289dfbbfc81e2'
            '1ada276e74cf5a2efd0e2abd8742d2bc4e5af0e12587672cd6c5be6402bb36b1'
            '2be3a04075a0f29217d63ee1c3378b34e9ebd18d3f284bec5f08ea5ed5701d79'
            '26d0141d49939fe01767cc0fd2d4d23e28ef490487add80a8fb07d38d1ebd2a7'
            '80f1fe48e96dd2d58ec5cbce859acf02233137348598419d5d6675be381b99b1'
            '8609a84d1f774d0b90e7da709c1350afe9d5f99ec9aa80ee183f034dc82b9ab3'
            '7b2f9dbc0007bb1426b487e769ac556349f1eca7945c737a776ce65239306ed3'
            'fff3801e91fa322811b58e74a7011d266bbd312b787d27e0100dfe8d66a5204b'
            'a6ec0b6ff3f5b1c1c546b5203ed1f60bd5550e1e76084dc9bf43f7b69403a35e'
            '97a1d582ceb0d78d24a43b28dd9943f2346659082013a67c8d3bc7c839058222'
            '390bcfeb95dd7e2eec4036e9c6c30398d46947e7640da3567bc615fc885e77e8'
            'cb5e5ca262c699a94b06f27eb447b635ec758bacc80a93823782d40f50229298'
            '4c0c5e514446a0c10e68738f18009748bd9ed8c515954e497077d6da988fc70a'
            '357203ed14f442a1703b33971421e69ca96614fa84e7ed015d3ca5f596d345f7'
            '493919ef22b112dcb720a02ed119d01632bd81d5941e41d6f809644743678ebe'
            '5d7874e0a17b3ca2787c5dd2631582db62f773213ae7f2874eb071d141518c0f'
            '097c31f60e2450292ba1fec7ac3745afdd248a1ca84a7b7aa7fcf6666948f75d'
            'a30562c83fb2db6f57820e8c5a49e2701def69b9943cc3df0d96a85afd11389a'
            '85ce716ebf9f30d46ee034f15836cc62debd96b2c81547889d7f322547e267fd'
            '1a7631beaaf336d5fa6bb17dfaebab822cc9b03f6e4a19fbe8c9fb9440bb5ed6'
            'edf73b68dd811f81045cec7ab2cc4e3fa793f451bc71a2d89bf4439276da2287'
            '3eb9c30658622552929f2debfaf40d9cd40348bf37d92ae4e69668f819579790'
            '21ac82be8b098013ddce57bbe6672b8da59c6a6a943cd47e5c8b568a239cdcd4'
            'a9de9c8e4afe3affb2090d7fe0292b88a182474f3917e0b1c1b1b89496da5189'
            '273d7d49c31d4e4b49515050556300169066d62ce33c1f22850f51ad529cf259'
            '435c44c213f5ec79334220e2ddae2564682053aef8c550adb833534fbc01c110'
            '212ae8873862d695f02e303ba21a40533ca104a0f7fca299945ab6946d1bcba7'
            '7433af7bbdf4aaa7c4bcb2e6f2b5bee36af8ee5480d37f0bf445a6e8e54a07fc'
            'b23ef307fd16d5f635b9dabe1e22778dade81bc088cf3c6eaa19f18f0dbd172a'
            'e8909bcecfa988efa03da1196c184195be5fbd9f679c57c060e01acd2eb53afa'
            '8eacda2c4dcc82b820d42d60e7dd6d72c34fd931e9137b3d59256f90fa3a0703'
            '0b69a5a68f84ac7fba6eb928d2ac5c0038b594204d101466670432f3169c5d20'
            '0afe9cebc0def42b0e09ac677a722a3e634a8ef320e8a71dfdafb8d759163d00'
            '2e5eb4924e7251380cea97aa52774e04177a560d15bb8c391790d2f0f64e2355'
            'bbf29edf10268288bf7466b872b30fffcb7f393eaa54af96f4521a9713e6ae11'
            '210820f2002adaac62019792d1f57b4081a79bda217069a12e63b14490027c3c'
            'acea13ac8fad73e8b2485155163a1e9f6b68b119e0306f204b4d6a06df1fb1fb'
            '7048254b558216e1e1db04b549e8a62cbfe7b18cf7ea9fbae03396ee09cce30b'
            '46a05428e11773f4a7e13c00837bb18ec30a73843d1ad775a16345abc10dd755'
            'ed147edf9255e323f361fe1a0ce8c5803503d528eb1d62a83b2522452796e941'
            '287038443abc11d2f0fc8827bdc6ec7aac67e0aa5f31af8b9a96257cf36f8643'
            '7e38258a556fa63d6a2878741be73a68bdb8162721389f7083c9c8963ffabcb9'
            '596d9cbf9dff97d1c93355d87dc8dbecea491af4e51a6db6a65f727cede729e5'
            '485ac1e2610fc9b2033390f28c6de1d482913d04edbdee0b1b71235bb8f9074c'
            '831e8df0e3102d4506b6e217c6337cb970faa2355f1755db471c1eba97e4aa2e'
            'a094aa6021a0b3883f7f50940296beb0b2de5dcf1c7d104955bc3ecb98ad2427'
            '7406b794ec88ffd792d8c4b266f7d96e26e17e76d537526230c9aac3864886b1'
            '6128e9482d3b1c0d0d15febccb7beda96faf1c701792fbcfd2710d36bc29e1d7'
            '79f86f68adeb3ebbfcd357c9eb17f6112a9cd3e7d192138a5c730548411e8841'
            '8dbdf54d5b897e3bda9395fcca77dfd8953e4cc836b3a55b299a303c741621e1'
            'ba0ff01636f8dad539ced01e6b4a300ebed9873106f9ea97616c4ccbee69f618'
            '1462429c1418c9157761d6111c339ef126237ccb985af0af88c019b51d7a5a6d'
            'aae418bb7b73e4a95f69828932fbae86bd10d13e09e74f7dd576dc16dd00f79f'
            '38b92e978ea9b6931a8b9deaeaea55143c622fbb28adb9d0d6acbab3789ba9a0'
            '7d477826793026a71734d862839603c1a5a813a8d0691b2098a8225028345bf8'
            'a68a65c386629a56510445fa431ce8f9d45003d23ddd6f3efb0e320c9521c48b'
            '6ab11f553da84b9ee9daf8ca93ef54a0b50478b0a7b322a9d55dacb88fd59f5b'
            'a7b31550252a7af0c2b53511e8369293e726cd8a0cca322b41b6014e031fe3b9'
            '7049b29dc17f4a3031bf465c734417186d0afd9bbfe76387a51a8cecf4c6d4f2'
            '0744d117dcc74040a30b714064b08ebd20e8192fb964d9c16601f57e9393300c'
            '8b12fc0fffd71bc89dc5b0eeafb5ac5ce2cac641cd986bab5cac9b2f34b5aa59'
            '9f1a79ed7ecd16d77916f0afae475fa2101d79564ed77cce63131c6aede5efca'
            '59dfc1b2998725bb2dd444d9b60df2ef26d19e62eefb1685be8f19de56e8535f'
            '19e74c4fff1da54a76d93a2db965468856763cb30f06ed38b71dc05da47ee4d2'
            '85a6ca82658b6d501f89b5dce0e598f769156ae8e9512bad3b350002ecc2b4b7'
            '766bf74ef3fd0c87ccfa65708bce5432ae0fe24d7050c153539ca00ebc9c8fd4'
            '6f77c2a40554379b36cf3ab267ac923f72b0609a655ef71cbb4056f8c897f26e'
            '902c063878ceac9b214b04eea48ade23ddd8fd5d4587d468442f196118397afb'
            '46346c8a2aabbbae0ec9f4315d8c31ff32d1fc08a272f73dd5d4126238ad7d1f'
            'c73ac4cf49fd70d9a449b50c7796eec4206724f3010e7790706d57abac526349'
            'e5940f6f25d989ae432cb167aeae8b1d91a37f2fe814f5672e3f23b78b45eafe'
            'f10043d03448876631bb030954fd427785e88c0a15e28d599a73eb5bdcfb9dfa'
            '9c0c31830f4976c3babd08ed3762f100d2c9ede2a9a30f5167ada9dbbcee0e08'
            'eedbb6dbed0db7d10b3e437a8793d1dd008f6db1af97b8b8657fe8b0be11e45f'
            '9854ce42f774d94ad5e0d626fc39fa892d59f86df37550729e58a88e5cb5e2cf'
            'feb796bfd7f01364d1a2712c3b0abcc47a0608d0f4d5d90cc35ade28eb5d5073'
            '6ac6ea84ff2649ce7ca74a4cb19698a8fd441d1b804443173ca214d01fd25e8e'
            'b956d628508a82f0e54c3ff6b37bdd9e4a181346865b4e0271194a811add4e67'
            '8ab2e7dea9cf4fb9c2c1a256b5f71d3b43c4999b2a8e8253eb9eaf01a415ac20'
            'a3a0340923e57f02915f2c95518a769b171f84370565ff153393d1524b3976b7'
            'eed7d639ea07850307696137c93af44f8949cce11acb28a3a0d2e4a74c630ecc'
            'c911d8b4d365d6fecef4d28dbd12af35e090fce7c8c3b2ea2b75f78edf64b08e'
            'a7ed9f01f93d96c00d25e1a6f183bdca86e2d42c245539693784cc662ccbc003'
            'df8b82594fbad460ce3b2f2a7f473519aa266ec6ea6d24d18065408f012d688b'
            '819e903acfed1970d734513a2fabae9051f601a627e3459157e10b91e57a4ea1'
            'd89004b22946cc069890d63331783a1186a626299974b3b25f5fe464e35bdf69'
            '5207b0ecf74b1fc86580f15d0005643a22c591125cbd68d72ccd07336e04e898'
            'bb9a9a3d846368965feee75bca881419fc7a46656b7687fa288d8adf9f8f928f'
            '0622ab3ff263e88fe2c8a30f2d1d9bc6d0b3f90bd9e298102934ee8074b398f5'
            '1de1afbec94b077e0acc041038f4eb374cfe090ea85e2f67275a5a3a9c57d622'
            '4a8b00d3ab79550f64ca2c450e0d6fca34e325b896fe2a7b059be3f6209fb80a'
            '33b49c514387bea44713bf848f1e2fa6893dc0061f80c59a48f5a6fee2bbb0d4'
            '28a97feaaca97df05bc181bbda2e6c96d0ba507dce4c41cd57d3f0ea6ba9b7aa'
            '37c1dcfa961155883e66bd506c61318f75fa8372549386eb613e1aaffcc13460'
            '5f0bbd96350dc6dd387607abf52939c6104b3f9d3a16848a962db2ad494cd7b2'
            'd70b1496ef58567e0a920773ad182fa1744a777646a40e8bd9f12d5dfc0360c5'
            'eae8b0e56deddc2009961cea50731798f073ef6ed59eb438df3e1cec5737274b'
            '5b34989543c26dca010e8d452bd375181d2f34bd38c53bea01628c290ad4e43e'
            '5b1d0af297980fa1d37d602461fb8d7c8be5b8faf08bf89a19e62a8f00300874'
            '8fa94813ad9a20b16358554c9285f4643eb73af07b677cf8b0bf017b27cbc363'
            '6ab1e33f74345cf3f2cc6ac8df19d6f1181fab747c96378c3804d270cd39fd67'
            '74ee29f960c143eee3b45aee4e1fc1c187152e14725060dcf7909f4f9ec5b3e7'
            'e01a2a974085ed7eb5a852dc066ed0a261cf1e649f1838906872856c20b887ba'
            'ac182c59ba1f661acbfe52ae990f2007e64f6c63f5318181636640596eb0a60a'
            '0ee961a968ac4da843c363f0b63dcd77d455c6fd3e1f1df77bf3d60247e0c28c'
            'ae9a1430c6bdb55767d30735ec1e64fd4c86afeee6b0bce8fe5f44b7b0cf92ff'
            'ad1484a753801049d5e9f0279115ac5a95cb1973debd6da70acf9a92e6901ce3'
            '5ac865f85230f912314ab3406b931edf8a2e8c4dcbf13aa5b124e42ae6b2546a'
            '2d1221a081b8393cc54a3d27ad748db2082a6f0aedf626656573270554b21c57'
            '23616919bdf7bc2e82577ea55dc6445151dee14a02027fb963e99636b01cae5d'
            'f898a0f85a059af3b120b4463b7fbcbf91f4c579993edba3b6ec5f9163f93db3'
            '80bb7e17a319ab02aa4fe070c2a141fe533c25c1e6c57f82fe8020461af90212'
            '6c4c81d3241788f398e91e2abdf3ebe3d6f743b6e691903530653fe380cb7051'
            '0a82c27ce8516f3124f58aadb67ae9ef834336d08280c5fb2113b262e1f97226'
            'df54d280a97342a3f741701b390212e0128f3c242a070593887bbc1a31db82e0'
            'a92ee0a04bca5c8c6ae6178647675ac12182f633f48c56cdae3e088ea2ea94c8'
            'd7f1b726cbd16c8a14c84bd50902f411057f68105379ea86607883359cb4a419'
            '43249c1f38c93bf26dff2435d80fe047a5cb0becaf9d1d60dcad746b45e18e62'
            '0e63e85220957393371e850190137152de81bb7b4e645a0de538d78ec2ed31a7'
            '3df0e04bbdbe4d0db5ae6bca0b7f5d0076dec0cca3475d8cb187583dd2c4acaf'
            '53599f5ad9f32e15379600949ab99baa7d27bde23eadabf349a281fecccb4f1c'
            '30d158e55f56080071832cd6a52cc58f71aa00d6236a90befca5adfe9621ab1d'
            'b5e83f58fbcaef24e7e76eee0841674e2516947c729050fff95996d555a0a334'
            '24922d08171ae0ec633fdbdd9e23390d774f28378c812e36675bf46305690483'
            'b5c39b4cdd8389b762e457a0262a0cc9255849a82926117c81da44f6d373db2d'
            '3abcc583bf02491d6dedc597de12c2d4bdd6c0b63e6faaaacf57e4175101d68d'
            'ff819556cb4537015bb9035f5ed7fe6430f894ec81f8e1e206142f3d4461777f'
            'd317943a45d05218f947461bdf25475a3a95c93c3f237606098d068f01d149d9'
            'c151a81dcc83e1f9042e065f3f96c6545a136f977120eafc388851f950beb3a8'
            '9de3b41acfd872fb1693932d67465341e141bd4ed82c6980420917f70772be01'
            '49c7a2f1fcbfa44ec2be3832fe30f85924d02b07f40a0a4c3392c79143bcd3ca'
            'ae73d4bdba1bed56c540bf1b0ca2f3277f88b86e8f4bd1f714748540d019fcbe'
            '096cc5c1ce4eedd7f7893975ce55c757ae09576e8f257094bfe7c2771f0226d0')

  if (( $_helppack )); then
    source+=(${_url}/${_pkgnamefmt}_${_pkgver}_Linux_x86-64_rpm_helppack_${_locale}.tar.gz) #{,.asc})
  fi

  eval "package_${_pkgname}() {
    _package $_lang
  }"
done
