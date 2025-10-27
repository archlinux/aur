# Maintainer: Jurek Kołosowski <jurek@kolosowscy.pl>
pkgname=krunner-yubikey-oath
pkgver=1.0.2
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
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

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
