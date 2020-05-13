# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=77.0b5
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

md5sums=('dcaa57898cebd5b6f6a5405448327855'
         '97e84d3e58a7614886f7a235463f4c61'
         'd7ea71d8244a791591a705cd66fcc742'
         'aeffe793a79ccc71b8777470816a72ec'
         'ef3353e41435bc512fe0ce73eef9cd37'
         'b19ed6975e062ec90d0b572a5857b9e8'
         'd17e50864b63967d23ef92cb8a511b9a'
         '175a10ddaae4e09325a2e93823faebc5'
         '2c57c8045ce527a990885e92cac549ab'
         '2d97089e2e96c57cfe9441b4c7550c79'
         'de6cc7a8bcc3ff286638e2457d8f4a81'
         'badab048f6385e97cfed0501947be8f3'
         '24ad6cea8604d932482fac43fbe6e471'
         '89bc82428760d3157be5e95db38f579a'
         '030f402920b5c7ceae6db3dec54351c8'
         'e5106dd0d193f70e9a62cadbe4ca6825'
         'e849ed84da4152f30c0e52b9f86414d0'
         '414da7e0a44daa06ab0820a0ab4ed012'
         'd57346c394d8555945c40227c29c7602'
         '7d6521503777420e77942b1a99c5a914'
         'f0d0f957a0e04ac87beab1c597ae7d7b'
         '5bdf0f235d89a7087f2612c3b8dcc7ef'
         '0f54bd473c046ba2fafbf195f1f14da2'
         '75fa6bb571590ffea344ac616504a379'
         'd6a5dfcb8f387ec1bbf4e3fd03751800'
         'c38d797373d8bce754fc193f189b96ff'
         'e7d482df6e21722e4a91af4c1fa15115'
         '62e017048666a32c5e82c15d2c64bc26'
         'f54f757f1f7c32cc69833e35a203708f'
         '8b877f703601b47456738c19c46b2e40'
         '84720ef4bdf0ba372b4796a35d37ee4b'
         'ff6ed41dc631accebac94e3e55f57a5e'
         '1a09f2fe54ab81322f9ffb9464cc109e'
         '26b6e4620b940f19140a0631d17e8f99'
         'de8a4c42f2e1a7bfed79395bc5d5bf1c'
         '715412c6d2866c0b922624cfa1324bbd'
         'e91133b1392016c0161e4573c521e027'
         'e7ddbe2e39daf9a2ed9c246ea1971e62'
         '8ba245a3642620566247fe491435e528'
         '3abfb4728ecdfe7a2f70260cdaeb764f'
         'd85c481309d42a68b6bae4e5968df673'
         '6f53371ff32ac56505284cb3cbbbb488'
         '2cd1aa90424df2608d3baa77d94755a2'
         'e1b25a463497cf7574f0898df25d150c'
         'f9bc34279d36be95cef246a269575efc'
         '6f9c79eb246fe7504f525fa908ff3a5f'
         '1aa9397cd45c0b77a3d7434b7ee10c2c'
         'e26a20e31af982ec5885157f564936c0'
         '1e941b5ce72e17843074e6ed8ad88f46'
         '3c3a9f1a213a614183af0f2cc823d095'
         'd208a8a358f35ee3de70a5fc53788415'
         '74f0120576e4408994f4c338bc9cbf62'
         '9db83addd3c58ffd8632e52b0256ed82'
         'e3b3e18568f16a981730fde721b397d9'
         '4687eb5a4429766b3320c0a710bf0f62'
         '971f82016ce1f4ca47757c9a718fe66e'
         'a69a5e7c4eb74ac093a1e1c3515a9e7c'
         'f759998d34620e8d9c879bb56672e282'
         '47e578443444eeebb5df807bb7ae1ce7'
         '52c6cf65c44d8127c89d7f9358c350bb'
         'd31d5a57e47bb17b37ce703e6f535e6e'
         '96d902e6398762ae3e5015ff8995eab5'
         '397edbcb5106a89057398890d0d2b408'
         '744571c29e7e52bdc537d64041ab9018'
         '0606a35bed08d838dad1761d51ea0d4f'
         '32e35d238ab03746f517f16e230adf22'
         '63b035e733059fdf25ac70d23628c655'
         '12d9011d896493af067a0b8cd01cfeef'
         '8be645fb62c03910054038e6b30c1e80'
         '46446b48c51ba399f249b2ea853075f6'
         '9ab8ea88ecbb14658c1027c5a41f38b2'
         '6fc027e0c83b9931f520a81f7848ed5a'
         '92ff3b61335bbbf81eecf605b58aa8f0'
         '6e437c97c67cd7b7ae51d3447c66e34a'
         '93cee7ea86b2bb1e4694d4ef764f5e27'
         'b994994d2be87389fd6d02d22486df93'
         'd13451030a8e3d0f1b6094e4a5b9ef72'
         '7a9ef80aca48542aecb57d7e2b0a2832'
         'fb62969af20c27d612a592200e223a6a'
         'f5265263bd52fbd90ecf2b77528f8313'
         '3fde8a5adfaf2342965b9747e7561cbb'
         'c7ba20bf5b216759493954f217196064'
         '1076d552459aa135b565376bd9940b68'
         '16261b852b6fdbb76b7fb5d3fd4d54ba'
         '1508776a9c1c56a5372e9364406583d6'
         '224c26cef04085131deaaa4eb58ff4ad'
         '70661a272ceff0a79af5b5f13c89e766'
         '403f67edd9ab9dade4143b29eb3cfb73'
         '016df5b49d6a1343e211078f066e7ae4'
         'a1dd0b34dbb5f4a54e615b7a899489eb'
         'd8d884223b64777476015df09ed241d0'
         '11700a33aae930d283870aca10c0b3ce'
         '03023c041f499f2fcc76c4159b70504c'
         'e43451c5fe0e6ff20c58d8dbef6e3333'
         'c5b4b8d899b91672978d74a2756b643c'
         'bcbdcc11e992e9b8efe51d29f77f327e')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
