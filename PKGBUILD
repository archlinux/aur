# Maintainer: Radu Ursache <radu@ursache.ro>
pkgname=kdecodexbar
pkgver=1.0.0
pkgrel=1
pkgdesc="AI Usage Tracker for KDE Plasma (Codex, Claude, Gemini, Antigravity)"
arch=('x86_64')
url="https://github.com/rursache/KDECodexBar"
license=('MIT')
depends=('qt6-base' 'kstatusnotifieritem' 'kcoreaddons' 'kconfig' 'ki18n' 'kwindowsystem')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/rursache/KDECodexBar/tar.gz/v${pkgver}")
sha256sums=('291f56442f6bae93b9613c529624886059fb27547163de282162573c89e1447c')

build() {
    cmake -B build -S "${srcdir}/KDECodexBar-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "${srcdir}/KDECodexBar-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
