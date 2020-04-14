# Maintainer: Max Beikirch <max.beikirch (at) unitybox (dot) de>
pkgname=squash-git
pkgver=0.7.0.r498.g713eeca
pkgrel=1
pkgdesc="tool for compression benchmarks"
arch=('x86_64')
url="https://quixdb.github.io/squash/"
license=('MIT')
depends=('ragel')
makedepends=('cmake' 'git')
source=("git+https://github.com/quixdb/squash.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/squash"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/squash"

    ./autogen.sh --prefix=/usr
}

build() {
    cd "${srcdir}/squash"

    make
}

package() {
    cd "${srcdir}/squash"

    make DESTDIR="${pkgdir}" install
}
