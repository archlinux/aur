# Maintainer: Miodrag Tokić
# Contributor: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Manuel Kehl <https://launchpad.net/~mank319, https://github.com/mank319/>

pkgname=go-for-it
pkgver=1.8.1
pkgrel=1
pkgdesc='A stylish to-do list with built-in productivity timer.'
arch=('i686' 'x86_64')
url='https://github.com/mank319/Go-For-It'
license=('GPL3')
depends=('gtk3' 'libnotify')
makedepends=('vala' 'cmake' 'intltool')
conflicts=('go-for-it-git')
install='go-for-it.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/mank319/Go-For-It/archive/${pkgver}.tar.gz")
sha256sums=('a0e53c80ce43aa4ce15c71d239cc1a1847ab600821d9c77ba528f47d32173e08')

build() {
    cd "Go-For-It-$pkgver"

    if [[ -d build ]]; then
        rm -rf build
    fi

    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DAPP_SYSTEM_NAME:STRING=go-for-it ..
    make
    make pot
    make po
}

package() {
    cd "Go-For-It-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
