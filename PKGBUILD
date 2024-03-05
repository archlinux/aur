# Maintainer: YangZhichao<1036711084@qq.com>
pkgname=osqp-eigen-git
pkgver=v0.8.1.r5.ga752c5e
pkgrel=1
pkgdesc="Simple C++ wrapper for osqp library."
arch=('x86_64')
url="https://github.com/osqp/osqp"
license=('apache')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('eigen' 'osqp')
optdepends=()
makedepends=('cmake' 'git')
source=("${pkgname%-git}::git+https://github.com/robotology/osqp-eigen.git")
sha256sums=(SKIP)
pkgver() {
  cd $srcdir/${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare()
{
    cd $srcdir/${pkgname%-git}
    mkdir build
}
build() {
    cd $srcdir/${pkgname%-git}/build
    cmake -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr ..
    make 
}
package() 
{
    cd $srcdir/${pkgname%-git}/build
    make install
}
