# Maintainer: Sebastian Gsänger <sebastian_gsaenger@web.de>
pkgname=xwidgets
pkgver=0.20.2
pkgrel=1
pkgdesc="The C++ backend for Jupyter interactive widgets."
arch=('x86_64')
url="https://github.com/jupyter-xeus/xwidgets"
license=('BSD')
depends=('xtl' 'xproperty' 'xeus' 'nlohmann-json' 'jupyter-widgetsnbextension')
makedepends=()
source=("https://github.com/jupyter-xeus/$pkgname/archive/$pkgver.tar.gz")
md5sums=('2dda1147460516b6756b5cfb8766a13f')

build() {
    cd "$pkgname-$pkgver"
    mkdir build
    cd build

    cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "build"

    make DESTDIR="$pkgdir" install
}
