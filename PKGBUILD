# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0rc1
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

md5sums=('39ba3452f304af04dc41cceb39d25810'
         '72ce0cd93c9e2d97c30df6378bdd1cde'
         'ce5d07831d04172d1e02db86b5afae23'
         'af67eebea1cbcb54892041dd1743833b'
         '574ea16f02a9d45f7b7e0524dff8b1b5'
         'c472fc4d6cfeb5270c9dbd992b1975da'
         '283762bbdf716ce54bb9077787602537'
         '6336156096cb4955ee15482412b78cb2'
         'bcf3437b6e6fe608d005c54923e623f4'
         'ac56d828fb4ff893ace6c2e7c7401bc3'
         '090a6db55cebc649e3f4da9ff1b1cd51'
         '592ea54758f889d13d16cc9a5807ee03'
         'c75d0e661186cdbc3512dd40ceaecc8d'
         '05d6a453fe4449caa2c2f26f9914a7c3'
         '1597968c817f00e4dd5b40c32082f1f5'
         'f92fbe9eb334f359e98368cfb50535e1'
         '5dd18b0c113e2d781c230f4ae0151643'
         '9d491cd15265e9077878c139caa79a55'
         '7e3e191f0e0e4636d1610248c9ff3816'
         'aa3552218de5d3fb6a27dc1782fb6a49'
         '041242c4b8290becddf6b508b2b65116'
         'bee4caeedfdd44419a517e1398e2d1dc'
         'fe39cf616cce1c2afb3c71c347de5247'
         'd9849605ad2de3e871d29ba79e887025'
         '54eb075bf0ba9ae97bc9eb2b0f04e654'
         'eade75df027910e297f0e5407e31843c'
         'ccea59a281191996f46646fce9d9dc32'
         'e9ccbe2628adadb34ceadee83017f00b'
         '2242eafd6cb28f6352fc18af56b732c3'
         'af91e080375b4d289cfbbfa33830f8e4'
         'fda4f0c99bae1ac24f8da08b68f28b91'
         'a8ef6cc5b57c0b39e8e3cb185a8e618b'
         'da3f0f636625e1d37ce0f251b6d24cc2'
         'b403213466610aef8d60233954ecf3b5'
         'c9dd46dc3c25558b730695dcfd75cdaf'
         'b91f81508ee2a1cc9a2401034fe97dbc'
         '00d98aa7a6fe1eebbbb2c8449ecdd3d2'
         '395d7ac4dae110245c5b11643ea56721'
         '909f0cd2fe78008ef3cb5146ee7fcf53'
         'c86165872d23cfbffb18394b52000555'
         'bb56ea8f55182fc5fffb0a9a5206195b'
         '480d55467c04d5eefc9f4f8e7c58bb8c'
         'b5361f5292e9903c6eb347ec2f0b54bb'
         '0fa5bef24406d0c7860dc42c43f98c58'
         '089190cbf1d02a4694c52d7f3825cc69'
         'da8ad09575afab49dee82608ca0a9575'
         'e6396a30f299444f8f7b93217ea888fd'
         '72e5c9a7241772ddcb0cf51bfd6a4926'
         '1597d3b595e62378f273a2e7ccab02ed'
         'e52af17224bf78779e25a1182ab11e6c'
         '90e1aaf78f3bae5c9db53d8316977f8c'
         '7586aa594383fc716038332a0fcc0732'
         '25d6c5ffa7f72db40b07503184409c48'
         'c4e39e4413f4c859e972ac05fc7cf05f'
         'd63b513077dc3ea39af37bf418fb5437'
         '60f35d335592385f425492c34e0bc7c2'
         'bc5d930c1b87490af8d5de343033749a'
         '775cb47d5b9929ea2626b55371745f66'
         'd16931adce954cf7bfafdc55f98f853a'
         'be95fd5ecad88d8d8e96bec19cdadf2b'
         'cc1da8d97379939f0aeb902a399dfd37'
         '18427a4dfe926fb65b4aa162a0bc2b41'
         '9152a39ecfceed69553bb0fa1f00db6c'
         '3b2a1b236a22ba50bda62978f47b7ccc'
         '415cd31d470b189642cb05de385be1ad'
         '8b9b4be624272c4061b6d1e6b2405ad2'
         'a36cffe74ca65a5b62410c797135562c'
         '6079217a8cf72e9db8693eb8c763f386'
         '158bce19363f48f1aee98cce57150a39'
         '8f1c01efeb1757cc528153f40bdd3f1b'
         '443160a4218307805f6897955c0b507f'
         'b019439ba1fae789c347ef1c440f1e81'
         '60276ed2db863d118802208e26bdb8cb'
         '9b5fcceab5d68ab2bc2fdccfc5b9366d'
         '40c985f86e832e9db7a11bdb308e8ec9'
         '33de200e18998090bd93c18ce05807e1'
         '4308932f39860d237bde932e88aac300'
         '63ea2ddb19c2d90e0251d5f432c73357'
         '0237f7c51a36c9a0cba86b0d0ec39f36'
         '2bde1ebb170fe2ea565715a50b19aaf7'
         'dab16f488c0f16532354ae7e1512e372'
         'd74d915cf3e2a809b8a012a7937975a3'
         '36866388f3dae4e613f0304751c125f8'
         'fba35fa0e367a0e25784d8833a1fc0d4'
         '891e43f3598d60130d63bee0dbdeacb0'
         '9ad0912f621733191098e57dac79e12f'
         'e4b2ad751afefa5b4946150fdf6136f7'
         'c7e3cf3fd9505a2295cb9792367138f5'
         '3db6e6bda0c33c01af35ee1b72bb6c80'
         '2dcc59bdf5c3b21a31e3cce2a4356ef3'
         '4fb3944698b8a7a99ca6e3d08d2057c0'
         '25f9a0c1eb9fae686e8ea8287a1802fe'
         '334d543fc2da6531c032c1dde9169860'
         '02d6082742a80f7b036f7118fad65f72'
         'aa53bf196cd94941360e14853f2b8851'
         '45e1ee465f518072b5b99d0232b3b0c3')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
