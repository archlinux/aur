# Maintainer: Yamada Hayao <hayao@fascode.net>
# Contributor: YamaD <yamad.linuxer@gmail.com>

_pkgname=plymouth-theme-serene
pkgname="${_pkgname}-git"
pkgver=r5.4b6c944
pkgrel=2
pkgdesc="SereneLinux用のplymouthテーマ"
arch=('any')
url="https://github.com/FascodeNet/${_pkgname}"
license=('GPL')
depends=('plymouth')
makedepends=('git')
optdepends=()
source=("git+${url}.git")
md5sums=('SKIP')
conflicts=("${_pkgname}")
install="${pkgname}.install"
themes=("serene-logo" "serene-mso" "serene-old")

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package () {
    local theme dir
    for theme in ${themes[@]}; do 
        mkdir -p "${pkgdir}/usr/share/plymouth/themes/${theme}"
        for dir in $(ls "${srcdir}/${_pkgname}/${theme}"); do
            cp "${srcdir}/${_pkgname}/${theme}/${dir}/"* "${pkgdir}/usr/share/plymouth/themes/${theme}"
        done
        echo "${theme} done."
    done
}

