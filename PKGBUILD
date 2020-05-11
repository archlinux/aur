# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=77.0b4
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

md5sums=('7e96304cd68c3fb4c67554e376f733c8'
         '4e1261e66a8e12aebbd907c0df2bc507'
         '309e4964bc6a66ae56dc6cd80cd9251d'
         '68afd64b458a86cf0143105302558590'
         'd758c348fc14b7b27ba66346e3bf4abe'
         '7ecfa221f11edf507db5352f5264aabb'
         '042f18b365f104fb81b599362c0903ce'
         '9b6174924bf5359d28e218e35ac2ddde'
         '1ebb23edbc4f1f841e12c06f773e5a84'
         'b437ae90a36aad5eb89f94793da3d2d5'
         'aa1a5a5aeb13775cbc553a8d7fffc23b'
         '13baaa8ec45f8ab6561851fbe3c79832'
         'b8a7b20a530cafd385ff4128a674cadd'
         '8e7ffc6dd8d91eb25e4a9f98b4f3f900'
         'a225bfdac7f0b81f33f827a95853e26c'
         '6816ed2dd8fcb87fa0586225ca4c9c4a'
         '710cdc7a269745544d424e9a5ef65fa1'
         'd752f63954af64aeba2cb8d2c3152847'
         '733a29b6f363ce7370fce8d1dc19c1d7'
         '63a89edc8189fefde3af496f13542f5a'
         '8254c80c0232edd90598d8732613c282'
         'a81da62ab3f853fc9fbbc760eb14e5cd'
         '1dfa26ad9bd3e0c0fad56d7c932a592b'
         'b21d074b235f535e3e73164f8f867347'
         '5a4b0e23170d2deaacbb06625a324bd4'
         '84e6c1700e0c18de12fcc22335a6b4b6'
         'b5c6dff79c570819d928b8885e69a12f'
         '3783fd29ee5e74d801d56217cffb2f3a'
         'dad3c56a90132482052bf178d249b91d'
         'a5ed60d0e81f25b66774c643a8934120'
         '857b7eb945f4f5359835d0158477f246'
         '0a318307c3e65827420f25ffbea5e2c0'
         '54c6fe18491b228821ba63e09cd9741a'
         '45018ddd677a5f486376563911877c26'
         '1c8f06a84bb330469ebbb15b88e78839'
         '8d4545dd51a75debef6a0af4f924eccc'
         '7b9f74eafe8245916713f50c932d192a'
         '880bc380da785b448255892416973325'
         '68add0cc0650faf379aa86d0a37260ac'
         '1c542a6b8a5ec09b2bf9e5044c82d809'
         'd1ecb5ccdc05ac5924fe0455cd358ff8'
         '13ec1275fb11cd20b022bd6ec22b70c0'
         '8e6fa88de2e0b6d347087d4c7753e50d'
         '9d45cb3c1470441149739888c6a39ccc'
         'd840545fccbfc6f471285ea4ab9e034d'
         '7c524c2cc69c91b15e5eaa11d7becfb8'
         '5c08dfc028bfe3820ad3c88cf3a6e82a'
         'ba1f5d8932f6e368afa04fc639f542cf'
         'c5e41f3cefcf18dab6cd4382c3e54491'
         '1dfe23cb715dd517e7e39f51a5494770'
         'd77b80ae4b42404ead80277f91c7ed34'
         '67c87d88cc2efdb4745a89d80b521f7c'
         '2b8925b8fff545f0681faed5a299c14b'
         '34017f63e8f2bee1dd96e245a4c45923'
         'c8c17a94b190c024cf417bcc983403e9'
         '8e7d0e52fafaa3d38b2dfc5cdbad40d1'
         'bfe64386cf628e3f5044fe97fb3561ce'
         'a727fa79712343aca316a7849584a90d'
         'b43d9e1c18e999a1cfe56c95a36030bd'
         '0926f4d7bc03b16986bf1fbf3b73e0b0'
         '9e43d179a17ea364bdbab88f1a0f8747'
         'c9c1af11a60371418dadf7d21e06ab69'
         'd4fca06825da114ac8ccbb01ccc4cde2'
         'fe31d0ee2c1bb2cc840f228109dcdffc'
         '8a13d5a3f28039183b46d178a7239418'
         '1c92fb0ead0adf402839c0db96105606'
         '360b0bbdd50cb72b50118f472777099e'
         'cb2683028046642c9a774d757efb9a64'
         '3b556191dec64dc3cf44362c27024fd6'
         '6c8fc25bf639db8d4f0f61b2033c73c3'
         'd9bd660d7a78e7d75ab61a6b8033b22f'
         'eddd3d01efcdab97f3c5077784072034'
         '195fc62caebc1a978f1be04167e3ac8b'
         '6f825b7e37fc47039a0a97729384c2b1'
         '771f071b5707ec4c1c7e6a0b122cda7f'
         '3a28b40140ddee0fed8e7531a0690fc9'
         '437fb766ab44012784189904e62fd2e1'
         '329b6144c8acd8042a94092c2ebc6d3e'
         'cda3c4d318f7cefcc697d2c2673dd78b'
         'ed28dba48ad206188ac70949ab7086a6'
         'bb7eae3491487d9208fb88909ed1fd8a'
         '1b61655e4b873c44ef1e56bfd00b8d64'
         '9d11c09433d2c3759097c400e1a207dd'
         'ca61e925f4fa6f8605e02f6a3c7f6d1f'
         '616c3e82950e6279e4139b79d5ec361a'
         '90fd38a1ea251c988d1c9196caf5f9f8'
         'd82f6d2c8e1009d1b57daf0795c84fd5'
         '30dd41257c60bf381c34272ec0fb6e0c'
         'b8a4d7d7de6d9585d41052340f9c9cdf'
         '52afe3d1d4a8bef1a7ccb0f53190b520'
         '042ef0e3704868c6e9820278d784b4df'
         'a2387cf112730a27f03417ef83fabe2b'
         'e37eb4167dd1c21158a84f7ed0c07551'
         '465e7736ab9bfeade5a2b52efb009310'
         '3e56544b5f182f4074439550db54c458'
         '7c09115ddcaf58e4d3cce4e229944fd4')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
