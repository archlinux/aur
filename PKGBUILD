# Maintainer: Weitian Leung <weitianleung@gmail.com>

pkgbase=wps-office-mui

pkgver=10.1.0.6757
pkgrel=1
pkgdesc="WPS Office MUI packages"
depends=(wps-office=${pkgver})

arch=('any')
url="http://wps-community.org/"
license=('custom')

_url="http://kdl.cc.ksosoft.com/wps-community/download/mui"
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
        'zh-HK         "Chinese (Traditional, Hong Kong S.A.R.)"'
        'zh-TW         "Chinese (Taiwan)"'
        )

sha256sums=(
        '8601c9bf0f3add3925d57d73ab99e51525c672b900cec28e1e42c6950d9132e2'
        '5ac2e2b21410d44519c6184e05c865781a217d51b11992e788787ef2c9213cac'
        '10291eaf66f650f28a16b3c49da026fa2ea2c01c7f3151f58ecc40abf82ce3bf'
        'fcba186339487f941a1d8c4b41ef6ac8c2474182867365d71a9910862364c294'
        'fe72b978b3f2f5e8291c4cf4d991fcd3fde1a41e7245c2b6c8dabfdc130ad00c'
        '1c8e95eb8fee73a07fc8568d32745424ec4b814dc703604a8f0626dee32962e9'
        'de1cf8a58f72a5e8eb757115c7fd87bc4d8570f26528de587e96651484740f04'
        'd84d6ee501c9750947421add071d53382a9c539f422bd27c66b027c4acd341e2'
        'a89b2b5b4f86ba8b8647ef5a64c62b1972bdcd47cd22f614b60219114b0482a4'
        '0494743c17673896f492959a89bb4ba8acee3b7027d692e4fe5a0662201348d9'
        '39066b6ad53ab05c3f701d17573cf174168af742e5e8676280d6f562cae8286d'
        'e36fc1df755cb5b0d0ec873a1ebcd40a6cbcb51f94591b97f9d6cf6293704e77'
        'd84a2203bb7079b931efa95e32bd8ad50587b6822628306aa551bbe6423b14c4'
        )

_package() {
    pkgdesc="$2 mui package for WPS Office"
    depends=("wps-office=${pkgver}")
    provides=("wps-office-mui-${1,,}")

    mkdir -p "${pkgdir}/usr/lib/office6/mui"
    cp -r "${srcdir}/office6/mui/${1/-/_}" "${pkgdir}/usr/lib/office6/mui"
}


for _lang in "${_languages[@]}"; do
    declare -a "_langa=(${_lang})"
    _locale="${_langa[0],,}"
    _pkgname=wps-office-mui-${_locale}

    pkgname+=(${_pkgname})
    source+=(${_url}/${pkgver}/mui_${_locale/-/_}.7z)

    eval "package_${_pkgname}() {
        _package ${_lang}
    }"
done
