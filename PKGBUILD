# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libstring-util
pkgname=libstring-util
_tagname=1.2.9
pkgver="${_tagname//-/_}"
pkgrel=0
pkgdesc="C++ lib of useful string manipulation functions"
arch=($CARCH)
url="https://gitlab.com/links_and_nodes/libstring_util"
license=('GPL-3.0-only')
groups=()
provides=(${pkgname} ${pkgname//-/_}.so)
conflicts=(${pkgname} ${pkgname//-/_}.so)
replaces=()
depends=(
	glibc
	gcc-libs
)
makedepends=(
    git
    pkgconf
)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git#tag=${_tagname}")
sha256sums=('1b784bf5fdc378d5c8a421a5bc55c26801d4b323dcf65ad47a00dd5104fe6354')
options=()

build() {
    cd "${srcdir}/${pkgname}/"
    autoreconf -is
    ./configure --prefix=/usr
    make
}

check() {
    cd "${srcdir}/${pkgname}"
    make check
}

package() {
     cd "${srcdir}/${pkgname}"
     make DESTDIR=${pkgdir} install
}
