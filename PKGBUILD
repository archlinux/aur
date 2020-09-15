# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=81.0rc1
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

md5sums=('8090bb9efab9ceee09a1dc3a62dcc7b7'
         '4ff519af26bc221b883563c3ec414032'
         '714689d282ffdbd28f4851633dbe108d'
         'c0e364e261b1a40a72ee33de0960336d'
         '84989d2495929c7e48c99a040b825946'
         '6782276f8cf3f3ffe74068cfed50e48d'
         '2ba6668d1079b55e9c048412e61f4988'
         'd0930d584f9341567d3f5a49da779342'
         'c98e5e889889e5c91099c4962f71afee'
         '8582eb4ec51c7c7b8f077fb857a52804'
         '76b1637c9de2b7aa377ab8e520b1e3d5'
         '3ac23622dfa600ca34facb9837b4f7c4'
         '281011c9eaa0e21214e0502af81bee90'
         '60a551da568d43c1d01242a772a3ee66'
         '7df4e57e735588f2b8c2bcca6046605d'
         'da7c0564a2ad68980a20b545bcb73bf4'
         '16263477bfed4c424344297b66f997c2'
         '4d102b1325df58c48cb682a36b3c87b2'
         '924f1c42ba76cdd8da15e2da4ac9cc00'
         '4735a8af004f6ccb629e0b62e04e8c91'
         '950cf332eb2999d068448e8fbe3695c5'
         '438071ba143d7d6ee42c63fdcaff5f99'
         '58a6028de2e3b8d59b73141d0d59732b'
         '5bc06d92316b41e088058bde4563e079'
         '2843cdf1e0284c2f676e5f50d4d27cf4'
         '1c0685d04bad65f8c2082b6cb64ee99a'
         'fdea5c6298ff1b6030e218561a444647'
         '1034febb51995ce870e01c4ab2f01639'
         '1ec7b5ad9472c3acd0a2b5207e20bd43'
         'a23c1786236d6be54277f4959b282c7d'
         '0df44263cedd2fcb8f8df31bb87f2cc8'
         '0adaea637836593861ec9e019404f114'
         '5df417155aa1b9b173ffcf1a9c987475'
         'f937856e737f6a45735efd1a31a5d37b'
         '55f651f546757e399358b873afdf5f70'
         '1c22d2e8680000d9627c28f2d92ea046'
         '5adae0b8c3628196bc96059d76d72db9'
         'f4161edc1abe1d59955ec8663594dd6e'
         '3281cbf2daab7ecbc7430b554fe250ee'
         'e3e66d21a92239e720ce086804170f39'
         'd2f0a0fb11d6ccd4e69c857fab04d544'
         '4a9a6c3b7f664b592bef5a92198cf047'
         '9027e0fde2296e3f11b7d946f58637d1'
         '5d436afab60137ceca6685e5c9fa7896'
         '1b8eae106c49e13f7276ffcfcaa36a8c'
         'ad1bf88c1e5e559ccecbe76eb1c1fa3e'
         'e63f27e745d3bb9332209dabce1f4eef'
         'ae48c222ff9182bd167aedae79ac16da'
         '74a5f7ccb9a727e43190e02b444607a3'
         '7f98998895c8da7100814e1d1e69eae4'
         'a3773741717c0889deaf6893d177b2b3'
         '68ff1437758734786b58c052fede62eb'
         '7948a3983d618b83318ad42f36840e47'
         '1f77b980e55d1bee4f7fc2f3e747cda8'
         'c602b220b63d0de540ffb094be625803'
         'ded5ddabc01be77eb339af43fa7cd95c'
         '038207b87a847f5249bda51321fa08f6'
         '70f7a17872bbab81c3c2984d63b013de'
         '89bfd5582987402df671e5222f6fcb0e'
         '208e68653d8c195e07c05c00d9119647'
         'e3fdc54a87cbfacc483659667b162ee0'
         'c8dd48407afd28286e09a2b03449bd4f'
         '313b428675172453be906022d957c147'
         'edcb7e9bf02787aa15058a737933d21f'
         'abb1d39240d474321778e429240ab4a5'
         '26db7211fa1b9a3d4130d3b005eec5be'
         '7a5f2f0903eb0d435ef4644290a0d2d5'
         'bd7143ab390c4b9f2da61fff0c6a4c6e'
         '661dbc266c1afdd42a9e4bfe92a594e0'
         'eac089c3135c088f1e949d932508341b'
         '079769473d1ea8a9264a75c89c0bde52'
         '2dab6ce4fda0ec557628deb76bae25dc'
         '2fbe97a59f942c9c52b48cd8bb62e8e2'
         '29232fd5189778425a4456ce30b8f0c1'
         '1c96b655fd34deeabf453427df7db259'
         '1bb73042984af45146025063fba6438f'
         '9440ab9eb3c7639860d4568f51fbeb9a'
         'ba5cdb455d58520b3928eb24ec4a1ebc'
         '2bc1bc81c08636a473639ce077d7d825'
         'bec82202ee3ca06bfcdeffa8ce438bbf'
         '143e035287758da8cae3b20892b7363e'
         'befe32674186cc233906b235f2e6f25f'
         '9cd0d86439b22b642550240fd9d01d9a'
         'c61cb080ba2d38f1755028618c0d0018'
         'cfd7c4cc5c55d6396821a0da2bc2b26c'
         '498d4ba9e05b42a5de6a1c61769a6211'
         'add661ad90ea711ddd30c5c1a9adcf71'
         'f2951ef4d4cb1b64c2b416772b258ac4'
         '5af45bd30730b6c1d57a5a2010bc3599'
         '04ba2d975d36883c004b16fbabcf360c'
         '92521e9b573208310abc1121c013a54a'
         '9e12148444204f55a16a975ff253d1e8'
         'f886ecf6de612f84583bd357aac32107'
         'bd8b8414316d75041f3575ae2d9c7b03'
         'b54d02850b9b81390beee9dcc82049ef'
         'f12e32bcf652c581458659f56574cc05')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
