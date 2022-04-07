# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=openblok
pkgver=0.8.4
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
source=(https://codeload.github.com/mmatyas/$pkgname/tar.gz/v$pkgver libSDL2pp::git+https://github.com/mmatyas/libSDL2pp.git#commit=4cb0e063ddd7db666007c71cef7a5f9cce866671)
noextract=()
md5sums=('82614ea8a047354d23f3f8ff322f00f8'
         'SKIP')

prepare()
{
    rm -d $pkgname-$pkgver/thirdparty/libSDL2pp
    ln -s `pwd`/libSDL2pp $pkgname-$pkgver/thirdparty/libSDL2pp
}

build()
{
    cd $pkgname-$pkgver
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DEXEDIR=/usr/bin ..
    make
}

package()
{
    cd "$pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}
