# Maintainer: Yamada Hayao <development@fascode.net>

_pkgname="checkmedia"
pkgname="${_pkgname}"
pkgdesc="Check installation CDs and DVDs for errors."
pkgver="5.4"
pkgrel="1"
arch=('x86_64')
url="https://github.com/openSUSE/checkmedia"
license=('GPL')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')
_dir="${_pkgname}"

build(){
    cd "${srcdir}/${_dir}"
    make
}

prepare(){
    cd "${srcdir}/${_dir}"
    sed -i "s|^LIBDIR.*|LIBDIR = \"/usr/lib\"|g" ./Makefile
}

package() {
    cd "${srcdir}/${_dir}"

    # Prepare dirs
    mkdir -p "${pkgdir}/usr/bin"

    make DESTDIR="${pkgdir}" install
}
