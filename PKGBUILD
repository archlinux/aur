# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Swift Geek <swiftgeek ɐt gmail døt com>

pkgbase='firefox-nightly-i18n'
pkgname=("$pkgbase-all")
_pkgver=103.0a1
pkgver=103.0a1.20220604213903+h490469b53dbe
pkgrel=2
pkgdesc="Language pack for Firefox Nightly"
arch=('any')
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
provides=("$pkgbase=$pkgver-$pkgrel")
depends=("firefox-nightly>=$pkgver")

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
_url=https://ftp.mozilla.org/pub/firefox/nightly/latest-mozilla-central-l10n/linux-x86_64/xpi

for _lang in "${_languages[@]}"; do
  _locale=${_lang%% *}
  _pkgname=firefox-nightly-i18n-${_locale,,}

  pkgname+=($_pkgname)
  source+=("firefox-i18n-$_pkgver-$_locale.xpi::$_url/firefox-$_pkgver.$_locale.langpack.xpi")
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

  install -Dm644 "firefox-i18n-$_pkgver-$1.xpi" \
      "$pkgdir/opt/firefox-nightly/browser/extensions/langpack-$1@firefox.mozilla.org.xpi"
}

sha256sums=('d1e289d95a3c558bf6a2d1bde6bf3a20f16fe36cd29c3f4856917aa38abb6d50'
            '84a2e52731f435603ae334f2965ca111be1c414e833d6f26ef30c0c7667a0a8e'
            '119d27048a6a9371364c20dbe67d98860f63b3730f0309e3a928e2e26cfa52d3'
            'db32e6b8a873f1391c72833d6b6f1eb2978a73d0717ee395376daca1098bb116'
            '759561439fcce2736b6d7b8d196a1da1beedbee96236fc49b42af43f4bdc27b1'
            '9a60166863e4679411faaff6ce60a18b881edba04e4dab7f2e0cee8c43eefa61'
            'e065ab765dd6ef5476017df7fbc843f2c8c8b7cbaddf09a018c3ca08561bf764'
            'cc8c6e1057e4ef87761679114f7db86c51a9abe4135d66590a18b67077e0deeb'
            'bf87b4da6fefd31f01a10d3f9224821ed70d01f02c2ab4de8221aa18ac021069'
            '5e3e78c007cb892c7011b505dd14e5357e3d64f50e7f3cd3f9a09e7195d5ddfc'
            'e507fce069ea6cafc0d00a5cf87777ff6d03413c38e99efb0b1988db74530564'
            '76e82f16b51da5f3d3b99da1fa42c680b9e8231b244bf5324b793d303c53ad7d'
            '09255de4319b23eb0987d2e46db50653ed1807ef0e8903ed5907c168bdfe45b0'
            'baaa43064f66c5e819d8ca0bd473e0085e114d6ea9c93cd16cad8063f4828873'
            'b1a7f83edc32d2a7e48a71b4a3bd53d436f063f6ea2512d0657f4ac1e0f34339'
            'fa05c6697ef008da636dde4d00b568b289a344f7e0e2e430702e5aa6e5d212d2'
            '5f2e843efd67740abe156988fa058a4725b4231a8c59a418bbf55e137a51bc09'
            'a39b724f8f9084072cc9f60e0e35b8e100c46653a227280236b26ab5f023eb5a'
            'c76095bb56aa04b373d6c31d796afc9b7eb1868f5b341cc49782313acf86fc9f'
            '4782d1eb35157abdb05521fec57dbc79eebbf8fb23a11f233c49de64c93839d7'
            'cf4205efa8b92e3fc6e129777b5897040a595cc375f948f7acf22676e19251fb'
            '99fc89599a7ef409e2cd6b248ebb068b71a8e5c489f4e75575044cea4097c7a2'
            'b8c17c3b15d9aa4d41b3d4788440c5be33bc5874f6c2b0af80614a2f5db51f80'
            '354736e0f0f39ef3895a7678fb18319575ea7e0e2d68d169e0443f8599f897ac'
            '968da7d3b8cd68ac05485ad24265554af464cc9c7eaa401b1645ec15093ff96e'
            'dc90a797502c9a10ecc83e42263e02f6564b459fbcf135458d1fa421353a4fbc'
            'ffd42d8d2a0e87fc42e90510795b4dac4b2c6cf4c3f2a70bbafd254639ca75f0'
            'ab85bff549015c0e4b6f73e414e53bdc5b8fdccd617bf7daeff15a4185a72c04'
            '9e4ece1f5b2b7e7bbe2fd43db26bc9bd2901370f240e03b9ec50b3e961ff2881'
            '4085da97edc4895f74e06027e32558948bc8d42ec2f697a7e6009cc289cf863c'
            'ba943daedba70644a586468e7b56bb4ad3c00405712684ff271a24ef75623f57'
            '58a679d37fa03df3270e1a4f56c39e7cc57bbe2259687a368aecb58fdcf16551'
            '5b6065a2c3704f7896fa96d63e3e23dd44dcc0f5569973ae33e4d2f54af1019b'
            '094a48385bf8240dd9b88465352aca4e1765b59eff3edf16cdb1cc5dab9a7b29'
            'ee434f876b8a68fd5218365ab3a4e234475cb7956f97b613e9c359c01d02fcfa'
            '59b0b56a53a9946794e12aaad7580231651985b2e0e354aeeda8ca5b012fcddc'
            '09abbcf275bab0acfad428f4878eea304addf3ba8c1d6ec29270b71a5261f8a4'
            '6fe997637d8a88cb75eae1a58477563371bc3827fe7062a3d2ed5ce8cbf9988f'
            'a8712fb1e6696cd515441c45235b08e2e04691e98d9beb5e3789d7097405541e'
            '2b3b7cc94c79d55fbf5a8a21b1d931b428f569f71d5dfc9014a1e927cd851320'
            '635099d471f4ca24249bd672fff23cc793952de125daeb4c53911acdaf0ee7af'
            'a41420ef823edee1d1ed7fa7cb049b5d21f531886f19f7b8b0f01e3fd4dc2dfe'
            '50c96e3a78045dde9ae67f791075cf1d0b3dfdfa4eb469c9a12ef2e1c51acfff'
            'c375591074ce1f131a2cf633738c36f7c6bdcec47e78d9440c06e407669e510d'
            '01fc812f894f08c591f56e403aacffe4d77b4ffa514a92ee691347af37386737'
            'e1e50c6ffda61a1c6203a338621a4b938493d69a794f74364c73fafd350d0d13'
            '43623e01df247d69b3cce2f32c2a285c5b1015a6b1a2672130c6628bf9adb353'
            '1fe1be9f214bf2102523955202ac390db4426233266a9cdac90588b71ad1c1d5'
            '180715fcd1b5156b1fe3fad865bdb49015a59c6206c5cf7c13b63409eab89097'
            '421e5fa85303043416d20752c50e67af32b8f8a04ba7e1f870fdb8752314f45f'
            'a82621cd7d8ae3ffd276dbfb21086aecd80dff285cbaa5d88f9aa75583b933c4'
            '81a746b27cd0af7aaa3915efddd38c560ba1c76afeae7ed74a70d6826541f01f'
            'c6b31a364b776a4e65769cd16b359c4220b7ab14eeebd357fba5e05739466a42'
            '551617e70d71d58665d05f5fc84e25fa92e2cb43c1c2abb38d9a78ae6775247c'
            'b0c3a378ec8250c721eb7189cf54bc94b0698eb8b1a8b5e5f9cf77840613f5de'
            '9086d88e1ac911806640c0307dd3eb599da6fdae9123d47b4eba7df1cbde7f34'
            '25a31e40636d2166415ecb4134f71d0a57c9881547656e5390a4b121b421eb72'
            '41469ed18201e397fbd90dbf13c16cc69b3e1a9a2786b74f44adc0d645b9a475'
            '099c8ce0249236f1b56700bbb8c9177183f1bd56aa1d565ac0eb8956019ebc1b'
            '3ac3a307f50822705a8d318c3306fed8bdea9c7600afa1510ea36b7965840eeb'
            '2ed24564c23511e5e01e2f78596792d5620ab0aec973c33eb697be9219868011'
            '2c978c0761a5d1418b2b0e80b7d72123e28c147f3527cc0c943b9ce83ba1d687'
            '3c2369eb1c200c25bc4583242427e0d9e813f705d7bf79d88247961f58c9b1eb'
            '6fccc50ccfa1c03511c60ff490d6340c3662e7ae9e6149dd75f6b863b74a9ca3'
            '1c3dc5861dee6a4128092add9ecb1c3bc033c47430797b2a86cbdb29c123494c'
            '90c41975d554df965e6febb216b54ba7c182ea9c0bcc03ef74c8a06228394b5e'
            '720efcf03879c9695e2ea86d71ac32f6466946e71ebb0e77cc66a399a8f9fbfd'
            '0c4b2a1012bb9b1237262bf379ecac0f74f6a79f07a531c709d41022e1894451'
            'c88b774eaad04ef0fedcdb1cfdd6998399efa1c762018868560615088b0e0715'
            'a1940425a0dfed22bd3b32e1a4bdb4d489ca9e4da6e7801dc0947be6aed7be22'
            'f0c3fe235b2c2d175998fc7b66f2c7fb23b66e811e48560bed61786d34e6f2e8'
            'e8b41e0f9ec127694bb474a3036afd1146d31177cd8773b24eda1c87d985f8a1'
            '456530740da9bfbad1fdc1bbefaab5c74bbecd9c2e09587ef1fee20d5f61a121'
            '8caf9069d5e10e98d667e9ee601fb5a8fc8b7473321923aead35e70023d388f5'
            '0360716ef1cc06ee5495f1456c0616f3078a8c2712295324c8be651c91d47851'
            '4bd7a7239f8fc4b733e0a42e46f2a317470a0b4317c002b2227eddeb829ed31a'
            'b8315625439c3a2bd69a5c8d9488601ffe78dde328c0cbac3e216659b44948f2'
            'cdc0cd4d1edbf42ce8a3cd8c6b6f70fca723da7212cc9fa5dadd8f30829b5fb7'
            '6a1e78fd1b5ac6d2994c68607801cb1a361e238ecf8b719ec0270f91083926f5'
            'c953fdf197456b714420b4e3cef5cdab0e3d6e08fbf68939b2d8761ab3f08441'
            '03aed97ae5b29aae87776b7756444df693b48cfdde5e444913193fffa852c901'
            '2e8745a8dfaed481459e9061b979c0bb5cb3439aa33a998ebc3e3de79d159689'
            '90db64634d55f1497747ad14e1902c7d8b54c7e7df26176f2853239aee113831'
            '57fc2ee81790183013195a8dacfa1e77aec90596448785e06acfca9d6726a480'
            '91eeebb4cd7e3f475dda0624de73ee394e387fd5e480e455fa09ce6986beea84'
            '9ec837235d40a72a3b237fb4cdcaa83a509c212d08a14180180b741b351bb13b'
            'c37eb2c92f4b8fd6467aa952d0a419ce66a36639ae4cf9aa3da7c849c6656a4c'
            '2b2cda970b016b04bbea30ca13f7bc7552394d0dfec4fd1b56e7c58d0629aed4'
            'b7878c13fde028d95b6e2796a2506c3684c580b35efdf997589affdf4dfd6ad4'
            'cef992ec90f898a5dd4e61e4f50924f73d0333d12a3843d714bc87ff4ccd311c'
            '8d05e5ceb7ab037cba3c06f3c15b6abc9607c86c301a2ac599f23eb7f67ccdee'
            'a10968fe212b148cd0af8d94af8afc8e4c6a6ae388f5c8207fddf7024c675dba'
            '55398355a78053700dc8bb317158e38e9243f931800a01b0538f3c3671c1966f'
            '964763188150f1e33f22257d74d6e8f22c53f752e4e75e3cf47173ff43f3389d'
            '812dabfab9482bf9387d5d883e3feb46848dc911e3da1a2390eee4814ec2ecb8')
