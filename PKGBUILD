# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=80.0b1
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

md5sums=('ae9c060afc85922cfe71b89d09c506ac'
         '7c6d76b17960a5f370deddc24273b98f'
         '22987bf13822e9386c559797e248ba30'
         '1380fa3c7781e1245eef77f7ba61518f'
         '72d589994c9fabfcce1b2ea970e73c8d'
         '582f415f92098cf3ed569a4532f13ee3'
         '349e5ce9000e0a80dba4618b23bf8cb4'
         '37b0db8077bd4e07d05d41f6947dd874'
         'f47ec85141ee4df4032130ec3fc77a86'
         '47f818fd78cc5e475e50486d46fe3ca7'
         'd3b13025a415831449cc9474ff17260a'
         '4b8823e6cc0ef9da549762483d5132ab'
         '830eb528f0c332610933e3b8b3f5e66a'
         '951a6a640b0518a5133b7b7b20d0008c'
         '1d26fceb775783b4f946d4c15375d478'
         '4d797b4ae00e1ab18d5ef2ae3eb58cd8'
         '9f804018c68865f8c6fdfb19ff5f8884'
         '5a0c252259882c206168a595bcd0d462'
         '02efac7d68ee220ea38a83ac97509205'
         '9a55516e4af3eb965606589e355409ce'
         '759287473233a96a99cc5c390eba67ca'
         '6967968759df0c7312f3a1c93e2d4c4d'
         'b158a2cde30844c122eab3da6794acf3'
         '074d3407e126d927d837d34eb8bf4284'
         '91df2d6826275cd37ee966ee701d87f8'
         '0faf63cbc9cd7eed7193bf3d2961a116'
         '23f14747163506f090d6926716280f07'
         '24843b5e7466aedb245d42bb696605b4'
         '21fed1913dd2cba40a34dedb0d27af55'
         'dbcdb2bf8da0d38755c6d309b4e07143'
         '476364951196da7f12eab1e3119800b2'
         '806676b599b22bfa15d1427d1f413490'
         '400fc54e2b36eaacad09d00bb66f49fd'
         '31c82ac0e0139ab89694125bbd59fb41'
         '65f37d9f7b87cfbd8100f325187506de'
         '423e3db24d78ac913709f718a9700759'
         '166b85398423b4e59b8d0daa537a9387'
         '06bc5959c4ff6cc1694f30e7cd38d73d'
         'fdb65236dd8e7a08eb796bed226b2998'
         '1b13fa6bfbc6ecf47944551cced0b85d'
         '0d8cbd4631510895904878338b9b125a'
         '75811f5640e9eaf4ba631f984e368328'
         '538c973aa9163cde72b8d207b4b5f9cb'
         'fff83554a79e5f945c45007e0fa835b5'
         '4c88ea33e3d293ee167d97789c331b0f'
         '4280c3580aa256310d41ccd89e9886e0'
         'da12d9076ef240dc9609940ec702b105'
         '478e133633f21c3c946b153fbf52b05f'
         '8fcb297cc07948570dbc45aea3d112aa'
         '600c13ee1c4337dc5cea80d360bea473'
         '4cb413f4b27cf78a270b8f3e35e79185'
         'f71edf7a9c10fc9b0e02f3e02dfe0a44'
         '2eae4f51bdd2970ad313d72333a18e50'
         '22db525a510b30747623fdeb1a5b9091'
         '32987a2a99a9a2adb8000376cd6bf87c'
         'edca956e20c4d030cb2eb1c10b237e53'
         'ddddae10e4801f4714262bed4dd71be6'
         '2fa4914d3d1401d32b6806d608312839'
         '65e5ba7b037f114ad583ca590ace2d2b'
         '8cb154dc610964c5575e25a34443a9e4'
         'ac5a8ede051ae81fdd19b97de4d95122'
         '53d6e4dd6b55017b65a0c064f7ce0b3d'
         'f518de21f3a2bcc88cd5f6a11f8fd9bc'
         'bbe4e0f45e4ff4f907198f72c99333e1'
         '3bccf1bdc718153a29906be8a3e929ce'
         '2c5fd35cdc9115e261ec1368c68a8ff8'
         '1e64d76b18c61c282818fccc276ed770'
         '397c6acc9ce8d289bfea128056de0b00'
         'ef06488da0b78f456ddd2226ac341144'
         '1aa7f7bdb7483e1bdb2632cf48067903'
         '7d14e8973f808d44ea3f38369bddf1b8'
         'fe90e7cc537231153b1b511852732fa3'
         '124f7bb8aa67cd351bde6ce4db3ebb78'
         'd59936b66d7b71b3a2ac7ed8547607e9'
         '61aa7ba3d4143e092ca200356fde53b4'
         'f2582eb259e923c432409fa84fbf957f'
         '29431b3decc229644da3e8239fd67238'
         '0fe458c6e571a5f9d01a957e2a64bcc8'
         'cc6d2b6ad49472e635e7bd646155e3b1'
         '5dd007ba8c1c40b765fbec4cbec15653'
         '34e020122b41aa2c0ff6ac49c7c5795b'
         '47a6d15e696917de72e341c94536f995'
         'c7bbeaee4e13607b772d2e07d371fb45'
         '4effa0b26752800ceab8653b9b726e85'
         '2675a9051a47e5b9234d50b57aea56c0'
         '2084a62625f121130729efe05ed1e442'
         '8564b8e94272b474e1b8e48f476625c7'
         '3d780145cef39598f841d4430ee9b716'
         '5c4ea3774d16315f2b84ee8cd8a0458d'
         'fecab796c29cbe306ac60c6158b12b8d'
         'd6e6c4a7444b68807516bd492ffd9c23'
         '61659cea4780eef0fa83eeb9b92c977c'
         'dcd6b0546312fe1995839f469ab42fcb'
         '0dbd1c48954d6d7a0e9b3cf58c9e9452'
         '6601f6ab557487560a32803e28b3b2a8'
         'a7c668bdf2d329297e0e50a6b2179bab')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
