# Maintainer: twa022 <twa022 at gmail dot com>

pkgbase=libreoffice-dev-i18n

_pkgnamefmt=LibreOfficeDev
_pkgver=24.2.0.0.beta1
pkgver=24.2.0.0beta1
pkgrel=1
#_basever=$( cut -f1-2 -d'.' <<< ${_LOver} )

arch=('any')
url="https://www.documentfoundation.org"
license=('LGPL')

_url="https://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/"

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
  'qtz          "Weblate Localization"         1' ## search for KeyID strings in weblate and help with localization of LibreOffice
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

sha256sums=('9fe1afe7cac5ed0d1e66d4b5b354af3c87d7c6db86c1228da28117c566265b95'
            'bb5d75f5a5f89f9f9437eae8707d972f206ecbda2c42b2e7460fcede1bd0d2ff'
            '8c74ae8449cf1af9c92c993b25db77acfbac1fb53ba159de4a6fc95f01331843'
            'f4c6c9ae70b2034b36f21d7064312e5d57bc958dcedde15ffb324b276258a65a'
            '4d05e655e50c8176ad463507f2f82dc41bec8a8b4198b856fb1008c0398ce0d0'
            '7bb2c214a2c7c7b9985eab538cac4a5b0fb689a27753058b838027d1000ff440'
            '1c9528a2a79c40b96791fd45ec4e1ecbe9093bc274000de37aba6a1b0bcd37b6'
            '9de031e82b846de826ecf8b27efe707d9ab8f77c7e967ca6ea3779dc0cfabfc0'
            '6da0dede41b805efd7eac1cb702f9672ee4aedfd4802cfe995e4466189d8e4ab'
            '90d7253470f84227e434629154aba456bed04ef3d53936aaf5a6d203d8d52ca8'
            '4e64dd99e022e49e6b0f8298bc24acaf74ef85292268d20337632061787a72b8'
            'aa43e664eac3d7074b170bcba3d5c9350763cf4dc33af41a6b96078611243e54'
            '9c65cfd8b39a60c80063a0aae50c735071a0d7e25924790b24d421fb9a0a0edd'
            '93408841806c761f5c839ebf505e9c44a517202ff4cdd2b9cc5ed8e8adf30916'
            '25acced46fb1d863b8a63e0f7686834168a6baf2d958b2e590e50b5ac5a7ac64'
            'b1badd80608eabb57b6c51c94e555a7134db177e1951fa0695284fb0c97dc471'
            '2a87bcd49012f7bf4ab98550b11c8ed8049447974ef7c508c8ee3a0d47f23400'
            'ebbc203a55b603fbef5645ba705cf0100a8cb90a4d6cc88791ca06c258820860'
            'fdd4caae16fd640344840b44914fcbc1afd990b3208c0dd0f7dfba1bb4fd0095'
            '02bbedfb32117bda7e4ab84f67af1585aea7eef8ca6797738a523d2369aac91a'
            '64eb035ad623c33dc49d18b976c4a050d66a3e22d5c092ac3726d1bed90c5781'
            'e43220c69e7d80d26c16d16666e1539c5e2e87e7c29cbb4472f14ec7f8325e1b'
            '5d9a2d0006bec682fe82b5d574c02fa3ff583e693f6a2a6d0ece7337bbb95001'
            '50687a9b9224dd7d57e0885976c6a9583312c38219063067c704992f214c314d'
            '8dc35efc34b651ee9a5bf87c36ee5ff664d18f0d465b952d914b280702aacaf7'
            'bf97483bef20a1c37094761935d4b52d2281841d163fcd99e1755059b4f8bf3e'
            'f51e9e123674596d4e76a03f500b7fc74c72ebfbbb4ce2978879bdc85fedeb44'
            '5f275a9def44b08c71ff76a5c4892dd85a2f8e3a2a937c497638f01cec4f3c9e'
            '6e625a30251e783a77a8237ebc938788310005280ce12b127f761360301fe2ef'
            '69fa0b4ece17cfd6ac0e5e25121b731fceaaca75e2fa2c98bab5231a9211e000'
            'a274a45e5d594ec7942e510517fd47b07d4534bdf01088521fc0bf87894b77c5'
            '4d6e1dd6486792ca3b1da023f5a919160b7c38a5dcec79938e2c43089845ca56'
            'cd75967b88b3aa381cf0c4ac7a5088554147ebb8db610ebbbf13b38eef3ec418'
            '466e62111a8ff9bc525a95f3d041cb68dfb50ce939add764cf9b18149c0b0c43'
            '707844f5e4471cb972a86e3c8da651b266d819c623492016d3a418d144846178'
            '738fa78bd7c5031c6344e1d392bd0a4dfe417feea9313cc41f77a9e9e5fa0936'
            'ee8443d00cc840209b21c70c48c762ec0c47e450c38c1d5029de0e4722b5fa6c'
            '06c3f543de857aec0dfa9490f4fc9bbe2f9da2ee9eb630cdd69188b7a63e1944'
            'd0666ba1700c1727d4fd650502c30475ac2e03bc87313bf930c03cb0823a30d8'
            'b600bb9ac61a4b67296d0ce26a8d4dd197d74fc9d03a5cb0b8f44c2614642e26'
            'ed791eeb45661821abacb64f049cae7240386a571b3978eb07185c38a496dd20'
            'cbd652279cf735a47a60a652a2a703d06cfde0403ef31cea12b5f1f897a136f4'
            'f7e0d5df345c16806d57090a00e412aae1bf3a9e8f62dcfd2dfb2832311b7f6a'
            '94832b6e18da685e9560010bc49b5ca5083cdf1bd42ff19027f3315382d91faf'
            'ca4ed5c3ff684e93d53b74277d0b072c3ed2fef47b65127179a7d86ddd677f99'
            '5cefe3e85b7705f2f4fd012ef726a3446ba9026b39657320120e9b18d3080998'
            '5c42d5ebfbce63aea1c465be2de4149dad17ce59681324f3f773566f1e78cda4'
            '64dbef67a2e03ce62b87005330b443d84ad4d0208644a1f30f47a09ab0a5ca44'
            '81776b3b69889766c9f7529919c8f7eb7d4b9aa056668e963ebcdf19181b4022'
            'e8d646edf15d7ebe7987c812a9946946a1bc7cf5f8a53fddea71f46ef6b4d1df'
            '3ad9bee0c6dff6b4496c7a95aa628786e0def560c493b573cb03ba174589087d'
            'e83e607c3d731730ed6d2f4ca897382cbf9f6ebd5fc21059f3c9cb1ffef7c23e'
            '54328f875bd8b1b9f1b7178fac1943316bf9641c7ee9c1567f3f687705ffc705'
            '1d1514f958835182ce063d09500eff66e0a2aa3b9e36c0561ca0fe74083d8ca4'
            '491615c52a91729e1c487fbde76012128e5b04bdc150ab28e9821cae29cc14f6'
            'dedee035b82a7439b9fbc3bc55db53ef9150fa2be16c50bb7e35efce345fd472'
            '75f34e92508bd8785333b015a55cd5d8ea2bb428818cff7ed117cc7b69117218'
            '7241379bdf29ca5c55a01bbaee3b175cae02915b8fb37e836ea78f7edb01b99d'
            'c42cc0f84fb703ef36aaed48f93f580a77931e274710dd41965f3506dc446b39'
            '83472efd29af731b136e1055907747c6c7e463a74e09961d96b6ba6b655fd8f0'
            '0d44af2e255207a9efc447d62ef1c88c7196bf638933c20dbad2c019389d02ed'
            '81335337902db725a0620b6285b7b9aa8cfd6d58ef7747a85dcfe818732f6048'
            'de5fc9b8b603846297a9c6882e0236f60f79f48ece16086e5ec4ffdf56ba8421'
            '1a8edacb3e2a0a9f80608cb6a795d0a6d18198636e7c875d1d475b26c0828a19'
            '951ad3912a6c1af88a0aedb76f4522a75aa9b23e3a8c8da4b20484cfb67f9991'
            '3d6c13ac26a5a05041118246b3f87b58479a45b1ce85dc95f6eb132db8f19651'
            '28248d8facf4c7458d719d4e65f480635fe171565c3ae13a8dd861215ad1cc95'
            '4a63465dcc820c7cd425fec965ee3e308b3f1ccf84bca4b9b223be60d9dba6f6'
            '522b7da3516d3b71773efe71673104a15984203fdabf11c2655d0a0188fdf6c8'
            '539a7d2b55c2d4d797ca71ab929c59de93e1437cd901b37091b122ef49ee31d1'
            '571e929e8f80be78dad9af745cb8c7cf568a707f98f8bac32647e3572c6022d4'
            '7d96d98e1d32ab99b0ec023440de85eb411e786752b73fae5c6cc126e5987b24'
            'f41ccb130f0e5716f4c740a8a842233eeb8df317932e89cbd53e41515d402883'
            'a3aee76b6e9eb28c42a66042cb006aef0b910c63390566ad509c91ce33f31b95'
            '625bffe33cfba3cb3846b1732901ae5642a0196ac0daf3ce5339db28a771a79a'
            'd8100c47f977d64b6e569b245bafa5c05acd45db6192be81e5c20476eef10c40'
            '47388e278171334bfc8652eca75cef0d170ea9fdb9a84d3feea8d088832921f4'
            '951f70ee23e745fc2dbbc25421e0ab3b1b71304eda847852c35969c432927235'
            '51e74025dfc6b2850a5cdeeaa49ae170abfc99e3bfb863157b9228f76fbdcb18'
            '369d2a45ee04489f040390ed797c921ea74ab7a22f90f555d028057dc6a1ceef'
            '9113899a1bac3f8bef50e27e4aeb17f5de12cea103d102fedb3e66051b57ad48'
            '74d0cef69f95505a1a6838d41bbb21e8586cdd6258b2c018d3a664815e88c754'
            '341f1b92b47358adbf0ca646b87c27775d6b310e17199a05466e33ff11a52b3a'
            'ac1345019fb04a820b03c1ec26d9f5fd1a8d62b29776379243cadccbd27bf01c'
            '57c2e433f555369b766730ebb53d0eec6ea9093a801ebfe0e394f1a5ef45123d'
            '6517ecbacf6b41d84f55f4a0fe1e671b21442a039614a977a08e9fb76a5f13a4'
            '600b07e52eb8d595b003cc074bf248e0ddae3e97c40a5c9c95ca72af6d36c775'
            'ef82330fc8aac75a71bf2ad74d51580edec8ab7eecf2ba4fdde9d02c3c44da53'
            'dd7455a3a0baf662a54a34eba68d8f56ec0183721b679dcb1152aa679554722d'
            '86a6311942c615d1e20ba17b2ac20434889304fe1aede3ba13a158836bbba57c'
            '0a2ef1d52508b958a93fba6f539d5a3d99f3af2e2dcc47f7ff94665be0710648'
            'c4081e3a350ed5ccdf529f879191ec1cb3dacf602212ef1d420cac19c83e0dc2'
            '6ad76025502ca34a9059f2b34c2f1984821c499496b53465696e3f218d7db3c1'
            '9e1dc34a35dda8e2fa62e409d6529f3e7adb586912df42a638764108b3c73ad2'
            'eee7726ca4f94027e9ddefb9458c1d89588552a4647ef01eeec73d96d514afac'
            '725d7a9566222abf0e278043b22c52e0ef29898eff0c0d28fc66a17847a4a989'
            '572323c3b72734772d7b8ab1ebc35f2d89e037414a40e761a37423c3a43f26ee'
            'c06085563f0bd0a2d153c414e2de3bb4cbeb5c356f483171a2c43cdc1a49732d'
            '6f70d619dabd90d5640a203f5ca7794c517d25a7f5be26045771e6b125dbbbda'
            '75df86847d28b2ffa26aad954cdd70c17f1e0742161cf901162e8e515b1ae291'
            'bc7864ffd4e0f3075214aba3057ac36351ebc9bb612610565a67ed9c55eeacef'
            'f9079ee17006571884e5da16d6ab23a86278da3d84e7409919cbf99fee062555'
            'ed827e9869beff277694d5d6cb8bbe6132b74ca61857202f927e437928f24a88'
            'eb9dc125968c6d3f69d13bdb7b25c7dc907a1379a62ef4124508b69ab33087c6'
            '9ae6a46dbecc9d62bafd8efa2435fa9a2a2950df52477d7b51dea7863a7a97c4'
            '1e2cfaf06d9a9765748d4624ba7e5f4b95746b4a5cb1f5dd37ee31cbe508d161'
            'bff9358cb327de896ce14ec2d38ca0f6ca3e5d20017c4cb902ed53c8a10421f2'
            '7b794eeefe36626c518cd6fb71314248365eb77c15ec373ba650b76821993c9c'
            '10db21a0cf6e9690c1054872076d15a738d977d3009c7ac4e93a5517e8bb460b'
            '1ffb61a06bc655b2bc9e9ef7c62db27ca59e1aecab636360d04229142f090004'
            '585eaefe5d94bca87c18764a9515659483615957bf1d659d3351a7c9c8af4757'
            'afcb755436888b093099da5412714493f201a0c021908cc06de9bb8dadc8eec1'
            '59e3010d1436848d3a563abc91d21a2b682266351df77fc90bc1e9e7e9c21db2'
            'd6e81e898573c801b92d6860f0dc012218d45d221919c66a4713c7766540a3cb'
            '4353e9cb885058da748f02bc4fd7bc6c5f5eb2148a4c1744a0f1082ef6e952e6'
            '49a83d56e6d7c9094fcbfceb280c6d97c2c77533aae88febce70e683de849f8c'
            '18907d3ff7eed6c3c1c06849b603b9b38850b99742fa3797611d4e2aab14f216'
            '16483ad02fcc7ef850cebefc1b268eff2a602338e34f7fac4ea1e3e1e763d39a'
            'f6e2487f23afcaf196123344c09dced7891f39d5f807e4639299652829959059'
            '778330dff24ca20525e45ea391676aa8eaf33d0fc44c40da784a502968ba64c8'
            '34891eee9eef98323707f643ca42d35f8181e9049ed12c4a0e230dcef4ebd856'
            '9d2305ec0d019e934167c958d64d41bf84e5d569ba294891e21acdc6f27ca41d'
            '09f4f363fb34267ad51bbfc5f219b1a2f9069f8dbd25d7314a0fd618c1514810'
            '241e1fd3eb0beeeb7f2285af26d83ed64304e5dd99f14d458bd48864977074b6'
            'e0d080a649444545aa7fdb4d86afd5950691ef14fcb26ce8e9ad72797e904742'
            '05a65717ea8357d8fa13ed6355dd107061a2fd166a0f4cbc2c3ef0f8e178e09e'
            '7507c3233ab5593d7f066335e844e20961b4a49f60d40435397e99751f195633'
            '0532b8179f55add8358ee29b6ff5b1c26e1314025d3d4a25da528d06fb707e4a'
            '77befcd078d4f6395c50de5b0e34dd731c5296c45448da3b550a6696850c1790'
            '76ba51f38e4f67fa310e9a608565e3ad93c9ad09184c66db1bb29c18f564185b'
            '8f89bd824a4695cfca7fd8cedcade0e7bfbd0418bdcd021192805819f2b7c4a7'
            '7ad3ab36b49dac5d54bd74b55bbbbd7e802cbdf5355a8afa3d964003f1650d60'
            '6d17db82cb703d596dd3f2f8147216775255e9a9078117a783b9434d3c6e0d24'
            '6e2f918cb0e41a214f1ce142dfb8208f083559b6c66bef1fc6dc1a22ffdcf2e9'
            'c5dd7c7f3aa772fac28b58f57038b7418a7a978f85aaa4bca39bb60bd716a9a6'
            '32a5dba76f2c4a206010e970aceec6fe47bd4303fdbff644b5734b109ce16928'
            '5d39ac02d92e9834ddc3e212037560b8a915d623f8e879ea4950dadfacc14732'
            '31d821dcd446f6c6e6647258297f9de7c01c8f152924b54b404fa734306bed55'
            '9cbd47d7f1bcd1897beb523a52ba1944c44ef2a81a6844119f6dd2dd6300c54c'
            '022e0badb2794c7d25e7249eb2fccab87741f711666900501ac98f5ae4838803'
            '2a3d96f5609070ba0ceffc1a7f38469ba308f1bdbcb0c2605cf7d5cee6f3bf30'
            '3b1a3bf97423149e5263f9ffcbec3cd011960f4ab6e43630b6626652154f6384'
            '8f69d7bc866c42b4950c286d93c58b0c9e46eb18ba42fff1fa19e6e3260107e9'
            'c6a84a5c723d5b353a01bdb7c93bd8ca6eca82394423bb7e478af703dfe36aa1'
            '370e79b120ea1eb9559747a959dd022886d6f8af3e82da64a8a2286dfaba269d'
            '1b7ab070861f59a656cbbdbe13bb690ce5b909886fdf1287e926559336a69904'
            '52c68d8864930f993c4239fd0b8f39fb61be5bdcd19e0efc616632a7735cdec5'
            '56d3efd063fb7f980ae50dac5e8dc1f049f6872a8e25b432805367e09b0f879c'
            '538e48aa50783d5a7cd3bc3baca4bd1267300273299aeec9add3badaf1b2ab53'
            '14f596938e34c35ea8c42e320d96bb2575b669d91b8cde62e25f22872bc4faa2'
            '85aa8b2b8bae758f5fa9bfc83a73f9815382331ef9e10deb4c4b64c1b6de7597'
            '33267346959cc7336b1d3ebff879e5062065e1ec4de8ff97a304ebbd2f0b9d02'
            'edb33b87546bdea72e03dd3e72646377fd72755a25e3218b5cfad001eaa44e88'
            'c46f36de00bc1397349ce8b6377dcc4b758b4f9a691d298b48316c9b573ddff8'
            '58e0210ab11f259c3de482951aeae46e5435d641d379cdd7756f68ec828b441f'
            'c1d380ac540951f9d97a73e2be6c7bffaa49d2abc902ad1059bd4e509250db3b'
            '2d5918d00c34d6adc71c870c39c528e25ff2cf289401095336862162efe50052'
            '742b6a6ad52bd412e2a7ddd4ed8cb6634047948fe6faeda1d4b0493940cd16fe'
            'a7d21843edf4d4efe9f1c6410a87c78ecb2c255a0dee6a5e11fb329096c1dfdd'
            '276a34b3aef8dee642fbf1ae5443ca83c53299bd17ef2b3e48d5ea6eab34fa32'
            '39b1a1753bcefb2822965c91ad8454474ebcd9c635938a41e0f302da1a3ccb34'
            'c0d084faab257aa6595b81ac7896322d9dff7f3fee3e67aa231ee2215553136a'
            'db7f4984c82db1e5a12fefe051e2dc7c3e8df7e6e1a94eac4ce36f442b58d8c0'
            '4e7840dcf77e59c41f424014217db3caf95a73f73d8e3af297adba43b9e5fc2e'
            '01e8f97589d24c779564969ac75bdb472077def8b20c12952d4782b62cb0107c'
            '25f27d3edcc1b800dcc8e18d0c5b90abe74a7c75383a15ca4f77df40a3b8a891'
            '6b27f5af323a04b5b660e2b29c866a07d52c34dc10563b892369048b3dc6a2f4'
            '8da88a5bfc0d66f4dfd6292d2f2e363dfebf2c3abb761ab67d384804ebc5f8d7'
            '96ac8a18c4775d082d3817f37244258dd5c45da9e9993a6732db934db59d3866'
            '05859addc2d1b6ceb9e45db8a2e3d8e2797185810f43691f463ba473eaeb11d1'
            '277683705d85762730b274c8a78b77b606e6dd0e89b8822416528ffba3421cc6'
            'e139a8d0e4d6ca3cc374b770426ec0b9a5558eeaec3dfe5685379f80e058cabc'
            'f2f5c8e6edd520a09f29d904c6f54ec7840fea9dc62619e4bff7c17e83ab5f42'
            '7530846e2ceef11c41d9957fce853d7f15e091ce37f8dc2c628563de2950159b'
            'b6224825046d45b03181709f1a506ff70af00e044cbb296981f2c026b050f415'
            'e50075e15b43c10862a11f0333e586c7d457a1841b7e77975afe5c18e2f6f733'
            '9cc882ab6c79105b6ee6a157e08779bb6d8bbcbc43c4811f9ffa8634cec4e094'
            '260845eb48cb4da42b4b0448b5aab81aa23c66db87af7bff8ef2f8b88355bd44'
            'ca989cea005c2c5233eabab4f6cff23b36f43d62c3b95b66127181fded19860e'
            '2ae830c74579adc274754887b740d728db65bd9dbc626e308af643944458e2b6'
            'a1c7de9039e9f9f48f29327ca506c77b564ff93dc4aa27c0ecb97c9ff5b25793'
            'e0d60328149e42c64df4c47b8ecc6820a9343dfbdf32172a19799de07c8655a6'
            '8b17adcd545b3d57c451d774f17b7baeba4a474e34bb3c3a8b51a90315c4fec4'
            '8a6f6d9f47406df49f674b35a97e82bfa0016c678b0a7aa5b160eb90def07409'
            '3f7e0b222b37c308eb31df56431714fc5fe43f641271b67432076ebb97e15133')
