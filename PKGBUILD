# Maintainer: Weitian Leung <weitianleung@gmail.com>

pkgbase=wps-office-mui

pkgver=11.1.0.8392
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
        '00f5b2609f4270f1c5a358056865ed62a08eb39e8e57892b4771c6a0455a95db'
        'ca853e76b998ffc5116525032ba82e11ac41eb342a5e66cc7aeb4dc91fea68f8'
        '18fed4c9bae7fc6afcf37de5fbd51f4eb80dd59ab5e417ae81e067f408321c4b'
        'a77e4e44ab9c5db0638a8f86041dbb4e11dde02638c504179a307bc58eaa9db3'
        '2df2580e53215260f3fc17e73c5874b81382ce4a6d237a4a8584b6797e7fce53'
        '8dbc3db659a9041edf4ebe212ab7bb565b3bcc5d8680d9070317b317c436677c'
        'c59528d04cc94087e7ee44d618eab9ff5d00cbdfd148eabdb33763ae05703abc'
        '5df8d2e5be874164587e57e7ca6409683488e4a2654708c5b1b0768f0fc35dee'
        '7ed3a8404d6a5110b0454236df26b1465c96cc0637e86b3479d7c10c6ccaf88a'
        '26a277e9a41dc5bbf051c72959e881241d72ed6c048d7caf2bc299b4b7afb02a'
        '4917feccf04bc6dcaa8c9f9aa544dd586e2c869debff4fa27fc385558c6dcd17'
        '20de10d5c93ba731deb93f411f826fbcd26ddef88e1d3df50d2586335acd5b5d'
        '0cf85024bcc696cedd92a31463a0571e4f555d4ef6ea18f35be894b820855b8a'
        '5c0ddcb623d85b01a9b6cc63d995b0f49670901433ec3797c7b7f155970d5a6e'
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
