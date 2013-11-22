# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Kringel
# This PKGBUILD is a modified version of eigen 3.x in AUR, and eigen 2.x in
# extra/eigen.

pkgname=eigen3-hg
_name=eigen3
pkgver=3.2.r5716
pkgver() {
    cd ${_name}
    # Remove after hyphen
    _latesttag=$(hg parents --template '{latesttag}' | sed "s/-[^-]*$//g")
    _revision=$(hg identify -n)
    echo ${_latesttag}.r${_revision}
}
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra. Mercurial version."
arch=('any')
url='http://eigen.tuxfamily.org'
license=('MPL2')
makedepends=('cmake' 'pkg-config' 'mercurial')
source=("${_name}::hg+https://bitbucket.org/eigen/eigen")
sha1sums=('SKIP')
provides=('eigen3')
conflicts=('eigen3')

build() {
    mkdir -p build
    cd build
    cmake ../${_name} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
    install -Dm644 ../${_name}/COPYING.MPL2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
