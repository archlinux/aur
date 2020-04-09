# Maintainer: Miodrag Tokić
# Contributor: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Manuel Kehl <https://launchpad.net/~mank319, https://github.com/mank319/>

pkgname=go-for-it
pkgver=1.7.3
pkgrel=2
pkgdesc='A stylish to-do list with built-in productivity timer.'
arch=('i686' 'x86_64')
url='https://github.com/mank319/Go-For-It'
license=('GPL3')
depends=('gtk3' 'libnotify')
makedepends=('vala' 'cmake' 'intltool')
conflicts=('go-for-it-git')
install='go-for-it.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/mank319/Go-For-It/archive/${pkgver}.tar.gz")
sha256sums=('582ec27876dbfdab71c5fc681a74c3e4f5a4d0d73cd634a0c5db64e5c4c51ea7')

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
