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
pkgver=96.0b5
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

md5sums=('10511f484cc8a123c2df871622dd9f9e'
         '7faf8b9919c7631f6cec7fdf47b4edf5'
         '1a1d590cdd5efdc9d7e75b627689ccc7'
         'bc002c9e7360d4c3e948cdb7400a1828'
         'cd912d401ea357eb36b2fdaa63d402a5'
         '67497ec0d11c13b7ad921df0e7b6dc31'
         '3be534041d5f20ce70dc5f9019b53d52'
         'c6513bb8ad22267ee5156c54caac262e'
         '7fa0ef35688279f47088180ef5c7c964'
         '3ff9ed304a98d1a08297a53a9d5319a8'
         '1b8e1efac33a5c6f013a4fcc44199a58'
         '31f32d668b5152fbcd8ab5e82c929f52'
         'f56cf58ae7d9fb283ca0cef7ec35852a'
         '4caff68b4c8436173218be4133b126ef'
         'ecd1ec58046611273d150a012a627df0'
         '55bbac68c95c90cb9d9f51e871aa3381'
         '6f7b7840eb22525d7fb8f235c91efecb'
         '549eb831a56dfea042283c45a7906593'
         'ae2c41e4052f23f85fa5ab8409db2a32'
         '4dcf39a90bb0c5f6f243879128a15a8c'
         'a4fecbec9359237092b3cf6679da062f'
         '7d4dece39693ed526b49fea0c9a3293a'
         'c325c905640b8bf91d5ad47ffdb5632c'
         'b2768fb9422e6ace031018aa5b1b89c7'
         'a16e60ee086e69e9ff7967288530bfe1'
         '67e87dfb8e759755d5aee3dc5402e96b'
         '12bef1515da7e261ecd123a8629444ba'
         'c30789367feaf69af157dd098bc062cc'
         'f3a91e1d453d663f8cc1a3206f36686e'
         'c66ad1ff743cd0ff91d7539d990100ef'
         '58171992a05f3465752c79697dd85709'
         '62f3830547007c6ec4fdffe990f20ce2'
         '271c1885ed88e091978707ccbec23c0a'
         'd78aa7c0ab0e9768ddb04b651468d5f2'
         '9a39cf3558a7c9fdae873cb72c363377'
         '1bff82564e425e20a74c5583dbce5b79'
         'a2433f48f3ceeb256cdb77591238b1a9'
         'bb1bebe35ce99babb5dd8cdf8e47cbc5'
         'c0270549cec219372c945270b24b9390'
         'f218103880c9e6a1533b74bc075cb794'
         'dd054c1abbb8a84e39a5e11c359423f6'
         '40eb2c37bfc0b383e42b1ddae7ae7d29'
         '105b2daebd4e0d91ec2f5932aa97140e'
         '04a8bd7a77776110f7da80338dda57c1'
         'd9440552e5495a98eeb0bc4c5c17e002'
         '1ef48c67ee4cf14939e8e8cf3b62f93a'
         '6868d2dcb7a8387e17e9b2f75bc7e9f4'
         'd5ec0b5569d124faa04c9601a0003f6d'
         '8d79fc58459426f632b8318901a72891'
         '15ae0e133815454a48730eaa5c50e716'
         '29c1334f0f612edf5763f0748ca1dbee'
         'b38e42adadb53ac23fe6095de489d9c1'
         'c46c7efad074ba24ebadf91464c85c88'
         '5f7cd297b2b61bce4175b341af72db3f'
         'ef20f469d065cc461202e6f61407096c'
         '0bbb54903a8f3a8244ec4db815b2964d'
         'd2a2acaa3fbc63467b86811c33581e44'
         '5e7c267d5701421298fd8adbe7b46e7e'
         '8e3dd8b2eace6643d0f40122c8b412ff'
         'e7a7c152ea8646cb4f1492a3d4311abc'
         '0f84adf25991cb17cd669be76fb7bd6a'
         '4afb96758b73b46b9d579e28383d8e72'
         'a0eab9a06278cd0582df6b2d8339200e'
         '172ed85fef0ef4f1e089cd0e0dab4980'
         'b4f90fd5db714ad9bdcc633e4d4c6db8'
         'af81465623c7206bd665b5f6f7d9be45'
         '6334aec9567b6446b2836ab3268e1464'
         '7b5ef110170babf9fcce01d1ffd33202'
         '0df6700a80a25376cb510489d6cd5ce1'
         'b291ff3b3d706d16ed9458a4d9ab052e'
         '9d0eadd94a3c427b553cbdbde9b2f2c9'
         '711c3f2438ecd453f0115da2ed93bb70'
         'b445ecfba1111bd87ab20ee7d2a9ef46'
         'd3300dabb8449ade6b9657ae6d0ee0ed'
         '357a157404b6f8e683ae92f33a721448'
         'dc66a9ec8a9748e3bb88985e47a4f0c1'
         '39d7747d27042c8fea3e269a21c9f0a3'
         'de2c6526986f0eb51172a3882255db87'
         '97e341d08760ef5c387dbcff6a56822a'
         'd7acf7b5102a979c6f0a8f534b500dee'
         'a538c885454d4c55deed52009c308c27'
         'caf6eb53dbca288e9677d15bdc5aa536'
         'ca6758d41f7fea31d3456f2640612766'
         '3d2f8a9be728294a59fb78851e431c1c'
         '37096ab9aed31339aa3581a50c8f42bf'
         '1b422efe36ab2dd2bd248b3e0d7a3afe'
         '8c96625991531d320e0f17aa8e5cf1bd'
         '7c6ff997406d0d7e40654be9f51831e4'
         '6b5e14566778fa07ce670c16482d7085'
         '9b0cd98a89d36aa353964a91e327d447'
         'c433583effb97c5b8eaf970895bd61a4'
         'c10217c303e7d61c3c4fe98f85bcf06b'
         'af79c6b6b0eff01dec9051d90c1ef760'
         '3cdbb82e7f1baa3499f63d82fb1bf5b3'
         'd8fbc04cf564c77d09b46c48e811b5d3'
         'f91e79e4f6acac0fca8b44280e9ad2e8')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
