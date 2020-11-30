# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=84.0b6
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
  _url=https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/xpi
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

md5sums=('94c1cd8f2aa45b5d2c3e220163048a20'
         'c6b03bc06b5426166009d017777d754d'
         'bb3c3ecade6a5f76c2e935644135b580'
         'eca1910e3630f831e14be123f0d66740'
         '3e39a7357f12b496b718faad1a512a5d'
         'c23fa346fe2ac448d7cd33ba12a9ca02'
         '94747c267b88a7370f80e318e072b21b'
         '1a269a58448c63480068edb388e43ea2'
         '96058fcaf18a1d8dd76f5264d6e5ce59'
         'a18558d39cd3eefd2d57be4c96ddccb7'
         'd1670519440db11058d069621117d75f'
         '28c72cb2acbc4d0b7e0b1c56a8cbbf27'
         '35f9f22cf718460205e59452c9a0c9f4'
         '03bf2ec6ff4d2b8d0b0a4e1013a6a297'
         '84ef84fc9a17eed9d2ec9558eccde4c5'
         'ef4fd3dc7519ba8187264050196b3daa'
         '9cc4345663b34c107aa93ff7407214c4'
         '533ee87768c1d94e57ba2e9c3f960376'
         'bca68a34ebe119a66248bc945be193ba'
         '3c9c3c2827e82a60e7d4423761b3030b'
         'd87442fc59f7e7e8cc95369261d7e705'
         '141f6e028ab31accf4901fe234d410b5'
         '06e903c492139d89e807d273bedae7fa'
         '788eed54780a1e89e23e51eca016442d'
         '7ffc3a8ce2533a1bdbf2068c77e0b94f'
         '5410e4b7747e36eb2dd77a4e2e67fc70'
         'a268ed8424aee61e6b12494822b49240'
         '13fd2aaff9d948cbbf01cdc38b93a580'
         '4b697b071595119b15e4c378442e3c8b'
         'f6591b5b07ac68e611977b23ba6140b0'
         'e14b29bf275aaf81740f172f12a78d30'
         '5f889c1ef6fc1cc6b854d71107aeb48d'
         '4a427dcf72640f895dfba5b3ca3ea1a3'
         'ca669e385ee352a1ac28c267655b7903'
         '835b4c8b1223c034c75bae46b5b96505'
         '8ecd15e4ce29b9044b14eda22a510f84'
         '29991e454cc80b3166a108c3a610d848'
         '47f5d20b9e2b8373839fc2ecff29e906'
         '32d28d14f5a83dbaad9778964e2e263b'
         'fd4ad111f06ee66f10550ee693201c2b'
         'bade10dbd9cd7a9bfcec7acfdb84db4a'
         '63e4f77bcf56d2f56cdbffcb4c69938b'
         'a3d8931a3455a8aab176a3425e3747b5'
         '2f1426f401529e37f52fc347bafa4abf'
         'e7ba1ed9b9ad40ded56413d1a4666b9c'
         '44e919f7c0523ce783b8c9bc96e2c41c'
         '40a65fc6531a8c69a4c9ca64838cf792'
         '861e39d2b0b5820fb59701444e1f5dc2'
         '98a831126d1fe0d393a3f5e8bc17ca92'
         'b68f0bf3e74523cc4d83a1ae4805daac'
         'a442522686e3b74728015da742b55953'
         '589c0851e4183c5c1a38e22f7d16ff26'
         'a9408ae083ee21f4e2384bf23e9d7530'
         '6f88f4e357c98fe88195b844868212d6'
         '1ada046fa0b86c91bc771f02914a0d88'
         'b7044e7615044db092cccdb52b55ef5f'
         '0c546f1d1f766ec80b1244f5b2949980'
         '8da15a92310b6015132a63ac7c8a1fd1'
         'e9204e9b922df43f6680e10eaae16d51'
         'bf49e644453c7aad509d67a8e3215899'
         '99f575b1eef50e59c5120b6fe92d966b'
         'a574a971cd8848ea123eb2a34e644f29'
         '5c824d25e42e3468457a70b6e1c9472a'
         'f03f9abfc1dcf15e72dff604962c79bb'
         '2d604cecc6440c8e6415242b6755b852'
         'e48a6e677f4b49a2f687d9bdb705733b'
         'cff6d91878f6147573ea7bfed9c56c12'
         'c4f498af41e197e560700d83ffe82e2b'
         '342498557c8e75b8d733856574d61c88'
         'a3eab5f2871380801ad28f7b82540541'
         '6c49aab9986008dc75ac5169f025def9'
         'c3e132f8eb0aa38f7bc032b39423a997'
         'ceec8a02ee19a656f4d95f539a9fdbdf'
         '2acc28c41867592bdd1ce08d3d554a36'
         'dc8277998a81a38dbe614d7a8ba979d8'
         '8ff151e1b01cc41ace40bcadf120c802'
         '4d4c4fcd7f97d3044c8d4e7527eaddd8'
         '75d6d7b8cb6864503a7e4ea597497ca6'
         '5992e5eb92fe82f04d1c18ebc977fffa'
         'bf1b68e32d09afe8ab4060d67cf16499'
         'c4bb1efa535869acbeb1774e7f5e0bdc'
         '823a06facd79b7847703bf6c3729c64a'
         '90f3e84bd863889f8b33238040f18d74'
         '43bad99525eb3358475a1b176ea2b985'
         'ea3f34ecfccfdfac4fea979e2fdd5944'
         'f236ef3eaf045dce7123026f333a9bc1'
         '34aeb65fc9c3cd6909d8228e22464e86'
         '3def9ec1b2c8f25e91f4fed8fd5cb414'
         '1495e621e0a78d66f1423c918f3d7555'
         'dbd321ffb87fb31496e2827dc63a825c'
         '5d6d972e44f3eff0bd26416c60551570'
         '14c391f35258ddf5a4ae0210563de916'
         '6d5102720be3571075f2078efcf6761b'
         '0e45cc39d292515d10546dc020b92ac8'
         '8e11e60ea6548a65f9331e3d4b8b6df3'
         'b0b9d5409baeae37343c50e0882fce6b')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
