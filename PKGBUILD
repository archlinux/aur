# Maintainer: Alessandro Pazzaglia <jackdroido at gmail dot com>

pkgname=typhon-svn
pkgver=2.0.r16
pkgrel=2
pkgdesc="A slim and themeable OpenGL-based dashboard and emulator launcher"
arch=('i686' 'x86_64')
url="https://github.com/frostworx/typhon-launcher"
license=('GPL3')
depends=('sfml' 'tinyxml' 'bullet')
optdepends=('imagemagick: for thumbnail support')
makedepends=('subversion' 'cmake')
source=("$pkgname::svn+https://github.com/frostworx/typhon-launcher/trunk")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS="-Wno-unused-but-set-variable -Wno-maybe-uninitialized -Wno-sign-compare" \
        -DNOMMD=ON -DNOSFM=ON -DNOSCROT=ON ..
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir/" install
}

pkgver() {
    cd "$pkgname"
    local release="2.0"
    local version="$(svnversion)"
    printf "%s.r%s" "${release}" "${version//[[:alpha:]]}"
}
