# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=106.0a1
pkgver=106.0a1.20220827.173411
pkgrel=1
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
depends=("firefox-nightly-bin>=$pkgver")

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

sha256sums=('80c533ec7b0480b0f0bfed736bab13033a0e9cb4ad431d2fb9d2fe2035137e0b'
            'decf7737b53f7cb6043bc280b95dc7cf16aed79791d66cb154acce25c779b24e'
            'd114877fe7ef3e776575b8cc5b3aabbf6d2ca17ef43e3183c0c2488d78c8ede8'
            '2b4723ea52339f398e6e07fa6f630c0939beaeedc660d8547b433d5f3987b640'
            'a0f5cf29ae16b72f89d5f26c1051200de0b07adeb15644a8023e5797188c7392'
            '5b18cf98022492503e05d42ba3ed29caedc7f6587a35c6ff424d371a53a2b144'
            'd553b3b50352811861ebc6d9ca519cc4016c143d179efb6dfae1da72356a132c'
            '02b1371eae96744f8b2c5b75a8c8248d6d4ac49e69ed49fc371acaf4188754a9'
            '2d474bfd311b547d54c37ca54a8caf670f1e27e094f34e7646b57fe9f8a408d2'
            'b7c58e7b7fe786d0a74a99aa915758f861625fec9b7143d93e3fd4ceaaefe66c'
            'b5ee399d7949d6e87cd73ad93ce2fda71a303f06b332356e420df24082bd9496'
            'ec3b11c8d905106e63ae26795042403cc6453ebdbfeb9acedbbc6a119565c29f'
            '21c326ef1c47c5a4a7af4da9587adf055d896043805adf8ae38501e4df53c75d'
            '574da6e6f0b6d88d7f06f5f7e72bfc20866bfec0b36300ebae60ded00ae3fca9'
            '85c4f6f2eb24a559e0e25fba73a591381a1f7e19608b955171af4bd959650e50'
            '004f61cc53156406d3830ac1c2cba30a0e5931049157e7d74a016a5969c962ae'
            '468e4f3eebbd90ca230fdc8c601f8483215ddb78c0c127ddd367430752b7279e'
            'be01513194dcb56a0a4277c8c1025f8c7bd8429c01950b6e9e410df19d56623f'
            '829159e04a0e41347a0f330ec958176ec48fe8c37a3f16cc6a3925a07ac4d417'
            '8652fa62c1f1f71131d3718d0e4f5873cdc400b427c8c9947f5c9f31e80780e4'
            '0e77ae0c5482984a27f333b2b4adca9635f3bd3bc4e73765e29b7f33ca31c806'
            '4fa01db0fdd678ca683b2c5bd9f7516d0d3a152619371408f6afb25b1077425a'
            '41d9fc8323ff8eaaa885e943bfa0b20ab505643cc030220af2bda10d1d7efb45'
            '15e0a1b83e6f71795770d85884ddd14acc9f3d4cfa998c78826b287613f281c4'
            'c0ec39b17e7557a7be055f34cbd1c871c25342c4d80da05baeb3032fff4871f1'
            '5a980938e0d5f527164b39ed2c741ab1bc634aa3b9bdba44b281fcdad73f70f2'
            'da1cd9214bf84d7acf33e4b63d8bfea983a5b296c2a7090ae8957c2701a36198'
            '44afadb615bc0b27cccb4887bca7a678a6f23ab2ffbad1e788128ad31cb13114'
            '7d9aaec645d2a64c1b90e40d33a30961db75fb9ba754db6724e5764f54007bbf'
            'e8c42a4ecbc4f939685d852900fe5434562330d41130674b8c9c356820e01ea4'
            'fd9624ffb462f42499fb5ceabf20bc4b648b6e480dbf681d7fa292473d325ed3'
            '855ff97f30f34f6fefe01e884d133cc5fda5b751552ef7b96f036314d64e0648'
            '953c0fe3c8a14a1e547e20d36d64eb34e7f3971c2468601e07fa142437b29c88'
            '551920c5c04b1a677f1ecf52b05acc7b134a28f87b54baf012db3e1ffbcecbd6'
            '06c9b5df897f4a4707ae504f031a09b812f6faaf8b41bf44693e6e5754857fd0'
            '66202d24401085c15424db37d87fceae6b52de6bdbae585e62630473a41a5dc4'
            '1ed3900c82d8a6fea874575609709806b490f30a0a29b3f07de4350b633f012e'
            '2c1774289a25a45309aa671c1c1bb3487f89abdb064f9282f55a92f6cf2a1e51'
            'a60c19d49b90ffd370105fb552a48e7593aede8c6bf7473e92f94fc8996b3396'
            '171929d5c28ce33d25d696b168877a1a6c53b569725c771e9b91770134764ffd'
            '1d738c47bb99f41b398a16983f41743951215d5dc19786998c854f9dffcdcfa9'
            '2bc56845dd04af206232632026fb7fc4b685d17a780366854e41ff95e6b63856'
            'e10a147ef66a0f71ce44557f8f9128b00a5efbd86cca22ec70cfb4dc0f2fbe6c'
            '0ecabd191a08e829ec231fce1409ba5f894ed031ab9685be6dbb94b93321940f'
            '93df37459e6e713a1c603ca9cf41f469d3d3893485685835c4589fb2bb7a2ca0'
            '49b84b2062b9bc9141928f9eaa78eadfccfacc389ccf90792c1553b1076ad5a4'
            '42f8cde089450864437545f6dc89facf59956fdb2ea8cf674e11d7c8b96b5179'
            'bc159120040e2f4e7d56de5228054087f96b98f154b0c60f1a7fe7f754882aac'
            'c226d1208a9d108e4777dbd79d24761971602f2d6a381237622781a9dd7e8247'
            'e12792b6d6979bb38743fdfb974388d8b593d16c2e8f8214ee0d38662817cae0'
            '1c375083c86be359b5551614dabc8697572d4bb9875be2800b4e246194d18588'
            '7737a794d9c839160b13f6c0f61a67bf5164b3fa11cf91335527f697ac646a55'
            '3ab5d2c1290dc9037a4adf0f6fc953f7079658c2e42b9394f3fe3ad93a5d74d3'
            'bc7839a418d79bec6db0591be0b91d464277f63a888040aca32284258d5a0224'
            '90aa46c9c27646bbb37cb392e9f8794933d85701f26e147aaacaac15a19f4033'
            'a5cdbc205069646665156d8b3527c6216ef6b1704c2f064d15e10e661894419f'
            '1abdb0cb8d1127780afccd05a1319d12d9a427220799f8b0d01037003c398bb9'
            '3760bbec1df29bb6e2dff569420be634114622580085697c0ffa5a7efbfaeb61'
            '0c141d0548833f4d12b1b7606740b3b4aed5809953d976f9334068386dd1bc4c'
            '2a373d18ce1582bbc3fad41b61d046f0e7377a9a7d77002e6f36265705b5bcd0'
            '7d10aec9ce09b1432d4e04bf9c0f9ff8d67b8b8dfd49cb9428280940a38cfb21'
            '589b3f9ce37cbb45c257dac500cf4510e9927ea9e3b36dd241e8a888b85b0bab'
            '5d6049e4fd8f2576dbca27faefa93df28a1b6790a2329661044efb19270ac487'
            'edfa36c2184eb28c7fce99e3a3de85b3ea06ee74bac40590a38b7bdae4e4e4ca'
            '1f133b64f9233a4f9f94a6cd33d5cb6525e8734c44302e7ae9dc886126328ea2'
            'c8fe9716d2a2c88659d72c584ea0dc2111b861255d0638b76b6b56615b241912'
            'd767ebdd360f52c9856012c6ac12f7a9c7a026da975533e7180d4f6768a6d989'
            '76d27923fe2308d6592ee2d92d50677434f2dc5dc200eb896c2bf0a9724b9b7b'
            '78798ed38a43254f0dd012e69516b384a509e11acb03e1cb45d6f5baa76fdff1'
            '5abd7bd644b154741ad43e19fb9afc6d5224786e5b76f4679f81731b6725ec50'
            'e17dc4e483e20e553d41294ef964a819dd44ab19ea122f9fef025090ad94cbb1'
            '5feea8b861eb45f1e6be50e3b689261929134e2edac2bc677d581c8e0ea75a8f'
            '790d1d95785f01655bcc654835888aa52acc4321d8ae7a63415f956e39c2072a'
            'bfddb19038e3e71ce3e933572f3bc8e77ae562f5bb2aaad3233f695552a2c38f'
            'ad51dbaefa358ea25188def3ce0d047f6f9b3178fc89cc05c66f08d7fab50393'
            '37d1e38b406c4b7dd8ce361642c934e916956b153fe0afab6a6c539ccbf47432'
            '2a0b52d0e44b9dce36dd0200e1997f2845b813a95d194d7fb66963a68965e5bd'
            '35a942752e3bb139f93bf2b121ec648060ff59abdd5f84ca2973770317def3f2'
            '3be220f8a3841af8fb88379343f75489e4cc995c5663ac593176d68621f266a4'
            '6d7f810803b6cbd5c6218338798f4368799c1485bcca0797502264a03ec17612'
            '25eb26fb16a5f815f181b533a5d9ae463c0201c4826f82a331562f75ddafc66c'
            '030bf5a397763fa51703b7112b4ab7363d478a60f5a53f663b4042091293472f'
            'ce041e1c507478b62c1c360c5b024d3da104465c00264312439447027c5994dc'
            '5cd654265237a821c6bc1ae618f7913ed34b3d14d9a1178240a4549c240fe1d0'
            '96f198542abef37e45dc63b69c3dd18a0a34e8cea5a4327d6b114e5bf3316cd9'
            'e949b3e0ffda95ca28166207916427a2411038a8cbaf00ed2849a789d3384cca'
            'f4a295c195c9725cbf2e2380932bfe4ec477a1aec0dbb9458a2933e3ac02393a'
            '87283c99e9039e3fbdfc59650c5fbb80e6e27512f952ca280fac6c7d2dd4f591'
            '5bc448ceb8c80c2c5853cd029be5fe0861f8b03bc78bd7cfd32fb89682661b57'
            'dccc18ee09e2feaab94a689a6ae8fcfa42ad5033e4e37ab282b7747746016810'
            'e2ab941ae1c8ee7d0b4b911885014e524c25bebb94e827a8a3b320e4ab278ef7'
            'c8df3e0002201e2b58422e48689171e16993a87690d99e3db1fc97c3dbfa04d3'
            '8e89555d75d8b9a291d3416ff3c68bdc3f11926e1fc46bd46277cead715603f3'
            '77fd3b752d12b500a2b7b6bd6847e77fa92d9678da1fc1bf3b3b4b2aae40fef3'
            '44dbcb931c3a7e961268201224919a84674437a8ea807bdcbc8077ab8107f9a8')
