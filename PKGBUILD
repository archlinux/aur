# Maintainer: Eduardo Jose Gomez Hernandez <eduardo@edujgh.net>
pkgname=c3c-bin
_pkgname=c3c
pkgver=0.5.2
pkgrel=1
pkgdesc="C3 is an evolution of C enabling the same paradigms and retaining the same syntax as far as possible. Stable Release (with LLVM 16)"
arch=(x86_64)
url="https://github.com/c3lang/c3c.git"
license=('LGPL3' 'MIT')
depends=()
makedepends=('binutils')
provides=(c3c)
conflicts=(c3c)

source=('https://github.com/c3lang/c3c/releases/download/latest/c3-linux.tar.gz')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/linux"
    ./c3c -V | grep "C3 Compiler Version" | tr -s " " | cut -f 2 -d ':' | cut -f 2 -d " "
}

package() {
    cd "${srcdir}/linux/"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/${_pkgname}"

    cp "${srcdir}/linux/c3c" "${pkgdir}/usr/lib/${_pkgname}/c3c"
    cp -r "${srcdir}/linux/lib" "${pkgdir}/usr/lib/${_pkgname}/lib"
    ln -s "/usr/lib/${_pkgname}/c3c" "${pkgdir}/usr/bin/c3c"
}

