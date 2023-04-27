# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=inertial-sense-sdk
pkgver=1.9.1
pkgrel=2
pkgsuffix=""
pkgdesc="Quick integration for communication with the Inertial Sense product line."
arch=('any')
url="https://github.com/inertialsense/inertial-sense-sdk"
license=('MIT')
makedepends=('cmake' 'ninja')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
    "https://github.com/inertialsense/${pkgname}/archive/refs/tags/${pkgver}${pkgsuffix}.tar.gz"
)
sha256sums=(
    'c97746b77b084af8c941dd96c61b330b9f434c9ec57440ab6131e79e11d17827'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}${pkgsuffix}"
    cmake . -GNinja -Bbuild
    ninja -C build cltool InertialSense
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}${pkgsuffix}"
    mkdir -p "${pkgdir}/usr/include/inertial-sense-sdk/"
    install -Dm644 src/*.h "${pkgdir}/usr/include/inertial-sense-sdk/"
    install -Dm644 build/libInertialSense.a "${pkgdir}/usr/lib/libInertialSense.a"
    install -Dm755 build/cltool/cltool "${pkgdir}/usr/bin/inertial-sense-cltool"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
