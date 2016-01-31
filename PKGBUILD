# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=picrin-git
_pkgname=picrin
pkgver=r3250.5a5b5ee
pkgrel=1
pkgdesc="Picrin is a lightweight R7RS scheme implementation written in pure C89."
arch=('i686' 'x86_64')
url='https://github.com/picrin-scheme/picrin'
license=('MIT')
depends=('perl' 'glibc' 'libedit')
makedepends=('git' 'make' 'gcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git://github.com/picrin-scheme/picrin.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    make install prefix="${pkgdir}/usr"
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
