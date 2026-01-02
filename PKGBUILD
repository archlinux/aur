# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

pkgname=libtexprintf
pkgver=1.27
pkgrel=1
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git)
source=("https://github.com/bartp5/libtexprintf/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('68c80b7b4ac3bc69319d08d9bad6a5dc6ffa14e2ff5f68353ae111d8007ff04efba32897f81c0a537a3730d288a2e62c16978e037af6939d23f33f73479936ae')
conflicts=('libtexprintf-git')
provides=('libtexprintf')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --enable-shared=yes --enable-static=yes
    make CFLAGS="$(echo ${CFLAGS} | sed 's_-Werror=format-security__')" all -j${nprocs}
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
