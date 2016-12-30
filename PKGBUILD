# Maintainer: Kitsu mail@kitsu.me
pkgname=movian-git
pkgver=5.0.r454.g552ad613b
pkgrel=2
pkgdesc="Media center (Git version)"
arch=('i686' 'x86_64')
url="https://movian.tv/"
license=('GPL')
depends=('libxext' 'sqlite' 'freetype2' 'webkitgtk' 'openssl' 'libpulse' 'libgl')
makedepends=('git')
provides=('movian')
conflicts=('movian')
source=("git+git://github.com/andoma/movian.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./configure --prefix="$pkgdir/usr" --release
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
