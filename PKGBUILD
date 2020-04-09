# Maintainer: Weitian Leung <weitianleung@gmail.com>

pkgbase=wps-office-mui

pkgver=11.1.0.9505
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
        'bb42d385de2e5b9351f42bda9deaafd5e1140c2c60ec4bcafb720cef4fcb4ebc'
        'c81fdf32f80e6e20ca1882e3f76a3477b2b9eb363ba28f04273a0457c97fca7f'
        'eec83edfc3fd37b523ecfd56c4af156ce7747e5dcb8b1b77c5bbef00b374ef27'
        '753f448587c3530b7fbf8a66f014cceaab949eed169de068c609f52b4ddda9bd'
        'd44d009137e3849550496fb022da83edce975a503ca14b7882757e6a862cc3bd'
        '3cab6ba50f8460dd6d053da7ee27657bb71d820a21c53549552834eac138fed2'
        'a4b731497078cb4581e8d15e4bb0c5f81bd4776384591275f91a3a9e3a1b7201'
        '783970866c9c03b2334166f09120cd1cff6fbdf2075607067921e63ac8fac558'
        '7c38656f9a0002a44d075018ec893a8acbd1b44d63727bef7731b2450b762b96'
        'c924d6a69c27c0a0cc7026822f06b2dcd9d2f4a709182f6d1817adf4fbee74de'
        '65fce89c48a262cb0df28fcf4d16ab06e8e2b86a494537c8ddba214eb91a9104'
        '4eeec75da65e6d6d623f0f9b5d5628641a2ec875c269a693b14080cf626e73d9'
        'c7242251e2cbc66c1cb2dc6f321cfbb54386198034b2c3806e45c782c0ba6129'
        'f0aec16a436117b1573bab4b2b419c8705236863277e3e9b2e674ed288800d67'
        )

_package() {
    pkgdesc="$2 mui package for WPS Office"
    depends=("wps-office")
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
