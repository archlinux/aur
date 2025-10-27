# Maintainer: Jurek Kołosowski <jurek@kolosowscy.pl>
pkgname=krunner-yubikey-oath
pkgver=1.0
pkgrel=1
pkgdesc="KDE Plasma 6 KRunner plugin for YubiKey OATH (TOTP/HOTP) integration"
arch=('x86_64')
url="https://github.com/jkolo/yubikey-oath-krunner"
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-declarative'
    'krunner'
    'ki18n'
    'kconfig'
    'knotifications'
    'kcoreaddons'
    'kwallet'
    'kcmutils'
    'pcsclite'
    'kwayland'
    'libei'
    'libxkbcommon'
    'zxing-cpp'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jkolo/yubikey-oath-krunner/archive/v${pkgver}.tar.gz")
sha256sums=('d3bcffa59dbb6162840c81f4376b800940577e889ace0e75c2825f1c3496c6fc')

build() {
    cd "${srcdir}/yubikey-oath-krunner-${pkgver}"

    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_CLANG_TIDY=OFF

    cmake --build build -j$(nproc)
}

package() {
    cd "${srcdir}/yubikey-oath-krunner-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
}