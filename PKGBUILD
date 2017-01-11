# Maintainer: David Couzelis <drcouzelis@gmail.com>
pkgname=kwestkingdom-git
pkgver=0.2
pkgrel=3
pkgdesc="A cute 2D turn based strategy game"
arch=('i686' 'x86_64')
url="https://github.com/drcouzelis/kwestkingdom"
license=('GPL')
depends=('allegro4')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/drcouzelis/kwestkingdom")
md5sums=('SKIP')

build() {
        cd "$srcdir/${pkgname%-git}"
        autoreconf --install
        ./configure --prefix=/usr
        make
}

check() {
        cd "$srcdir/${pkgname%-git}"
        make -k check
}

package() {
        cd "$srcdir/${pkgname%-git}"
        make DESTDIR="$pkgdir/" install
        install -D -m644 system/kwestkingdom.png $pkgdir/usr/share/pixmaps/kwestkingdom.png
        install -D -m644 system/kwestkingdom.desktop $pkgdir/usr/share/applications/kwestkingdom.desktop
}
