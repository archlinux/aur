# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=ipmt-git
_pkgname=${pkgname%-git}
pkgver=r98.27a5853
pkgrel=1
pkgdesc="Internet protocols measurement tools"
arch=(x86_64)
url="https://gricad-gitlab.univ-grenoble-alpes.fr/Drakkar-LIG/ipmt/"
license=('custom:CeCILL2')
depends=(glibc)
makedepends=('git')
checkdepends=('net-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('ipmt::git+https://gricad-gitlab.univ-grenoble-alpes.fr/Drakkar-LIG/ipmt.git/#branch=master')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/${_pkgname}"
    make -k check
}

package() {
    cd "$srcdir/${_pkgname}"
    make DESTDIR="$pkgdir/" install
    # Fix license location
    mkdir -p "${pkgdir}/usr/share/licenses/ipmt-git"
    mv "${pkgdir}"/usr/share/doc/ipmt/Licence_CeCILL_V2* "${pkgdir}"/usr/share/licenses/ipmt-git/
}
