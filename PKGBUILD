# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0b8
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

md5sums=('275a34f158b12cae85d91408406f76e9'
         '71d2b6f4c96b4a4fa3daa56fceb85918'
         'da54d6991fed5be9228922bb1c0edd7d'
         '08abd1637077696ea3a4dce3799b95db'
         '3cd76f1fc17330c24ac8f7f8a09e543d'
         '125cca1f27ab5749337def36af8424fa'
         '328420eac6bfae8ffc106fab6a8df4f5'
         'd004fb7689705cb5777714864a92ddea'
         'e44e55866f2e057f226bd800203ffe37'
         'fbcc7e99121670b5af0b3c6a9b03b711'
         '32d24611ec8a40836e2a993b52f0597e'
         '0a32450cfbb91cbd41340646c81b20c2'
         '5bcce6b1ba3900167af1c254642988a2'
         '3fdd65afe9ed8d3feadc66fde74b4764'
         '01937d6fa00b48b3c6406895fc4b18e8'
         'cdcc56d27abe40ece22f3031b63d5893'
         'dcc2d70f099a115739dcbe54063d56e8'
         '139e2b1a63b6652edb706e604234b9d0'
         'da52eb4163b61b0711a11df58545b510'
         'b9992a766983908ada9b0be4b6551926'
         'f36cdd1022a71dedc5930178222de322'
         '3a7627d44cbab055fc4cbd3f82de5306'
         '87ad79bfc7c7641e9b9e6dfc64706958'
         '9ce5b5f091c5a7ecd2afc13e1dc41d37'
         '314fd1aede03b17b767d5c0d2d572cd3'
         'a1f4eec43c62d8a40dad1426f9bd53f7'
         'eafb33f06495b67479687f6e20e3931f'
         'b8a1eda03836f3cc3eaabb8f57a23ca1'
         'bf1819dba9bc0557d1516300a0ab6898'
         'd98e431fc54cbbf00cdce8fc8b3a8280'
         'dfe545b03c1721b027f3ee08b02f765e'
         '09e3afc75b13014083fb27c5b391ef1c'
         '282acd69acbe2411ac1902a58e190158'
         '7aad94c9b3806e2a5f2944d27025179c'
         '1d4b3316a05ada3c4d44d5a9a2e4a16e'
         'b46e7fd4392ab713a6bf8230678b0b58'
         '2c62be074036ba09587379b9d40abd83'
         '25fc2f17113d7fecc8a9b6fd4a06b92d'
         '3a4af5f7ce834d189804365c5575b653'
         '9dd808d910e70cf94e96dca937ade326'
         '7abd9569c4fa15ad7dad17cc6e4c6d2f'
         '9e23ae307dcc569b92bd7bf9e4ef2aa8'
         '18463c1f53caa9a7492796d173105a82'
         '8dd7b1c3e8660804d21fee6f6775fe20'
         'e01337c51bbadd08103ed3ed6c4ab3e3'
         '943ef02276dd910e03aaf3f0ea12ac01'
         '61f7590c312c3cfb1a7d820206a97208'
         '97f12b91cd3a3253348d697bd56238a5'
         '0c94d2037aca09d3b00a7b897db99381'
         '4effa120150901ea02f96e9b80220082'
         'd33ad77f0e908cefc1b0863f962c27c5'
         'f41f7c5b4916c3f1b015f53e1a1cd003'
         '1ee59b7e70b93f5c7fc5c0c302089378'
         '2f014fdaa616e3e715f006c4f4812bfe'
         '51180b486ef78d3c91101b380068c967'
         '48ecdcf3645c248df0bcf821d9475f1d'
         'fda35e2daa3283619c8b482f675395f8'
         '77ab1974be5ae9bdf750a1a8c4745447'
         'd338a34827be839730189a087abe535f'
         'cd0b205b9a70d63c3188948bffa86254'
         'ce43b0cc0645d4af2449f81303840be6'
         '66a32945e98734434a5ee1b9111d39d7'
         '279288976205c5558611703928c7cf83'
         '7e09e6a01b9c054dd2b2da7ecd79f86a'
         'c3f7cf98588f8f18f0d9bd19657e356e'
         '65f11b8c735873181c0d5cc5f5f2d75d'
         '6546b78a6f1718a6baebd5b978dc2931'
         '7daf9bd5d1810c86ce4c2057a2c3a167'
         'fa54c55862bdb957284f37cfd403a197'
         '2bd8b3d732e8b23b01d99108e030958f'
         'bb3fbffb4e98599ab15061de25e3d06e'
         '68aaf4e3eddb48618feda939cd9fb36d'
         'b9d28d2d687910692ac96c69cfe44680'
         '294c5ab0766ef7a26c805bad2bb9f291'
         'ad62b426fa80200f5c68b202c384f8a1'
         'f9e54f6eb63246492d24ba071bf96266'
         '26a3a8541bcbfca349d3eb8562191da3'
         'b32a5e68033296f6e34c1a4c7bec25cc'
         '4df8a98c5fac4bfa560802b622485613'
         '5e8d17fb8febcbf8daa7bc5d529be495'
         '6eb8491f00695cd561188cd7b1d77c71'
         '947c19d1b1ce71c2301049e54f52eb97'
         '441d3d9c5ac3ee49ccc7ceabedec4a71'
         'd08db33a1cead4925dea814a8dc214b5'
         '123a419dc2e6eedd0cceaf8183579479'
         '70cced6d498f760452c39cc11eaf2c64'
         '867947d6386a713cb9476625b94512f3'
         '92636acf16629c1eaad88330833ded5a'
         'b66e542a5f2db147870ef4e5add96fd2'
         '2dbbda9b45a3b5cf247dac517de43753'
         '1cd31a531bf94bebc77af835fd4425cf'
         '991748fad4c99d97f8f169cca7e742d3'
         '4c83e09596c69b88449c95ba1729f4bf'
         '0d0037923e7f3ddb358cd916c8c0fbea'
         'd3cc0726de40dbeb2194f0595e0c0099'
         'b1e494991469da5847a0780221079526')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
