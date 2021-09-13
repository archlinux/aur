# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=94.0a1
pkgver=94.0a1.20210908
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

sha256sums=('93e4ae6546a0d3e5071b10fc9bf141d2e7924e85811adb95f5c4c0cc8a7e074a'
            '20622aec235c2e94157bb3a465873f9783a6b6e7b62cc13c186a5e48fcb4d22f'
            '9310d3763517010395060d7c53c1592b784435d4be4030b618f5fd0f01a44ac1'
            'df4b56855cd7d88e5ff6e6d2570c2215016932c78ad0e7a8e94a0093ed19d465'
            'ab21363c25e1e5b0409a1ac7887ae067e98ae954fd7e95e4931784968f716b77'
            'bc65efe74c7af96f47b4dbf9585e8692eaf3229efd051d4454517550b9159d7e'
            'bc1fde1978ebe0ec08d50c7a0d47f5b15acea0b232db02133c3d59debf78c802'
            '60d94651434f01948b6e52bb45c256ee62716ce5da17b62fe13001b31a00c153'
            'ee53d8e3a0bdb251ec5daf1b52e85961e2b49ba3fb7951968ee76beeaf495ce0'
            '19a2ea65020eb65b5f7878800affd17aa00733b9c36899ef5dfdaf10dd50f965'
            '59c1852dd2313b97aa0e0e95b351d62a3698b3b874f22d37614b541724a6a2d2'
            '7e31d1ae4b338549d0559f0f8fc364e5f3d0a475a70bc65004df995f52914eb2'
            '119564242e54e1cbe098e70f5abc881063e44677ce267c3b5a0fafe4b5697d52'
            '8fd201786491870c920d2b69383ad9f93ddc938502c284402cb493d7e257189a'
            'e5cf70d9557fa8e444901f88b94654b7d73af5966312be93d3c97a8383644e16'
            '6abf2243a8820d60d785dd707c1a28e7c5c3d8e6186713c656195a62b73cf809'
            'fa82cb9d45af151a2b57ac5f2f748e8a19e3d43ed394bdb64ee99d3a5c722b8c'
            '41004168b4dc4c7ace7a1620a086ab8321a3bef9d3fe0990958b6c2ffb0ac331'
            '5bc93e005cb826af418a524ceeeadbb468869ce5547b29f1dc82225438e4b1a7'
            '50699fa4933072c7a91fc6f79c93143fe6d17412b13b119606a898c669ab177d'
            'a4c69b242f3493ed09927bcd32134b7486387f7e2758d510c2f549856f44fa64'
            'fa19206d25b295385875739ac2480a4a7cf5a020dcb001aa852b053177a85ea7'
            '11cc41f324ff91903c54ca50eaacb437291bdf730c6dac35b63d5b341129ba68'
            'b88dd7cdaaba6da0f84649a63690662ccbfec6b6c170663eed509f6c2b890433'
            '94906b1c0aca79db6ecd24117dc3e95af427b6be3914113769db3a72cfbfeb9f'
            'ae406bee1be40ee4d4cc6228f512da0a69aee648718f169a8239919e57bc0db7'
            'd8b2dbb381c4891ffcd49412a30073c6a5bea3caf125a4d544e6a37025e13853'
            'f30d33be3c904efcae589129c31df02f99bd84d8c329d1aebf133ff96eb76874'
            '83881ba494a5dae3cc382d9546f74ebbf32de40bb528ddff1866e8153e92c108'
            'a53d2ba38d8527814644765c77a527c932e0b05c688a32ba03aee76384d83c9e'
            '431710ac2e57539793eca832807cbc3079b2ddd315702b89a2db731fd54dad5a'
            'edf9245da22c1d421811d8416619b1c0be138746f1f83ca63c08eeb16183465a'
            '94f1e11af0451597c059abcc9a89f3809ad7e771fa2f5bfd7b231bdc3678459f'
            'c1507e24ef16f46d2cbb330e3f969ec99faae2327ebc33625d88fc2d94c57130'
            '8d1f2069d10f32ce1d7a4eadd20a27a916f83b2bad7d4c88cd8dcfcd2d6e6f5a'
            'ac241573a5093bdc43079ced3f4e174b0f16cb3cee3d5f45b92df51c386c3ded'
            '297180e84b95ae4667d384a3c2d4f8e748c026217087c04d0f8a1b1ddac8f5d4'
            '3e532a0d562bbc68b948bf6c00f4789975b3dfb34dff9bf684988bd8420fcebb'
            'ae300796e9eb46a11538c9183383753bae146e3247522ebebdbb1acba8b9c2ec'
            'c54b9674a4613f3574f23fe2bae88359d72043a51df9f80214e99011ab2f0bd2'
            'afa0a5982b2172f1b86c40c832cd49772b0155a546fb30210a8a3545953599f7'
            'f117f604160937dd82ea51c3f92b6ad63ba8313cb24dc849cfdca83a65974112'
            '5d591d76e33f8360e8f0b75581cb229affd19adc571546012679a08392e829b7'
            'adef639cb45bd66b076fd9ea7af2491d9a68fd0f8f8710ce8f2a5ce6ef549f57'
            'a135ba5dc172a8da0c314876b0fcc2a93bc85298a6c2e5e45de0fd0526b3b147'
            '116094af7f198a52f8efc20332f912cc54c462c46c2ce2de5f6849530714f3ec'
            '4d86b96ce52c1cf19158282e7053758a8bbc1d7e6038bccc210b88e4a15884e3'
            'e3a30f307be0a97f8ff0f75e4c76df42316e2e2c172b41579bea332cfea5364f'
            '5e56496e02c32653716bf331dab46b06ac2ca004a860844cfbbd34237540096e'
            '2b2191ec15b841fcc62d4a4877fa89f3cc205a20b51961ee37ca5357097ad62f'
            'ef703905096e216701c7b88a8836bf0b79fd7551d17370077a038117a7736006'
            'a12203710398c3340495955996b7c519854a14a774da7746d7c278add5877435'
            '17d625c54c4eec8f0587abac5f24e602a7cb8d8f2d06405df19c50287bdc4f5c'
            '27a58216b9dc5160f21702aa145096553870552b9a91af697e0feedc3bc6e62f'
            'e85e2f9680ac0b20203b743013105c7960377afefad158a20d2d8ee844c6525f'
            'bf67219e31f5a7eae4992858ae91bdf2cb7f8bb33ec536f05998fe6c3699ac6b'
            '99305288dd8ce4dd29c44606b2d267b17dcefb45a2cb164444fb5288ac882062'
            '953425ae3e0150f138e3dbdd33064d1f5628cf5a194eb4c438c27d99aa0fb383'
            '064c21956682677740613c8ca41cf8cb617f9e7510e5ebdc42022b5dee133798'
            '0512fed3676a44203a086cf421c81d871da82e1771c0714c5c3ffc526f0cf11d'
            '28c7c06c45c161896927c701a358910ed6e68e627069d7e0432e322179fdd631'
            '314b3cba8cddfad93c1e4a743fc0d9abe1ffee046f764ac37220677f6405cf6a'
            '8c7d618f0a1e535fbb26e8995bb81ea638cdcde06ff620b9cec3a7dd6c5d1bdc'
            '33d8e73f2ef6b706021a76cb34b54c5e112c79b952b02b3935e31a435e211c35'
            '1e5ab872db400fd96cde92afe0500a56b24cdc786f3c25d5e83ee7e80964d3a3'
            '96e681068a826fc7a9ba6c4d0e2fed6d02e45a3601205f3ce18a855795465dae'
            'a30a7c3ff5e6bf979116e3b216b044077b70759ab2a88a3a5f61fb04862c425d'
            '15f94d3420229b078126e4b417ad138517ef7ed0d2c80dda9c06fde39241c317'
            '46e5b1c363a213b82e446afcabfbb735b183cf6535229921ccb30265b33fd092'
            'a4c72391e8824529fc1b6ffe1fa95284496f03ecc6e247885165787e91bd4579'
            '913121fd28230ab107069d55bfbebf57a103a698b49024b8375e75d29661856e'
            'a262c1506cd7748ef530673e97eca6bb10a86f0800423507893450a05d5cf5e5'
            'bc8e458b579057a291612c42b0274d5770fda6a4b95653c60d5d5a97fa60422a'
            '31adf557696b53f33afa0dba351e939b29584ef70303e67069c96263496d00a5'
            '96642acda2c539ce4bab9220a0670374c86050889ddc7e1a2c23b57902c05a14'
            '7934d436826519498882b98ada7200f7fe1febaedf766faf86c0e523667c3129'
            'a8f729ba5d6e5275777b5b5d3ef8a369320d2b1a0219b002cd962a077deaf589'
            'bb3e57b8236ae83d8296073996224e4af51ed8f59e4d8c7bf8ac514246cee039'
            '702266865faeb68cbc230dbfa727b7233bf21a864e5a31996e7ab56357daf7ec'
            '1b56711c62cf8fd1d55c74d0165041f483300ee469cdd010a9d931b1b92ada15'
            '02f671754eebe8de9505c865b28add4373c1db3970d846deca3e79a09f136e68'
            '46f937bf3ffee1ec79d12e808a571be81b52ecfb1966db3c7280e7d9ba8d3e76'
            '9eacc88e6281c7204d5cd90069bf3ccb2747ffba7df6b4ffe4fb74a2cc09e496'
            'c2cf34d0e203cdadc98c1dfd52a826de5f7902adab215ecc8454aa77f331c0ca'
            '86b0da692e87d3d806406bbde948eee7f533eae98fd7af977598bd128acc4f70'
            '034d72818cde85816711ccf5758733d64c90373abf460aef6000570fd73ce856'
            'a354d09da4d59624d91f752da5ee0c81d6f5daef2bb1412a4c75ba055694f1d0'
            'd160cd6559210b2d4783c2cb472227c468025647256c39b83df602c30227d5d2'
            'c20e00dbe34975f9519765ff8b1b679b6583a2c02e9e4695f09be7a3d4f038e2'
            '5fb07e2d483d460846ab1837a8b62f759c37873a37e73570d9a0cc428597ec7e'
            'b4b18be06f59fca7fad39cabb6f9e63f7fb2ed80284d95166c1fab2961bbfc1d'
            '31aef61512620c098d7136286d235a09d266581df60b3a100107df58359d37b8'
            '29428e96bd5c70b4a4a5a51f04874772a5211bfc0e2f9d98fc28a300063c5d73'
            'a1b7dd31a77d07d9a3715ed2db74df98c61060ae4d1272685a33ccacec44cc70'
            'f0fba9df5c1276c28e3a22e1cc5bd5562613391340d2a3da38e88ce965e9d43b')
