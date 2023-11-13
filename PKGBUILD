# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

_pkgname=libtexprintf
pkgname=libtexprintf-git
pkgver=1.25
pkgrel=1
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git make gcc)
source=("https://github.com/bartp5/libtexprintf/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
conflicts=(libtexprintf)
provides=('libtexprintf')
sha512sums=('2121eb27c40b31e64f67dbfde309112c2368f9898e473bcdcb7f760fece976f8d55871792e3b777340a2c28306db0c6db0d54ee8d179e72f7803ab29e28da663')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure --prefix=/usr --enable-shared=yes --enable-static=no
    make CFLAGS="$(echo ${CFLAGS} | sed 's_-Werror=format-security__')" all -j${nprocs}
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
    install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
