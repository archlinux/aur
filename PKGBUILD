# Maintainer: Kitsu mail@kitsu.me
pkgname=movian-git
pkgver=5.0.r472.gf5bbabd9e
pkgrel=1
pkgdesc="Media center (Git version)"
arch=('i686' 'x86_64')
url="https://movian.tv/"
license=('GPL')
depends=('webkitgtk2' 'libpulse' 'libvdpau' 'libxss')
makedepends=('git' 'nasm')
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
    ./configure --prefix="/usr" --release
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
