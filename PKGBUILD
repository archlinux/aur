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
pkgver=98.0b7
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
  _url=https://archive.mozilla.org/pub/firefox/releases/98.0b7/linux-x86_64/xpi
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

md5sums=('a2bddb853e6abe007ccc27c3bd6a9ec7'
         '89075e8de6447f0e6627c3b74493d8da'
         '137a03e14ec30acb873c54f342176205'
         '177c3a4d5c7d8e7225b17f5cd2463c4f'
         'e46e38f8e1e30d840ad6f2d7d065bbad'
         '0f2c8ac2af99bafffd0208ccaf3a1a5a'
         '554e261480818e077184768bbba2c6ee'
         '0038d0854fa44c72260aba098c4a15ee'
         '8cf826bd3512228156d688e4c8ae7452'
         '5d781d1074eb17c4fa5568040efd0c41'
         '4fe6ac3a4e16d28ba7614e324cefcf59'
         '939321636dcc73e75115f0e49c6622da'
         '477c465f602a34666d337c7dea660d1c'
         '9932620fcb6613e32ed4ecc8b928ae98'
         '02f04dfda0ef888e0a2699d0c36c570a'
         '879e1cddc4327c6ed2d243b53a6b9a38'
         '69419d9b76cda7a6b4e90cd56883ce45'
         '9f22c56edf3ce299294011469324d58b'
         'f34701852bfe4fe03929b2d16f96e61a'
         '4643ed84d898f44c6aed72556dccf9fb'
         '658b8e17d7583de4c838c05bae357b5d'
         '10878111f60d6fd48f9b42fde69bef5c'
         '3cac52b958b572914dc20ce45004a076'
         'd882805947d8a82abf5f6502650d76b5'
         '042ad2853b7f85be46daa6ccd734a8e5'
         '73073ec286efd2871499d536bb98b166'
         'ba36dab318f69adc172036e546d9c94d'
         '56043295d45063f2d6ea5257bee710cd'
         '8072eafd03b18abd98c348965108f561'
         '1f08ec96bf2930af0ef3aa31759435f4'
         '93d9c7c8a2d8c270210618ad445b7566'
         'b10482c743e8287b05c2314788ed216a'
         '4cbab7a9a8da28f1d806b7c2529c2007'
         'e1a3544c646ee6cc2b61cee5cfe84c7d'
         'cbdf99555495c957dc5c976f1e16e832'
         '4b61c88b34710c217cbb97c1ae3ca328'
         'f595c67edf45a7546c535771e2a915fe'
         'b34cc31db983f3ce25fa80ec07721702'
         '5056b5f4181296520c6b50caa4edb722'
         '3c28fa240d6a216e6aa911e977a5b14e'
         '7b988a0af881aa7076a05ba79336ab4d'
         'b7b8bcb573f292b6d48f14054673a19a'
         'c2868460a995352c077be86e70fb3b82'
         '89f68ed3fe4be9194558105dab2df437'
         '2f918cbe907ffdfd2ab0a7a564365074'
         '77c7ef01b73b5d857b18fda1ed6d3a47'
         '6dd3fe14b9da979a4626dc423cff8e08'
         'd758cc1eb8c2fb97d8d3ab736665daa7'
         '83c2575a4b85687264498182ed424ae6'
         '0c405b747afeaf80bc21f5ca9cd95572'
         'e57f06f1a1bae39722f556b4b3dfcf4a'
         '5b7e2fada2f91e1087b6230cb11321c5'
         '5ccbf47343b9d2d0d55e130b318546b6'
         'a8884d7545701588e024872adc3bbd67'
         'afde398777990741dfebcacbe4429e8d'
         '524ace6af3cdae479fcc11d62e0da9ea'
         '7afc19341f04aca148b16d3fea10229f'
         'ab72a42ee6797d6a2f6882c5c0fb93fd'
         '68b7be5103856334f1930bb3917babf1'
         '4de7ee7039178bff75b05eb6d8e34bf2'
         '913da55e8a811b6beedd6206a30670ba'
         '6d7319d7f46bf174a57b16879e7dedf9'
         '8c61eb8d534778791ff30d7dbab01f83'
         '6d3df396005776f7b93259861345b83c'
         '7961d748309b7b9c7917777ae7fc5da6'
         '84dc93607139b41c145895e409930231'
         '1bdb2328200152c9615931e485302d55'
         '6c3ee121566304cba14672a57a16da8e'
         '3868ab4eafc1b161c8c1b3b8ff183e3b'
         '07fa1fc8cda267b37e77e648c30f77aa'
         '3fbb46a7340c4704e42d53724b29e8b0'
         'afaa09d3d9b49ad732ff369bffdb5634'
         '075e6b40479f02ad4db098e99019834f'
         '0cda698a8f8b111c08c6c6c9ee695aa6'
         'a6002a2e8e2355fc2d5779de7335e723'
         '1d229f572f1b17a87b53d88bfbd7d636'
         'da192ac9a76b84a8740dc0c1216d9b1e'
         '79e139d61a9138f724f323ca18296a7c'
         '2206118d80944ccb6130b66904f5f9bb'
         '1b130bc2f275165a071b92cd344e437b'
         '6fb13ac142e5c6567b7cceb065e21837'
         '81abdc8fd2a1b063ae0169f5b4898513'
         'b20bb8280ec54791769758bdc0f09791'
         '709f400f87ee6f28fb029f40548d1b69'
         'f51b898df0ecaffcf4dff5c439b05938'
         'de00fe310b87ad543b8083e955aa9407'
         '4b479cde308ae355a069b5007dcf5bde'
         '764ae3d7f561d8d1ad537c1e7accf2ff'
         'f7864e17a93bbebbc60578e54a90b1b2'
         'b03372bba93a5a6549aaa1b33dd6d4fb'
         '041bed92aea87e84f0f13a165469e617'
         'e7f7674a064d1a5f7b4864ec8fbb8e44'
         '2473fe49407b03eb1a09dd86ff625900'
         'ae6692ec741e1bd089578604c1894358'
         'b675d0873704fb138d0a009f2921669d'
         'ec420b95ef2263a1cebc658e776324b3')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
