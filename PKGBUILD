# Maintainer: taotieren <admin@taotieren.com>

pkgbase=libstring-util
pkgname=libstring-util
pkgver=1.3.0
pkgrel=3
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
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('a51e352a723306c116b20aa168638c329fc2e7de79bc5a294cec465fba873199')
options=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

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
