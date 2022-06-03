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
pkgver=102.0b3
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
  _url=https://archive.mozilla.org/pub/firefox/releases/102.0b3/linux-x86_64/xpi
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

md5sums=('9b15a88e11645829756b703c517a282a'
         'd371228891342c6e01d201885547abc0'
         'ca051844030246c138c0803471217faf'
         '112d7ef120f94dc6f4b8eb6990e463b9'
         '2749685d706e99ae1e874d131333993b'
         '71470ea0bd7579c4118d1e2c1f6d185a'
         '368a8631216fedaed950de2907ee4aa8'
         '3f3c66f98e270001e4ae5404488f5988'
         '5cfdf70d5c107b1fec9806252f42ec48'
         '93138cb0ad2310e1c60d360e22aa0629'
         '45c2d27087873fd839a8ad0ed12aa519'
         'bdafa2a02d73c54a547c8b43eacffd65'
         '27a19f5a7ab4dfe41c9e35326472a00a'
         'ce90778ec87aa1cbef07aeb8da1ea078'
         '22d992a08953ecc2ec77a862b4d560fc'
         'e7ecabfb6e3fafa5505a41858b39db78'
         '5654351ebb9ca4716cfb80056e028b5b'
         '0559f1037d73d7d150ff75b3bf06c1b0'
         '277872ce88d9eb3b6dbef54c73cb2ddd'
         '2a11defbbf8785bfacac8901d337f0a0'
         'd9843b0475b18b61112376fa043fcc24'
         'be7d0e188299003278a31819f2d59360'
         '3875438709b3c4d697c5602b5232bee0'
         'fdefe970b4bbc94b9bb7295ce2055546'
         '99ccd20f3ace884ae0ef5238f475242b'
         'ad6f4d3141ef522aac2b2599f8f85f27'
         '1e34e32bc8fb388f50f89298bbe58f80'
         'c41797c7a05e4f51309197cd05e6c67b'
         '2634739a24421eccc16b548e56b853ae'
         'f095b65defa9b8b840733cbfaff31ec0'
         '1619d85627dbc8e06a88d61e107c8dbf'
         '4977ca5c31fd47440f73e28d3bb6d562'
         'd2d19a3cb1ebdabec8ee7ccaa6f3ed78'
         '96a1e244b9c3e18ff24f0687f2df3ad1'
         '5d7077bd2d8c9b78f5aa5363aec2ecb9'
         'ab30c9112c66b5b62864897cb5ed9c72'
         '03562db9005c4fc419398f860f025d77'
         '5a64c14038ef5894f1e071f4ad27f288'
         '5883bf126d119bd210bbfbc80006f1d8'
         'ccedea97cf33866a221a717adea32d94'
         'd21e5efab42b20164fd2bb185534b82a'
         '4854059849f373d0de61a9247b17d8e5'
         '8467603a86a5c3490918dcfd61a904bc'
         'cffdec4047d24ff2804ff88aa0ac6500'
         '512f0987b9d3b47af5fbb1998ad60f91'
         '9d315fc8bbc3210291d38e695a631da7'
         'a977ea015e1cd49a33335e2f99c29c48'
         'd0399fc7855f6ce58c79d4e5a26e5fde'
         '52707f508c0823ff682752f7afd8e64f'
         'a152187aeefe8b7953614d79364a4f0b'
         '0ba26f0eb0ffdb4214e1949d2a7f8297'
         '117e88fb7bc39978bcbefaf3bd6d17c8'
         'd8bf2be85e8f43e3569f01e558376b8f'
         'e6e6fc85668d201fc4917192fa4ca268'
         'a82e995bf82fcd676c3787839db96d42'
         '60f5722332b687e7151e21c42e138da7'
         '3d73072ca4169ad0b7d89576b55826a0'
         '45dec3d971ef1589dd465e9200751c22'
         'e5ede807d812ed5ba235c76276dfdbc0'
         'f63eb051efed6f4ed2504147cb8c98c7'
         '6baf5f6d94471f9a71df1131e89c32af'
         'b688ecc55847bbee2a94305cd882d71d'
         'a005225f29337098ca87477197f89858'
         '0875c0bfd6d307c619d7c33f6c0d2190'
         '583249d80f72223aeb288e92c511b8a8'
         '1bd85265de934b6221f78c6001e8a0d1'
         '3000533e6bcc31467a9806441bb7aa07'
         'f3c378c8b4ccb61ea235ab4426b9a207'
         'a60e724bc6359a9650e882e4be7c7bc6'
         '57a9762e16afd595f2147590b3e16f9d'
         '1de292edd009859e19e721d5f699fcac'
         'd6c01ff3ae6123540c3e85613a63c7ae'
         '0a6b2e232fca436398915c8036bf59a1'
         'e0a35a4494d038cd86a42ffbe3f6ee5d'
         'ac6776b9a0d070888f03d6c0e2de8bbd'
         '4401a7881a03cf253f82fd92be20443f'
         'ffbb53622379e309f65d7eedc1cd3bde'
         '3b5d41fa1e2461c9c5121545c7433e4a'
         'b37ac7394ad8b6107690e2560581fa70'
         '46259fa804c6205a3ff5255e135e8ed4'
         '27617d3c2edb8a2db3154c13e3544ebc'
         'acbd44d98dfd56e53dc7f7b4fb45c0de'
         'ff48cbdf585a93017bd07ec0957dbb06'
         '082506b9c4fc7fb599f1b30303e7f782'
         '3d976f78f3c4296f3e8544f305fb8e99'
         '8f056003f6047e3a10586e2ec72283e7'
         '83aa4190f790e4a08f39431888a40c7f'
         '37a39c938bb2bf5731eab5d7bb8d534e'
         '5657ab3d9227eac74220b8523544a6a6'
         '2c5093061cef27cc469fbe76b863d855'
         '4d1b157e1c3f7ba052bb3bd66c320b1d'
         '33e48f3f49fa99277096c1b788743c2d'
         'c11f9e18d88775f9f920745032e4212d'
         '8befa27923e038d8478c0f9a3e3cd0b8'
         'b7ed24039c8ea0e696b515ab4510ae87'
         'eb259c36afe39e41f7364329a1b36f20')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
