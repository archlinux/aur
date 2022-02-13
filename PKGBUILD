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
pkgver=98.0b4
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
  _url=http://archive.mozilla.org/pub/firefox/candidates/98.0b4-candidates/build1/linux-x86_64/xpi
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

md5sums=('6b27aa75debdc82ca74d48c62a6e3eb6'
         'cc8681b53a936163954ac2def305832e'
         '9ea366eeba32e7641c6d1902c98178af'
         '2a1a291c2985bc42be079287f3e60595'
         'e6af343b83a16fba5634c4608202c917'
         '60c0e0e7aaa11a691b6f33713d9a5083'
         '81f3ec18ba806774db133b85192e6b0d'
         '8e782c551b9477aa4ea1fa533f3ea694'
         '75ec1739447796557015f59a17b48f68'
         '6c843b0d301f2fe7b3c58d5db1de7bb7'
         '16df406e62d1d63eb4ba202589779071'
         '91d79c94c0a1bb91160cda66502e866a'
         'dec17b7c812404d435bc8b5f30b0d883'
         '35614661f76b568df3b6779fe8f1c978'
         '325bd737ff7b09c30c6ccce013ff1903'
         'b3c081b6cbaab83bf8bc4d34ab786c32'
         '62e3e2ff7a5955a4e8e9aaf04e4e7fef'
         'bbb4f423f84944133405ae6229065002'
         '499ec85ed8f34ab6079ef09f141baeb2'
         'e627a7ccbb5bd22ce6ebcaa9408fc2b7'
         '0ad986b3d075cd4bb83194cc50a737d2'
         'c7258f0cadf8420b6db672bebe120190'
         '666470b19d3783ae26e7297e1008d1a9'
         '76775a04cfb6f0c128997c8ed9bc2fe9'
         '695d0543a71f039a6f3dd55633538741'
         '8bd70912c6104670d23bec7063ead3ef'
         '37fcdbb69c249e298bda0cd67d12e1d7'
         '7e9b802a3746cb9b35e35e2b529d9c5a'
         '750c5361364f3c5c3462675a930e510a'
         '96bdd89bf8f61c8d4586c245bb9cf241'
         '2ee5f3b22f56343081ab3468532c8beb'
         '33ac2ec0c892524c3f18a8d0309922ac'
         '66a3f351935868f5079221e44278a1bd'
         'd54622cdd8257433422cca116c023493'
         '5a853306c2c8d76dcc7673de034f7b15'
         'd0ef33d92a558ccc4741ca68798fe503'
         '3ce26605f4ee3ee5191f02f8e1fa7dcf'
         '5d6960dba7bac76b06ae9ed5737e89f3'
         '3b08c73310d5a758d210873311b81278'
         '1695d41580a485e7209053c2e15cb9ae'
         '74a4c462c7eba5e9d64d0f00925e14ca'
         '1ee99c0f1378f9e4e8059092f7960814'
         '789c6c04f2dbc1772764d123d12d068f'
         '29f2ba70fc1b5802132e039a94627402'
         '9d95479a5a859e8753da61e60dccc53d'
         '2379486209bd40db50eb2c2b50892ac8'
         '2c27e3cfcf8fced88a50313a07730932'
         'ce97ffbb36def6b6354a433d8f546ea6'
         '01dcb9099d8da40b4c89548f7489178a'
         'aa62f36a94402178abfff1b7905ed020'
         'e1ff01c68a2e0c22e22c7ed2211df5c2'
         'c60819bd63b43bba17da95820414a499'
         'dcb2bb358e28151008c938c1ac930e9a'
         '78ba698f4a08ba03df3db7c23680d5f9'
         'f04e8560a155c694e38923dafe62b40f'
         '4add50ba5c9a63ed75b9cdaf09f4d9e2'
         'ec34ece6d66d2bf8bdfa6db5ac6b2600'
         'edd92e80d10dda875b604aba8bc6c310'
         '13d8eba70c3258006a0af7fc74a93faf'
         '3b48d566a43f124d059130bc60594eea'
         '91136b39030359c14da54912a6c761d8'
         '6adc2f24d7ae9203fad548b7cccc6a32'
         'd02a37372fab16e1bfdbbc4d6e7a9c3a'
         'fdc236c0d18aa5319e16d834292818b6'
         'cb029f704adca6d83640ef6340fd83f9'
         '98ce256819e3d392e4e6aa16fc1e5a41'
         'c2ad08c973322061d05dd30456d16ec4'
         'ae4071dfefebcfef94a5458984a87f78'
         '9815d48df2bb6447cde03ae604725f9c'
         '0d87c62c31f659962849875ca79be606'
         'a529db115dbeae1cfd69a063b27a17ad'
         'f72e729dc1bc84cc349138352f9e1551'
         '85129f8058795a18b43d95feebccc200'
         'bbf4653f91626e2d3d784ea568dc6573'
         '1156ba641128082627280bd61c5fa0dd'
         'b494e0d68d6abbbdde1198476f646b07'
         'ba2ce4e3c60bf918494237081d94241c'
         '34eb029a0ffde878669e650f920df6e1'
         '1045e0a5a369e454a58a158266e8b93f'
         '5c42dcca2646ff64476588f13a426bd2'
         '67fa820f597cc1d991f77c7f83d5aa08'
         '846425d64788ea87673be0fa3da73607'
         '5887d63f37c912ee2ff9b1b319fe4b10'
         '615eed96f558ed579d8199b5a042647b'
         '025e2a548b6dc8d7bf01676f017723ac'
         '7d0b66b7dfeb0e88aeb6247ae8ae4ef5'
         '0501dc532edd80fafed7c6f1ae518b7b'
         '21ca200c3118fa76da0df8f690b31039'
         '8da1633721a1a12c97b16417c7ad730f'
         '9248f2836473a43b8901ff0f5ead2185'
         '633161c853e8a47c743f0e18a0d4a20a'
         'f415e38213cfce1e7a3964dbe560ed50'
         'f6d9fdb95d284084aee819d0cbfca1f2'
         'e56d3fcd27aa4efc6cbdc5b1d9524c5f'
         'cfd06fea060b74fb7d6306fcfb63e500'
         '11379c6395e0450ec8544384b02ec7e5')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
