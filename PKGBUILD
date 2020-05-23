# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=77.0b9
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

md5sums=('fe1d1c8a7bf291477bc0526c1510a2b2'
         '95ef66665bab13396b41f32e91691477'
         'fb434d40a440023a7a6ce4f7e2c4a310'
         '5723fae8933ed8d18e290f98ce9e59d9'
         '797e4c5efd28ddbc7d67454607126ed2'
         'e1f09d11f642e4a44ad2b763ecc74cee'
         '46e38f54678dedf5225a563a7b68e3f1'
         'ff84c2b1dc04fe37f8d9ce8d5ff5f9c8'
         'b9b5d402b64fa3ce494800467de9dd1b'
         'a9fa274a5143f034ab4c35ec979cbf4e'
         '35313224e79f6294f91c49d7e8d88484'
         'eb3391eb7b92def42528ecd32eb0fbdd'
         '048050c093e92cc6dfae23901eeb7b03'
         'da82244745c31a7baa4879a8654d31a6'
         '8517233a53ac092c3349349d821a4a95'
         'cd1491358f4d839b0658966a6e11f8b7'
         'b6a98e3d9f8c109fa89c73ad912d9f99'
         '9209e9e74802881aa5a559918337143f'
         '6d48a30b0ace42a4abd1adf6a9cd418e'
         'bac8a082d653f3b7819e1f8b855783a8'
         'e9524a385ac18fe238de344e9752ea69'
         'a7fbad78e2fe7e4d563603ec1b050cc3'
         '01ee69c3ebd187b20805787931a11ed2'
         'd7bc5c1cd5169921f62991cf92102059'
         'e9f76d97af9077679cbe4d49b7f90acb'
         'abecdda5131791ba82c24b2bd061467c'
         '143c6bfad98114d699a203540b884638'
         'd6c8af46f89338d782b4832ff1bdd9cb'
         '0b7402db9c6fa213882d96dacc7179b3'
         '3e700192811c903fdae93b9fe3420feb'
         '86228e86d126485eb0033d30e9fc6ca3'
         '29db6bf3deac24f92db540096d4ac96e'
         '4ba231c928f656f09ae2a126d425e24d'
         'b2869b1dff3da3a58f6368c20e833b0e'
         '8be0cbdedb7d68a9909c2461cef0fb29'
         '32d51b729047a7fd72865dd245cfcf8b'
         '8b7d4ef47832bca2335775c1d3296aef'
         'ec849f247a363fd9a7ff89078a64aa10'
         '8bcf333f5a08e0aedd356f8ea1106a17'
         '238a2252be9bf69d48bb6f0ff178797a'
         'a584d39ebe641002b593d44d05325113'
         '1bfcd71dcb774917375cb2417efe873f'
         '0f27b7ba431f86714c6d1f903043e357'
         '2f6f9cb08a7f243e4b9d4d9729c30aab'
         '760fc4169cf42bfe0664ff435a8a613d'
         '937d92649c3c93fc288f2c790f90e6c7'
         'd3b5b4196387209627f51a25d8b8d8a2'
         '37f3834802c66cae04e9ab8b436b6e63'
         '582b3a28e1a3c7b98f4dab42f39c43a3'
         '0db679dfe7e39be91766885007a4b21e'
         'c099bdc5d201a5b62afac1ab25a659d6'
         'c41d334d861a4797a0aabb413b2b62a1'
         '90189c93f2e6c84b4c9163a2d6eacb5d'
         '0c921ccda5250442035914c9892af7a1'
         '818e1ebd22ed77b42191ac0e4ccc5456'
         '8465296d7c1c629973b32bc1d7fb0cd3'
         '5c4288bce83f306186001089e3a53bf2'
         'ab3d4f57e88e92f00e34991e420f29b9'
         'f5772d7b570bacb69f53077b4e07f88b'
         '2e3f00fa79d70a99656171896f3360ef'
         '3d28957b51c6e4de0f34520512705a7b'
         '8a1f45b01e9d5090b6bdd688821cbb2f'
         'bfbee55cede053e98dc47964ab837b51'
         'ed3ca1a61bdeb2a7f33cae18c168316a'
         'fceea752ae30d4e85079f7743c1c20d2'
         '958753cbeb89004df3c36f4fe5153a11'
         '006ebe3516d9c716ee0eb58184d0c70c'
         '514190f2ad1402ff940867bd94f0fa87'
         'f9be2346123ccffa88ba12435e75c08b'
         '4684c81771923e26880c85cdb31d7d60'
         '352c10293bf33bb33b2f633816327b9e'
         '3cfdf6e4c2c12901f30a16ca3d218ff0'
         'b21d8ed7382beecf4fd3c911bd1bcf28'
         '5467e7134945fe4256eda5165c25070d'
         'fe8febae307dc23739869c5a5bdafd8c'
         '58de05b1ea13c94431eee6e0618b66b8'
         'b7d0f925fbe02bafb2ebc48aa7c8622e'
         '25da41426093456f2b80cd1e0ca4a404'
         '962ffb805d0c18a0821625bf0b7c6da7'
         '52f0d6d60b28633d16e888c7679ff6ce'
         '13e74debb338276e0d29fd187b65555d'
         'e89932992d79f6a54d43f8eb9d661710'
         '0d17cc7b7b029409744cc9e2ad4f78a6'
         '7928a8492e4256f13a8cd934fa4f655b'
         '1b3bbb01d9e4667e719fd2aa4a1c9b04'
         '76b75583af9d1b1a98f044aade4d5005'
         '9ab1ce9f84979cdb410aad1c6233f7ef'
         '67badb83ff5a5283f192d8512cecbe69'
         '9d42333f060814350f56529afbbcfb99'
         'd5beba81e23d15f2001690f6d855886f'
         '624767bc8b693aff8bab134fc0d463dc'
         '9fb81e23945f524f61c94c2d0b15dbd0'
         'd9a00a9d83d6b68fea3b096fb5cc640e'
         '696c5c98cca1bb4f36830926e9ad9eef'
         'bf9e438b398186717d26f340143adb82'
         '2ab40b35b595ce74e2d3167e0055689f')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
