# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=87.0b1
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

md5sums=('7829419c99b6adbfc886679cdb176fa5'
         '308a990a441d78abd3deb31f400a2f92'
         '1d1430d7056acdc78dcc1f18234a3bd3'
         'd80c166368a6ce6fa8dbc92905f431bb'
         'e0185608d50102cdd821e0ffce84620b'
         '3ca7280791b00eef84c51c86f1f7c6f2'
         '9a6b19a4f43b9f372cb732c252dbba4b'
         '592b959359e900fde193e1ff386e62c0'
         'ed60ae71f42575dbaae23745f7780d97'
         '4f7cd39cd036f16d7b805568a2d8e476'
         'b3a0ac0ac51ee48c0afc8a52bf8bec54'
         '2e62375597d01833c8af02d666248365'
         '75b590f9908eee25b928f092a54eec3e'
         'd63cc9bb2f96b76574cffcfb08ad4841'
         '47246aaaa50966dee953975470537626'
         'e4e321920af8cdd2d2a267a2de11b5de'
         'c2c053aa14c72795f87ec98225ab40c3'
         '0d7bec0a38f42aaf05704f65f0dac6f6'
         '416e3fd21f1cbe427e9e46f67a6c997a'
         'e3dba5724fac5d85a093d0c518db211d'
         'afa6244a6024fba036c8d79ff9072aad'
         '1edb52608d000fef0439c73598b443a9'
         'e66156a36c58dfc74cd2eea1f6cdde1f'
         '8f4520c8b192727a42ae3d2b9e4fb158'
         '1fd6cff951fb3df275101260674fe47f'
         'def7753b9522a5f2f002c869d1428105'
         'b479461c56153ddcb7eb610a803084f3'
         '9dedc80de3b25ff1535392c3cca008fc'
         '2ca65a1641793b19833e9d2ae679d629'
         '34f9bc2207c7ae8319fe7a5d20c30255'
         'f63fbd2bb745fd4bd68f8a56501e5546'
         '673b8158722c5080b05872246a187d77'
         'ea721dc174949ed50b47f3772d438386'
         '225da84a4e473ffe3f6ab87a1f67574f'
         '83ba8c0bbeaece2b532051838c05ebb7'
         'bd2c948cb30e0f75d970d4038de85e56'
         '1830340315a94ac810a5d2222d321a53'
         '186d7a1137989ef89c0ec06bf99d4f57'
         '9e055fb92a2d21900947078d356528a3'
         '5dad7678140b4abdaf69897e43990a33'
         'ff5e33539dd7525a76495e1a3fcd1ad8'
         '989e0460132ac53d0f81d318f722b439'
         '7f1d6b06a9cf00e406d36a7c550672ad'
         'a0109ae7dba7557ebba928e82bef98ee'
         '562249e3a6cfe3d6f8e5fdd5bbeb89b9'
         'c0658b6312f5ac99cc3d2364bb0b0fe1'
         '6a5915ec6fbe3034686664da5df71505'
         'bc546568469045a3fd8d067dc7257dbd'
         'db4bfb5e2ba358956fea149fda383530'
         '5bcff8ae9380f113aa91fcc890498210'
         'e1ab9aeb21efdff78672b5dda31cec8d'
         '7e3f502fa4422b2c11525afca711caeb'
         '6f263abd5baed6545b96729e7f1950ac'
         '7a497bfb8cc51f41ba698408080589ae'
         '7106489c5f0a7a7b0b3aee5831cf2797'
         '11ea3c8903862b8132fdd48926f20946'
         'be04f7ba4b88c7c7bcfe857a9c962abb'
         'd4e7978bbc5eb9e6517aaf95863ffc59'
         'eac01b903c4e816313e49ac300756656'
         '035cf924ee5ef74839a5788c05d7e324'
         '156bf79b9fd2856878087066e12797c9'
         '2a388fb21a3928e5713b31272cfa8be4'
         '55ff250fc00f15661533c8ba7d09c500'
         '59aa6f93d9acfd717cd91a1ca2e07851'
         'a26af9e3d7782367084ae97414eb08de'
         '6e0641a130c1f89ad7135580f51d903b'
         '983c86213b0479b246fac684e70f8ac7'
         'ce49305562b2b967429af833731245b2'
         'e40cbc97250450df922c04851aa9ae76'
         '96d6c31a0d697238a38762f15731a1d6'
         '4dba633609420f3a456ba0b633d6319a'
         '3c48d003ef2b9b13fff3dee82380fc38'
         'd1458317a3436cd5ec8721bbeaa8110d'
         '3addb9c8dcebdb3596acd656fa0d9b74'
         'd98987a486fd98a88ecbdc5b6ec6b1e1'
         'b378a6533e4660f2dbf22634c17509bd'
         '6fc24e8e2f8210aa58a6b25b3c8879a9'
         'f1b7d1bf1d4b0816e1dcbc25c3a5caba'
         'aa57fdfa2b1be93eb83494e0038a7fa4'
         'a2dbf3c389190abcd5cbb301f4e94bba'
         'a5652c530327f839b9f924b3cf0cf141'
         '84f120ec5ba0b96304eec97a725e0bc4'
         '719b80eb8831a03522ff886075d3782f'
         '225113589fa421bf8688cc1ea5e58050'
         '500fe22fe638e4cb8da5c7276170e8b1'
         'abed87fcd09180a43be697569b4ab64d'
         '15b8bb764ccde1a3559d9496c264e3e5'
         '6ebd754ffd4743de593ad6a49fdb883f'
         '0f952073eef3ecec395a89aa18fc4ea6'
         'c8f1fdb00563984baada6de2a992b88f'
         '995ce68a94cd3b26a290668061ed5646'
         'eccec89cd3034410a42eaf9d092d8c17'
         'b671259b31e254f756a02dafba9d1c9a'
         'd7ec83c9b4c78a14851e18f5671daaef'
         '163b41fbcc7d61d9abf3ffb11709e3b5'
         'c22528d4a2d11bc209e1694f42b61bf9')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
