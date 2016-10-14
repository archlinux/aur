pkgname=b2sum-git
_pkgname=BLAKE2
pkgver=72.c314fb4
pkgrel=1
pkgdesc="Computes the BLAKE2 (BLAKE2b or -s, -bp, -sp) cryptographic hash of a given file."
arch=('i686' 'x86_64')
url="https://blake2.net/"
license=('custom')
makedepends=('git')
source=(${_pkgname}::"git+https://github.com/${_pkgname}/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}/b2sum"
    make clean
}

build() {
    cd "${srcdir}/${_pkgname}/b2sum"
    make all
}

package() {
    cd "${srcdir}/${_pkgname}/b2sum"
    install -d "${pkgdir}/usr/bin"
    install -Dm 755 b2sum "${pkgdir}/usr/bin"
}
