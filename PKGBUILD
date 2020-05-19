# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=openblok
pkgver=0.8.2
pkgrel=1
pkgdesc="A customizable, cross platform, open-source falling block game, packed with a bunch of features."
arch=('i686' 'x86_64')
url="https://github.com/mmatyas/openblok"
license=('GPL3')
groups=()
depends=('sdl2'
         'sdl2_image'
         'sdl2_mixer'
         'sdl2_ttf')
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://codeload.github.com/mmatyas/$pkgname/tar.gz/v$pkgver libSDL2pp::git+https://github.com/mmatyas/libSDL2pp.git#branch=cmake_modernization)
noextract=()
md5sums=('6dd426a1dec30c74036ae09113505659'
         'SKIP')

build()
{
    mv ./libSDL2pp/* $pkgname-$pkgver/thirdparty/libSDL2pp
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DEXEDIR=/usr/bin
    make
}

package()
{
    cd "$pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}
