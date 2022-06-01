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
pkgver=102.0b2
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
  _url=https://archive.mozilla.org/pub/firefox/releases/102.0b2/linux-x86_64/xpi
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

md5sums=('61641f18a71803bc985f95a5138f664b'
         '2bf6f99e8a72cdf8162c4b0d498b932d'
         '64fcb3838a155013967866c74c8fdb0f'
         '7bf72db28c4563b0d4b474f11e5e3c35'
         '11274526a61fba6666ae398c73b102c6'
         '686569e3b78eb6898b3bc22543b228ba'
         'ec7f0827df3b6fae0be5dc537b4a1c84'
         'b6f1924c04dc6e824a30b678c1643f4e'
         '99a48fb1ba5ab0868dc5d2b8ced15d0f'
         'f42ca620910b4fa78c545d203165a884'
         '8f5d4f48aa7dbfd5a2a566ef35223676'
         '0aac61ac57d7ddb1eb4d538ef2d20452'
         'c5ddae806c209a1075dbe88b71e4b81d'
         'd7c6760712c16daedd1e3eaf353f8e2e'
         '44b44ee7df70e827887c287d3dec6b27'
         '7ac6e70a6ec8d71776bb0462f3b2cc1a'
         '7573bbf59d0740d14714ef0946f940c5'
         'b4e69d4135a6faf8dc0be908c1796696'
         'abf752e4f18def2da7f6439ec550efd0'
         '1204ac615954fcfac99ffeee3bc0d963'
         '4e164a36096c76f03c6092aa851cb89a'
         'af7e374716b0538834ae7ba9b403e994'
         '1aa4f40d4e597350f034dc075785814b'
         'f4ab316b7befb5edcdb7c05ec41dfb7b'
         '241dc4c013ad890b3ef950d960bd5f2b'
         'd8d09a48397fb66cdd24f3aa22c556d2'
         'a160c110261334f7ec0626bc90f8f0c7'
         'b46f1e10196493b9eeb402aff686b9f0'
         'ab489d61e2cae7ebc71ab988bf3c1692'
         '6add83357948a26c32ca93ef614791d6'
         '402b5e4d6ae9ba19ec2188c34c67eeec'
         '87537710ab039da4dd5aa7dc44bbbe65'
         '085558a7ee78457747d25ac0cdd15c4a'
         'cef96d370a950800d00b35ee8972cf68'
         'e6a1086178a05b4784d3ac0990d987de'
         'adcd312066f4fcc8e12501711b9fc602'
         'd145fabb25e541cdbfa3e52432af7d92'
         '0732707d3f102835160e2c8b4504d84d'
         '3d11c095e66ca5731b47acc5b8e71eb6'
         '64bad2cbffe0c013d7a39ad7d3b595c6'
         '650da845fdbe0dd80f30126947796f3a'
         'f2d42009f1b7c0516146052161c9591a'
         '19676ebee91398a72f6254fe42592cac'
         'ba8c186a76ffbbf77ce1d77a93985a5e'
         '2fc0f4eaff4e442cfa0647c59938f60c'
         'b7c0bdc17cf5ebe87fd8044543ff4536'
         'e7db54dc39b24cc12ec7e5411dd9787c'
         '0667bf49ddb7b09aadbc09d09f2ab575'
         'b30d327da48e97e8a6857abc2b1f505b'
         '7aefb0c60a1e558e59284f5502fbf933'
         '373f532e00ca8074033d04b13068d66f'
         'd5a09e58204a9d833c0ad68af163ede0'
         '2ec3aed0ce17d1772fd6ff059d70b718'
         'c82f675fb24cc6cb105f048514ba9cd6'
         'f012c3beaf9a1e1211e2ad576bbd2aed'
         '3aed4d996e3b60e1c2b2bade7939d5de'
         '420e246194f0f50e3c3d0072a1f81354'
         'ff85565fbcca3597ccd2914f23290675'
         '7314a27f2c53f0d612c68c12ca32f1cd'
         '2e50f79fe83c0f1ea49ad071db133bb5'
         '57d46e1304886e97f594798d68418004'
         '2d9b60b946657abd727ba6c0b0befe75'
         'fa159befae76d6059116aabf28cc8c41'
         '198894109a729b8694277cde4f689bca'
         'e69b9a38d011b9bf0a00bf5e13ae9297'
         '872c482157d2645cb624daa79603a265'
         'ab3b31042b34abd2fbf22d0d653628dd'
         '1be2d935a0f18bc3a2d304c8a5752283'
         'c2ab877e4d273ac00a69c60238717019'
         '565f75b2c770cf63803ae2609c17bba7'
         '1e8f8c74005a178b78c256d4c88dbb55'
         'bd31ec270765c78ca24d188c46fbab70'
         'c32c171750f36d77a7fc0eef8b726930'
         '79787fc4f374aa5f2461a09d15f3040c'
         'c9d88df0c204a2713e26909e04a1df86'
         '07224d445e0320a8a03a4d46b9575962'
         'dfaba54a8b263c6417d8e82abf9f00e3'
         '4f90e8afc191852d823523243630ed40'
         '4c424ea7451debb9a0ebb52166692dca'
         '944c7c9a920df71b1dea07c7aad879f6'
         'b3625b6ea068a5f499ecd28ee2ec6d92'
         'fb12af40a6b449422249b0c23c85bd67'
         'd7e4c66bcd3813395da87ce21d0fb814'
         '4f7bfb5c9deeb8f67ebb2c9db6e45089'
         '66f067f2a3a1992fdca829fcfb58a180'
         'ac037222b01623339b44de3949026dbe'
         'd7fb29f59110d8171b97599598785661'
         'aa9ddf21aad8014e040b0534c81f39dc'
         '5af862648b8a73cba0e1fd106955fc74'
         '0083642c61933e43f19ed8493ca4f50c'
         '0da105d21d16aedec1951a419a762582'
         '37b1a19806450c3a634713da54d80209'
         '28ec63c20375b23d6030a9a2740df57d'
         '779be5bb8dcc06ff7069ea4b176a092b'
         '3052faf7bd76014b776ee2599dbe9241'
         'e43f94882b5375256531ed636d92b089')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
