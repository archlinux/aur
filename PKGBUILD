# Maintainer: Yamada Hayao <development@fascode.net>

_pkgname="gnome-shell-extension-arc-menu"
pkgname="${_pkgname}-bin"
pkgdesc="shell extension designed to replace the standard menu found in GNOME"
deb_pkgver="49"
deb_pkgrel="1"
pkgver="${deb_pkgver}.${deb_pkgrel}"
pkgrel="1"
arch=('any')
url="https://gitlab.com/arcmenu/ArcMenu"
license=('GPL')
conflicts=("${_pkgname}" "${_pkgname}-git")
depends=("gnome-shell")
optdepends=()
source=("http://ftp.debian.org/debian/pool/main/g/${_pkgname}/${_pkgname}_${deb_pkgver}-${deb_pkgrel}_all.deb")
md5sums=('SKIP')

prepare(){
    while read -r pkg; do
        dir="${srcdir}/$(basename "${pkg}" | cut -d "." -f 1)"
        mkdir -p "${dir}"
        tar -x -v -f "${pkg}" -C "${dir}"
    done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -name "*.tar*" -printf "%p\n")
}

package() {
    while read -r file; do
        echo "Installing ${file}" >&2
        mkdir -p "$(dirname "${pkgdir}/${file}")"
        cp -ad "${srcdir}/data/${file}" "${pkgdir}/${file}"
    done < <(find "${srcdir}/data" -type f -o -type l 2> /dev/null | sed "s|${srcdir}/data||g")
}
