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
pkgver=99.0b3
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
  _url=https://archive.mozilla.org/pub/firefox/releases/99.0b3/linux-x86_64/xpi
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

md5sums=('0d8ba9212dfb76bc063014982fbd6550'
         '2193a92b88873faa3b07699a07c46789'
         'be71206ee12743268108498813efc0b8'
         '57f99d49d966257bb93950d559cd09d3'
         '3e26d7bea7faef3bd4bdc8e92e90385a'
         '5f796484a5cbdae3133d29a8c3185a77'
         '5b1036564478f73b78a8d45940327b0c'
         'f0bcf61e22b4bfe66d8f2dc0f651aa22'
         'ee7d432fd09374f14f905fc9e0408efb'
         '74181e8247adc1a305236131b1aa1dd9'
         'd2ca1a4b1bd61e752ef8ff1e77b38d9a'
         '753983ad1f7edb0996a95e0164073e21'
         '885664ef1c55fb94eda77b7471402195'
         'a768d345c3c6946aaadaaea91e61b19c'
         'ee91fcec7740cb51ecbd09a591c7af50'
         '5f63e78dbfc5486b167855c86811c144'
         'ac9d9217ace24af46f97ce97a00ac18a'
         '62673cf367c1c16deb12ae8b53bfc636'
         'ba4310cb30b78d924ee758b2ab5b7eb3'
         'c5cc5e2dd00eefc64703d34be1bdc933'
         'fa6a8f1b1f34fb0d0f7a3b9b1052d26d'
         '71861bcb34980e4b4e5b731bf9dcc167'
         '79bf4a2ec6234fb9042ab3fd82d02341'
         'b7c5c95a82c5fd132ea82e65f4c9bd76'
         'ae87eff4d1c2c94cfc203217db304715'
         '2946ca8edfb1ef0cebdb96839a1ffea8'
         '2207983b7076a6cc4a7624069aaf55ff'
         'af4d6209f46fc2183d88d049723be906'
         '547e541f8b0ee38f3dca2b720a1f96bb'
         '85ebb62eb9500800e720b970bef67e5b'
         'cdf8f19b8d1fbd0c91e60b641188f98b'
         '1065fffe28fbc5665646669904529769'
         'd68860e807030416bc2b7b2842025efe'
         'ff07707702c080dece8d01f1ce1ddc8d'
         '70817dd0462619f863510b3339df00dc'
         'ed70262def59b9281fd928e31fa7d3a6'
         '32220712a6edc85b60bcb80b20c1e7fd'
         '18c974b47e98dba5264a48f08fa84308'
         '9365f63263c4dc14ed9dad1280a00266'
         'd6b0f4594ede95e5cebb9741f08dcd0a'
         'b2b99b54e68bc75b981cb6942b68a2a7'
         'ef177bc29abb0121c9a1b421ea6ad2d8'
         '11b8c46b5c04b83159526f7fb686f915'
         'cfc8dc1b3c928f6b222a065bdbdcba6a'
         'b25aa0c773cf9234984537ec3e6e63bb'
         '056f23de407bb3f37180f4adb9b7d092'
         'b78413f4074d0e7d4247506bfbfe85c4'
         'f937812f876bf6da85ab124cdb4c10b5'
         'b2c6c69ffaa278ae0e07e80f5f1a16ea'
         'f463c5842eb8340266d2f1ff4e981337'
         '45b1e972d5347c917828549f7cb8fcb5'
         'ae81324d6a5c14b687c94fc4819a83ca'
         '2a1c3655ea2a7ea1526e80790775abc5'
         'f2715d0e6577751769bf8fd104e87fab'
         '282f19db8b760f68d23103486211b73d'
         '55643b83374f5da543cbdfd25182d11c'
         '0fe2b6f78459ded31a37a7ce76b80e7e'
         'b54d5d76a95fc3e5991a549317994c36'
         '0777b67616a5a3ff850d4d815abe2d0a'
         '52ccbf931c5484002d8f4207c0eab731'
         '453ad8f6abe56423a558e5a0ee8b3326'
         '3927d64e4ca7e213c6168d28254ab32e'
         'f58907be27c15882194af6923cf8729f'
         '3e84051836cc4116b6642e6c3140aad0'
         '6a58685e26cbbf1015c86b6729d74377'
         '14be635af937e6d323623c821f96c2da'
         '8e2c32474b60e5d96c5611938e6460de'
         '21ce0dbe77d2a723745da16475c7edb8'
         'e109fa727f7ef02f0ede8d218c95ce2e'
         '4dc973e4138dd99a14acccfc8a814489'
         'bf15e143f2c26b988a89224494113028'
         '16da1c4dc4595ea6f85faf3b664804e0'
         'a2b47bad4851a7938f8926d0bdb75dab'
         'b1754a9877b51deb1b3035ba785cef6d'
         '0c7d25d1a0a0e7bc8d888fe14c358eeb'
         '2cecfa8512f7dd80dd2b5e8fe140a7c1'
         'a602052c86dfa505f67e6bb6d60a2d79'
         '768799c619a2cfcf902ae6d630135242'
         '92a3578fd6996df21d08bdc13d56db23'
         'cee0a9f62bf24926a881bf9724815482'
         '4efabb96328048191564595f296407fe'
         '6d851b4359739d21b9fc73e9ca8c2fb9'
         'fdc3c271fe8a822c5c3c1e735d3f4d7a'
         '125970996ff8b5c6c5eb3568c2381efd'
         'abdab54b1d18e28f47163c4b7630b508'
         '186354f9dbec280ad6aacb6c391cb7a8'
         '81e711260902216d987cc302bfc197d5'
         'debae6fe40ad600ea29354686057c5ba'
         'f72b4416b112c9fc73573528c2dbc41c'
         'ec02c4b1d04b7509d8b4543281c79ccf'
         'cf537626ad804a027f67734a9fd5b84a'
         '1f451d8f612397a67ce4c683b6128bea'
         '900fc53323e285d51610fe9d49111c86'
         'd065391cdfb28af763f232cb6e36d3ac'
         '628ccc78700dd0f1fc7e73053446580d'
         '472915ed21b48f7cf2527a7b9aee0985')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
