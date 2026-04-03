# Maintainer: Radu Ursache <radu@ursache.ro>
pkgname=kdecodexbar
pkgver=1.0.5
pkgrel=1
pkgdesc="AI Usage Tracker for KDE Plasma (Codex, Claude, Gemini, Antigravity)"
arch=('x86_64')
url="https://github.com/rursache/KDECodexBar"
license=('MIT')
depends=('qt6-base' 'kstatusnotifieritem' 'kcoreaddons' 'kconfig' 'ki18n' 'kwindowsystem')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/rursache/KDECodexBar/tar.gz/v${pkgver}")
sha256sums=('5851a843a98fcb328ec9f3445aea9969a39b85fc533f53365d1831366c31966d')

build() {
    cmake -B build -S "${srcdir}/KDECodexBar-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPP_VERSION="v${pkgver}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${srcdir}/KDECodexBar-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
