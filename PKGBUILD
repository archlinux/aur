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
pkgver=98.0b5
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
  _url=https://archive.mozilla.org/pub/firefox/releases/98.0b5/linux-x86_64/xpi
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

md5sums=('393cd363ea98da9b81684c94318aadac'
         '857a94759ac32360fc6758bff6be0ba2'
         '243055a954bc49ce5d45ebb6a6ddeb8a'
         'cf3950b9261f0289bb19b31174ee8749'
         'e745b500526d56ebb454a29411f80188'
         'e3560966dc0ca503dd117a0a69ec1267'
         '1b5692dcf410f6453e37bbe1e264f2a8'
         'e30010ad23676f6e6ea52c678b9b3a17'
         '203bd59bf839b644bcf3ce812a67156a'
         'e70c2f73aa7edb80b913fe1af3fc7471'
         'ac7cd9dc9bbd8cddf35be4599f10e2e7'
         '55ef10e25e8dd983765330b9f60548af'
         '63768e1a32b40c0c0aecd5e574c17a6d'
         'de28878a0ea9d0c09b420ed1f5ab6164'
         '81ef15da3a3db4b195d6a4107991350b'
         '0ab4cdd9bdf40c0a73462c59e26e2155'
         '8efa9cf0be0b2decf70a3de754b0f5ce'
         '7f7dd2aee79a47570cbbdfaea056f87c'
         '157191df655b704cb2e221cf92e6a029'
         '9c49d1662122ae2be9e0b2d076d9aa82'
         'f216d17a8127ff617f693cf07113b479'
         '6abddda6eb16c88fb4f376ff4da257e5'
         'f74734516edd1a3913ed0c004822c671'
         '7a3854a0d048559118b42910d1ea25d8'
         '883975be859575d56b3fb165760b7cc4'
         '208c303d3c76c646c44c5818a029e028'
         '0ab2150450f3b202aa1062a912c93f22'
         'bf4c3b4e2766f43bb46e768c1fcadf99'
         '53b7009c2d862561ab4e8da22745cdec'
         '48ede8b1132f29eb0c7638c248cb4276'
         '9b28421cd35d006a264ab9a63c6ccc99'
         '5dde24a3834d0b1d51559dbd045707bd'
         '68f6d9994a209431e3b86beb817342b1'
         'ba0e1f4d2099f59c72b5b5c145d3d7e9'
         '8ccf581f3c5cdc4740714ef58678dd7f'
         '7c994461d1c84e8a3ccbdacf66a10656'
         '1c4e88406755828038869fa83ecc4f22'
         'fcf393556f77e7a04ef0559aa303c5f1'
         'db09b391ffe6d44f19ab40ee6af3ed89'
         '899f501e79d3b9078ef8a554a214c94d'
         '332a6a9583901beba35e487ca7408c65'
         '472265b074cfdf247378ed535e235687'
         '95f2cb9ee621feeffc8eec646f938041'
         'ca41a08969d0bd9fc87d67737b45654a'
         '507229c0d2f30c5763d40340bcfabf14'
         '054fe1c39ffc425b71c135b440d50a18'
         '47698e628968ffe19a27e520c5c5bc0a'
         '95db623b508172ed9504981b036183fa'
         'dcf135c8fec57db254120becc66ede07'
         '5f725db95ad5fd0841d78c36af7fd442'
         '42f533f917509a24d4c7f9888c5e06d3'
         'a9cabef054b696239799c759373aca64'
         'edda516cf392f35471066025e1abae99'
         '58f2900fed14538c2f7c1425eb4a4d89'
         '53d8488f6add24a3aa96408ace4e10e1'
         '297e06569b5e1cf3b6b784fea562945d'
         'e8cad2cce17b69805a64224b2b6ccdc4'
         '6e610ab030334314fb77958c0e1d8e06'
         'd66d3fb79d132c83f6cce4866e14acd4'
         'a92647f72a907b25e1793cebbd99e7e7'
         '92b74da105ffc67954bc69c3e83f49a7'
         'ff2b43d0f1716ec869a3b25765833e40'
         '35d1a343ae4b1851710d42b30c7135ab'
         '75ff566a7863063f2a814e3443c79254'
         '7a3740482f1b56f97c0f3769ee60cdc9'
         '0e3745e8f8f5add3f871c26404c2c975'
         '372f9d0f130a6e5a555e42a8256a64f0'
         '79957f82032ccf3d499f4b8b13d9aa32'
         '8341dbe48cb55441f9b219aa9c6db30b'
         'fd04f2fa5408063dfac449119623053d'
         'be35ace382354c8d4c0c081b8d7a36b3'
         'ace972ce995269ca7a90362e4e21bef9'
         '94fd0291f226278d12ff6bbe217e880b'
         '40b6b3c9d52a43ac06212e7215568246'
         'feb179fd977d79cd1b435e9d308495f9'
         '79140a964fc3ea53b6b76ed3c1b527af'
         '96ad33e408665b06969252bac10ecc10'
         '49ab82c3a3f10ef85093bd93376cd593'
         'c675d74a9960efc2155597fe0dce191f'
         '59682888363b8e35cc6b8c12ad29d521'
         '84f2005a0b300bf96081ff25244f8ae3'
         '6c68e1b9b993ce89d53ae7ec4598caee'
         '6e5f277c4306bde546e6cf8d8741af58'
         '610db5651bfbc7b9857daf608fabde0c'
         '8177731c8e106d401fb2204108d207d7'
         '9eae6912e6c7edf344b3e7c51fa061fb'
         '31ba5e6db7d53ee14bfc8bdc8cf43ae3'
         '828530543f4a77869c1781cdcfd410fe'
         'cbed7d672c6c7ef4928479597d42601c'
         'aa0bd60859429f94e6aa8b5082658714'
         '78f26c7ea42533cb3efdba65ada54028'
         '3ee99a6853512c7fd77dc5a817cafb37'
         '1a9f09cf96b0e498711b1d6a5bd43617'
         'e72795584dcb4d3bd7d43c5913591afc'
         '6d2bab42cec3491d0cca2992feebfd4b'
         '8cec8f75ff31e0e5f6bcf8967464505c')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
