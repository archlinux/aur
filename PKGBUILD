# Maintainer: Weitian Leung <weitianleung@gmail.com>

pkgbase=wps-office-mui

pkgver=11.1.0.9604
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
        '6384eaa1cdcf13cd41c44e244358464b9da4debcc8cb473c381b236ab4d5c54b'
        '10a2b73c9744fdfb34cbbfe1680838faed3ab64bf8d1bcbbc1349cc4752cecfa'
        '4e051845d4e8df7f5d430b1fe092f81b32bf0a9311abdd9c70f05819e53a8a83'
        '74e262af77a3dbce8f65290d3e24ba3b025099a0b92798744b77f565024467e7'
        '47773f24b91db4749dcadf16d759e8f0a831b0617a8dddaa3154d3a6de940ec9'
        '60e7095caefec21845b9717660585be8f9b79af87a4820e6498d5927304a0a7c'
        '6847388e01144467fdcff26c088609f09d1abbef1eba5a6e26e6236eaa169639'
        '31c2ef331173752d76b85e56d3b3687214b2ff1f0d0aecad6f79393034326b60'
        'c4226de9f966b617a43c25cfc9508d0d1eba6410fe3c6c64fab637e3ca8b2888'
        '2d11f8e6f5f6449278a3d17f69d391ab7b02b1c9dd1a4bc7f48291f784777037'
        '9cdef38a1cddc427eebb9a53cc0c8b2431e71c8d4efd139f2644c4190efcf0e2'
        'b96992fa1a1ad3bd2e1d965dfe1c126d178734db129a156b1774b1b0a0cb0ce7'
        'fa5eb38e5f24334913b5ea55e9c1392eb8a24fded1ef09a65351da95d327ec16'
        'c8b580418cd04e57f26a02773e45f544972ff210c5fe11d0cf1f1ad3ab7b3b9f'
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
