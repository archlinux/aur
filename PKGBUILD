# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

pkgname=libtexprintf
pkgver=1.31
pkgrel=1
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git)
source=("https://github.com/bartp5/libtexprintf/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f66c15ff50e7da12b3b26bec0042f578b1d679fb872aa1ef64db6e6448fc6bcac5b2338df7fbeb75e583fe6d2e76af19e47aaf445bac42cbf4337175ddec604e')
conflicts=('libtexprintf-git')
provides=('libtexprintf')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --enable-shared=yes --enable-static=yes
    make all -j${nprocs}
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
