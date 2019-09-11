# Maintainer: Weitian Leung <weitianleung@gmail.com>

pkgbase=wps-office-mui

pkgver=11.1.0.8865
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
        '66c45b3aa6600ad8199429a5fe0fa93ded100f768bb1c8663d7fe5825b02d374'
        '3410135379a3f2e22133a0bbfb884befbd06897674bb2abfabf27b6cac176d89'
        '6f2471736218cee29ac739a0261ac85d235cf4011fc1cfaa89d6e9bf8e427099'
        'ffd9a22836bf60a897eb2cd2f4e7596eda72a7c8e8bf2df4a33d5a0906d561b7'
        '4864ec83d85d493331679434d510eb543a5dde4da056b5f59f07e935314de296'
        '60b195253a020dfcdd0112825d1e780ae3b27f85be702c41dca0029518fa3060'
        '7cbd8cac907e2d9cfb98a3eb8c0f2c80dbc3c19508e1c1ed9b9de258ab404620'
        '4fd5acdea5453a616a8a4fbd4f939fedcce231abafb4adb1c822a31112f37de9'
        '4cfddc38b6ac5029c1da81835b6235ed6f5cb6cd9c2c151390a44480cdf1255f'
        'f56dcd8db400eb063b6e2e1ad96d5839355a2a30c8d3053218b020e4699c3867'
        '8794867e2498cfb07a67bcfdbd708597c3e48435c318bb10906621d9327f7002'
        'b5401e9cf3bd0c9395e67a056d9a27c84f8eca6a28cff44a31b48fb271caa431'
        'cc8f08dc6f0414d5c228ef2b3a901aad1c6269ce37d7d664978ff934ed4a11cb'
        '9d2a7148c8dd9e3d63e135156643b70ac75ea35937c38339093130674ab9c295'
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
