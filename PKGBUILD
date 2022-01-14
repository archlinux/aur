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
pkgver=97.0b3
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
  _url=https://archive.mozilla.org/pub/firefox/releases/97.0b3/linux-x86_64/xpi
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

md5sums=('c49939f78cfd241c93640522f38294ca'
         '1b3d9f1968f5741bd069d4de7fcaf6af'
         '71c188c09e42a8949603a611e57484d1'
         '226ebfac647cd82f0ff4848d69a3b9fc'
         'd3105e5ee51d84ae298234f7efae054c'
         '335db5da120a2e8b916f65e4e898a995'
         '23ebaec4d7da4c75713c46a66aae477f'
         '2538ead0c701e71365dcf8afc4564bc4'
         '3ca28c2efb07c15ff025a3d841aa588b'
         'b444913ad8aed36a9432b273bf596770'
         'dedd487e9c7c6cf8cd0a639ee040d0af'
         '1d89143d03b1faa0acbb338df97a49b6'
         'eed6770b08d5b0767048f090e3f3eede'
         '2780679f1f9f086b35376a12a464cdbc'
         'ec3df5919b7a4919ba99c77dd2f47a79'
         'ba34f070bd1b9c76b26175fb2f750875'
         'e13cc0bca780adc42c6888af9388c1b1'
         '7cedab5e303b487ca269d26f242fccdb'
         '8e6f52a27f8f9091327545cacc8fbe08'
         'd1a97ee5b8d93ca68c99811a96b0fbde'
         'ddf064fe62480fae58218dfc5e99a6af'
         'ec0e26dbbf7eb8b5a16ac3c4ff06f044'
         'cd44233d7ab6e5f9f47e64e98465def5'
         '19e301eb142e189c8b5add5cb7098d00'
         '19ba7078e5b47dcd8bd23b6bc52813c4'
         '68e65d44a3aa474af35a5faad5b026f7'
         '3b8d655e0534d92deb94ff32d4649e26'
         '49fdc174e693c5a46499b555b9891ab4'
         '503a157382ad2b289b7112ee21789091'
         '8ee0b4f512ca1bb39e44d5ce41b21142'
         'a2d4bc10bb67ab609f409a1a2a45af43'
         'c5a1cd97a070536652a385654b5e81b4'
         '1475c901d2501a3633ea945fdeac22d5'
         '89a3fff95356c2197a528b711653462d'
         'aed8da52014262bd8bab7b6594047ae7'
         '48367943cee7c8841be621595b7971b5'
         'adbcd0b9c63bf62c0230ff15f8071151'
         '53ebec674ceeeecc8d715f8c7d0cac2e'
         '328fc660dc1e84a5ae62c7bbf5c99efa'
         'd45fae9a283102a0806dcfa67462e545'
         'a77236b3d5524d1935c33457dd6161bb'
         'b2fcf95073eefebae90c696537bab69a'
         '29ef5f5597c5f40d599c6b79abdb3b11'
         '2e99bb2cb404814a14fe27db67930a66'
         '3d8dcf109e240375b921dab5bfb724ec'
         'da04c2ab8f06340aa19fd6426fd35aca'
         '9b597283ac114e642ae5fad14fd29c23'
         '2fca1dbf9287c6b16cee5aeb0daa0866'
         '0a0eaf98fd0eb089c3c0806a42dfe7e3'
         '2d37f0703283362326b0dd1122f3f5e2'
         '055a5e140261a9537d9648f198174f4a'
         'af9594643e20e003a6d715c6ef4e360c'
         '40207cd1cd7afed9d600723c00b5f123'
         'b25ddd5aa4d62bb0634823346be4f44a'
         '7bb1bd7e71230f60ba51e9c7d73f5520'
         'e3d4eceb3de6ac080d2c24db06040e60'
         '7b264c89cd0cd76799f761c759f746d8'
         '3c9dc328f11f560b41787b58fc2a1d32'
         'ecbd52128845963a260bd1084e3f3c61'
         '8c89ee834c7eceef038e58e44867bc3a'
         'f951dffbc31713f63184ab6b9565c801'
         'da5076f7772c6d96b7703f85826f4afe'
         'f16259a0588d370687a32fdf5d5007df'
         '950ac206ea46e7c5f29031bab6d37a24'
         'f11adaffecaa5d0872b96be40ea489b8'
         '7f3a3c5700b94f95ebf721640f96458c'
         '832713c768bf458624a0f2c539f882fb'
         'd326ccb12e918f89332d32aa6cede6b1'
         '9395174c1f73c876e0843f673ec14d72'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd3bf2844a9a25a9dde5af21d43c963b9'
         '400b55c539305c56644b53c2c9c8c1a4'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e'
         'd41d8cd98f00b204e9800998ecf8427e')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
