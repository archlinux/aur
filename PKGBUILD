# Maintainer: Yamada Hayao <development@fascode.net>

_pkgname="zorin-icon-themes"
pkgname="${_pkgname}"
pkgdesc="The Zorin icon theme provided in a variety of color combinations"

deb_pkgver="2.9.7"
pkgver="${deb_pkgver}"
pkgrel="1"

arch=('any')
url="https://zorinos.com/"
license=('GPL')
conflicts=("${_pkgname}" "${_pkgname}-git")

depends=()
optdepends=()

source=("https://launchpad.net/~zorinos/+archive/ubuntu/stable/+files/${_pkgname}_${deb_pkgver}_all.deb")
md5sums=('73a1b7191511decd66053a7aaebe8809')

prepare(){
    while read -r pkg; do
        dir="${srcdir}/$(basename "${pkg}" | cut -d "." -f 1)"
        mkdir -p "${dir}"
        tar -x -v -f "${pkg}" -C "${dir}"
    done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -name "*.tar*" -printf "%p\n")
}

package() {
    cp -rv "${srcdir}/data/"* "${pkgdir}"
}
