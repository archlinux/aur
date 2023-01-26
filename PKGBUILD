_name=gwenview
pkgname=${_name}-light
pkgver=22.12.1
pkgrel=1
pkgdesc='A fast and easy to use image viewer (stripped from unnecessary dependencies)'
url="https://apps.kde.org/${_name}/"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kde-graphics')
depends=('kactivities' 'kparts' 'kitemmodels' 'phonon-qt5' 'kimageannotator')
makedepends=('extra-cmake-modules')
optdepends=(
    'qt5-imageformats: support for tiff, webp, and more image formats'
    'kimageformats: support for dds, xcf, exr, psd, and more image formats'
    'kamera: import pictures from gphoto2 cameras'
)

conflicts=("${_name}")
provides=("${_name}")

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/release-service/${pkgver}/src/${_snapshot}.tar.xz"{,.sig})
sha256sums=(
    '4bbf8cdd69c4918b457251d6f906c5ec5ea60ad4d08635fd7212f67a62fe278a'
    'SKIP'
)

validpgpkeys=(
    'CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
    'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87' # Christoph Feck <cfeck@kde.org>
    'D81C0CB38EB725EF6691C385BB463350D6EF31EF' # Heiko Becker <heiko.becker@kde.org>
)

options=('!docs' '!emptydirs')

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDEExperimentalPurpose_FOUND=OFF \
        -DKDEExperimentalBaloo_FOUND=OFF \
        -DKDEExperimentalKDcraw_FOUND=OFF \
        -DKDEExperimentalCFITSIO_FOUND=OFF \
        -DKDEExperimentalDocTools_FOUND=OFF \
        -DBUILD_TESTING=OFF

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
