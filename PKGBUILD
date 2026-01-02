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
sha512sums=(SKIP)

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./autogen.sh
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
