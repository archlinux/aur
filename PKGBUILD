# Maintainer: aggraef@gmail.com
pkgname=shuttlepro-git
pkgver=0.1.r0.ga77ed7a
pkgrel=1
pkgdesc="a user program for interpreting input from a Contour Design Shuttle device (git version)"
arch=('x86_64' 'i686')
# This is my own updated version with many enhancements, forked from
# https://github.com/nanosyzygy/ShuttlePRO.
url="https://github.com/agraef/ShuttlePRO"
license=('GPL')
depends=('libxtst' 'jack')
provides=('shuttlepro')
conflicts=('shuttlepro')
source=("$pkgname::git+https://github.com/agraef/ShuttlePRO.git")
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
    make install prefix=/usr DESTDIR="$pkgdir"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -m644 README.md LICENSE  "$pkgdir/usr/share/doc/$pkgname"
}
