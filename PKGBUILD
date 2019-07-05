# Maintainer: mbb <mochobb at clix dot pt>
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>

pkgname=falkon-pdfreader-git
pkgver=r7.eefc135
pkgrel=2
pkgdesc="PDF reader plugin for Falkon browser"
arch=('i686' 'x86_64')
url="https://github.com/Tarptaeya/PDFReader"
license=('GPL3')
depends=('falkon' 'cmake' 'extra-cmake-modules')
makedepends=('git')
provides=('falkon-pdfreader')
conficts=('falkon-pdfreader')
source=("$pkgname"::'git+https://github.com/Tarptaeya/PDFReader.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir "$srcdir/$pkgname/build"
    cd "$srcdir/$pkgname/build"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_INSTALL_LIBDIR="lib/qt" ..
    make install
}
