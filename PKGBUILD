# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=86.0b5
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

md5sums=('0e6f58e48ab5c1bcb640343e73ece199'
         '7a4b445026064eeea2b19d71ce540e1b'
         '2de6b3c7d9f4228d13425064ea29e049'
         '34f4b92d9bafd4eb596a07d4a856d26d'
         'd1f99d981a9662c326317e0e1fde021d'
         '10e366ef9582a39fc8861eb6927a8593'
         '7d4e96be2702c68f30ac559ec8592aa8'
         '911597c43ddb246811a154f843c59f38'
         'be172a3bcf544d2467ac9f9ed7177562'
         'e7792af742d9c5888cc27219af758136'
         '6dfef5320dd1d2aba35b7c523e8a9dce'
         '46aea105163845c21f4bc776137b02fa'
         'e465e151b3206c10eb031585aacab649'
         '39fb5d9d66298058acfa7b3df0c336df'
         '7953afadbf404225ee05c0e568204876'
         '076f46f9e76260a822be59d65ab33c3e'
         '8df1e0594ed3a48ff145c3478ba2eb80'
         'e8b7d9e235fc89dd588ca8f42a2897dc'
         '838d17177d14d0f4d666e439e415a1f6'
         'a0953190a492f3e6c472d6d610650e2f'
         'fbd24eb49d8f4c6c0dc16d08e3361c5a'
         '3ce070e89e144e59c1ae824730b4e919'
         'd9ef332650925345edf9fc982c1c5fb5'
         '9c209cbc434c4d66c2327479b8da7223'
         'c8da8ae61f570267b4282057dd423f71'
         'c0718ba67c566557cbb8a7d94547896b'
         '3304755878c6518aad5ee5445cb52774'
         'bca15411dcdd86166a179b7ef6f433cd'
         '6ae2a4e9e21848ae5f917a950b16a9e7'
         '7a8feb517fa290f7e9454fd8afc3e1a6'
         'f967ece157231e41093efc75c884e4ce'
         '85b5adf1bb79fc3ba0bd4c9931dd038e'
         '7b9917e7329ac092689f3ce4dd6b0463'
         'de97cfe96cbfb1504fb9d022cb10a8d2'
         '918d986c583675c6117528db80462df4'
         'fb940712e001be575b579f0ad99507e8'
         '103a4635f77dcf47be2500068f6dd56a'
         'f3a032cf858c2f5f524f11a6eb832715'
         'c0e7d7e9f5a790ecb3396901bb2d0b93'
         'a40ef413952f525742d75584784ac202'
         '912259bc1ea0472361ff2d5fdef09c21'
         '6c77d8695f1306e5eb75318ed53e70cc'
         '629ee3180ec4b0d272fe10d0e8620f5f'
         '502cad70e4485a2d958fbc5c5e9c2367'
         '8f141044fb3221ceb462569cc40f931f'
         '18ee9e2eb9fcb898b176f836861981ce'
         'e2e451d974d78ff1840446e1f1aa9e52'
         '0121962a0fcfda6dde06489d298ce487'
         'cba3a41783a6e43b3fa2f40d252d0e27'
         '7510a01c8344e881f730e58888275a7e'
         'c619f7024a999aa79a6ee01ba014a1ba'
         '18ea1321ad4573238207f6bb0ff91fb7'
         '310895d3db754c130de635f9f48fadec'
         '8e3334da76ec8c2d1ccf4382cc669a9c'
         'cf9e3917fbe49d6ff4fda2efd92511f3'
         'f0d9cc3a68b027961f0b8babd3d02097'
         'da81df78f07c07e30e61182d18cf2811'
         'c5e56e17f23b877d5d71527b52fca9fa'
         '130610c9373ad07299b8c77da016930c'
         'b22e3ee0239f53a38310bbe80b3adcfa'
         'aa9aea747efea2f125d6dae6b334f903'
         '5555edde0ae53c8ac7dbafa9b768e0e4'
         'd82637ad616f5f7ba62ce003af28bc76'
         'fe53c403b4eaab4a731bf9362ad0759b'
         '8da581081ee7a27e316be8537c9894c1'
         '7c39c7dccdd4444b3078f63576fcbf73'
         '49ed4f4d1ad02ff1639a81cb4cb41d26'
         'd52f9785eae8099b11c81ac7726f0a26'
         'b5e8fdf76934db7d64a6ae9dc536ae07'
         '41ba0d81ee1a6b7f1e27e7289cc513cd'
         'def47e22b2bd7f02db2acfb4f230297a'
         '2edb3890fc74d0c45411643107cbdcc9'
         '9b138c4debfb6f904295d49517d521b4'
         '6837fa85431cbbbbabb835045ed728d3'
         '1e5e7dd6d36ac290be65ad09d5f7adad'
         '7f068762099d4511703ed17c2fffdc6c'
         '4939e5cd4a7c0c89013fd1ada38cdd5e'
         'a5b23a2d576d8380761199796cc62460'
         '445ba1f5cd2ec1e5461b583d511bb67d'
         '3f01fc6390379e462988caa4eac6915d'
         '617fd2ba3a5271bd1b54d4739623dbee'
         'f4e764af9ae6fe534d4912fc766f58cd'
         '64a67fe9fc44c7e3900eef127c173d30'
         '73fcfbc6e2d734dd63ca900e82855eb9'
         '2e9336bd732bb21f873e55e67ac37657'
         'f6d42b2bca3df637e69bcd3fec759bae'
         '92066bb09fecbdb6d1619e568af634f1'
         '5dc0a0d29b77b6ca582291c1a189b069'
         '992c7c6e94f7174d19c0a8c5983b9f5a'
         '731c94e6fe14b1a7c801310dee246f69'
         '8fa54d2845fcbb094907fc85d52285fb'
         '3fb2bfb7798bf3c2c8d811bfc1aa34b5'
         '11066192aa6f7c22664082521014b3e6'
         '6b6e545b41af45f0e538c17ef698a458'
         '8de8beeead6aae392313af14124b8243'
         'b4677b8f5ee40f0e12bd93b28fbcce33')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
