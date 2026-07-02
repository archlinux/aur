# Maintainer: AuthenDesk Project
pkgname=authendesk
pkgver=1.0.1
pkgrel=1
pkgdesc="Desktop Two-Factor Authentication Token Manager (TOTP/HOTP)"
arch=('x86_64')
options=('!debug')
url="https://github.com/AscendLiu/AuthenDesk"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'openssl'
    'zbar'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'gcc'
    'ninja'
    'pkgconf'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AscendLiu/AuthenDesk/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=authendesk.install

build() {
    cd "AuthenDesk-$pkgver"
    cmake -B build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_DATADIR=share
    cmake --build build --parallel $(nproc) --config Release
}

package() {
    cd "AuthenDesk-$pkgver"
    install -Dm755 build/AuthenDesk "${pkgdir}/usr/bin/AuthenDesk"
    install -Dm644 assets/app_icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/authendesk.png"
    install -Dm644 assets/authendesk.desktop "${pkgdir}/usr/share/applications/authendesk.desktop"
}
