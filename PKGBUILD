# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=inertial-sense-sdk
pkgver=1.9.1
pkgrel=1
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
    'a644744494656be80802bb84726fb8f30c3aaa88e1ffcbf52ede28aaa9d933cc'
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
