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
pkgver=96.0rc1
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

md5sums=('15da8cf3cb10f39d9d77dab11abfb0e8'
         '0d9a2ace7ff38ba007141a7ae5c227e7'
         'fc9ac4da180b22865d76f9b2448010fc'
         '01b931225e2352a03b01bcd0cb3105a7'
         '15a33d9c3691ae738b9709cb0a1ed23c'
         '327a40a0fc19b1cee1167b53c8dfb60c'
         '4530d1f41296da76c5c97a9fb51c0c47'
         '92ba1b2ecf3c48d6acdadf2a292a6e9f'
         '29be0384f7894a1d15b55082090958c6'
         '4fd77d208522c8f67b05a6513664b130'
         '78d2fb71c31292f3c29e0ab7f02ca4af'
         '2fad645ab04a0cfdba8fc0272d5ba765'
         'e765b9c1e0f82594319b117f1cb1e34a'
         '6824eeb563803b18661292c4a2e5cde9'
         'b8d51c4714e3954c82e0b1d91cc2c20c'
         '0eda647bb0ca6fed8afe5b844af41cb7'
         'cda8a13c31f645cfea88f852c7023593'
         '7d38a73a882d8a5baa210998a3a39016'
         'c14935b4d9cf63d4e7050203465d7381'
         '21e01ad7ad72acc59f2cf0727793c405'
         '044771fdbab11a9332d292d7dfa03039'
         'f2d42d55d2ae7a3650dde736c670ac04'
         '70241d80dd712f82821074da6a77654c'
         'fdc4b25ff55dfe673b3c27de1d2f952e'
         '12fccd7ac18c0bb8ea8c1f0c3ad00306'
         '3bc38a829bf0177f88ac91cacd4922ec'
         '200fe3f508884f145699cdc4d3d93dc5'
         '39892da9486cbd576cfd7f2c3f6deada'
         '4b7c32e33ec0ee89381d08f7e61196bf'
         '47d43abf5aaa9d39025fd6ae74f5f898'
         'b65cdb5c7fa1c9aff171883823a490fa'
         '5f147efd8471e77595b6b4b0d2fa7535'
         '672e337e45ea3e231221879ceb0d7e49'
         'aef844eb1258651a6b2d3b8742b203a1'
         '09466e5975f7bc063e94450ff2face5d'
         '7922354014836dd51d15d1e2e61bc4bf'
         'bda4a38ceea346c88c1e12313757bbc7'
         '72e5623c0a6b33900ccb742832d80d96'
         '972f8c141a217e1e2e8e0084a6ede5ec'
         'afa5184571aac8476071aacc94650527'
         '41ada2a1287005a191da54839c7ae7b9'
         '5a011d8877f6244d06acf7d72b002130'
         '2caac1af2009145e74db7ef2b2019d9d'
         '981742f20e595ff0395e7bd2eb1b877d'
         'f796bd3fc2bb60a22d8c120073485142'
         '445bdbf49025f1d064e52229d7a62c68'
         '147e289e99baa59071575ea45923bc28'
         '163bfa155eb69a2dafa4f675cf0d961f'
         '2da92411added3e4527cca7f59ed5cdb'
         'e636c41f69629a423c303275a5ffac9c'
         '6853cbd3c27f747ba42ac36be8ebfabd'
         '9748cbab58de3f5cc21eb110ad04cd80'
         'da8ba67a281e18b4b49625978fbc415d'
         '4a896044ef7aa5c6e6f5d135a38f1088'
         '1b56a8c378b069037d44cf1c8b5f69ec'
         '9981c0456e4835a7ffc90e4c676014b3'
         '9f515a7a78589545b52cc31ed19648b3'
         '1166c318d1bb6cfcf9344262170f7b40'
         '6165359a63e5f02436805b8cb3d3e43c'
         'c512506f4ef13a083e4cf4c7aff89086'
         '520b8dacfe595e6f0bf847e1a9ba485f'
         '6fc17c4798b0ed3ab962d76897e20cbc'
         '06229b3f3ae5c8387a51d757fe5f149c'
         'c6765220544d5457a07c98fee9ebec53'
         '142a9d3fe19ba181438964188f069d46'
         '1610926174e74ec24df0b7df755bf232'
         'f124c62e4e9109444cf9ff887e5c549f'
         '513d3126646c9e09f198cb75172256e5'
         'ba26e99ea034edffbfcb70fa318b395a'
         '8696d91048203312f51e11576420d4c6'
         'f08c19b9605f36b79f319575e5c9f405'
         '40769294fe72a3a050d5dd6d935f78ad'
         '7f6020e2c7fcaacb205f6c59637c1002'
         '9deab6281495526c53f71c042ade0c10'
         'a2e7acdbdc1600ad7678c1fc47ba26d5'
         '55240678fb6e785b3bb7a5d86cabe555'
         'f50c85d37eba3baf81cb77ca4c104cf6'
         'cea710d4e9005d1e46b8656f9ff7ce4a'
         '931d4adddf39722bea731d7e9e43eb23'
         '9dc2331b939f05b7aae42353f1b22d59'
         '6d3f6f0829b8003c7cdcce4ba6128112'
         'ae728da5fb2b2b2c2a81d1fedb3ba4c5'
         '9d93acdaa14703feb1dce58179dd424b'
         'b16ea1d6f8a742afa7f166f5613aa48c'
         '76075d09133ec372e73e68f1c2dc0408'
         '242c257912769c230f982c343aed1c83'
         'de6db9e5477a82628d3b99f802ef4b71'
         '39e22e8c43d3b8b47c943835102784aa'
         '4bf5da8afbafbb70c383ab7d09d7bf46'
         '4cc2fe140ae1f4b283a3b909c4c0ac0e'
         '186503e397516898cc0907c931e549d9'
         'e7da3b434b1712f0719f1f8aa971ee7b'
         '57a84415d177582d10b49b0742dc5be5'
         'f4d20437f52c3730809c4f915e8204dd'
         '866088b9ea16543b4ac2e4f18c1f14c3'
         '556c9d223dbfd2f3d83fc20f8008e75c')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
