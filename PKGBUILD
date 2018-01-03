# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom
pkgver=1.2.2
pkgrel=1
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('jsoncpp' 'openlibrary' 'qt5-base')
makedepends=('cmake' 'jsoncpp' 'exiv2' 'openlibrary' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://codeload.github.com/Kicer86/$pkgname/tar.gz/v$pkgver
        cmake_modules::git+https://github.com/Kicer86/cmake_modules.git)
noextract=()
md5sums=('303f9a1261c33cd9410562922c827e65'
         'SKIP')

prepare()
{
    rm -d $pkgname-$pkgver/cmake
    ln -s ../cmake_modules $pkgname-$pkgver/cmake
}

build()
{
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package()
{
    cd "$pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}
