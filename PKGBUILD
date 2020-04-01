# Maintainer: Eugene Lebedev <satanych13+dev@gmail.com>

_pkgname=FasTC
pkgname="fastc-git"
pkgver=679.0f8cef6
pkgrel=1
pkgdesc="A fast texture compressor for various formats"
arch=('i686' 'x86_64')
url="https://github.com/GammaUNC/FasTC"
license=('Apache')
depends=('libpng' 'zlib')
conflicts=("fastc")
provides=("fastc")
makedepends=('cmake' 'git')
source=(fastc::git+https://github.com/GammaUNC/${_pkgname}.git)
md5sums=('SKIP')

pkgver() {    
    cd fastc
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    mkdir -p fastc/build
    cd fastc/build
    cmake ../ -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd fastc
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 ./build/CLTool/tc "$pkgdir/usr/bin/fastc"
    install -Dm755 ./build/CLTool/compare "$pkgdir/usr/bin/fastc-compare"
    install -Dm755 ./build/CLTool/decomp "$pkgdir/usr/bin/fastc-decomp"
}
