# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=95.0b11
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

md5sums=('0a90dfb43887b5210c1d83b63d130ca8'
         '022685120c065353c27064218535c282'
         'bd8b244fd423030f3b2494f2872f65cf'
         'a8daa4350f51dfba34903aea7edc6b63'
         '2bff572be45d3ac17412d95cb8ce320c'
         'cad7d078b57401416ea0674b50c259d8'
         'eac0820859827eaf54007aa9fd1d7afd'
         '9706d88d579a54694ef77fa6d0d87c75'
         '096b5810bcbdc37918e8e179e4510d30'
         'd76351b5113c7f48d01847c03e30f0eb'
         '73dcbafdc899d34badcc0a96dbfe1bcb'
         '77ea80462dd4d05accb8d85713f506b3'
         '51080583187eda42957a2b5e6b63c796'
         '10545f1a898df1ce2aece7f9ac87a4ff'
         'a8780508942bce1bb86129e8ca27437f'
         'df86b588cd455d97fe39093dd3f8d4ba'
         'bc76468547fd33301abc4f0c9ee7db01'
         '6e06237c7cc8227f0050d0640bedeb4f'
         'f13d692bc1ac2825bddd00bf89b661d8'
         '080ccbe1dd20fff65f822d1d6417b18c'
         '01423cf1c9502b7a48d333c6a5a49a59'
         'd37e39ccac79f329f8128f36b3345e4e'
         '66b6a8af8047aaa0ac75d57b8fc1db32'
         '1658afc9ec3dca2ba07bacd8725c7f8d'
         '0bd453f972eb7d6f1c90e1e03c021c54'
         'c7e98f20c568330257165dd6697a88f3'
         'b47dd1ea9ca9ca71a3df8db1430aaf05'
         'e8f32825f72a0224c0c7c62e2aa113d4'
         '403979095807395e04c9d2711aab6b77'
         'b7c662da9664e6ea83977bd74a4db5d0'
         '320be285c787339e44a7a823862878db'
         'ff7a880e61a5d77b8aaa1f80249cf481'
         'dd4ff7c469ee091358c48ee13ee562cc'
         '142767eb9e04e0d4d88005cc553f5d9f'
         '73a4c076901f32702237179facb9b520'
         'd9917c02dc4d59c7603661f37c6fcc69'
         'b80b224bc50d6e4ec05f9846b827c2e6'
         '3e199d06ee84fc166349eec06107cfd7'
         'c073178aaa1abcbf553a80f7ab354012'
         '4bba21651075b25677cf368ce7a883ee'
         'c2adff0078833c968fe064003f6d9cd4'
         '7eb9c2faea7afb8addc1e5ef78119bc2'
         'c38f13f071c6ed5590a57f036ec17849'
         '764bdc93c53924951e87e9c98c34a858'
         '908de61cf78bf15f6a3e0861d2bb9580'
         '650c80e3babc2f808a150e08300a3e4c'
         'ac956ef73407a44964a3b271964cc9ef'
         'c869de977b1cd3317d545f5bd75576ed'
         '36fb33770703437edf9da4f201d2a58d'
         '30e370eeb8e755703a9dff2281e0e6fa'
         'aee0d66abd299051b15cb6f3c2416dca'
         '1372bee939c35e493a67a98be61da6df'
         'df711f072ab90583b1eb32d6c9d9da35'
         '2cd67c0681d63f27da3e0c3371a2f4ea'
         'bb22d4d9e6e224fc7c2d2f386ef5ff4f'
         '514dfcc202ef6c4d46dace058defad46'
         '2d256a6d4cc3ab5cd0207e73f4d4da26'
         'ba594215eb7c5c43497cfea473e6934b'
         '88a6455cdd5f707d53f22739d3f1a78e'
         '0eefaed539c8095e7f7e2d636c2b9231'
         '3af4a4384ceb1a5ba67d7200320c0330'
         'c74e60558794357a4dc771f2f133a8a1'
         '39e923aa2898dde4eed3805e3f6890e6'
         '11021232fd0fc8cbe15de88b0d1e8f65'
         '36e8fcab3ee39b557d8b5c477306d201'
         '4aae4ca628b9c5f410b8867e776258bf'
         'c68f2473e978ca2de75cd3b19c0dbb4b'
         '55200af94433fbb3deb158dba8ef437c'
         '8bfa826d8dc3287206192a0578a31a62'
         '9eea74d344a38a24fba767232be59c3a'
         '4387242bda6525069173f0599cc267b3'
         '1d12ac4483a2dbf5784b666424a739aa'
         'a405e60f91b8669efa80965a65fdcf0f'
         '83e9a482e6b88f4b03398b641f1514b9'
         '2e7ade646223b15fb2ff3eefdc692c42'
         'eef46e87472732fac2c99a46947d5c8d'
         'ce56a21249ea1d19ef8fbc913b84e9be'
         '0f6cb8cf4ce1e8f5e8b5c3330ae11b58'
         'de8a3f367492cc50aac5f659e8e95ac1'
         '7657efe35fe502a208140c1ba1de72b2'
         '605e66e833d7590e5491fa2fae9a09c6'
         '6778c6f44e95e89cadb6710c607eede1'
         '3dc51056eb72ea4d318286ac92c4a8d7'
         '8bd230ce4e207f8467c11dcd38dc29a1'
         '4486218dd893d48478c78ea336523b28'
         '9dafbc64545fcfc43e4ebe843444bc7a'
         'b0b9357a8119aa0d0df89f936dcf115e'
         'd5395700f7cdc2d0243be3af445285b8'
         'd465a965427c61e6d5b7866330b379da'
         '019816a0a140d56de82c3b5295ed2472'
         'c8cb4804c01ba1ff7eb07a8c9b770d6f'
         '44419736629d26e30025bc4946227a95'
         'df538d6475540ca942cdec172a185028'
         '19ddb78b5a855d0b4aef39b0d64a4716'
         '50da4caff89a6a3e832ee355751aaaf7'
         '79867c37fb29f42065d9f4866b4e10d4')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
