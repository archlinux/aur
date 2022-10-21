# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom
pkgver=1.6.0
pkgrel=3
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('exiv2' 'qt6-base' 'dlib' 'qt6-multimedia' 'opencv' 'jsoncpp' 'libwebp')
makedepends=('cmake' 'magic_enum' 'qt6-tools' 'imagemagick')
optdepends=()
provides=('photobroom')
conflicts=('photobroom')
replaces=()
backup=()
options=()
install=
changelog=
source=(https://codeload.github.com/Kicer86/$pkgname/tar.gz/v$pkgver
        cmake_modules::git+https://github.com/Kicer86/cmake_modules.git#commit=bf447aeb3bf57680f0c257f9d77ea7f5ef90b0ec
        qml-colorpicker::git+https://github.com/rshest/qml-colorpicker.git#commit=5967b3e38033794f54d66c57a03f9a356df0dc03
        face_recognition_models::git+https://github.com/ageitgey/face_recognition_models.git#commit=e67de717267507d1e9246de95692eb8be736ab61
)
noextract=()
md5sums=('19c042f359b47ef954b11bc67f967577'
         'SKIP'
         'SKIP'
         'SKIP')

prepare()
{
    rm -d $pkgname-$pkgver/cmake_modules
    rm -d $pkgname-$pkgver/src/gui/desktop/quick_items/external/qml-colorpicker
    rm -d $pkgname-$pkgver/src/face_recognition/dlib_wrapper/face_recognition_models
    cp -r cmake_modules $pkgname-$pkgver/cmake_modules
    cp -r qml-colorpicker $pkgname-$pkgver/src/gui/desktop/quick_items/external/qml-colorpicker
    cp -r face_recognition_models $pkgname-$pkgver/src/face_recognition/dlib_wrapper/face_recognition_models
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
