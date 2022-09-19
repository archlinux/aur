# Maintainer: Suavesito-Olimpiada <flyingspaghetti@airmail.cc>
# based on the PKGBUILD of dzen2-git

pkgname=libtexprintf-git
pkgver=1.12dev
pkgrel=1
pkgdesc="Formatted Output with tex-like syntax support"
arch=('i686' 'x86_64')
url='https://github.com/bartp5/libtexprintf'
license=('GPL3')
makedepends=(git)
source=('libtexprintf::git+https://github.com/bartp5/libtexprintf')
md5sums=('SKIP')
conflicts=(libtexprintf)
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
