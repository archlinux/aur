# Maintainer: Weitian Leung <weitianleung@gmail.com>

pkgbase=wps-office-mui

pkgver=11.1.0.9080
pkgrel=1
pkgdesc="WPS Office MUI packages"
depends=(wps-office)

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
        '5c9b2e712c44cd334c85e756d6fc33e5ae99f4052e3fde63fbb479741157023c'
        'a47cd753bcafb2304ef9aae65268deeb9d9c616313b0f4c875981ab0389ec5a1'
        '1928f958d2c1a197dfb36ea12ead0fd0f60c590575ec96de91fc5fa0609ff152'
        '495cc949eb44900e3477b094ea2af7dd7be8cc19ac0998cc1c81fef8c28b6709'
        'd21c3c8c6e300cb3100d7e99cb1ee06b0cf2e14be1da31f5d35555e7960908e8'
        '3a2bf91f0ba6cb99ca899fb33482b985d74dda22a4c04d2e5d505d5b82048705'
        'a837cb5e637774bbd8c40fda49606d617ad2817dd060a638cb14b179cb82c331'
        'ec8fdf6478f2edf3fc3ce01694c418ca9f520fa561731a160b5313c233ef23ee'
        'b1c1499d241757b7a0723b7b4c498fd5a9be2e4356dbb0ec60900b4f276619c8'
        '5eb64d869eb383325d1189911e4a20aa7424625b3ce0f336e769bbe0c06d8f5f'
        '65ad50f15c8848ff927b03f5c32b0d1f55078b6b849096d8055513906b1b7363'
        'cf9b4b76d86b89cf997c42602371a589620d59e3bba2a41a09d1252bb2ed7093'
        '0ecef8f681865353f4363fb581b8420020a3e71e7ea528d989021fbd9fbf4deb'
        '7dcfca8ab01fa9c03cb010b6fa9dd5b975e797d1c6598607ec6b6cf3f65d2656'
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
