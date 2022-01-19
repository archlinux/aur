# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=98.0a1
pkgver=98.0a1.20220117035808+hfd384d84f3d0
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

sha256sums=('ca7f80be3c6368b49715a2ae89414670d7712d7dad5d9054c2d992f49d42df45'
            '1193d9263bc2f92d498a092bd7961ee0fd38ade28d0d8c2cb18512750e2f13d4'
            'd3fa62d1bd6082b0fd9e855a66b2b47d733a6c42215052e7d730e97277860189'
            '9a7675e098f465a77b2b3b5657cb100ffedc1cea1648aad074e7778b435a4f35'
            '37c58ce30a25e73a2135cd7b735658bf410ff4a3682e593a13d1aa84d1f79587'
            '0ad1707b00f0930e5ff5e141a1ba5215a01d937eed6ba094b418c18ac0462543'
            'cc234d90e034def3a093980e6c6f589b59caa9842b8542b55befac1dfc8c22c7'
            'e9704b53b922677eedac7838a41d1287ec333ade08bda6604a630cd000afde25'
            '6f0ebfff2ef8754b73f4c75592bd2ec492414f745332454c1868c6b7a07785e2'
            'c8584070ecf5f29a4251756462a4874a4d70dadbb3f22b2792897aa926971e91'
            '5842828f10ef27153d2b260e9a45d811a5751b2493d26a9a70f5b6c032b3e224'
            '5c7048b3b81dc9706d73f3e30eed5e3b15142e64a2835f5b6029d1008442d5f6'
            'f392831996fa5aa7ef74cbb0e0d64e432f15d3bf426bf01f3ffbcdbca91fa749'
            '60d120913bcd4f593d73074813c223ccd471b53c05109c6500fd44690ca21a57'
            '981e99c03c9066e8a7f281be42d400198c2caffa21bd422b2aa3e6bd762e8702'
            'dc4f5dadd187f0a184ade45d1b9342f7d01f8f529b1accc71de2ecbadb97d9e9'
            '30d2b2be45105a71cc976db0853049c8baf0248749f958026f2bbf863690db1e'
            '06ee7c579632cd444a8e48c9012c78e630768ca3829ff5dfd1091959b00f6c6c'
            '7c5b7d8b67b49160607f4d5a1696be7ed1a62009e162837b12f836f33ecec94c'
            '2eaac7d98ac12e0c05d842a705632395c33ff27306ae8ea90301a706dff1c37b'
            '340cead8da83d58056fc1434a28f27d7256b56d41951c9090205843c3748125a'
            'c852bc012efc6daa2671d0ea6ace53441d4ad9fb8ce649e1952bf4eabb4319b7'
            '692203a1e2692d35b60ecf0d4df95839f45c8ad38a7e3aefa66634b606eb8e85'
            'd89cf22de735531709740e753a894fac7a17a640368a68d9fc7e3b34df206dad'
            '59447895770362726d17289934a0255a2ff23251b30f0a25f6d539581c76603d'
            '4de9ee62f7cfd768004439e1a76b5b742c1418422a194859807cca542504c958'
            'e6a8fde3c3595e33f65e9b4e7126fbf779509e02dfb1f74991a172a07e31edd6'
            'b92fa889239f453698c46f30f1256f7d9ea573b6be1aa39d6575f32ddad18245'
            'f06658ed9556d941b463c1513ac04159216f938109910116f953541ba61e0506'
            '40c7d83de601028a911aed46d7e5a50bf0781d4c17b06867e305c14666301f44'
            'dc40a715d6f49ce878c9df91ee5d3dbd34f61820ac24983f19df2bacf7f423a0'
            '4bccff8061db78f3f04abec5d10e42f8e99a8694cb50d48b7ebd4093f05a5dc3'
            '05b61d599e383f953ba7cab040e29a6c5c35fa11dc35731ff55c6ff5ef56d5bb'
            'a27d957f526b35030f58a7b3903990f5d5fdf9158a042a76104a247718ff8426'
            '7206006479bbd4ff0b0487ca38d29d15fae25ac330668a882f3d511fb632167d'
            '018ae41449efeec012030562a5927c3c3b0eaea96e94448a675dbf50922d0f5c'
            '2fc9f4cba33add7ebb2f0e780ad9424cf65fcbbc731c0fd59e85b7f786ee46ad'
            '54c5bd8fbb9a4de175276c486c9d9f5192e4decae4d301e169e109f094d8430b'
            '6289599cd4b25e15171687472538daf1295968ca97653580b798bf6372f3478f'
            '6861b743c0ce4745988f1911566ca41b53ba1ae5682a006aed9ad1b4032b2e71'
            '166554ce88d8d045d59764d44e8f84f76fd18131d5b1ae011acacf6ff5641dbf'
            '2f9ffb4c370c032ef2731635492b0c23893026fa302cd1bb9be6653adb5dbae5'
            '770f611ff9d4b8c988cbec238daa3d7768a73f82758e452dfd7a96f66b365b60'
            '42b408358d0ced51df9c78465b01466cf80b1ebec4d65c8c740f25d416335aa6'
            '499c58da2ff4653cbb582ed2b883fdcad590549245970c2951c75e4f60cefecc'
            '62cc70557f366d59464a18498ec156454e4d02e4ea1481c7da0d5021979b5d6b'
            'a053bef1e4704d462780cfb89fb328f4082d205f1a56989cf6fb76175e4b12b7'
            'e06955fc71857e74a6998badbe83b6a33921ff3a23c3c29ca200a7585ef3f9f9'
            'dd4476b59626670562ecf6eecd2158cc555ba995b1853f0f62aa01d37010f9da'
            '2c9f0353ebc572f649f58f95b3c982768b439da7484b9844acce826ca2a628be'
            'c497fc912083beeaec4b2088f3c908ea37f7f8ec9b45071b36f1ccf9dee0183e'
            'f044949988d5be3d902403824d686749254034a0018d3f2e0406ddeb9df2e68b'
            'cea2a37f4d87785d9f242446d18de13643742e828293df50d1beb92190b46e74'
            '97e438d906d4c7a5a1190516f6c12a7ace76105325f2079abed34601eaa52b73'
            '7468d408f4b88286bcf710622dd45ef412ddf98e9d44ca906038665e3652eb03'
            '57671bd4a65f4df3bb8ad5ebf026a89ccacc301ab3b2d8332aae25311c96ad31'
            '1d28070fe5db250e02a28bedec46226b44dde4985bf78106940480fca5a6d8f1'
            '9ce1c99dd8018345f49dce060dd2115c0e88ddfa792d178c3194f167b8bf7cb1'
            '0f7c895500c82c4628e2c0526a8039d890b79daa47facbfcc8ab2315884b0064'
            'faf58af47dd652c2c2c8011357438c5810309b807564526d6a0d2b6d136454f3'
            '2bcb6771c7525ed728aaf3fd19a0d814eb3cb5c811a8a223e118895cff860cc2'
            '443b380ee964309b8a9b6f7975ca9503c731aff0833d10b77c4d1430b4073205'
            'c018d4abd3bb59cd3c1646bdf9c23d55de4f58a864b38f4569b04f6e1073de45'
            '69834679dfda2629a7e0cd685b1810017c7c0a16fc28b72368b2fbbcaf2cee9c'
            'b7624f03b05057e3610829674bc974d4ce1f050dafff6b0b9b05f539fb8493c3'
            'deba05480597e88a5457a9254e5699816d6cdfaf91f63072dced2f34a717346e'
            '47e7810ee53b090b1baabc8bcdeccc7b7feda61143f36f6e3473f9ac04e1609e'
            '002372e609db99fe2fe8b8389ce07372fe50a5be3fcda46d1da84c291cf59cee'
            '3fc436836c171d7aef5f98ffc1143c1ae2b3828ad2bc4b22cf41f1cd353d78f9'
            'e6d413536a9c666612eed3bea7f29f76ed4e3980fb2bb1e042d8456eaf4eb496'
            'e086dd3b3aaf66ccd87b391708bdaa45de759b048b91be1a82edf3f4c070716e'
            '6528aeadda8d1c9d685c64d79ec4b6527d41b1a03fb4260af3d49821e18150b1'
            'e31930c72526cdc71cc57094dcfe2d3ed25294be7656bc5e412e927b6f47bb43'
            '52f564a580a89eb6e8a936df447dc8798c5cf48077315cd9a11bd0fbf9b97178'
            '11c60078ab9aac45c6ea238abaa6d24d89e731a8c9b13e8e4e453955df184d79'
            'da7ee7832306d297b8a7020cfee6f1c5abadc75e5cbe8843669c6529f560668b'
            'cf19089a445af6626ba24c283d11712ae3f5a15aec38837c88a1a33fc5f3024f'
            'fde20910a7f1705e4290aa31cb0f792966b14fcdce59f305108c7bcd2cd2a04b'
            'e106314245e4f9ccc161cab1ecefb86849e36ba02c878aeee2c81acd42a29a7a'
            '21128e951ba1224027d782dcc0b48da1896feea050cba4d4bf0bb5f2a2b2c2aa'
            '1e4f3a19e495fe542bdefc154289bb17a3e41c85559b2a21d50ef9b5faa0a78a'
            'b00e17647459d4195b5b53d3ab529e5cc5c159bfaca9d70be736f493252fd1c6'
            '7d8f206ee344c7f584a71c8e9ea710006f77d3df1c86037e788f94feca7b9c1d'
            '77b485a62a1825ceeed9ea46ddb8bd4a7b4781739fab79b04f32f77438be18c1'
            'ec4a62b2c81aa7f17998b60544279efb98cf6bd5e3329b576b2289c287eb1336'
            '1dfcc1645bb8f67a1509a1692d6b9dfd133d72a35cce7672612a2291e856c1b3'
            'b63e240ac02ce8c97a085df3bf55cee01778b2db3103ff8fbef24d3da572711d'
            'bf0a3600cf486aae1fbd6039f80011820989ccf0882e991cd64ef4d45c4969ea'
            '914564f4fd4529fd80e303a13bac99bb28702b07d773c03b89ea02279368fecf'
            '66efb64c8c55138b44eb229625cca0519214d6a0bbacb23f5204f465f01084c5'
            'c4c08c70ed2bf0e768d0772c8d44dca46dead92f875427fe86bcc1cd56446230'
            '2ca001676cfa36c234b8e17c59158e60fa2f8c640f10b38ed2704dba1a25bf16'
            '3fe9adec9d9180e58d8f7dbf60b8c2a022629a0254e0583eec2ac18a922c5294'
            'f0e90e0624d70231e25cb4880478f67e81faadecf8734ed2cb3f40b69e22a77f'
            'e588ebb5b77da22e411f05f679dc4d71d359807f0d71959bd2d79ace078acc4a')
