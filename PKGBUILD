# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=shuttlepro-v2-git
pkgver=0.1.r49.g2bb3c65
pkgrel=1
pkgdesc="A user program for interpreting input from a Contour Design Shuttle device (git version). This is a moded version from SERVCUBED. https://github.com/SERVCUBED/ShuttlePRO"
arch=('x86_64' 'i686')
# This is forked project from https://github.com/agraef/ShuttlePRO.
url="https://github.com/SERVCUBED/ShuttlePRO"
license=('GPL')
depends=('libxtst' 'jack')
provides=('shuttlepro')
conflicts=('shuttlepro' 'shuttlepro-git' 'contour-shuttle-git')
source=("$pkgname::git+https://github.com/SERVCUBED/ShuttlePRO.git")
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
