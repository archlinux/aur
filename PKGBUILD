# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=94.0b4
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

md5sums=('365db092cea686c853482d14a11c17a0'
         '7d228c43f09fc64a001cbcd5822d2590'
         '0a16979e66d5e247557be9be8dd0dd87'
         '423c6c68baa0f6c0a87cc74f6726b1a2'
         'cddc0ee77c303ff72e752bdf945b863a'
         '55ec54252d5e414f2e088424a1f65bbe'
         '016c0e643d0a9b41354b1de2ba846198'
         'a9dd2e19365aabed7687dccf843fa6d2'
         '7b337cc59944c01136d6ae3026114a4d'
         'df1af541dc9971a2aa2e0c2942093d42'
         '232988c2fcbb8b6b7d0656de42a2bc83'
         '13eb79a62d614b68446e7c8aed2c8206'
         '67d7773037ed28077a04ff99c39c2eac'
         'c74c56633c90f54cea36cb246657b415'
         'a1a6a5880d9f49afae4dce2176ce2660'
         '6a9f82371ca1be2880ef31e4173ee5e9'
         '6f5cc72559186c0424902aacd4bd32af'
         'bd644465a47baf445c695b752f6e0af0'
         '2390bd3eadf4e5f67465ef20e94545ea'
         'e53158f765cbe58b09c9d3fbaf017cf4'
         '229b42872290041e08586375acea0fcf'
         '875badf9deb9fa26187235b540db6ecf'
         '488f27fa8c58ebf60d53102477e4a087'
         '7ad038b02e464d892cfd48a3d8590075'
         'b03ed08f55b68cc430826bcc346918ee'
         'c9db482850f77f64778927b8d6eaef5d'
         'd35ba1f2d987e3f4a24681c61c42f6e3'
         'c207ec871c2d5e154f85c755bb8af827'
         '12acb5251d78afc41e532de4cb17a20d'
         '68d145e27249bebf1bb9670ebff120e0'
         'd79b131468cc977411ea8356c24f1852'
         '6acef54032079b370abfb92492c75a78'
         '832ca3330e8ad2170f39afd704f76218'
         'af50ce6e415cc6b14b7ccea65dcfe86c'
         '020738b4f426ca5cbe1c12f807ba8a42'
         '7c09214a84c681a8b604b3a1b7ea19d3'
         'ef86c56508af0671767c342d0b7094b8'
         '2a0078fb361cb9fac8549af4ae2b0d1e'
         'b60c029036c1d315a9d53b7a867c1ee1'
         '7903a8e9139c342c0274830fe01fef05'
         '7d7d759f92a3693df991a745dcdb3504'
         'c83032674d962fcaa4dd761775acdb23'
         '6a8566a910514493cf028ee4c0e37165'
         'f4e4fd359efd00d93e729e26a972b83e'
         '522a53aa77ae7cae59f00cf15ffe71b6'
         'b1be0dd4b8938c5041a7608846d33a71'
         '65a177c355471080ec9e0171aed2466c'
         'a32e0cedcf3b10d8051e6ed21c747a52'
         'fcb80e1805c039e9601c94a23ab9a391'
         'd0397cd7ac50b5f7584ad8e8bab385d6'
         'd8852324ef44bdc630d756d464425e22'
         '9d49c17f821a57fd1bdf2c845fdd0094'
         '96c965684fb447d3ab1d39699ff547f3'
         '19b7f9aaa841b5f79fbb7d514082f39a'
         '81fca73396fa2f0e77d64d552be96855'
         '87ae870532ab2a9dbc912c39d0c85d29'
         'e37572e098099451bd79fb3ce3991436'
         'f8e45161a26921508a1e5d578c480412'
         '3a54567dee7aed7e5dd04b444630e880'
         'a059085e8383b3b01713629298e9a719'
         'a88f83d071c83ba748cadc2f7588eec0'
         'a767006a6ef7e92aab50f51d48eb2f6c'
         '2a77ce6436497b16d342fdb88372a273'
         'bb084a731b58cca8cb59af8ebe3e5504'
         '5c872e481b17bbcbb9f8ba7e55f897ae'
         '59794660006874abb6caad59596e65fc'
         'e254068d83cb013062e7b03be5e65e9a'
         '00953c83a98255eacfd2237e67df5ff0'
         'd59af8feb8679dca45cba03c589ab93c'
         '42775f7f26fe03e16b187f870a1c06bd'
         '98a7a1ab00ce150fa05dd5a821eaa063'
         '1c4c01851f97ab32ebcd7a4c6c1909e6'
         '62e100496d8fae9d22eb099371a1e53d'
         '3a05edc88472f63240e169f9eaf7916c'
         'a17d8a5685d78eed47cd7a9b7765ec2f'
         'b99a5891e42f3c92269b9f644447bcee'
         '237babe649ef02bab97a520587f991c9'
         '0b35f685e53d6ac7764a6ccdc236c218'
         'ee75e2e01baed669420931665be4ad06'
         '0f9b3d8a049a0f4e8979c19b81a4b88e'
         '7b763a76985f6f96791f50b34f003049'
         '2451d1a4a19d98876051828f271c8cc5'
         '8061c007d9d42170ffd58119a73057e2'
         '17156410b8dcf0c74aa5f44541758300'
         'a9335e85e9f31892cb68cbb77c720bc7'
         '0287a6db546acc50878207036d8ac060'
         '0bf2568f6a6f318ffd58acca939e19fc'
         'fbc88e1a6c241cc7b794d15b04b0425d'
         '28c3a26474a11a049da20ba0d63c2f53'
         'babadc4fe856b03554f55c94e123ebc9'
         '963f38ff0d10b71781829d15b384f421'
         'ce967dc2995600e662ea518de85d8ea2'
         'a3443075f764be9d164afc86bc7fd538'
         'e4e8d703a6c1eb8a7abfea608307f71c'
         'e6e19a7bf14450ade1d7ae69306ef27d'
         'f61a0b196c78c7eb564b2049eb6891d6')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
