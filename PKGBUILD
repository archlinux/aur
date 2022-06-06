# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=102.0b4
_major=${pkgver/rc*}
_build=${pkgver/*rc}
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

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
  _url=https://archive.mozilla.org/pub/firefox/releases/102.0b4/linux-x86_64/xpi
  # RC
  if [[ $_build = ? ]]; then
    _url=https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/linux-x86_64/xpi
  fi
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

md5sums=('4c69770c0823003b8771e71ca57e6ffc'
         '1c12407a680953667caab86879e0e6cc'
         '44e60d9973b09412b4fed8b9646d077e'
         '8451660ca158d0dd7d77ef8c456b4810'
         '03b6973258cce271cff5fdaf2276cb69'
         '8036ca8f15fd4c326ee950a6a2195fff'
         '195b5bbaa502656ae95308ec63c41eac'
         '22cfdeaf93ca4a5d394dcd0a4fc85170'
         '80a0e5b1d0c57b8807c58b9bbcddfada'
         'd9fc481f993f5130b16b31b4996a180a'
         '5beae618612e0af09f0e763c64015dfa'
         'aa44d9f9320d1cb4797435e10721df0b'
         '612318e0b50359e13013de51745560a4'
         '8d74e44efc137aa2b04a5cdba6ebf624'
         '8c7df349dfc98a96bd1940383639528e'
         '63929a0415a0477af405588d05c46846'
         'efcd051aa2d1d0035af659b68fef6d87'
         '7d9086893f97f7c2a92b0ba9ea905889'
         '4426d5fd1d034ae398a3776834f54063'
         '009730b94a2019c095da03350f5e6ba5'
         'a4141e5f11d966f26684085097bd6e31'
         '9974b84e569e0fa0988c05ecb674e9d2'
         '5f4195ac68e7b0510fc00cb142ba8692'
         'd00c5e25ba072f25b29b3c71b51efd88'
         '9969c06e8bcd8f956b8f751cb73f0d28'
         '4734620a15274a7e3e90c154bca24050'
         'e0a3b1a67f4f6e55d28c0718898436b1'
         'e0d864f0e72dd427cff8091db874959f'
         '8a2ec0a3b0821e95ffa92c23cc219b5c'
         'f03db535190b5901912fdf8c79ccb4c4'
         '864922d30d7a642b16bfd0bc473b1604'
         'da3a53a87d3d98d9797ceb7cce5885be'
         '3a7d3ff34d6ec5d16683675fed9e9837'
         'a57b22e91b06f12990d4e857e8014234'
         'f05a0dd4f54ef359f7f046a2d4a1f053'
         'e4fafb0a1bd0e9fc586a21f55edd7424'
         '8391a4a4f726537efa8f6734100ea094'
         '24f3490b9c3f94dff9449a7b2f51d9b7'
         '5001116da6313270394fa7291a34cc0e'
         'fd5b891f57837b4c2c2bfc2d6e379403'
         '3f23e0127586c0e914c5c7f0a7e5f72a'
         '59e4cefc85fbe6253bd93f37ace85a44'
         '1db3b005c418f513e349c7c325291834'
         '2501499d7048327273eaaa5ce37a38d5'
         '93566b607f670c6a250e4cc1dc0b4d04'
         '9eea4aa9035b23490f189a236f187608'
         '01cf18c135a5460d394435e71918d1e1'
         '4901cf9887941b9ae16d1e6a0edaf3e6'
         '7bed37052346792e45342110fbf3bdde'
         '8ef12724e1a9e940df2cc9c67474b6f7'
         '15dc6c2c305876b2ba6da26b27791d50'
         'b9996eeff95a897ab169453ef3b26a20'
         '9f49d39a9cecc9518b40b962e8690ae4'
         'be4ed0e6f0baa4d5da0d16f278aa0407'
         '8583731b26a25a1da726906abcbf0e73'
         'f896a7dde586143cc46ed488bd81dcbf'
         '70babaf1be3b2b7f02074bc1b37280de'
         '9f055c93ab62d6cea4afd8161eeb07ef'
         '260448314a348c402386b340e3aded10'
         '5b5713ffa14f8a1dae14eeb46f99da57'
         '5556d2d5c6c38dea1afc1ba4540b1956'
         '5a657736656fd5e1adfab2550b7b7357'
         'df582e6858d159baa63b8487c6aca272'
         '3fe5de0ca9d27d7c15aca07a9f498580'
         'aaee3497f56bd121875a1764614b8b5d'
         '78456a1deb6486d427d29a6b44beefd2'
         '51550c14284e364feb24bdcfff680fa5'
         'd1acff7774e298329f9c8a2314ac728e'
         '86c0b0c579267caf621d35b5d8618c90'
         'd3b1152192622e225edc647170a3ea0b'
         '1cc1d5682cc8f5203058203769f10d87'
         '304594bce2e68cc15ecdb7df29f6d50e'
         'c043556e0301fa093f1899cf102c6d19'
         'ac96b06e87c4ff534a3c1f15ad747085'
         '8a7e56c620b5de94c71306ee6222325c'
         'ec271bb8f36318b41c262a187e7299ca'
         'd0cac48f32790604b778659775e20c79'
         'd4525e9cb0b74c617240681b427c1126'
         '807119061f7e25e64a32cb42d5c3dfee'
         'e0e505cb84ec1cce4211270e8aa3c4f3'
         'df54767da658c3da14e5caec6dec7aba'
         'c32d720fbad3c9ed1338a3c029b74efe'
         '9768c8f5d6827cbc4581107d6d59a579'
         '0166eaff0fba0304d5b2353b8bb60693'
         'f1057c8e2315f4d604f5db28f0636fe5'
         '90760e525ac4dd7f774d4b65e962c535'
         'dc2257614d1effa1b3c823d38fd98c02'
         'a4900c56a7c73a7cf13ac1a8e99260de'
         '5ab4a56f444c55b9a0e7019026e6d06e'
         'dcb9a038c487be0e0563722eba3800ae'
         'bded12b052fbebf0a30201b550bd2a9e'
         '24b28e4c84f8c09ee47325f8f9d93e8c'
         'ee4e042d64413104c4c0c7bba104151a'
         '7f51d41aeb08c8afd5ba83db0a86ba75'
         'd046b9edee1f36153d45e62a94c0bd4c'
         '3a4a13007f4f7e89e1d96ddeb20e56f4')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
