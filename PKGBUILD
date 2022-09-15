# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

pkgname=libtexprintf
pkgver=1.11
pkgrel=1
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git)
source=(https://github.com/bartp5/libtexprintf/releases/download/v1.11/libtexprintf-1.11.tar.gz)
sha512sums=('958f335baae5d5f162c08d07743b59ee5a1e55ae432300ff521d5a45fc9953342cd53b54a2cae8a2553deed46061f34c0f1e16d788e95bdef87deddec12867be')
conflicts=()
provides=('libtexprintf')

build() {
    cd "$srcdir/libtexprintf"
    ./autogen.sh
    ./configure --prefix=/usr --enable-shared=yes --enable-static=yes
    make CFLAGS="$(echo $CFLAGS | sed 's_-Werror=format-security__')" all
}

package() {
    cd "$srcdir/libtexprintf"
    make PREFIX=/usr DESTDIR=${pkgdir} install
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
