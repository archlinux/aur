# Author: mosra <mosra@centrum.cz>
pkgname=magnum-extras-git
pkgver=2019.10.r54.g0c4be49
pkgrel=1
pkgdesc="Extras for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git')
makedepends=('cmake' 'git' 'ninja')
provides=('magnum-extras')
conflicts=('magnum-extras')
source=("git+git://github.com/mosra/magnum-extras.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_UI=ON \
        -DWITH_UI_GALLERY=ON \
        -G Ninja
    ninja
}

package() {
    cd "$srcdir/build"
    DESTDIR="$pkgdir/" ninja install
}
