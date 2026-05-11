# Maintainer: Ignacio Perez <ignacio@feuer.me>

pkgname=dbflux
pkgver=0.4.7
pkgrel=3
pkgdesc="A fast, keyboard-first database client"
arch=('x86_64' 'aarch64')
url="https://github.com/0xErwin1/dbflux"
license=('MIT' 'Apache-2.0')
depends=(
    'glibc'
    'openssl'
    'zstd'
    'zlib'
    'fontconfig'
    'freetype2'
    'wayland'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libx11'
    'libxcb'
    'libxcursor'
    'libxrandr'
    'libxi'
    'vulkan-icd-loader'
    'alsa-lib'
    'libgit2'
    'curl'
    'libsecret'
    'libssh2'
    'dbus'
    'tree-sitter'
    'hicolor-icon-theme'
)

source_x86_64=("${url}/releases/download/v${pkgver}/dbflux-linux-amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/dbflux-linux-arm64.tar.gz")

sha256sums_x86_64=('ef8cd737d5c3783b43281fed94689b24237f3cc2cd1c2d1d06fc5dfe3da487f5')
sha256sums_aarch64=('de8dde2c23edda17f1f3897b6cf0b56e476740f11134ab8e1ab02e309e6893b2')

package() {
    install -Dm755 dbflux "${pkgdir}/usr/bin/dbflux"

    install -Dm644 resources/desktop/dbflux.desktop \
        "${pkgdir}/usr/share/applications/dbflux.desktop"
    sed -i 's|@EXEC_PATH@|/usr/bin/dbflux|g' \
        "${pkgdir}/usr/share/applications/dbflux.desktop"

    install -Dm644 resources/icons/dbflux.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dbflux.svg"

    install -Dm644 resources/mime/dbflux-sql.xml \
        "${pkgdir}/usr/share/mime/packages/dbflux-sql.xml"

    install -Dm644 LICENSE-MIT \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
