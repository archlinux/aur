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
pkgver=99.0b5
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
  _url=https://archive.mozilla.org/pub/firefox/releases/99.0b5/linux-x86_64/xpi
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

md5sums=('8644e676ac5e79885e647b19d4e3e1c1'
         '0af857e7bb771f10307324b0bbebf26a'
         'd9af40db6f9727ff3e54ccc21c370442'
         'd745d504ead51e3713dfb2c293babed9'
         '2e0cb08cc5c00003add20479f1eb6aac'
         'd80197aba3fbf03fe75d49646eceb87e'
         '05cb8a2947d1bb8a2093289115ef7ede'
         '944cba657eccc8e03f54cf656d3d6fd4'
         '6b7895b4af532a6ed961fca2a800bcb3'
         '2c75b4da285639c0f7b1a11c1e1d0849'
         'd616a4d1fb0f1536d6bf06efa5e7ee8f'
         'afdb3070e0140d1642c3f15e0611b75e'
         'dd546e4eb90db126ca3a1ee16aaf4109'
         '36dbf0ad0d80f48f39dc9783f021b311'
         '5b7ca186cf321a929c63e7496662ca52'
         '9050a1c4652495fc6d68f2cdbcb7a567'
         'f61af75943469080038e26176e061e81'
         'f3c7080257077eb12f46aff0dc527d0d'
         'f3a7ad248247e453442185000ae7c74c'
         '7bf6283de38c9cea84c74b1b59ef14fb'
         '91cf53009c5fccff3e5cee9753e4ffdd'
         'ef1b501bcf698a1fbc4cd2947cc372e5'
         '05e0ef662b87b1ceb4de80d368a23675'
         '35bf046acd72a1552c8dc92e3a350a1b'
         '0fcf6eba237c36f30a9c570fddcdc48d'
         '3c012c51904b6796e1d755f949a2a63a'
         '926e07746c33de997174fe7a0db1fd7c'
         '2dbffab522157492e7083cd0bd6e7943'
         '9e9df0b094377cabaec0a0145de3606b'
         '100e70a3a552275b46608e148a5e1e22'
         '63177f2235c61e9e2638990927646450'
         'd493702b5cc99ce3bd94b4c70e47ae84'
         '93d4f94b17ba6ef4a1d7bec4dbddef93'
         'de1412ca61f191d2ebd3e8955e4aa6cc'
         'dcb411b3cdb7767dec22e8bb36d53e64'
         '308a66275e9cf0026c94e04dcd97aca9'
         '8bc0adbd0a00d1820f22f2ca4044922e'
         'afe089f8c2ca5776150e6ff4f4c98221'
         'a9445d4fc22bf2fbbce0ce86ad9d0be8'
         '27013181d46adb68d85dd8d235433699'
         '860ed3bd5ebeded34c7e0b8cceb9b2e4'
         '5f36f84e1359550e0abb9a8698262b13'
         '7facf8d9435314e0990c212624aa69a8'
         'ad822827005076f5d9320dc1b799dfd8'
         '7d8b4f6aa0f871491f725703ea1c4529'
         '1328681b05d75aec7205831a9c8f88cf'
         '14256c1ceb64cb85a34765a1488566a3'
         '1afb5f643e5a492eed3da0c9e25a9080'
         '999d6506cc1478989d7c5109c9bfac9c'
         '4a6b76a29a6c60ecf3f55607c8bac0d9'
         '116befa5ee60269ca476bb1886786255'
         '74c88321e6c62c34b4b7795f7d239ecb'
         '1c9a8407269a025956310f2bba1e6eb1'
         'fd25bcb8b8c721452878f74da17a62fe'
         'dfc660633ea2724b45cfacad30f7d6e0'
         '79401caadd0fdda1df95d5991df3d15b'
         '1e208872661476a25d24ffbf3ed70884'
         'fe69617063975cb864736bd52d4c0212'
         'e165703dd6e1b1155367df91a9fc16ae'
         '5cafcad181930e4121bc10cde219b12a'
         '8b76c8fdc1885df5de3b494aea42f256'
         '231c5c4e7d33031e6c688f6a03fd656f'
         'bb3f8dabbde6fdeb5c4531216c162090'
         '61a3f8c09ab377c2bea364a7d1691b71'
         'a631cf196014d3736dc56d8e0134d338'
         '8d666332bbac82400d0484191861fd48'
         '66c8a77bef500930834dc7a2070047b3'
         'ea3ea3aff11a4159899bb7b4e7df0483'
         '26b01e93e6585a1979782e03e898b86a'
         'bb765d7d1617b5dc2d267861f99a1699'
         '329a6684a862c4d18ee7c50ade3da2ff'
         '6e760a0b00eacc4e47cde66cc84c6e21'
         '2f13356650c9788fc7c44554d6f911a6'
         '505b85b315b43edc6d2d276a4629ed3e'
         '8b2dce3b408d83487fed8e26a3540f6e'
         '68ddf13bfb9eceee2a4515d733c073a9'
         '2157656bf78ca41e3f581b431be2d665'
         '3362603b9cebe06f7bf0e00c38862ceb'
         '5fa51b7c6b6a6fd9211ac2b03036a7d2'
         '7fd5d6b57152d4b95b9a001be650c062'
         '8061deb2fb9c2cb8fe534943f7197b9b'
         'b095cf55772f7a746d80a254c8ecf267'
         'b0f4454b003ed8be72b80fb7d0d65bda'
         'caf28e179208be61eb60bcc079eb6fec'
         '198b00d423473a87c1192883b4a8e29f'
         'cfeea37f5ce2a46516ef014c7c8e2c9e'
         '653302be1a90bcb99a963050c860c714'
         '1954a9eacc5c8a874d06c8bfb2bdc5f7'
         '5c91cddd69fdc4d1e22a48173fd64fa0'
         '3a6d614d8537f4dcd83c5f0593684421'
         '92757f85b7fa9a4e968a6915f25fbaee'
         'd0bd3397d1b447d6e7644b1680e60156'
         'ef8ffb494becef377617c93de6f30dff'
         '54b94c886ec2ebfa58624a8b75188ec0'
         '12aea97a783634af3625a15de6bea895'
         '36630a591d0322a0f3ed2a63c14aaf0c')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
