# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=77.0b8
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

md5sums=('bc7d6b2aa9954960621b0e384a5d5485'
         '218ae33be4791e0430eb8738028a8621'
         'c9456ed95674f4be70a94cf32fbad90a'
         'd4dbc123afaefef1349cdb1839aa0dcb'
         '60e7044d79b0176c237815bdf46558ee'
         '2a301dd0883d556236c1a2e03dc14f65'
         '25b2d111074cfda3b9427a7bda3ba7ee'
         'b9f66ac4043d6e87596e9b2c626f850e'
         '1d9656fbe0c67e6959e9b4821a06369d'
         '5f33637fc7efa3f73d470138625c9b34'
         '5a8d42e7fcdd9f0b7f8a84aadac35fde'
         '81f6b8f944fd1c6c97f41cca99ee614d'
         'dba7f9160c98410c548cf6acc46eec18'
         '9542d75fd25913242ae697312cd7ef62'
         '47b7fa0472ff01ab7d12c7d4424dfa7a'
         '6d4a8791e1c96d9d931361c991ef2b80'
         'ecd7f4b6931898f969e7c563f232cc03'
         '269d74ea96e5571fec567ad47c8caf06'
         'c6f461369659af79318040630aef5885'
         'e48c8f699ad50389f7d97c0dc8bee920'
         '0e850ab26c7717cdc1257724460a60cb'
         '1adf062e4ba342c4177a6415dcb6fa83'
         '846c113f7556ed8fa71c905b51455c73'
         'ca1794d3982aea810720488b46606e73'
         '0cc1fcd2eca8a86547bfe849d68eb564'
         '13e1a0e225da3715cce15d2a969f3eda'
         '5cc9520e0e5c4f58c8fe410eb3be6d3e'
         '36284098cee1cd73c68c9270bfda76b1'
         '62a1eda34907a7e491fe69aacb02ce2d'
         'f8d01ba5ce2a86d007bdbb10b886a673'
         '45f7d89c3e56406f2078c72ff93fde47'
         'b56c5ecfee4426d2ff9205f1b541fcc2'
         '5005da0d80300207a98b3f7a447978ab'
         '065b30f3e2937514d1f535cace98799a'
         'bd1bdd3abdc693a4487c430a9539abde'
         'd4e1f93ffa81549ef803fd59b39a49b1'
         '6a2c4124666aa119beab0f27119962f6'
         'd5ae28042b0399f327b5e42241ed1c85'
         'fa00449c68a2693f46336a6e3ece604e'
         '90b491089be5e02d9e67a23bee4f0a3e'
         '853637dbcd354c2e1f4cb1a9cee36807'
         '61fc77db67db9088bf3bf432b14aed58'
         '83822312d9fa6dac9fa682277b3ae718'
         'bff4271943ec5795817787d7abb76a03'
         'f0402c72bc2ab4803705a4fdf1ffbf18'
         'a535cace2e64c5b022e26d77a2a92c36'
         '084acbfefa786959783c63b3c250c417'
         '1d3c9fb4f13b0629ffc50245af753129'
         '00a511aebc94685a94dd3849110daa35'
         '18063c28421a39ca919da10cac8dfc5d'
         'b478c60ac3be90df5cc6167fef3c7827'
         'aa33d75e0bbf967660c837c2a48c2991'
         '9e965d58e63d1c0192362c7fef132570'
         '02991febda30c82025fb4daa4efae103'
         '101cbd0ca9bbaa14e96c3677368e3e94'
         '80cd770a909945243812f92ae97d9290'
         'fc55bdb6d28b8e659f0268cb7146eba7'
         '31b4b3a9ec8988f6a5b2902be4f90976'
         '5383cd8f9ac05d6c871aaf989a09a196'
         'b5092c5535f7c0bf6ff9d1a068967a55'
         '9c88e9fc59c9e9bb41bc8ba63a07b1d7'
         'ce961d84f14596409f9a17d5ce39c670'
         '390ccb14bdd56a2124e8fd032ae7fc80'
         'ca80bcf01705d6b04faa8aecf31e15d3'
         'ca8cb94b5af137f27e3936ca832cb127'
         '1519ffe5cf22309941c4634d1ba92fa1'
         '777ac3dbe4548dc4fa706d5ac1900408'
         '2d1478cbb3e5540fa534f00c8ef72ada'
         '9134af6d52c5630838a84eeb39361d15'
         'c711edfa9630f72b37dba9b32d8d75cd'
         '36f0462c3affb38b43875aa167d63945'
         'c7d8672862253b81106d90d654133bbe'
         '3c48bbb1ae6890405d0b5f86fac00ed7'
         '94b975f89e71154e47e712c02bf81053'
         'e1991795f20d3dce12c295ff0c83d9d8'
         '1b5d53f06e2ee3e112c6fe31a1a53140'
         '15279ae197015bcb72d3fe9d7d23629f'
         '085fe4fe03bee13248e48de75cfafd66'
         'fc910d46bd930d124f57dae378c449da'
         '4cf4fb5523dc576852aee222731f39d0'
         'fc218c85eb98c9be60f5ad4a9da6f66d'
         '355ceb3024906a5f84f48810505227ff'
         '0f8290746832d4612c095afa33b86396'
         'ce8fa715384dcce506433becc37f1c4a'
         '9679e8bfa07136969b8955e9d44ee98d'
         'bf7622ee43eba822c49a698d69efd6f2'
         '73405d7e833047a30f62d08df9699c8b'
         '37224b31723e6c97190ce2775768502f'
         '133a3f92e09098736b1b33e2aa95fced'
         'bdecbdbf29313a0a95ecc9ae95fd3734'
         'c6f1f02d48b6b6d012c13200d3679226'
         '6152166740efe8faf635f3e5f4ee200e'
         '25d363d3d5622a8e875f7fba28364837'
         'c2f7b290bbfc3fa2880f6a50104dac09'
         'bab1c1d712f6e9f2176c397f653b9e0f'
         '7e4544c275a7f485f94c451ae4cc5246')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
