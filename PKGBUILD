# Author: mosra <mosra@centrum.cz>
pkgname=magnum-extras-git
pkgver=snapshot.2015.05.r104.g02d87f6
pkgrel=1
pkgdesc="Extras for Magnum graphics engine (Git version)"
arch=('i686' 'x86_64')
url="http://mosra.cz/blog/magnum.php"
license=('MIT')
depends=('magnum-git')
makedepends=('cmake' 'git')
provides=('magnum-extras')
conflicts=('magnum-extras')
source=("git+git://github.com/mosra/magnum-extras.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_UI=ON \
        -DWITH_UI_GALLERY=ON
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
