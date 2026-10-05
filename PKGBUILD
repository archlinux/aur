# Maintainer: Ignacio Perez <ignacio@feuer.me>

pkgname=dbflux
pkgver=0.8.7
pkgrel=1
pkgdesc="A fast, keyboard-first database client"
arch=('x86_64' 'aarch64')
# Upstream repository: https://github.com/0xErwin1/dbflux
url="https://dbflux.dev"
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

source_x86_64=("https://github.com/0xErwin1/dbflux/releases/download/v${pkgver}/dbflux-linux-amd64.tar.gz"{,.asc})
source_aarch64=("https://github.com/0xErwin1/dbflux/releases/download/v${pkgver}/dbflux-linux-arm64.tar.gz"{,.asc})

sha256sums_x86_64=('3af790b6a585a0e5b0507f42651fc7b9c51d1aecbb15eadb524aa0095d6e77a7'
                   'SKIP')
sha256sums_aarch64=('21cb102161bcfc5ec66bcaaf81755ebaa78640b185273e12fdc5e7084fd37152'
                    'SKIP')

validpgpkeys=('B39EB98E8860DAFB05670073A614B7D25134987A')

package() {
    install -Dm755 dbflux "${pkgdir}/usr/bin/dbflux"

    install -Dm644 resources/desktop/dbflux.desktop \
        "${pkgdir}/usr/share/applications/dbflux.desktop"
    sed -i -e 's|@EXEC_PATH@|/usr/bin/dbflux|g' \
        -e 's|@APP_NAME@|DBFlux|g' \
        -e 's|@APP_ID@|dbflux|g' \
        "${pkgdir}/usr/share/applications/dbflux.desktop"

    install -Dm644 resources/branding/stable/mark.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dbflux.svg"

    install -Dm644 resources/mime/dbflux-sql.xml \
        "${pkgdir}/usr/share/mime/packages/dbflux-sql.xml"
    sed -i 's|@APP_ID@|dbflux|g' \
        "${pkgdir}/usr/share/mime/packages/dbflux-sql.xml"

    install -Dm644 LICENSE-MIT \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
