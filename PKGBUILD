# Maintainer: Yamada Hayao <development@fascode.net>

_pkgname="zorin-icon-themes"
pkgname="${_pkgname}"
pkgdesc="The Zorin icon theme provided in a variety of color combinations"

deb_pkgver="2.8.8"
pkgver="${deb_pkgver}"
pkgrel="1"

arch=('any')
url="https://zorinos.com/"
license=('GPL')
conflicts=("${_pkgname}" "${_pkgname}-git")

depends=()
optdepends=()

source=(
    "https://launchpad.net/~zorinos/+archive/ubuntu/stable/+files/${_pkgname}_${deb_pkgver}_all.deb"
)
md5sums=(
    'SKIP'
)

prepare(){
    while read -r pkg; do
        dir="${srcdir}/$(basename "${pkg}" | cut -d "." -f 1)"
        mkdir -p "${dir}"
        tar -x -v -f "${pkg}" -C "${dir}"
    done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -name "*.tar*" -printf "%p\n")
}

package() {
    cp -arv "${srcdir}/data/"* "${pkgdir}"
}
