# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=87.0b4
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

md5sums=('30e55d5e6e7460e2cafcb99f2f2eaeed'
         '7608bb8dd8a090e8e64d638d8b628a27'
         'e97ef074226d252bbaa38d553ea58082'
         '83209fa7ab2ccb0397f05a80dc163967'
         'efc243239cd3bbb47a71ca3f936f2053'
         '7f7e8f5c602f1576b5230ea5ab113e83'
         'b662b01ca18f1da8822450e97398f0b6'
         '2fe59399ef90a426d683bc39ff2b5888'
         'ad24deb97bd2823f091c258485ad0f3c'
         '85dec3bf9c36cd4b898be05a8cf3ef84'
         '06f3f968779d4724d2606c57002b9459'
         'b570bc4124807cda08a7ea02c612b317'
         'd1d2b092f36136c44c2ab6d445847082'
         'e47359783cbc203e8442a8f76f8d7357'
         '4443429361ec62a061086e5950afbc13'
         '116145f64786df65dc3852a7442b00e0'
         '556f8ac0d78231a2098fcd1ace077304'
         '0fdf6b9b2977bc70cc85644a4b0819b3'
         '514faf7b0e05456ca00559c3acc97aaa'
         'e469605d5cbd90bffdce5ee6a413ed5d'
         '4ad46752158905bff3dd8891ae7eed3d'
         'ad43aa0e935b37577515feb36fd6ff78'
         '5c4baef2602f9cded7527324aba2aac7'
         'cbbbcf2689a5126f0e1e27fffb524bec'
         'ccfb29a9a88ad08d71e948a1f33b6e12'
         '411e35851b531acaa7464844f3567d06'
         'd8997cb7b7c3780d3ee2b38872f0565b'
         '0b925386639460d68373bc49a119bc13'
         '31e9194072269fb2dc99698c16182840'
         'b4a92bf4a9f1288e8d7d8a0dd9f67f0e'
         'cc98cbfacc9940b97c77490cb9b88640'
         'b8f2889726499e27b4e52aa90043b6af'
         '0c0c4fa5226e27cd637433c7c70da519'
         'ecbbe84b90330d0e97148083501ce953'
         'f75f120c747e7063e2d5a3bf564cb41d'
         '58be76f9ee1c04a71fdff7d000d1ccf9'
         '380a4c281904a56abf7927c8bcf6ab67'
         '69506cab32713fe5ffeb78227701702d'
         '273b53889be813f11527dd0a8b2136ac'
         '33d4767ffbf26a8f531637aca770dbf7'
         '22155602133fb8655fc68197688799c0'
         '8ea547b52c8e12dd400aaf8adf7a63a5'
         '613027469a61976bea754cb65507434a'
         '14878e6096d1100f6398b6407cc1342e'
         '45200b15e9cc922ebac4566c08a39f62'
         'f568d128667baae0ec6f1dc160d7dfc6'
         'cf9921b083c5e8651df29af2435fef0b'
         'c683b6840b4ab256ba5445e5eee84310'
         'fb1e1122106b4f49e89d98da4d3b34e9'
         '3f82b1fd9220206b7b247d577f44d2fe'
         'd4dba5f0f1de656a34e2a4b279b67ca6'
         'd69de5bb9789b0eab0696a49553cc14d'
         '396cf7b5283c7fdd15a2b21ff5f5d779'
         'fee6a79b28cc3d43eb113ca52cf4f306'
         '077e24417c6ee69de65307dde6be8053'
         '613aa82e5ad3310cc3af1696b5324336'
         '544ee179c9fa2f4e41b5a8996463a4c2'
         'fcc9ee6af5285b8ca1c277906f520288'
         '26422c967b3df1e9f58820e88d188047'
         '228113f4aac1620b5f91bbe7325f24dd'
         'eccb19bd1cf1cf7c23a8eb87b9390eaa'
         '6ad909b572ca32a3e5e0958f6cbb4f69'
         'cac73ed35fd744c4e74a2162382bbdad'
         'c77ec8502be4154396759951ba0dc2c0'
         '10bd8ddfba78657aee9ec6c73776246d'
         '77cdde2a551d3e2a0b5cc1616ecce41c'
         '340dbd2fd167a77f5f768b9dab0d2eda'
         '521c8f784a50d9f26808caabe6e0197e'
         '5cbca0d8f71d153acbd449e7da94c610'
         'c136e172b947ddfade8f69d77176cf4c'
         'db284a5727bf017fc2f756c3efcdfa47'
         'd7f2504aa7f405addfe5387ba731216c'
         'd2c804d1084d5c0a6358eb7d5b73f10a'
         'a778cc24b4aba2e5aef7cd3b19ccb61a'
         'c1452df6caa45f0f33eb8e97efb62126'
         '1632e6fc456e60b40bb21f1dd983f840'
         'f4b952d3acf6263c50f124d9251e2f7f'
         '99e23b98095320d4267055547df46a8b'
         '54869bf7af8a2e132c4f4bf3794727f4'
         '6fa0b88beaccb7d5467501cbc53dc3c3'
         '0fdd2c91c1d4f83dbc41611e8d5fa21c'
         '23bdc44d63b6e7bd5eaec4fde61f2bb4'
         '1a913e569cdbe4bccfb7ec139de4a4b3'
         '5a6f4be2680f3752527322de199819ac'
         'a9b91398c86391b75eda0e76741e15f4'
         'f9f046ed8450036094640bbdc833ff98'
         '56627a4a6f48917dae780fe94e0c5e89'
         'a974e36edc037e5159f4048c96434d4e'
         '692d5cae4f9ac5d7cb81208b4f9377e2'
         'cd3e14263260fd81153e740bbba2f03a'
         'ed8be605fb1d2f1e66e393a307a1b9a2'
         'ef56d2a28c5e20923dbe1ef2234629b2'
         'cc2e6fb3e11c2068dc21e5e4ad0fd908'
         'a484e335d79bb53785a25e1760def292'
         '59e1b75325322758b0042d70a4f9be37'
         '96cefe0af04a8d21924326628c6e7bb6')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
