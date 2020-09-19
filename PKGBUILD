# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom
pkgver=1.4.0
pkgrel=1
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('jsoncpp' 'openlibrary' 'qt5-base')
makedepends=('cmake' 'exiv2' 'openlibrary' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://codeload.github.com/Kicer86/$pkgname/tar.gz/v$pkgver
        cmake_modules::git+https://github.com/Kicer86/cmake_modules.git#commit=05a523fd464b6020ac3839e410236ebc859721cb
        kwidgetsaddons::git+https://invent.kde.org/frameworks/kwidgetsaddons.git#commit=a2adad286075e4033bbba14ce0a3798a256622ac
        face_recognition_models::git+https://github.com/ageitgey/face_recognition_models.git#commit=e67de717267507d1e9246de95692eb8be736ab61
)
noextract=()
md5sums=('506a3f7f621091da3e2847fb0e552bfc'
         'SKIP'
         'SKIP'
         'SKIP'
)

prepare()
{
    rm -d $pkgname-$pkgver/cmake_modules
    rm -d $pkgname-$pkgver/external/kwidgetsaddons
    rm -d $pkgname-$pkgver/src/face_recognition/dlib_wrapper/face_recognition_models
    ln -s ../cmake_modules $pkgname-$pkgver/cmake_modules
    ln -s ../../kwidgetsaddons $pkgname-$pkgver/external/kwidgetsaddons
    ln -s ../../../../face_recognition_models $pkgname-$pkgver/src/face_recognition/dlib_wrapper/face_recognition_models
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
