# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

_pkgname=libtexprintf
pkgname=libtexprintf-git
pkgver=main
pkgrel=2
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git make gcc)
source=("https://github.com/bartp5/libtexprintf/archive/refs/heads/${pkgver}.zip")
conflicts=(libtexprintf)
provides=('libtexprintf')
sha512sums=('2251cf9511c3ba7c0f993a844c82e59d3bdd378297e1df6034643f3d1c9c0415460f4470c8fa6c84de6b68aa63e1e893fd3211386c55b8d7dd6e4a451b2fca6d')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=/usr --enable-shared=yes --enable-static=yes
    make CFLAGS="$(echo ${CFLAGS} | sed 's_-Werror=format-security__')" all -j${nprocs}
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
