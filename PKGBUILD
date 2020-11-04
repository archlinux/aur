# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=83.0b8
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

md5sums=('70121c55618d203fab6e6984167b64d2'
         '7c19168166ffbc5b40e7d05770d2db83'
         'c5f68235247d4d820f49c08e34c31208'
         'a8af20bb4e3a961a54fa0b4babbf2781'
         'a09272a0e0b59e1a38c3c720016094da'
         '86022a20c81211d9e2aadee6ef2be607'
         '0d985154bd488134d10de39533f9cf51'
         'd056ce181d15c3bbb9984328eef45b96'
         'b42f190268f95f3228469f2ce0e2ab60'
         '6d7b17d1aaf4d77eb408641f35dd6955'
         'e1ac22de599cc4627e61e1a4832c6a2a'
         '78022e8c7b570b9632741886d7f44ac0'
         '3820744e329330f9c2b9604a189c8eae'
         '32dd97020f55a6ef8d2d31d1d5d2bc68'
         '9cf20993c3a84d2ee4e96c31029d4e12'
         'bfcb20552c1b1367e16670cdf35c18c5'
         '511713df9bc75426d8b601330cca2a96'
         '57a2f4bcd532d440be09c31f071c4a02'
         'cc51c72a24e52d726db038a4bb7ec627'
         '0f92cc0c6a7d02e6ba95d656a4783c73'
         'a8ef011824bd5652159d69ba853f8e1a'
         'a9305e98272ac7e978a43f090395a592'
         '33881ff05c502c037bb1741cf4410180'
         '86d4214203b2bf1bbd26e833948df0df'
         '90fd4f6549e279a5485842483fecc36a'
         'f32b172f63fce1ea79beecaad245182b'
         '7e1d67e5df81c95e842b839b0d81f41f'
         '8ca842de570eee71758194c853e69df0'
         '9659149c26a14b01d8a21007ceda5dfc'
         'bed6b96458bf11f413ae1f64987f2ec8'
         '8c1be8b198b3139c3913c84581793b5d'
         '6888834f1820df17ec5a795c41467e05'
         '15e462b69013cec3822aee813d78f3bb'
         '3b834d9419e32ac4a8a7b088759dc886'
         '69c770fb7ca0fb08444ce39b57a1135d'
         '3c4490d4db9c79ee6af650c72df7d17c'
         '878fedf92958fc7cceb6a701eeb8d188'
         '4bbe945601726435ce49a669e4664fb1'
         'b2e1fcfad0db9d2807e556c6553546ea'
         '21e9605a0e5637f6b00ab90e5d62148a'
         'bfab73db00e8dce9aecae03e8b63e704'
         'ae874aaa477e94b7f9e8ef800b016b10'
         '39e814530f0bbf18a0eb01f80d94177e'
         '4d45695cf88bbbf1c381c0a2be67288b'
         'c8d6dff5625b155c0f7cad3f089b95e3'
         'd16c21cf64f632f780e8ca55a52ff8bb'
         '14bb51b28d88e1a419ff7ecf692d7f9b'
         '5f3b85b7f446d8f382f94cc88c5af55e'
         '63da54d7902e5edb835929e3cae1b355'
         'a7aa12c2e222e71dff21353cf7c78d97'
         'e466c93ba218d8588124efcc43002055'
         'cf734573ef63fcac29b43007c3db1dbd'
         '26305248e82a1c783c91918c2d2e1585'
         'c10c373418ce7fdc26cb8ddbbb845c40'
         'dc51727c09d41f7d744b8eae6f30cc5e'
         '5ab77190a28ac01f1e8a2d9bc1de3006'
         '3cfb0ebbe27c1402624b61eb23f7c88a'
         '0902d36abf175e012f8022a24bd810cc'
         '1eae2345fd87b825dcceba861f0f9d6c'
         'db89accfdc86182029371a5207f152b7'
         'f5ffd6192ec732e7d694a85d9518e1a1'
         'f42ec428dfbc9207ee45df1431af966b'
         '9d716a2abd1a4531a2aa6c8907e85b82'
         '12851a0c80a2fb5242ebfdbcf53c1884'
         '419bddd9531f8f171631fd3b89648dd4'
         '521378c95a83369a32a3d2e76b191fee'
         '80b19a1fbbcb826785b83978547aa3c0'
         'b6073cd96086c10741833da10964878e'
         '25757d2dd051d247649afce6492de264'
         '80f4b05dc0eab0f3f63389e2f2e76b36'
         '3e5ac1ce3eea607a798e59fc0edb188a'
         '079497c8361922b7e2c67a552db7998f'
         'bbc13c195c04c5cbba4ef2c0b023f197'
         'd70da357e726975def5421c6dd6395f9'
         'da7b6ac4b056144efa1ea6dce31ce2b3'
         'e6154167289be7d14ab6b14131265c07'
         '68f20413b3d47acba6caf067624207a7'
         '53e34dfb4cc7283ca2ad952363969ba9'
         'db6e28a8e6250f61f1f7f68bcceb2e77'
         '28534fc57f262185343e8f3cfedd220e'
         '5b9fdde7954354747710f3687b195910'
         'b5799fd95197466e3a315a05e67b8791'
         'c32941baed0306333396e136c4f0bcc9'
         '7d45dbb85e4c9ec2039b93a4609026bd'
         '911fb2ef004264fe647afc8c702d98c7'
         '86d22b0a2f54254557228634b0cc3c8e'
         '72d8935ff0d496d3bf89a5706eafdf98'
         '72f01931637688b511d7ae848dfb5ad4'
         'bbb8c963a3d3e296c33697575c15a21c'
         'fb6452ce73a050f404e491cf0b7d8263'
         '271bd7dce0d4c766d4eff08ec438beae'
         'e9f901668fff010d2e25c9739d617e95'
         'f025c856f5044a874884d5d09a97c798'
         'ce576dbe3b34b1f7303361ed0c1197a0'
         '0454bda0925f09105b45f04ac49a549c'
         '6c391723194dc5b0e964f6d1fc08cba4')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
