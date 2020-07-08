# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=79.0b5
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

md5sums=('f8e6e4a7a943a9d1d04aa45f0f147d95'
         '5634dd63781bb33cc4cfbb14afeec20d'
         'f68b166acba4d12950f9e9025d725b11'
         'a947f0d767466b1938ef9fd9bffe8d8d'
         '162e8edb77056edd8de136f07fcb2b7b'
         '8c94a8a8fa657e8b14bb6540ab0007ed'
         '67c6880806d02572e17807cbf8c73db1'
         '7204be30d490151be4ec553ffc1fe33e'
         '6cc3be6656e3558332c229b608363e41'
         '02c7d26982df621df1dcff41619fc4fc'
         '3b43b4bf0f21a06e40dafebdbe8ca2e7'
         'e92e29078df0691e1f365a766f195858'
         '33281ca669e509c939c076d9f9cc1ca5'
         '0753faff10c9410e02b18a14464e68f4'
         'ffc4710805a2b9d89cf9dfeb1ce90475'
         '058b37b39e7e42ffbf9ffc79c9eb7853'
         'e2eaa1e7faf3d4034d9c6ce4cade8420'
         '3aac24ab07afd3dcc919ff75ad635ddd'
         '0c660b70aa70d2f096005c2157644fde'
         'd8cf84e1fedf8048ccfdf26b39245ae5'
         '28eda6d0c06334d7772d4a95039824a8'
         'a5d9bdc9fe2c16682a399b646b09559c'
         '2503e428245f8ca59586dc2834bdd2e0'
         '51f0597a782a7e5e070c72fc99aef4aa'
         '168166324f6993d5ba562ed57b3f86c1'
         '62b447a00d3c7c9a7f39024da60bb7fe'
         '5b83f9ba71e32756329cb298f6a9ae1c'
         '0cf1b81a4046a21c0650b52d8f58051a'
         'ce048f833a21804d061b018644b92f5c'
         '2fab7ec20c9da6a6d40570d31d5d3079'
         '89c6c00863f29c064dbc20691f549e24'
         'f33965ccfa5a98729424bd5902033d19'
         '65edf027787b7abe095d948a77378329'
         '6143acd0bdd6fbc848bbfca019bafafc'
         '2336ec57f45d486dfe24cf2ac50adc06'
         '3f2f5e5e392276f8dc4c1738453da13f'
         '9dcf904a1e1540c421025cce57fa7c07'
         '6bd7851fbf3404c1de14e07678803bca'
         '822b84d1dfef0d52debb70a49e442aa0'
         'bbcf3e4b952657e42b8e98b348b3e6ef'
         '769a0f3de98e68737c249395bc8f9e61'
         '1a40eac89f25940c560a5fe85b0e0cd3'
         '0d2d764c1ba93ef9db879dd987161ff9'
         'fb21d44bacb8dca6bf2cd111859c5502'
         '91ee9224f3687674e5d9046986cada2e'
         '358091a26ec2c2f09d3878ed83b192de'
         '2a4123e151b2511ee1a11a56232a2453'
         '5980cba3ca6ea74c6d277ae1bc70e334'
         '8dab63d6ae729dc4569a94562d3e1599'
         '4b74f783b4605b09c4db862f97f26219'
         'aabfba2628760a8d2025e954d1ee269e'
         'dae30453210cb958ee4234f2ce34a15c'
         'e38a9c6682d80bd04de0fcade710089f'
         '4bbcc0c9015f0ee8c01c50d39ea757a4'
         '258f436e8b3749a82590ba19b6a22d70'
         '86febb3dec0add0f4f4217a33857e6c1'
         '87e5bef4bd21dbfa27e19928af94b5f7'
         '2e339703674dd0eb4aea783fe502864e'
         '43a52c63669ea4a2dee231bf3380b4ca'
         '3284d7fd2cb0896bb4c3af72a863112e'
         '32d9f8b9f2533a08c110e0a317681819'
         '4a39822902cf093b65c0b8458d19a999'
         '9b8dd39ae1dc467089dd78ecd6f195a2'
         '57b67224b930553a440b4708f077e29a'
         '041bab7d58d049d0f271bb8ef198e8ca'
         '784deaea0e3b391797282cca0c017146'
         '8824e10c3571f54e8d08138023e80a67'
         'd57114e5ad3ceed52b4460fa5e63f822'
         '875099fc2f6d61b704357b7d192330f7'
         'bbd37cc558e131dbf100bc616af41a14'
         '8536078138d6a2c2255c98a804f43bf6'
         '72f7d8d48871cbf05d5b2fb474975e8b'
         '90a33caf6eecafc99ff026cabb1cd35f'
         'a7ac4cca732f382041b1c3d6f613244c'
         'b7463b2caad014fd1351f30b25ecb5d8'
         '0cd83ac5fb557849bb95fc73bee2af1f'
         'f5950c646b62eed38c52354a1dd481df'
         '6474e17a3f02b6fe51c6d5c0fe4793bb'
         '86485e842d3533435b16e8e73e914c9d'
         '53cb35fe2b8e6966491c293b8619f039'
         'd56c31aa40fb6526d12c075dbf859520'
         '17be25e38e20a206f2cf4814d0887547'
         '7262c1b2ac538424da9d57333b6c91c6'
         'adb231e40e3e720729c2b295190e9e15'
         '090f7b229c65618d8079d18dc824adc4'
         '1d6ddd576d146a4a692bcf4054679875'
         'cd838b745f96834bb7a1d66ebfde8655'
         '43506cb336601ede09e72212a400f91c'
         '04c987c00db935a4273f33a9e2274d8e'
         'd1a8379093c26f2e0ccff607c48a08be'
         'dd1be20d24752e8255b57173830d0503'
         'dcd37e186f0633ab19783eafeed0e9f2'
         '3dad451ac8b45045837da445043421b5'
         '45024150031c13ecd691fbb361ed7a9e'
         '375f18b105118162297d3770c52df43e'
         '7c248f8daab14e7dcdcc79ff80e6041c')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
