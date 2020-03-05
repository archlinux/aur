# Maintainer: Yamada Hayao <development@fascode.net>

pkgname=lightdm-webkit2-theme-alter
_pkgname=lightdm-webkit2-theme-alter
pkgver=1.0
pkgrel=1
pkgdesc="AlterLinux webkit2 greeter theme"
arch=('any')
url=https://github.com/SereneTeam/lightdm-webkit2-theme-alter
license=('MIT')
depends=('lightdm' 'lightdm-webkit2-greeter')
optdepends=()
source=("https://github.com/SereneTeam/${_pkgname}/archive/v${pkgver}.zip")
md5sums=('SKIP')
conflicts=('lightdm-webkit2-theme-alter-git')

build () {
    function remove () {
        local _list
        local _file
        _list=($(echo "$@"))
        for _file in "${_list[@]}"; do
            if [[ -f ${_file} ]]; then
                rm -f "${_file}"
            elif [[ -d ${_file} ]]; then
                rm -rf "${_file}"
            fi
        done
    }
    remove usr
    cd "${_pkgname}-${pkgver}"
    remove ${_pkgname}
    remove .git
    remove README.md
    remove LICENSE
    mkdir -p ../usr/share/lightdm-webkit/themes/alter
    mv * ../usr/share/lightdm-webkit/themes/alter
    cd ..
    remove "v${pkgver}.zip"
    remove "${_pkgname}-${pkgver}"
}

package () {
    mkdir -p "$pkgdir"
    cp -r * "$pkgdir"
}
