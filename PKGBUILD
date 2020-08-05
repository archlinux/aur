# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=80.0b4
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

md5sums=('304d9687efe4497f602c49255f3c6aa4'
         '271b935af81fe87abafd2da9e045429b'
         '0b98205ffe5a25a167a5291524da4787'
         'fdb286908073d901435a5ded3ba46bba'
         '5fe6422a866c3050ec67e5ea97959d73'
         'f52cb0efb76fabd8efb8187e8ff033c8'
         'c18084aef5a061a34304f60b55ed6f94'
         '85cb0a8395518394d69efbbef28e4290'
         '02cf939bdac61f196de79aa4a4f3d9fd'
         '1d2ecb058be4bff95a8b713eaae4628f'
         'bf8080dec6e11bd0e9b4f6581df4d255'
         'cc5fe86a04e9d68d95a3d8f5b9507d54'
         'd96e8d8684d234a63835f8d00d829da5'
         'd94ddb8afc325fea3b30f57583c30550'
         '6cea982b32d277169608e0ccdfe1441b'
         'a9464616e22f5f37ef6dfa2c86d03476'
         '79a34784b6156a3eb82bfb718dd2f4d9'
         'e1d0d9b2c5f17753f5824d1bfd258210'
         '4564b21deeda3bd8403c93bc86eb8adb'
         '108013dba5c91aa590d49ccdcfb8dd9f'
         '5695ac6e846e055c2bb42010f188c977'
         '4a17e2ff454884eba1fc7db1fea93359'
         'be8828de85085b6316ef2fd47fccd3e2'
         '92f22786067aa9963c87a123627200b0'
         '64e9a8770d96608fa7ea9f135bcf438b'
         '02fa8381d11a7b52f1c037d0c1e25be4'
         '8c715da2a58209ebb5615de5f2230a87'
         'bca91a8cb66afaa6ace3f380a61b9340'
         'bddb72908ca108c5c31bb77079e77ceb'
         'fdb7ce7174562cfd3f97c76d31a7003e'
         'c0ccae0e282d807424b4719e7ce639e2'
         'e9e9b171c3caac81ce5982cd92853034'
         'be7ddb5cf0e597fb1b35782b39e64667'
         '1ae0be48127d0d5a57a669c3a08dce52'
         '04d3ccc45762e5de27dd6fe104cd90ab'
         'da9c993abae011ceddffb96b22cdfd42'
         '1a3e5368457805eca7da42ac97cd1661'
         '4057e5b9b8ed7b5f3b6facd9e2ab36dd'
         '6fa53ebc3f94b63de5ac59fc03c2a6af'
         '8509ea7b9feedf74c60effe55c048968'
         '2506c69ad1af1ae69b9e46bcd7d8f61b'
         'a4883d3570b57769013823822ae45b80'
         'dbe65d42a41632a8404f331df3a59f6d'
         '87a1f9b39cc3b02cf201f610178ef01c'
         '1f370aee816d958c64a8def097cfc710'
         'f554707f7091a920b6cb3eaeb4c00096'
         '7309e1db99713594d7ac09ef20598272'
         '1be8ebac288a70ba9bc59c02455863a8'
         'a00eba9ece9a3f0032d84f3df2718b97'
         '72dbf348ccc70c79d93a71da95d0517f'
         '803b70ab1959e27af3b20fec3bf5d743'
         '13d463c5d7b65e89001c4961531e34ce'
         '2411561cdfb445e1e762d9b2081a907c'
         'c09433ebfc55c0a381e1495e4e487e10'
         'ced7cbbefeecfc87b807c910b39d7c4f'
         '744c0dd4f4ec0796a7c137b1ba3974b3'
         '4af58777fdd6f3a96ebc96db52f7a229'
         '999c508f1c7148213127a8dd65d6f61f'
         'a59c4f1a084774593f433cabe3827f14'
         '017967a10ba0133b76db054be88dde05'
         '28a7a0dd6a9f127d6eb9a43cda881738'
         '3590ea096ddc19fa513752d8ff247d51'
         'dba5cbd12fb60a2823f8e8751fc9549d'
         '99bbe231f608cb3efe2b8cf65feeb27e'
         '5c66869ab025108e6055f7447547e03e'
         'c47e5d848e6a16672bdedc7a24c452e9'
         '570ab27c1cb5307ded2bc29aa5d9d74b'
         '37a643c18e2d236d15f722af3c5f1040'
         '5c70ee2c26449a679bc9ec02e0b8f0ad'
         '674c78e78e13015c97df3696db2769e2'
         'd38b3946a8320acdabfaba7531b16379'
         '21d4ba4927a8bf6da359a8283b331f3a'
         'ad4a7c07e97a5bf5ff533ffae2415a26'
         '3c00544820b0cd87af769055c4bfd2b8'
         'ae3f77eb2836ccd01c11e4c2b4520955'
         'c36635cdd571d8d243ea82c6f595d64c'
         '6228d518dcf1a7dbdee80268050515ea'
         '9b23fd1b44928e8bb1b74f3a5e28da01'
         '8a9f647e3658767de18a75a936f2fdff'
         '8d0850b6e75a5ddfe6f33742ca34de06'
         '7642f0efc1e3983c7db38a88f8caae49'
         'b940c93b6bf3a856e47364932e26711a'
         '7edf2137f596248af7702db27dbf2897'
         '1ee50b4436f74a55deb1d658823b9d2f'
         '10c2f1e444b85ad298de20154a62b241'
         'd2a2bd30f7980ffdf0ed96c88241a44d'
         'c625f3baac99fe0ba11c666321be0bc1'
         '1b59011f20e42e89537707eecc4211e9'
         'fe2c26e7a2f8adca5cc6bf05e66d92cd'
         '765a9ff2d2beeb566e2ad890aeca6635'
         '7e80123f27b77f9515aaec61a7ccdce6'
         'e6dd85234844e4450327738dd2786919'
         '2ff381d2326991e264b8e09f97ee1077'
         '52f4e4b803aff7347fb972881ce8dd1c'
         '59a8383d89fa093c7e8df1b8b2d535e3'
         '94aef9908c856dc15715409c5548e308')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
