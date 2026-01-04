# Maintainer: Radu Ursache <radu@ursache.ro>
pkgname=kdecodexbar
pkgver=1.0.1
pkgrel=1
pkgdesc="AI Usage Tracker for KDE Plasma (Codex, Claude, Gemini, Antigravity)"
arch=('x86_64')
url="https://github.com/rursache/KDECodexBar"
license=('MIT')
depends=('qt6-base' 'kstatusnotifieritem' 'kcoreaddons' 'kconfig' 'ki18n' 'kwindowsystem')
makedepends=('cmake' 'extra-cmake-modules' 'qt6-tools' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/rursache/KDECodexBar/tar.gz/v${pkgver}")
sha256sums=('1642e6d0359a8039c8f6d7d5cee457a13ab56eaf840df93dd595beb78123dc98')

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
