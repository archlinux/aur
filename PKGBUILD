# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=78.0b2
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

md5sums=('f4e1a302746e7112504719f33b9d879f'
         '29f90073e7a094058f91019756a4e7d5'
         'c0d333ade8223dd7f8fb1553fb8d0de4'
         '9f9868661b86622530f4f887d30db8d1'
         'de95995c1589b855e399fb1592ed995c'
         '41b1ecd73138186a32f7155995aa2e6f'
         'e6ee66b4863faa4cbbf0794defe4400d'
         'b5ae1076ccb8b2ca0f27a94c615a2e7d'
         'c967a9a764d0a5804c5749aee3e8234f'
         '25a0d3431c1a02a79f4ca2a2dfc3b788'
         'c5aff598df8cbd27797a75136bb3e26f'
         '6a18a77e577300059204821284846247'
         '8e80f746b99fbf2d407d28028dc56d19'
         '3276e7a1228d76e002f864ffc806c875'
         'd412f3809a73d565b225168da7f4e6c4'
         '08b6f3ab7982eb8182054df7b8803881'
         '378b0316a2ad026636b03859eb8e2269'
         'ec00d347d5c509f06c735f7ca3106bcb'
         '7ff7f5db2b8324d0aa3e6876abbe4d0a'
         'f5cc6fa5b6e78405c8043bbf0a32dd88'
         'f38d5c3d666f110f1cce4f4787a94d96'
         '7a569febea8145a72bf44bc5c98b5aed'
         '71cc7447ca2c87a8bdd6e8e3e4bbb62a'
         '5dcbc658f5d5a12a97d286085c1a5744'
         'ae8d6f4ac6a0c4cea9ac6b363db38457'
         '747027652ec1b74a6a43e33ba924b6e7'
         '35794b1a68add4df071986bcb6f479d4'
         '8c7eca0a607269dd99a15b2196b559d1'
         'a571aaf7154342959be7eac3823e430f'
         'd19c54c2dbf33a89bd92086b4d241840'
         'a86463451557bd1deb796c3006004d95'
         '82ab0f78c33c13a2ddf4dfb91e142808'
         '8692df34ea3988ded510def1e97d2a13'
         '2c63c0c2952db31b571cb5badd22ca9e'
         '7565fcb4305910e3d2f3bba485e3207f'
         '58e2d906f199bd8cc4bdf9f614432b34'
         '787a59761b4aeb0ccb89e19642c425aa'
         'ccacb2c683f0dc5694b95da0d241abed'
         '73668219b336188d201ba3b7e17f2391'
         'db63c9654848962889b77310dde167d0'
         '4ca543438988dc4ece557915409e41ac'
         '624e606cb4525f090a29b29abc58f33f'
         '54e013cff34d77e6f3f43d36f4a05120'
         '80497b3e24050f7d68a777d79769c0b3'
         'eb9e5da09347aa7a36d87b0e939f6d0d'
         '06e45be226b99d5d43b444ff68d42692'
         '1adb30c7c3906ae5b4b44e1df8002367'
         'b56cf4c3a2a537cce9394994af2f3e1d'
         'd40ee064dda6dfff92650ff8453c3d79'
         '9c074291ed1e3468cfcb00287f877f01'
         'a36febe8517372f79039d0daa25cd070'
         'cc8259f8e5fc661ecb83d130ebde7dad'
         '0b26c814a6ca8b0f833f85bc303aa2c4'
         'a4f3d1c1ba6bd0ca19558b26f651eb1a'
         '282b87bdc899b5f9e19c5325085ac2fe'
         '6d9e3ee75dafe9bc37c9dc5dbe454d23'
         '5197a92718831c60ef61c9b6e9496f9b'
         '264a597d3deccf550d09ed75952081ba'
         '432e9e091ed9b4cb15eefae908d44dd3'
         'a5c54d28d80f61239da32b0f6065f2d6'
         '0bbb0c46a6ddbd2b118dc4c183f1959e'
         '1c79759f52a992690dbaee39d9816418'
         '85250f142e2f141b34355554b1db4c9c'
         '51014072b7c4b427c0329cf8cf9be909'
         'a2485a36811d83ac0c9883481ce23030'
         'fddebb6a5b81a20b3a125a34b32d4a66'
         '3b79dedf60a172eb11cdfe31127f10a1'
         '60aac203be4f042f4955333e9f1edae4'
         'c6eaa9943517f882abb9b8a9fd40ed72'
         'b933e901f935d36bf07aba677b8b5188'
         '38d385a56570f6c48c27b802df7afc11'
         '6eb0aa95a6aaec71e262c550a64870f6'
         'ace313ad6d1ad980cbea8401a9adaa1e'
         '31c3d59383163dfc2e4c1107d6cca8b8'
         '9030070bcdcb34ffaf84370a37b7df84'
         'd47350c03086d73faaab43beb5a3579f'
         '8e783b0d67fbc764f1ddb46b9e9ee76e'
         '172c0bf56d95ec39f08328be9e5ebcc2'
         'fe76378acea5a02e5d303eb38b81f446'
         '83a964852ddb1910d3473104b3cf600e'
         'b0605fa9b9b3e4d5e717dc06813a2960'
         'c0a4048ca78b7f2f9538158d636b756d'
         '16bb80d52ccf7a880c96e77f8205e8c5'
         'acfd04d325d7f29310c88b9c6549a627'
         '1f06edbd1ce79206fb71c43cc984378c'
         'e2fb73d3672d192c19ffb6765a5a8d67'
         '3a9157cdcebb4bbaae0c51c5ec0c83d6'
         '983356e39cbb50a2224c3a251adcd728'
         'bb977df92bea395decd310d017761f0a'
         '1a78cf1ac1fae48ff7e2446111c6351e'
         '70ca856f6a2e36a013d9e118ac1e94c2'
         '9853464b576c0d7195b22aa871850fa9'
         'c919d2e5cd3a5ca8a8e9abb45aebeb82'
         '09b23b294eac107eba85af3450178501'
         '3391e0a9f4623ebb7aa32a5fe27fe84b'
         '0cf8d100f99cadb598dee473ab6cd21c')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
