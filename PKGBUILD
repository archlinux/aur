_name=spectacle
pkgname=${_name}-no-purpose
pkgver=22.12.1
pkgrel=1
pkgdesc='KDE screenshot capture utility, without the dependency on purpose.'
arch=('x86_64')
url='https://apps.kde.org/spectacle/'
license=('GPL')
depends=('xcb-util-cursor' 'knewstuff' 'kwayland' 'qt5-tools' 'kimageannotator')
makedepends=('extra-cmake-modules' 'kdoctools')
groups=('kde-applications' 'kde-graphics')
provides=("${_name}")
conflicts=("${_name}")

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/release-service/${pkgver}/src/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    'e8a8ab8e9ebde514d546c7247de9ee8d2f50578291a7f637b386d6a5b987f116'
    'SKIP'
)

validpgpkeys=(
    'CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7' # Albert Astals Cid <aacid@kde.org>
    'F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87' # Christoph Feck <cfeck@kde.org>
    'D81C0CB38EB725EF6691C385BB463350D6EF31EF' # Heiko Becker <heiko.becker@kde.org>
)

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDEExperimentalPurpose_FOUND=OFF \
        -DBUILD_TESTING=OFF

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
