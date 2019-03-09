# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=openblok
pkgver=0.7.0
pkgrel=3
pkgdesc="A customizable, cross platform, open-source falling block game, packed with a bunch of features."
arch=('i686' 'x86_64')
url="https://github.com/mmatyas/openblok"
license=('GPL3')
groups=()
depends=()
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://codeload.github.com/mmatyas/$pkgname/tar.gz/v$pkgver 0001-Fixed-AppImage-data-path.patch)
noextract=()
md5sums=('0c82fadc6573e4fa0fe84171d169d978'
         '47cb3991c7997149f9229230969342ee')

build()
{
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/0001-Fixed-AppImage-data-path.patch"
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
