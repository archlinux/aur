# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom
pkgver=1.5.2
pkgrel=2
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('openlibrary' 'exiv2' 'qt6-base' 'dlib')
makedepends=('cmake' 'magic_enum' 'qt6-tools' 'imagemagick')
optdepends=('ffmpeg' 'hugin' 'imagemagick')
provides=('photobroom')
conflicts=('photobroom')
replaces=()
backup=()
options=()
install=
changelog=
source=(https://codeload.github.com/Kicer86/$pkgname/tar.gz/v$pkgver
        cmake_modules::git+https://github.com/Kicer86/cmake_modules.git#commit=b1e3891453826887411c952315227d5c91e204b6
        kwidgetsaddons::git+https://invent.kde.org/frameworks/kwidgetsaddons.git#commit=a2adad286075e4033bbba14ce0a3798a256622ac
        face_recognition_models::git+https://github.com/ageitgey/face_recognition_models.git#commit=e67de717267507d1e9246de95692eb8be736ab61
        github_api::git+https://github.com/Kicer86/github_api.git#commit=61267f15d558819bab7218c353a03d0d449774f9
)
noextract=()
md5sums=('b848257683d47b9e07e6c513452a2344'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare()
{
    rm -d $pkgname-$pkgver/cmake_modules
    rm -d $pkgname-$pkgver/external/kwidgetsaddons
    rm -d $pkgname-$pkgver/src/face_recognition/dlib_wrapper/face_recognition_models
    rm -d $pkgname-$pkgver/src/updater/github_api
    ln -s ../cmake_modules $pkgname-$pkgver/cmake_modules
    ln -s ../../kwidgetsaddons $pkgname-$pkgver/external/kwidgetsaddons
    ln -s ../../../github_api $pkgname-$pkgver/src/updater/github_api
    ln -s ../../../../face_recognition_models $pkgname-$pkgver/src/face_recognition/dlib_wrapper/face_recognition_models
}

build()
{
    cd "$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF -DBUILD_UPDATER=OFF
    make
}

package()
{
    cd "$pkgname-$pkgver"
    cd build
    make DESTDIR="$pkgdir/" install
}
