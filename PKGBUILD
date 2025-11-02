# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=distro-rack
pkgver=0.2.1
pkgrel=1
pkgdesc='Qt/QML-based Distrobox GUI'
arch=('x86_64' 'aarch64')
url='https://github.com/BLumia/distro-rack/'
license=('MIT')
depends=(
    'qt6-svg'
    'qt6-declarative'
    'distrobox'
)
makedepends=(
    'git'
    'qt6-tools'
    'cmake'
)
optdepends=(
    'dtk6declarative: for native-looking when using Deepin Desktop Environment'
    'kirigami: for native-looking when using KDE Plasma'
    'papirus-icon-theme: fallback icon theme for distro logos'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/BLumia/distro-rack/archive/${pkgver}.tar.gz"
)
sha256sums=(
    '58cf82c12f13c2b506fa9be32e4c3e5a66e2c5b0d149411a5d749b4f0b671c09'
)

build () {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
    cd ${srcdir}/${pkgname}-${pkgver}
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
