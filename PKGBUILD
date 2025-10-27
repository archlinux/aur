# Maintainer: Jurek Kołosowski <jurek@kolosowscy.pl>
pkgname=krunner-yubikey-oath
pkgver=1.0.1
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
sha256sums=('3f62b3082919f93d4d506fe7d8db6f0781067f3564e48f6552b9027c2978b5d7')

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
