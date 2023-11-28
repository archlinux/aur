# Maintainer: Hayate NAKA-MURA <hayatehay.njb@gmail.com>
# Contributor: Weitian Leung <weitianleung@gmail.com>

pkgbase=wps-office-mui

pkgver=11.1.0.11704
pkgrel=1
pkgdesc="WPS Office MUI packages"
depends=(wps-office)
arch=('any')
url="http://wps-community.org/"
license=('custom')
source=("https://github.com/wachin/wps-office-all-mui-win-language/releases/download/v${pkgver}/mui.7z")
_languages=(
        'de-DE         "German (Germany)"'
        'en-GB         "English (United Kingdom)"'
        'es-MX         "Spanish (Mexico)"'
        'fr-CA         "French (Canada)"'
        'fr-FR         "French"'
        'id-ID         "Indonesian (Indonesia)"'
        'ja-JP         "Japanese (Japan)"'
        'pl-PL         "Polish (Poland)"'
        'pt-PT         "Portuguese (Portugal)"'
        'th-TH         "Thai"'
        )

sha256sums=('36a875397d1159dcf5363d12ce553d8378b3164638d95f3becbb6ef7dcc51a2f')

_package() {
    pkgdesc="$2 mui package for WPS Office"
    depends=("wps-office")
    provides=("wps-office-mui-${1,,}")

    mkdir -p "${pkgdir}/usr/lib/office6/mui"
    cp -r "${srcdir}/mui/${1/-/_}" "${pkgdir}/usr/lib/office6/mui"
}


for _lang in "${_languages[@]}"; do
    declare -a "_langa=(${_lang})"
    _locale="${_langa[0],,}"
    _pkgname=wps-office-mui-${_locale}

    pkgname+=(${_pkgname})
    #source+=(${_url}/${_langa[0]/-/_}.7z)

    eval "package_${_pkgname}() {
        _package ${_lang}
    }"
done
