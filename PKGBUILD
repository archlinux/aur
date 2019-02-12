# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=google-drive-ocamlfuse-opam
_pkgname=google-drive-ocamlfuse
pkgver=0.7.2
pkgrel=1
pkgdesc="FUSE-based file system backed by Google Drive, written in OCaml (installed from opam)"
arch=('x86_64')
url='https://astrada.github.io/google-drive-ocamlfuse/'
license=('MIT')
depends=('glibc' 'zlib' 'curl' 'fuse2' 'sqlite')
makedepends=('opam')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=()
sha256sums=()
options=()

prepare() {
    cd ${srcdir}
    opam init -a
    opam update
}

pkgver() {
    cd "${srcdir}"
    opam list ${_pkgname} --columns=version | awk '/^[^#]/{print}' | sort -V | tail -n 1
}

build() {
    cd "${srcdir}"
    opam switch create .
    eval $(opam env --switch=. --set-switch)
    opam install -y ${_pkgname}.${pkgver}
    cp "_opam/bin/${_pkgname}" "${_pkgname}"
    opam switch -y remove .
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

