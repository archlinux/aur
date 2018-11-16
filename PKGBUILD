# Maintainer: aggraef@gmail.com
pkgname=midizap-git
pkgver=0.9.r0.gdc62671
pkgrel=1
pkgdesc="control your multimedia applications with MIDI (git version)"
arch=('x86_64' 'i686')
url="https://github.com/agraef/midizap"
license=('GPL')
depends=('libxtst' 'jack')
provides=('midizap')
conflicts=('midizap')
source=("$pkgname::git+https://github.com/agraef/midizap.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make install prefix=/usr elispdir=/usr/share/emacs/site-lisp DESTDIR="$pkgdir"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README.md LICENSE  "$pkgdir/usr/share/doc/$pkgname"
}
