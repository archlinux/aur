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
pkgver=97.0b2
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
  _url=https://archive.mozilla.org/pub/firefox/candidates/97.0b2-candidates/build1/linux-x86_64/xpi
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

md5sums=('dd4faf7a3c33d8a886ad659cbf259e8b'
         '6810e55d19600899ca587b04c2cdc731'
         'c25b0a2e803b4dfc4d169bce8624206a'
         '32d1471c08e8023ccf905fb51d13cf80'
         '6a8324caf11cd6d31b7552fcb7b78bf1'
         '380c25eb165b15eb842c021b1653078b'
         'c1ac8f13e88400590c45e5a85327fd41'
         'cd83884a7ffe076dc020d85fb1098a82'
         '8c8359200756e26a8a7c75fe8537fa05'
         '6eba2e369aecff317ce9bbf6f6944993'
         '63e876bc5942181a991d60cb87e0325a'
         '789eb5a4fdfe4d0044ad160abb223bc0'
         '4b084f4d0170ab4e0b94f2d5768706ea'
         'ad7136a453cf19010165b0f281dc1d0c'
         '883ad6f3d0fddae9c9403c2f27960637'
         '6ec921e0b700333017dc5bbdeac76dff'
         '79bb45ca759678b521daee503470de4e'
         '03f8b59fb31aeb26742f8b1178538927'
         '998b7e9c392b600ab50cf1fd58514c50'
         'dc72ce8f131c3e522a05317295ea6996'
         '8750b2f89aa42b55c61b16c64c5f01cd'
         '87f58ed7b18ea31aa553769697ce7b69'
         '0fae4c67b39f4cf9e165e036ce9185ad'
         '2607b264aeaa151560f5e13599510f18'
         'cfc9d40c7bb232e1c3f267501a9943ac'
         '2015401da0b1992652f3f9d5e43a6921'
         'ececd9eba7ba0e42333c99429e07b887'
         '52cd589e1ffb300b099f40878d8e7276'
         'd58cfc512e8c599555305a32b3382c88'
         '05581fa295ec215428571fa7b75eccd3'
         '02cbccf3b3d00420b298576818eecc3b'
         '3812d7ad1dd04929de3b7f84d152e7ab'
         'bd2b4c2e1c13ac36d3a346282407b52e'
         'cea8a145871e27cdac5fddd9245966ea'
         '1140d1d9dcccedc5f7b86c28ed57a32a'
         'addeb328bfb8036f5eb7c3cfaa2f93f0'
         '4558dd091df702bb6b3e86f8eb851eb3'
         'cae52ef786823e81c5ce9c08c39d0fa8'
         '75ef9ae6b07f53978f162d995e074808'
         'f70a2c7a4d17721b50c36780e0b2770b'
         'f12dbc232a12769bb265c543a9600b86'
         'f3f62a4e43435e488abde0e0866fdf8c'
         '944d69e323193ff47d4d138249091746'
         '8d41c8d6423d7f713848eea4ae601a61'
         '7b24ffe49e559f32bf9e7e1c19ca06d5'
         '8f688716928acbf77670cb245adfee03'
         '6093df5c8400a8d28458e8700c1bf76e'
         '409a41bf4bcc445549efaf59b58ef025'
         'e829e9b6ebae7efe9ca6e35a820f338f'
         '0b6087c341a6bbe73690907ee0c27f33'
         '64700ee5cbcaaee184399b1be0e05409'
         '55e1e7f4145f8f92bc8de1c10cc55efe'
         '1692b7b49042887bf0e5ad2886cda5cc'
         'dc4c2e025afbc40a521aeeb5a45de788'
         'b95984bebe2d72e6ad63afa0ba94321c'
         '0782b4b0eee8fdea7a7a90f6a674ccce'
         '20150f8e70665af742769b2819f85bf8'
         '33a50a8e13beed09186fc70c7b917350'
         'b4e6e4d28acce7a6627fa39b295b2d8f'
         'ccdd24fe075df45e807cc8aa039073f9'
         '6c8cf283213727222c48de94918f46c1'
         '60aa72298a61cec750167bad4e39a5a2'
         'baf64608a97e7924469f536ca5f833dc'
         '62c2b38d99756bbe327e4ddc01844472'
         '09a6778f3f9a194633fb89539e4e3266'
         'ade466df83f09a4366cb7d9749f69f1a'
         'b4b33285187c0aabf68982beb814dc0e'
         '3f043e5e7a471dd7d5820b708be1f7c3'
         '5f17cc867c33a686d01bd69252161798'
         '77437aaa68619376f2b82f7f02042d54'
         '173ba7879e7c8902353eea665871a276'
         '4c8ad51825b62d13faebddc6f3f3ae25'
         'c574df941101c117025ce2f1e5c6a7d7'
         '8484bd38c17db85103f0fa24f0df0e88'
         '3e7ab797dea8be3885bf1c1cce6368ad'
         '773dae8f80e78efdd2b91f16b08bf88b'
         'ba69782aceebf1fbcb5e0c1bd8c27020'
         '2f1cf1957c315de9d752a4451732d980'
         'a27558281444d11df9000c2275e0d36a'
         'ee1cb2bf2ffb32203a48e2dcf2243c2e'
         '1b649732c0decea037b1c52405df1ec7'
         'b0d092c4dbc33e77eaa2af06677b032e'
         'd0a3af366d5b826c208d5e6120966c8e'
         '1038bba63bd4cdc0d2b12f75ae991262'
         '72c4d3983fa8be64faae04a27d07b47f'
         '67ae58b095d8e151b8be9acbe0a154b8'
         'c02100e8308a2c4bf2f68198a86cf3c0'
         '376d17a982d46a97429e09aa6f9ff612'
         '49e82c072be4b6d1152cb12645920be8'
         '79bfda12e846931aa132b39627ffe5de'
         'f87841441bdf24cba1a997f4401e3d6f'
         'a1a432bf2f29c5572fdb3c3a473b05b7'
         '8d9c453c6554bce82694bb0cfc4668fe'
         'ab4c98fa98812f548eac5e324ea5525b'
         '3b79e62db65a8858c8ad762de21ec96f'
         '27a0132c5e3f03a5d7d4c8e0471ee65b')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
