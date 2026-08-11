# Maintainer: Ignacio Perez <ignacio@feuer.me>

pkgname=dbflux
pkgver=0.7.3
pkgrel=1
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

source_x86_64=("${url}/releases/download/v${pkgver}/dbflux-linux-amd64.tar.gz"{,.asc})
source_aarch64=("${url}/releases/download/v${pkgver}/dbflux-linux-arm64.tar.gz"{,.asc})

sha256sums_x86_64=('b18c1c7c6d10b4dc1cdc38bf1d079f8f85d22ad25f81ce1129a458e500de2efb'
                   'SKIP')
sha256sums_aarch64=('0433c6fd51a903e3da68f8fa3a01ac3f536a0143bed800278a284b019debe9c4'
                    'SKIP')

validpgpkeys=('B39EB98E8860DAFB05670073A614B7D25134987A')

package() {
    install -Dm755 dbflux "${pkgdir}/usr/bin/dbflux"

    install -Dm644 resources/desktop/dbflux.desktop \
        "${pkgdir}/usr/share/applications/dbflux.desktop"
    sed -i 's|@EXEC_PATH@|/usr/bin/dbflux|g' \
        "${pkgdir}/usr/share/applications/dbflux.desktop"

    install -Dm644 resources/branding/stable/mark.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dbflux.svg"

    install -Dm644 resources/mime/dbflux-sql.xml \
        "${pkgdir}/usr/share/mime/packages/dbflux-sql.xml"

    install -Dm644 LICENSE-MIT \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
