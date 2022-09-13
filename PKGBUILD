# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=hpp-corbaserver
pkgver=3.2
pkgrel=1
pkgdesc="Corba server for Humanoid Path Planner applications"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('BSD 3-clause')
depends=('omniorb' 'python2')
makedepends=('cmake')
source=("https://github.com/humanoid-path-planner/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('db95b6be8a81d32766a20f11e85fda9189a498e216c268197299656cdaeb0eb7')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCLIENT_ONLY=TRUE .
    for file in $(find . -name \*.py)
    do
        sed -i 's/env python$/env python2/' $file
    done
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
