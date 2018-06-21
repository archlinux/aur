# Maintainer: Weitian Leung <weitianleung@gmail.com>

pkgbase=wps-office-mui

pkgver=10.1.0.6634
pkgrel=1

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
        '78dc50af109dea4c41bc1fd3bb13330387d1adfaaa32d08386d93c877951db97'
        'cbf5f36e9daecbe219734df41006190b2d90a696a1fba06f7fa87a08faa50912'
        '7f661ebe2c0fb7ad5d65cc7846b5e15621fe8a387a7491a80db6e78bdd099141'
        '1d19e31dbf98e9de1dbbc71512d2244ea6faeae8a672699306dcc9d6a044ee37'
        'f132416799b09e7227ade34c96d51f1e3d3cc6b0bc7b4f7b636d50c4596161cf'
        '70a4ddef1e6ae2a26330b434f3a8665d21584974b0d4a01351e0fb19fdaab8b5'
        'b74ae40b905c3f39f94f224a4ecf97aa2de9ddd79f9950c1f687242a0dc99508'
        '0fbf572a70681b846b9b8cfa3f96ec9cd83bff8cd2be78f7812f74ace0738244'
        'ffe082d009bfd8c550d62aec432d7a074cbe4b94bb2245e7d836427c738e1d34'
        'd13e93320dabf3cdb8d258b774647b979b160c06cc5447ada175521f5db44f94'
        '679a220c3a46a4ef2103ec4727e1c7dfa8cc264dbfd68fa49b697c2b8cde08c7'
        '59066901722acc6339733d0c1204fa2729634a29b75e0a4994005dfc92b747df'
        'c39729fd5e31ef486d9173aebd472cd92ca12395ffdeb4b4e3d23ce6dceb89a8'
        )

_package() {
    pkgdesc="$2 mui pack for WPS Office"
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
