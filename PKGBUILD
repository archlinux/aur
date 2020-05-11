# Author: rr- <rr-@sakuya.pl>
# Maintainer: rr- <rr-@sakuya.pl>
pkgname=shot-git
pkgver=2.1
pkgrel=1
pkgdesc='A minimal screenshot tool aiming to provide good control over screenshot region.'
arch=('any')
url='https://github.com/rr-/shot'
license=('MIT')
depends=('libxrandr')
makedepends=('cmake' 'git')
source=("$pkgname::git://github.com/rr-/shot.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --abbrev=0
}

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_RELEASE_TYPE=Release
    make
}

package() {
    cd "$pkgname"
    cd build
    make DESTDIR="$pkgdir" install
}
