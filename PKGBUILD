# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Luna Jernberg <droidbittin@gmail.com>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=100.0b5
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
  _url=https://archive.mozilla.org/pub/firefox/releases/100.0b5/linux-x86_64/xpi
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

md5sums=('59fb19797949fa91676c88193fe730a5'
         '48d17d6f2f2343043cb0e5bb6fee87f7'
         'cb3c8ce8ba92716ac902954030c95406'
         '8aa5e837f13c3a8c3c4eb5db54356873'
         'def60232be0dda03a0a0bb21cefa10ed'
         '8dea8acaefecfbc997b9f3d8aab61e67'
         '692f0a231fe003c99e1ac1c82387c560'
         '664172b5e31858ee31fb33b941b096e5'
         '7cff503dab06b98bcbac60b3f87f5185'
         'a573cd4891e5dd7a040e809bc0ecc65a'
         '916852684e52c63a1aa80cef5cb322a0'
         '8c4cccc771359c6230ca585aaa902a74'
         '918daff29efce86d965de32f83b4e04c'
         '1d6ea6f95bb1a799e6896400bf8a6900'
         '6e637dcdc9d7076c291970159de5b9f3'
         '1c9c42efb5beefd64959c357625738f7'
         '82f84c773f09d57dd6e6772d84bef4bd'
         '39878249d3ac5a1bf02a7ac98ab10617'
         'cf9042915ae48432f94ebe4c48543652'
         '3faa6afb81869b3b9c96898d505b7e6d'
         '844f9713ef16f58322c93b93970746f9'
         '92c2cba15fdf0a00c620386f5e44775b'
         '3cb8c1e0c658d218533d376292da8442'
         'b184eab67e87f4355b6b22e60cce7c67'
         '5d6e9ae31c2cd95ef126f5ae14e04787'
         '99c602141c43d78431be559ec5e7b939'
         'd466c32f8505bd16fb193b57d7085ab4'
         'f15fd92c52e6849a9f8015032369f12e'
         'e832f35fef2b968fd7845cd1dbe1862a'
         '32a428985bdab9004b0006d256163730'
         '8e0be7bf5cc20104068c81c151f8f25a'
         'fa065304697a44ec67d9f0ab936dc5f2'
         '6157b9132a596a6d10bc84f47816306e'
         '06a33e582412bb6b41ab80116f3d7471'
         'd0748b37ea60c45629c1cec3d95aaec7'
         'a1a2bb751bd83ffdf09d8c26c13b34c6'
         '0eb6016bc5e6ee813418212a4136c649'
         'ac474cc733cc36d74638be708ff3e2e9'
         'fba9ba68afaad8b2280f66003eef665a'
         'a87470b43a8e8b20d3ca13bc15eac210'
         'c2448d3ea8ec7d1fa49ea8a57e4b8bd3'
         '7268b91c67133333dc432dce94125200'
         '3b30e072a4363ba5a5651d8816a64a10'
         'bb053856108e8186c13e5ac733c4281b'
         '3b31c28f9245835482c6da6b8a059833'
         '7fc731872c1b932ebbeb8de3efc29218'
         'be84dad40b1602ca4e0d4033f5908a0d'
         '156d49e97f6fef579d9380b33e39dba8'
         'df77cfdbaf13714dae5c235989ed76a6'
         'e86b999f227418347a90085f3f8aff88'
         'cf5e6a139b9c267272d27573ccd8f427'
         '0b349829b8f371a4e8164a9276fff758'
         'd0677045a0d0e8e4abaf2eec8a8b43ab'
         '0821f190643396727397b5a21850d5c1'
         '49ef4012408602ca8ac6603b534eea84'
         '66ed0055b210fc51bf5fbeeec1bc3db7'
         '98885bb7309e456eb6107f6bd5fd3236'
         '1b04955613c4418f71ae4112dd325621'
         '9c84e82b36f7ed57c5765624d6e5fd28'
         'bfa25a14d8d5fb298092578dcff478db'
         '9ecce2bc0c93ca8106cb2199afc89b05'
         '6c95cdb3fef8ace515a9074670d26175'
         'e1655f85da5af78d5973182ff8d1b343'
         '4390733bd64c0c0288de63cf7ea41133'
         'f23da4f021bf266be0fc1edd25ead838'
         'ad42e76d9bf68009a2a02aa79a7984f7'
         '7ef73c50487d1468f9cfe80c49729d8f'
         '1c031d200ba30101236a2a66a97b9458'
         '112ac410987405349c94032b57198336'
         '90b6fe2e68c7ff1263db4311d05e077d'
         '61566a2df209f5fa497d7766bb2d3988'
         '15ee47ea5951b6fecb03df4a9a896429'
         'be33b624c2fa18718d7b9e1fa901073b'
         '48d941acb2eab85b6ba4f78cc68c70c7'
         'd7f1ae9c7ca122718c96341e38098f6a'
         '7f87e64ec5df4a88d0e031ca9c277765'
         'ee1cb0aa9558e3c7797719de7b8f7a47'
         'b1b10bf53d1cac3bf6eea147ef32c937'
         '7359b7ae0a786b36407015d31ca2c5d8'
         'a070b9e1285425eb3c7f7fdd2607d83e'
         '28aa2317d527f703d825a0699e04b8bb'
         'eb7bb0fa072497a2cd3bf36e4865510b'
         '646e7af7fd5036216da0c88432ce68ec'
         '5023f6686fe4390c3a241c16b6abcc74'
         '4ab849ab0fcba4dbdb33cfcea9df66b4'
         '77e8dab4bf3604ddb6c32ca1308d64ac'
         'e6422a8c710d403da18878ebbb880080'
         '8a4085422da603eab8b66ce17222e902'
         'dfb6cbd9fbaf6c370c9c67b813255758'
         'bbc242cb8557339a7f7a68acaec3a339'
         '3c1cdbc124fa5df9166ba0181d95ead6'
         '84f7af0aae98d7929ef95015875330ce'
         '07bd6547150218b94d571dadf9d82b4c'
         '7d25d1c455535927d80b0d2e50d50675'
         '9d1a9e307bf20ea6757a8c160f132456'
         'de199045f8875e5fe9a4d49d9d2f99ec')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
