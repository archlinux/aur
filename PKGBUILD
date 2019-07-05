# Maintainer: Weitian Leung <weitianleung@gmail.com>

pkgbase=wps-office-mui

pkgver=11.1.0.8722
pkgrel=1
pkgdesc="WPS Office MUI packages"
depends=(wps-office=${pkgver})

arch=('any')
url="http://wps-community.org/"
license=('custom')

_url="https://github.com/timxx/wps-office-mui/raw/master/mui"
_languages=(
        'de-DE         "German (Germany)"'
        'en-GB         "English (United Kingdom)"'
        'es-ES         "Spanish (Spain)"'
        'es-MX         "Spanish (Mexico)"'
        'fr-CA         "French (Canada)"'
        'fr-FR         "French"'
        'ja-JP         "Japanese (Japan)"'
        'pl-PL         "Polish (Poland)"'
        'pt-BR         "Portuguese (Brazil)"'
        'pt-PT         "Portuguese (Portugal)"'
        'ru-RU         "Russian (Russian Federation)"'
        'th-TH         "Thai"'
        'zh-HK         "Chinese (Traditional, Hong Kong S.A.R.)"'
        'zh-TW         "Chinese (Taiwan)"'
        )

sha256sums=(
        '03227790054074d9382e2e29ae587502e774e10a0dfbf4f4821311cf8b3a8299'
        '339791f16e10b9e5488c5a85c55c35da0d8818777c55ccee6ded9986e49a48ef'
        '6999cb916912701e9c4381f52fb7a7b678c391eccef93cb922a9b4ca95598f8e'
        'ad6ba17d4cd2cd01cfce736d282680d8c422039a624f0121632f901980d176db'
        '097c0bcfd16e1263d1bc4b743a906ca923d581f74acffb286d6283ff1cdec862'
        '09c4c01ae29649f7c0fd0ed4d207e91c5121a35b21929e61f448f65ad50c3b1d'
        'e61b44da57c839516d3b43a68c02eeadd7c9c4e008b4b18ba2fff4be82708e3d'
        'ddd13c78fd58231f1c700f818a5d0b00f73269569d4894c9b70a1183e7cdf274'
        'db6d76bfd8e7d1d166f58fcd9aec7db9473cc9e065c5a1b994afe5dcd0dc4030'
        'fef32512cc13e9df7bdd8d5cd7af4c3297647b408032ba8f388100f7184d9efc'
        '75a0174d162deeae7b77263ff962d0059bec4289bdc28e97c944808e47460683'
        '03dc08502d3ad9f36f0936350d8476641eda5325578d708c142f253a1eeb8d9e'
        '6ff7fbf89f09b670781a46f54f5f784fe1582f1fc61f91c0140633324c40a039'
        '22e3ef89e579ac7f79dc65d92c969ac3c2a27f5d3b134e5dc7449a57171150f0'
        )

_package() {
    pkgdesc="$2 mui package for WPS Office"
    depends=("wps-office=${pkgver}")
    provides=("wps-office-mui-${1,,}")

    mkdir -p "${pkgdir}/usr/lib/office6/mui"
    cp -r "${srcdir}/${1/-/_}" "${pkgdir}/usr/lib/office6/mui"
}


for _lang in "${_languages[@]}"; do
    declare -a "_langa=(${_lang})"
    _locale="${_langa[0],,}"
    _pkgname=wps-office-mui-${_locale}

    pkgname+=(${_pkgname})
    source+=(${_url}/${_langa[0]/-/_}.7z)

    eval "package_${_pkgname}() {
        _package ${_lang}
    }"
done
