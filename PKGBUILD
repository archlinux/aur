# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Isabell Cowan <izzi@izzette.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Michal Hybner <dta081@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase='firefox-beta-i18n'
pkgname=("$pkgbase-all")
pkgver=82.0b4
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

md5sums=('36cfd9834caa54b7527171176af27fa6'
         '4346679d999115496854e855067de3cb'
         '58788e62de6a3aee2621c42d10e9928f'
         '2b6205883487208c38ce3e9d84276a1e'
         'eee5db11267431731678bf2a9d3ab2fb'
         '44e6bca5cee92b7d01c1c0a5fd896e69'
         '6e575d6eeea5c809fdfe02033ff88c8a'
         'da9b15e2652c8de4dc72ab6f3f70014e'
         '31f7953a08a260f84e1ef1bc3b710911'
         '03d97d35ff089219dbca0fca2d8f9187'
         'e4b6a9fea45f461bc6246562a0b9a68b'
         'ec7c0ceb035be3a2422751b991e158ea'
         '4e3ce8337ddea0351f29d8beb2676757'
         '307ab9a416626e62e6150dabd07033e9'
         '9ff0206c315a2cf9fea21bc302af0dd1'
         '1127e746fae5cca2d06a92558b1a1d09'
         'fba52c12b2470f27376d89d161b4be80'
         'df73ff7cbcf42ea8d813a925981c521e'
         'a1ebb8536401ab52563f333244c1916b'
         '7ac46ffe240bfd41463ca0cbf4578ee9'
         'a5519f77c623d53f798c32796fdd3cf3'
         '8c9635c447ff5838b85a379c78953b27'
         'cc4cdbf89d1caa765b4771077201412f'
         '743ec1e71e2a60c2d620eea4bde7b23f'
         '0f4e217a6dd4b03787d2dd81047dad38'
         '545aa927d0d53bc9b895cfbdae72330a'
         '6bc7894891e6535664e83296434a776d'
         '0b7789d6dd2a35061b1b14f2b03123bd'
         'e0fdcb8faa0114c0ccc17dcd803c8142'
         'aceb895ba59676d1cf170e711cead95e'
         'bc476da8174e006a63472aa9e7b664fd'
         '8cee74b5c30ca71cfe60edd2458c67f9'
         '8acece8742a903fb2dd3e7e341634e22'
         'd7429121694a9d4984dabd17687b795f'
         '3dc01fa6ecac99a7a2fd5ef4655a2cf0'
         '72a37899035776ec9422be27572e37c4'
         '8bdf03204040085586cb53cda0336872'
         '4de8ccb11077d0c16aa78671b0635e21'
         'de48a29398fff1fef0b2ece08eb5d335'
         '29fb140b29292e8e41290f0027283781'
         '86537c03544f7bc2e4a5ac455668d251'
         '63ab34661cc8f2e724f7ec877e3438e6'
         '9a3d342d8d6631c755953e712c2081c7'
         'a0b33bbb9551be304182041be6854370'
         '16609ba8d5bcc19f5ea403c18f176682'
         '782e579c036b9db0fa8c3877929c0829'
         '92d3bf1a417fb170d51aea5e976017cf'
         'd4b581c6a5e84f8b4e91444f748c8f61'
         '08f5123ed529006e022a80c096e9213f'
         '05538d526d43954ae224988b21c80436'
         'f2cd21915b0666be5e5cfcdb8d04960f'
         '6b7e655b901ec6cd9c9adb30e0ee3c04'
         'c5b7211ab734e41f8abdfbcce4aa564e'
         'c00c98535a87bf37f824a84845cac1e5'
         'd357ad8da6696991e1e7052a8e378589'
         'fed9ab3ab1841f8bccb1bab7242056db'
         'c27c1ce62288f46870fbfb8e860fe904'
         '8883cf8141c15a245e1c481dc648273a'
         '8e64d4c3da2a4050323eed281cb14807'
         '7cff89fb9054d9ef4ec8e2e9f30beb9e'
         '2dbb3c1fde8fa84619bd37d8d7efd294'
         '856ced2e8c0535edb05e9a632623379f'
         '50362eb228e06b97549eeb43318c527f'
         '0fe25d147c77488586edbbd87cd64384'
         'b1f79f918721a9d11d13f11715304e7c'
         'f2bf7016176252002eca29beac68665a'
         'f50dc4e865cee7284af3f7810315aec8'
         'a3d9553c43b96dae9d07d96ec5f6d8b1'
         '1abaedcfb971297deb27926e531185b4'
         '40e4e84004a17e025ae18630f6358b01'
         'c8c97b1e6f2430e2e88eb14255603311'
         'e33865f9e7154c198babfe04fbf7a84e'
         '471b215d7b2507cbcf822cdfc1ff2f7b'
         'c3b130e8eb01ab3cc80fc6b20b48b6c9'
         '46dbe766e1e8f3f98701610248f86f64'
         '00b38b366e1e6b8660b99738d2582ed4'
         'd18fe62c77af997530f142a78fd65369'
         '4276cb2aaba06814c53c83bea3bada17'
         '5202fa63e7ace1ca5ce46c16a0e7de03'
         'bcbd9a9a4b114eaa8625bfb40839ac3a'
         '4303f5d4357b735788af3672ff21844b'
         '94b40c9170b4d5515cf89100140b0659'
         '1302353c8fe6ab4a40b4e6025f756ee7'
         'c065787f89b91ad622bc665ed202d243'
         'e32657099af28989d32ddebfc66e3451'
         'd892398ade616a7ccebc316434bd06c5'
         '28797157c26a2b4cf65686ad7839208f'
         '29db7adfc79595fc5bb1b16b6b86edb6'
         '966f284ddb5dad000d6831bc93033e38'
         '2c25ac400fcae7598298d3d26df9ca35'
         '6d6b890c2d632bc31fd509d3f9e41d82'
         '7fa979add5f8335d4d59299e7328af08'
         '6e88fb73b8fba18ae11512512070b550'
         '5a50ec87eea3b6f6641f3806f214da7a'
         '2a0e3527adfc2e4c0b18a79b9a6d4e65'
         '3851f0be7afefc89aa0f2196d967de1e')
# vim: set ts=2 sw=2 et syn=sh ft=sh:
