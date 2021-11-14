# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=95.0b6
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

md5sums=('5eebac2994dc9673304ea084bbf74d17'
         'b6f0b87f383e2a966e529849adde4999'
         '150d7fecf15f2c75b39ee7c4053e4485'
         'c3748510d47575df80f5f6a0a984ab9a'
         '43eb5dd138840a6533828def3d991b6c'
         '98ab3894bfe482caebd5dddc1e523e32'
         '9bf9f9c3f7874aaa6c471024bcf3124d'
         '7a2d498c2ecbb61b83940f02823281de'
         '8face89c2c3322a5c882eda8a81f5ce4'
         '82fd1f132e5a4ad2c2126a4e8ca54964'
         '957640e7685e4633b6bd56f51f846f78'
         '662b9bb24ee78151f522e3a93b9e7806'
         '9bf591cabe27506127779495a7bba295'
         '12174b6535723997c2b3c7e19487aae3'
         '47fbe43f799cbbdae6a234634cfc73ef'
         '9d267e1772d289c9e28967fcad1bdbdb'
         '77fce23ba25bce85a5fa4b2a62f70de6'
         'd3d3cfaeada68a1c7a1e9678eca7d938'
         '88ed8a839255499c386080689478ac91'
         '2f270ae270671626956d7c331e60f29b'
         '9fbf31d590555b5bf525ab75766ead64'
         '1754591bb4715495736ef01f73378075'
         '4e918956b48254ca30c786de9fbddff3'
         '8be383798870544ac92ac185117832a6'
         '0ecc2cf0fbaa25f80e933f5f5e6a0d2d'
         'c4dea34afcb2bbba31876d85bd0d1444'
         'ba9528b90f569b3bd7e9858e04bd2074'
         '2ca39209a17f8324a415f60ffd37dd78'
         '04ccd629f6354337e2692d51da36ea18'
         'df57ee55b53c0553f5f31b2b8318fb3b'
         '45375470992123d9257a24adacb6cf7e'
         '80a64520bac51cf4f7059c71babe4ea5'
         '3d4066cfbf00beb6f6ef6198a0d074ff'
         '6e1288e944fc86af44e89f59ca4549ab'
         '557124a61cd4e36ef70c4144cbe7b86c'
         '82524d81ad4a90c2edc045a52791dc7c'
         '4bee3c86c4deef01d68c3230da21fe15'
         '3f4c5e3d8cdde091817a956b6c8eff31'
         'a787b4b8ab2301c71913a1100d1f06a3'
         '2b96f804ebb159dc66ca48546aa425de'
         'b24eac4dab6ca5fc5ed6be23f7131f29'
         'caeeaeec8688299710224632a9d5409f'
         '57a58fbb7d990723f10bc3a0e1a84a1a'
         '2d21c0761a01499e4253b40fc9af06b8'
         'c9fcfa5c4ae946fd503f64f7dbec94d8'
         'e34452e46e665743256d99b6bb8e2b01'
         'ed0d8f7ec84c96f4c075f98732b80046'
         '8226d2dbcaf7a5899bd9a26d6d30efc1'
         '5636106e507ba292aee17f05b4789de2'
         '6f71a1a885bee7d88e3a5fcf09a80288'
         '080b81118db0e92554a344f1f28d44c5'
         'c1e8783ecd88a44afb2076c8049a9938'
         '722f15be697d315e2ad5963e3445c190'
         '03514461f9ee44be732774f4a9712892'
         'fafa522ad8bd1a653f08bff0d0f6857b'
         '51502d706db1776d28fe1b34cefec6cb'
         '03b7239e483ff93a8655e967239d8421'
         'a1715c425fc8eb83d67b8a506c3a561c'
         '39784c36749d1a6359c751750a40cc79'
         'b9c4731d03585da68db7bf1e08de770e'
         '3e18acff9b985b9295adcb54e88612c0'
         '0358c557128d773b20ca717d46f9831c'
         'b0bbd59aef6b45b2bca464a0eb543876'
         '64ca8070e1e6d4b2c09821e9415764e9'
         '7a79a8273bc9abbe3ed2ad74022e52f3'
         'e8bd7b825f0f22ade74f882c1808d1e5'
         '4a3b9c9dc3c2aefcf7e34ee10e984382'
         '6b7fb43ee6cbcac3d130cd05a4257494'
         'a359eb7135166d3124bf1b19d303bb77'
         '3b50a490241bdda3a0c75af75b87e193'
         'd3fc03f220f7de6fb24498ad024d5b67'
         'd1004acf213480e2974b889a03b45fcc'
         '87a98f9f87e6dc8138db816b5145c1b2'
         '648491b6483d9610288fd73e11eca558'
         'ac30249c800f37b4f9670b5e402deb43'
         '8db47fbb2b507c698dd891e0bc6be0e0'
         '486aab58935befe2786d862f7b053ff2'
         '19ee743b6891547a45d63e5bd926b075'
         '597729d44b372a00144763867939b453'
         '2cb78cac05735409b43f58cb9b48b16d'
         'bf38d19e186b8c70d25b88f3084acebd'
         'dcea800c7905a02a78b47e688966f2c5'
         '7836652ca5f0046d88cc22fc2f7bd3e4'
         'aa326ba97bed3ecd909fb4a598934204'
         '32c84f10706e30ad68976ede4d30be78'
         '48abd0529ee7b2f852ee4302bddeb30f'
         'a3ffc9bef10dd2a5479040a3ab29c361'
         'ba144e8c89c2ae77926682ff5bcd9cc8'
         'ba27cd4a83ab3b74a685b372e9d2b62e'
         'cb7f1423ce9a056f1f05fd1bd64dd4ea'
         '11bd63849eae29bd6fb7820ae1fc2154'
         'a3c90918c1e58469fc164012eb5bd676'
         'cb0e9311bb5db488c6dad05d4b45bbb1'
         '9b7230fa9df99618947cf8d77f6a16d4'
         'b7696fe19f591bd88919afb42c9bae4a'
         '1be69537519b3d6b148c175260a5075c')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
