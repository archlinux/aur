# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0b3
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

md5sums=('365292b3f23077ce73e4a66ae1034a43'
         '936aecd815016827d86d3ba3af3782ba'
         '519b7f14542b25f55799ade4b3d62daf'
         '383e6f5765a94c95a6b261207e471417'
         '9b9ec18adb09758bf859d51bc0767c4c'
         'd9701d2e916cef070f5b85348c6fe0b0'
         'dbc3dae132e201bd08720b76bcccfa9c'
         '947403ef08fa9c82924cab8e643e299e'
         '646ec9bfd47a8c9acc009b4326b86fb6'
         '85380940279863d5d5e1161798bafb1e'
         '67ad79086988cb744cd1df675c1d6ed0'
         '77eabf8cca066d88e90c01e1da308132'
         'e5279c3a25b35c750d38b81bef5b974c'
         '4218e51c1a029acf8b173563f98465e8'
         '46f5a1f01b8c9ae37e958eaa6bd8ae9a'
         'd2a66ba7d9b2e797e981d45bf4360fc5'
         'fc47150fbd215da1fae14701719d6ecc'
         '25a3304accc1d2cca42bae02eaf02d5c'
         '84efa0854a0fc4733b0e3c18a6f73d65'
         'a88f361ab1f092141789f820db7c81b5'
         '2b046613d16c7a83c17b672550f760a7'
         '88fa6fdd5f9dd5ed24eb0ab9d0e9efea'
         'b1e12b122684449173bbcdb6dbc4a4db'
         'fbb25ea81cee567062e5b46760fa2b82'
         '2dc39b6e39fda6fbcbcfaedb24ae4e83'
         'fe6875543a8ae44ab1b29796ec2e049d'
         '457f882c31a6de7530da54de8060a1cc'
         'e11dba78a5640a4e57806cd2b62c33c9'
         '93e783990b0a41f6d628240ff3f65f1b'
         'f1051f3671717631887ef3e5856d439e'
         'ad0a88bcaed57a7b45a557d1c3becd8e'
         '6790c1078054d787a618d78609bb9fc6'
         '89ff10b475fe08011568dd9b20664400'
         '877fe85f66cf20798a6e47fb8fbbccbe'
         '42ed6d5721b72ca861a0c7c76f469346'
         'b75a695b0c6dcc283ea6adbf785b8551'
         '33c0b3a74cbdaf5adaa090fcb76671a7'
         '802c85ce9a0e57b94301882ececb6193'
         '235c7a46bb87980fc424ee104a5723f5'
         '3f28df904c27304cb710a752b6bc012c'
         '66010aea03671a7e2a8d042a4fec27c7'
         'a9b307642b85a802c773b8cec96d16ff'
         '06600d41e6f2f283fa15b2ab08006a7a'
         '4fda7d6f8fd62833034ddc8f9c471d55'
         '018c1568433390bb0c4ec2cc6df61c7b'
         '3d14ebc19deb09dbe8b4da2e574b0f9a'
         '03fc7202a12e7f66686cb5c900e89698'
         '49e37d8b098897aa2e8412c9d30b4688'
         'b7a389f1b6e464e2bcc919f59d77bb56'
         '276597dd693d13ef307a2169334fcc9f'
         '6ae0053613eece658bdc8727c2821f67'
         'a4894eb834e9c71be2b42a4370557ca9'
         '6bcd9ee25f8a7899d2dfe6d80704fa19'
         '5bb36ca2152dc02234f2cdfa1ff62145'
         '6074f8dfc1de160d99b4e69a4bbcfd5a'
         '38d8296cdbbf63df95d7ec530b91c557'
         '8249c4d17a07db0298f314a0241dc59d'
         'f00e4803dadc951aabb96611014837e5'
         'ecef3aba2f7f13d3e6c264924663d02e'
         '386909b1ff8429f32b260d5bd5591800'
         'fa025c4f872efac81c7f96993145d42d'
         '4de36d16c58aff4e668c8bab4710b0f3'
         '8598ecb8b539fe831a9fafd82773cb93'
         'd958bd016401d99c8bbcf18381484aff'
         '92df064a10c5daddd86b9f01ac92d57b'
         'bafc7a0a4fe93ca37c86b5a3943459d5'
         '22fb3ff32722379fa080ee815a7d6a51'
         'edac780c551c0803edc9f46de3c6530b'
         '278b2ae79724bad196235b886eeff061'
         'e601e9355c0b28f0d141bb86dbc9ef11'
         '9cd635ec6b7ae15dcc02fd3e764f66b5'
         'cbf11dd66f4e6be3a06e3a20b57dcecf'
         '8c0b2715080aff75409c562708bdf630'
         '102e271cbbcdb64129295c46fc6380d1'
         '6f7c5f21a48259459e5df0f72f1a8905'
         'dc8bc31e0420ed3cc461303cfebc3d79'
         'abcd8dcc55c9d202de5b35f86ed65735'
         'bec66dc8eaf0935ac74f9a3dad27c9a0'
         'ee1ee20083f1c8281ac7e359a9e637c1'
         '7a8f9fc24455db316ab9d1c80548a82b'
         'cd0f0b601d13edc1f44a3b85d3ac12cf'
         '316dfab051e2816796664faf9ce022d2'
         '46d15f616041336ab346bbf6a50c6f6c'
         '597761e8cd7ef79aee2c508b0e59152f'
         '982027f4c8468484a9d67c1b621df40c'
         '2d240e7752f38e85ecc5dff802239081'
         'a1353a11e25077b17a00f8f0b525ba7b'
         '70789277352a649b15b326ef1d73a30f'
         'da96a7e54f6a6fc54a8811b702ba3027'
         'b7b539d6337c0ff2c24db520a43e511c'
         '62f85c1f7c54b63da35f6245624be4b0'
         '72acb94f9a6dde6947df2fd8b20d2122'
         'e7e42e42f525347c2b6af7dbfaedc02b'
         '0c2c488cd15bde27984c3efde9046a43'
         '1153f156ed51954c9e40fb39854e9005'
         '32e78004ac8a40c787e7e0cfcbf675bf')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
