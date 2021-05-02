# Maintainer: Yamada Hayao <development@fascode.net>

_pkgname="grub-theme-zorin"
pkgname="${_pkgname}-bin"
pkgdesc="GRand Unified Bootloader, version 2 (Zorin theme)"

deb_pkgver="1.2.1"
pkgver="${deb_pkgver}"
pkgrel="2"

arch=('any')
url="https://zorinos.com/"
license=('GPL')
conflicts=("${_pkgname}" "${_pkgname}-git")

depends=("grub")
optdepends=()

source=("https://launchpad.net/~zorinos/+archive/ubuntu/stable/+files/${_pkgname}_${deb_pkgver}_all.deb")
md5sums=('SKIP')

prepare(){
    while read -r pkg; do
        dir="${srcdir}/$(echo "${pkg}" | cut -d "." -f 1)"
        mkdir -p "${dir}"
        tar -x -v -f "${pkg}" -C "${dir}"
    done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -name "*.tar*" -printf "%p\n")
}

package() {
    cp -ar "${srcdir}/data/"* "${pkgdir}"
}
