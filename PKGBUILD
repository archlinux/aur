# Maintainer: Jurek Kołosowski <jurek@kolosowscy.pl>
pkgname=krunner-yubikey-oath
pkgver=2.6.0
pkgrel=1
pkgdesc="KDE Plasma 6 KRunner plugin for YubiKey and Nitrokey OATH (TOTP/HOTP) integration"
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
    'libportal'
    'libportal-qt6'
    'libxkbcommon'
    'zxing-cpp'
    'kwidgetsaddons'
    'kguiaddons'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'clang'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jkolo/yubikey-oath-krunner/archive/v${pkgver}.tar.gz")
sha256sums=('c0a13f5373dfaf24fab225669da2911694635b4c24fbeb4dd1fa81863fc855ce')

build() {
    cd "${srcdir}/yubikey-oath-krunner-${pkgver}"

    cmake --preset clang-release \
        -DBUILD_TESTING=OFF \
        -DENABLE_CLANG_TIDY=OFF

    cmake --build build-clang-release -j$(nproc)
}

package() {
    cd "${srcdir}/yubikey-oath-krunner-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build-clang-release
}
