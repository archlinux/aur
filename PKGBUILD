# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0b9
pkgrel=1
pkgdesc="Language pack for Firefox Beta"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
depends=("firefox-beta>=$pkgver")

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
  'en-US  "English (US)"'
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
_url=https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-i18n-$pkgver-$_locale.xpi::$_url/$_locale.xpi")
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

  install -Dm644 "firefox-i18n-$pkgver-$1.xpi" \
      "$pkgdir/usr/lib/firefox-beta/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

md5sums=('0f46ae5813baa75edad983f277baa5ad'
         'f78e8d4be844b74e21839b2d67828124'
         'aeda66ff267261a2cb952c90cf6ba7db'
         '725e61b4caffe5ec461034715bc6df52'
         '8c800fe6e2f989b5a5ea2aee946c41cc'
         '4f6313449d755e49855541e01fc0a602'
         'e0f1913d14cb34b948660452124847dc'
         'a74b837ac7bf268c9dea7aa950cb9197'
         'da620bba0682d4c578ea06fa4c746037'
         '315119f75eede05255912ead5e4c04f5'
         '22d05e9b4cf67b9363370345b8656f87'
         '720bd21251f282bd01e9529f8e81fd34'
         '2a070c609654078d36c8aecf1df4eb09'
         '3943139c5f3ce80db524e1924b34a596'
         '8efff06180ac2e08e00d3c9d8cc0f4a9'
         '66fa6568ced04b567a663fef0498f9f9'
         'a761338e74f629419ba10320091b6175'
         'fccee809ec31b8c52157eda4330bc18f'
         '659fea49a6e7d83e411c2e959ed57f9e'
         'c3cc6b6849a0b1dee545867acee2504e'
         '5a3bbc8556e043902084569796fda6d5'
         '9017b4450c199be10d49834ed14a70e7'
         '1fb5b86729bdfc3f21c3d979bc13a670'
         'e41efa6094cf2ad2048d444021170644'
         '6abf53ea51853acac1ff9bdcfff6a94b'
         'bf8e2ecab85cc8622ce4456afa9afabe'
         'ee4b65ffe9d59b991b7758900845c868'
         'df92d7001ca88c90b44877438dae7c01'
         '6dda1eb8b9645175c2ae4f5e8c442b5f'
         '134469a704bbde0dcbdc4beec255eca0'
         '8632a5e9e3ef2fbf46158f76cfe8fb55'
         'c5d382db468c78e2d59eb3b4a9870930'
         'b3bf36e06d897e67b5d37e0e3cf1e333'
         'ef7be71b6cd2e4b4141e94e9c19c7461'
         '5dc56a9d8afee90dbdca050c653defee'
         '4c56d87586149402e3ef7cc356533a4c'
         'ceca1127872b1192730e7ad623a1a15a'
         'c06319d08cb4065cf3deb1aa2752d09c'
         '0edaa1f84317a8e79c0bf6e7ff783db7'
         '3051fde8669376d8bdd6369d2e192835'
         'cb324d758212caa034f2e718e917e975'
         'fd77526e0b38ea425e01ef47c2856284'
         '9de269c7c2c1702b7a3aed0783c4f9da'
         'faf534049854fc3c38fa4fe563fe5c5f'
         '1abb5f0b72a67cd144c3ae6b01b2ef09'
         'd367d2677d2db89dbfb239f8b1e718ef'
         '84eb7834596571ba1592cea56b508ca0'
         'b6a3368c739acdad4cf368cfb1264e71'
         'bb5bb2e9043eaaf6fc1af66e76bcfaec'
         '2a3313a9445ddd237e546b43d68b22d2'
         'd19a5b595067a3e1ff3b73c217677489'
         '1048d718a0b835f3e755931c62a4e675'
         '0ddd6435d8290ceaa1eec66703c06492'
         'cb71878ee8c902b30e50834fccd95883'
         'e34d1122444caed68f4b145e0389eac5'
         '58eb4373e017379f47371cc6bf4d0002'
         '5b42817175e94c04c73bf305f3ae934e'
         '74b605e6a48e6e3c398bb8adafdc4801'
         '7f422b84e75a43ce48517324a4652df2'
         '6be2d86b84269205689c94ee97a62a2c'
         'adb2138ac6ea8478e2480825eed82da7'
         '60cdb6c38360792034670eb8a6fc76c3'
         'a0fa74d57c6ada01a965b75978fc5e0b'
         '6680a451e05079411d2f9f1682a1c41b'
         '575498ceb6ebe6f8f903b7a8cc2878b2'
         'f458d47206cdedb1466666160692a7a6'
         '3ce05e951c0705f2510de0fa6a28996a'
         '4bfa09f833a6372c7014e5e303ef2781'
         '173b4c13b02c2ed52d33e2fbf7505f24'
         'fdadaebb584876a584c9ff33de099eaa'
         '8ee5f6a7289f1af08dd6203de09964f0'
         '9b99594d46103665a434de43c24cf2c4'
         'a370c342420f93f0b0398f1abe3a06b4'
         '57024fb0c10c95ac5956d204a4f7b76c'
         '52f6e99caf8671369ca6753f7ac6f611'
         '58f2943088236bef1ffed434dbd4d17a'
         '867b7b743a12a475e1c185918d8010a9'
         'c8e7439b2f41ab3347233658c533bbae'
         'fd7dee4faff496dbebabeca4863c3ecc'
         'ea6ce324c98344a0fb6508c999cf59fb'
         '1154c6cf8b991bb7b80d4d3bb745cd98'
         '9a40799c0f48e6561b9d9ebc256dde64'
         '35dbe22e9c2d94c159efd9fa9379b684'
         '4d80562bc86bfda9863357c3ef61c974'
         'cb739216c4cdca8f272f89c90dbabcc8'
         'f64c1d836554ef3ecac50168f3fc7600'
         'bf87c576d932b37a855a00ac2a4cd991'
         '007bbe4e81542f1b01be0fa4fbda487a'
         'f9b99389e68164b88aeec042b89fa63e'
         '507cd21cdfda2e68c05527022dccfb02'
         '591186871c93d17cb4964eca5fe1df97'
         'e1aa45eacecf55f49b5ed36a87b92a83'
         '965f367677100a71812744d56b413ddb'
         'e5e8278afb0cad32d690472b17d71acf'
         'e3e4e0f54004dfb2795d5dcf54f2019c'
         'dbca29954edc2fc2c0c1356b6856e09a')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
