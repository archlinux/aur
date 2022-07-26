# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=inertial-sense-sdk
pkgver=1.8.7
pkgrel=1
pkgdesc="Quick integration for communication with the Inertial Sense product line."
arch=('any')
url="https://github.com/inertialsense/inertial-sense-sdk"
license=('MIT')
makedepends=('cmake' 'ninja')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=(
    "https://github.com/inertialsense/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
    'e44cf1c44dd22b3abb0213b99b8282cb852ce35d4e56d42605d72ce29df2a805'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake . -GNinja -Bbuild
    ninja -C build cltool InertialSense
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/include/inertial-sense-sdk/"
    install -Dm644 src/*.h "${pkgdir}/usr/include/inertial-sense-sdk/"
    install -Dm644 build/libInertialSense.a "${pkgdir}/usr/lib/libInertialSense.a"
    install -Dm755 build/cltool/cltool "${pkgdir}/usr/bin/inertial-sense-cltool"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
