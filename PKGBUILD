# Maintainer: AuthenDesk Project
pkgname=authendesk
pkgver=1.0.0.r3.g9643d19
pkgrel=1
pkgdesc="Desktop 2FA TOTP Authenticator (based on Qt6 + QML)"
arch=('x86_64')
url="https://gitee.com/AscendLiu/AuthenDesk"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-declarative'
    'openssl'
    'zbar'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'gcc'
    'git'
)
source=("${pkgname}::git+ssh://git@gitee.com/AscendLiu/AuthenDesk.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build --parallel $(nproc)
}

package() {
    cd "${pkgname}"

    install -Dm755 build/AuthenDesk "${pkgdir}/usr/bin/AuthenDesk"
    install -Dm644 assets/app_icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/authendesk.png"
    install -Dm644 assets/authendesk.desktop "${pkgdir}/usr/share/applications/authendesk.desktop"
}
