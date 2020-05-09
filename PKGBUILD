# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=77.0b3
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
_url=https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-beta-i18n-${_locale,,}

  pkgname+=($_pkgname)
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

md5sums=('fd6c1a1d050a78b4f78a4e7460e341b7'
         '4e05c3394590026576dcef832b2abeed'
         'a04393b7cd0976eeff820e658511af7b'
         '56dc3210debeee2f2b7098e87a2b14ab'
         '87bda036e28ef7cb913002b90e943bdc'
         '8fb47fc62c1cffee860174c96cf90501'
         'f32b66d4738a507d239c2416111edc95'
         '44da631964df605dc8cecfc329028d7b'
         'fa3bbfabd4953314a3662aa60f234db6'
         'afc5b8176db33063ecdc88813b843c09'
         '209a0463cc69781ea878db86fba48f25'
         '65afba74d1ec606a476b01f72a4e21a9'
         'a203dc9e3db2a9b60cf4f81ea66df481'
         'e8392a3fc32079c735353cc450d123a4'
         'e3fe953d8b2b553bc1506d9c9c8ca4b6'
         '5e9d7cac5ebe0d91516fb6bb72b99c43'
         '794857d9fc9a9335b3863e979f6abf35'
         '05d2504224300180a5904b32cedb0c87'
         'dd199c89744ae0634b76811d6d8e1398'
         '38c5a9af1bc02648a1877f7659aa4848'
         'c9c936b6e0c157a6b17048591317b507'
         'fcf095851b1049ebcfe1d03275f144bb'
         '502f58022574b963ac4569ec3cf49a3b'
         '57841900e596c6a8063bb06ac69067af'
         'd205b4457248cbb7d87609a55663d55c'
         '89f83a1f1e9c001127f7ab7e8271bc8c'
         '8b022828fd183985da774e86e68b8cad'
         '5b4933e7d16b4764f72f0f442422c3b4'
         'b9a1d9f8edf6476a31027198f6d3aee4'
         'd409c2f05ea4b76377714f4251347cb8'
         'd83e882716dbba49e7755d9fdead435f'
         '87afe53e19e021e11f701afbaa251290'
         'bcab68cc8fd26b900ff2e7bc95c2923d'
         '6248c76b06b5bfd289728d339b12ceb4'
         '88db97b54335447be7e2b68dcc3c2933'
         '859989f860e5e6ddac0a3c282183186f'
         'c7aa1ba335ba1571be443efa1f6de9e5'
         '1c6f2375d27df3bfd7ea60805e8da831'
         '68fae2791e4a672f4767c0c0875238a2'
         'faf89b4e7b8cbcea7c123f96a3e01fce'
         'aaaf86d28ce8074ab3b15d416a97c573'
         '12ab27783833a772c910f98459197f55'
         'a94bb38e5504aeae631f59e9a2cb5317'
         '34c8ec558910abe75035e4c4169a04fa'
         'c2543446be865250ad2a6876f4431c2e'
         '99b3012a482bf842a05e95be3eb21e01'
         '81ff3dd1287a52245a6591a99997d587'
         '8bbe0aa02d45659d288647ba76dbed0c'
         'e05143a1f5286ed532d15ed3d0cbaee3'
         '5ea06838b2aa5ac3a0c9bb2f1969035e'
         '8ee6da15a521171a7953ea227ecab443'
         'c6391de6c8737c557b63c1249517795c'
         '3b7b8cde84d88ea8fd3a2d135f2e6ad9'
         '632db8a7fb0107fbaab5dd943466394c'
         '22aee9fb672eb8c9c2f39cbf73539010'
         '2708a2e5ff49323905ca95e1a60db19c'
         'a6577e55280595a5790f6e3f0e399869'
         '1ac79e0ad873346cb77b227678a9d835'
         'abca5c8ba6974e92e9eaf37dda9a2f36'
         '1c872edf40d0f330b75d60ede95ff25d'
         'df01569f1368f49f4d1b30f1ed71d05b'
         '0965e131e9f00da563f5af0e1dbd8f3f'
         '0e207ae80e5216aa12eea5c8e03b9064'
         '8a90d3875f9e0ed3afe8073309137c7e'
         '2122875e70aa3d66bfd55099038e73d8'
         '77588acfbf091e9ae27d9ba926b5759c'
         '1cab53249bf6399ae8893962e2970e8d'
         'c26bfdc1f0255028108b2ea5bb012ff8'
         'ad273e27eb4ee5838a4d6e2748fb0faf'
         '6bafb41b1fac66d4b71a756dec4a4eb1'
         'b92e219b16b8af3cf27d3e52cd2168f1'
         'edcffcaac4d3b43487f8eab8fe3ec549'
         '86fbea234c1370eee3c283acc0005b83'
         '8c34c33271d3b172f2dce809d4a93d11'
         'f66b8ed5dd73753983991d11dc49c86e'
         'd5d986fba91d704a5e7c3ba9a6f94fc9'
         '0e55f3a3f9a5b7bd5766c0a3e61fe7bb'
         '1916a563038d33dd5b65ac9c5b9ba3b0'
         '73e271ea6e4660f0a2cbfc5a3084148a'
         '855da349cf4fbe783a7889221b4f5afb'
         '0055041bf3c3558b0d4c39dca12a1810'
         '4c7055cf9d62b390424b819b0cda91d0'
         '1a11fdb531b09464a61d0e8c2f8ae849'
         '18e334fe0a29397ccdeebf5e88aa34f3'
         '209e70e306c81b6e453718888a0f6a83'
         'cb4781441e2837615f660ee963174ce8'
         '3be4eb3ee0e3c9eb77479548b8b8c04a'
         '210ae53b81cbaeae4583e8868b62b67a'
         'f0c801700b93583f6c7655b8e2764469'
         '4d36e0dd6a1d0a3a988867207197e5e3'
         'e9164ddcb0a845fefa0423c887e7814b'
         'ab206aaa66aa87ad88a5cbd80fd0e1da'
         '7b0b41de12bab85e2d05e35a45f6a3b8'
         '8f9c84545bd2fda945431c0d1b358996'
         '0f775b1e5d58286ec66b6416ba3869d4'
         'bf7b08944cec5f2e0061612c6e2774e5')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
