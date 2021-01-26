# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=86.0b1
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

md5sums=('9f1c30aff2bdc6dac076a537ff304578'
         'ff43d251d1cb10f472d6744827f8b7a0'
         'ed0e77b562f0c0cd3d2165a26e709d98'
         'e0d624b4351a88e1133f569ef2c423c1'
         'a73e3186293e2f1b278a0f533c0d1eb1'
         '82d38d49647fd7657a2246b6b501fef5'
         '7866b0847f5f5ccd47eab9fed2b065b4'
         'f0a1b479b079fb831319456163ba783d'
         '43fb66ae0b8d8b328906613a19b20c62'
         'af93ea59be5d41243441cf742a915c8a'
         '4b1cf4d922339eaeab55d64d0ba0727b'
         '9ff578a45eff4d5c399ce9c619020709'
         '43aef649dfc8c7920cc44d26b6d2800c'
         'a75fa2d2191653054460a9a6da2ad0e3'
         '4dc11c46f7a1898f2628af95a59172d1'
         '789bef5b0fd709849480da4e4fee52b7'
         'bbf61e9095a5cbb0a45c854a1e2e8b91'
         '2fc288178434a7d014d77529b585d94c'
         'e9a2290950ec154ffe34905f527ee1cb'
         '6c0d1254aa05271d5cfc60666c81f8af'
         '87c78b34742748bc3665a2cb0d913b8a'
         '92eb3803c5df75a86d58d2e5346f6a2f'
         '086597381da9038ba49c37762c013585'
         '0f3fbe951a365844b7ea892404b087a0'
         '4f5ce622f381536f0c92e33fab868097'
         '7b1841a2451bc88f75b7eae47d97f9ea'
         '86f70b6e560d622bd9244a00cbb04ab2'
         '031906b25a5165e4681ba2942ec8adb0'
         '63e8d9757209cf1bc22334f4d227da53'
         '34bc0fa0fffa5a433b6a7496a67a788f'
         '4cee4573cda1ff4a81af29123a704a47'
         '373b4c41f8ec7053fd5d0fa53242859d'
         '6646c44e04171f073229d5eb40902dd2'
         '68763760f942793a801d85669d453457'
         'a3931f8cc101c62059a5aa9e26b09b06'
         '82580e66cc64f361f9f96c0183b4fa16'
         '9f93c7e1b06d0dd1b8dc71708442f203'
         '8b29ab863236bb03d679c306ab42dcc7'
         'd09c17973eeee87d467c49e51aae7fb0'
         '1fa1f9b1986cd382a6e329672675bb67'
         '78dbe8751aa98dbb016de9b2eb4ea5b3'
         'a0ed5d22b4d59dbbbc80ca40da6064c3'
         'acef78a7b441a4005b7a9a7dce9b0974'
         '31f0b09f23da88a35ae77e2f4f22213f'
         '9284cda1b6e33553ca06f7934b4d7400'
         '8249219109733e6cb125e5e18f54a9bc'
         '303099d13b597fa8c7e023f27b5677c1'
         'a7eee2c7e7f02557efd3a9f6883e7dbf'
         'e385165b69e2afda4e9e90050f9195e7'
         '34bbfa81eb87ec437a12b27eb0a8e13c'
         '1ad6849abdb0206e28dc54014480198c'
         'b3f8239917e9f51ca509d774ff82d1b7'
         '3806037ecb9262406f4748833deab3b4'
         'cc15006ed072c901b90bca41e9e1af15'
         '5fae832e02141d6cb7e425537efc6e44'
         'ea07eefa5ddc7f48792a9d66df50c7b4'
         '5167f98d227d50ba633a9bfc6bd9ca94'
         '635d96f767c9ad6138f96bbdd56c1eaf'
         '2a378ff5818f292dc1382570c5b401ac'
         '8f1217900fb4441f7abf90c6c77fa272'
         '8888433b355b3e4cda497110917d1433'
         '9e44e7fae921e64e52bb7aa66d0defdd'
         '801042a7d9ad91955d942a6beeb34ab1'
         '3447917a0c55a9e9997b73c93f578640'
         '06df123ca20db13300f12d0967ffdad7'
         '99ef2692d06c151e098b06363844012f'
         'f0b6a85395ecc4ce1e116466b57e9d92'
         'ecc71aea71c62dd3e46df7bf625dbe8b'
         'd0af7c21fe031d73ae0e47d5176a1070'
         'c5f9e280e9d7ebb308c12a17de298bf0'
         '8fd6351712b1067b0c22e4a8f04943af'
         '6ae38dc33ea1dac8455929eaf22a8c10'
         '91c0281589466fb6236d4993c92432dd'
         '0effa09272f2ed01175c30988db8e0fe'
         '49248ed9c23c0914825573bbef33330b'
         'f89d3d2e957114b4c0f8b0d91765c3d5'
         'bbd0b0fce637e052401ec9ea81c42759'
         '8f1c5da0de703b614dcc8c310b45e828'
         '1955c8d159c8ccdf60dfcbce858614e0'
         'eab808898fb0539bf9b1fb6dcd2b530f'
         '6c4bb34f94aa984caee3c61c378e4c59'
         '745b803632dc9f48f92077c927f159c9'
         'a1825b69942e042fe43df7bde6c99c04'
         '2771ed88059894b5fa6bd26bc3e5263b'
         '37977e6fd7327f24e471908ca02bfb19'
         'cb3fb9832f8299e34fb390e18a2e082d'
         '5ae25efa6f9d721e4d96bced32b2b80f'
         '6a2165dc2007c731036011ed70dfed82'
         '09d2a974c2463b517cbea6f944e5d7ad'
         '78bbb033afe25081d8710291dd59370d'
         'a8e98a05d682323da8b4bdab921d865c'
         '38495e414bcfe4091e2f46cd09482625'
         '765b5d235b66a811c11d1046747f4ba9'
         '771ff7d2d9b730c3976e32b5f9361889'
         '20672bcda947ae356608f761d837957d'
         '5b9d54c94d5d7e02128a716c10a503af')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
