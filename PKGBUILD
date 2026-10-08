# Maintainer: Arnaud Gissinger <agissing@student.42.fr>
pkgname=pen-dev-bin
pkgver=1.2.16
pkgrel=1
pkgdesc='Pen: AI-powered design canvas (formerly Pencil) (bin)'
arch=('x86_64' 'aarch64')
url='https://www.pen.dev'
license=('LicenseRef-Pen-EULA')
provides=("pen-dev=$pkgver" "pencil-dev=$pkgver")
conflicts=('pen-dev' 'pen-dev-appimage' 'pencil-dev' 'pencil-dev-bin' 'pencil-dev-appimage')
options=('!strip' '!debug')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc'
         'gtk3' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
_release="https://github.com/highagency/pen-desktop-releases/releases/download/v${pkgver}"
source=('pen-dev.desktop' 'pen-dev.png' 'LICENSE')
sha256sums=(
    '8d8a5cacedc15daea8974cbf6e33edaace4b9542a2117cf1df082dd413a00138'
    '5898e0189970c8995fc14978ad9b91483d787d2842a01369e29da928b49cc75a'
    '42b82acedd61dfb095f44aaadbc58b703fabaa1c25d60b6e133231a0c70c8c53'
)
source_x86_64=("${_release}/Pen-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('fff138d6f7b8ada69a6e6e9473e7e22408602f85287ec5f87b8339c4de405541')
source_aarch64=("${_release}/Pen-${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('f54010f6403862436715e0371f7e2e2ec04f15ade3091a65c125d96afbe0477e')

package() {
    local upstream_arch=x64
    [[ $CARCH == aarch64 ]] && upstream_arch=arm64
    install -d "$pkgdir/opt/pen-dev" "$pkgdir/usr/bin"
    cp -a "$srcdir/Pen-$pkgver-linux-$upstream_arch/." "$pkgdir/opt/pen-dev/"
    chmod 4755 "$pkgdir/opt/pen-dev/chrome-sandbox"
    ln -s /opt/pen-dev/pen "$pkgdir/usr/bin/pen-dev"
    ln -s pen-dev "$pkgdir/usr/bin/pencil-dev"
    ln -s "resources/app.asar.unpacked/out/mcp-server-linux-$upstream_arch" "$pkgdir/opt/pen-dev/mcp-server"
    install -Dm644 "$srcdir/pen-dev.desktop" "$pkgdir/usr/share/applications/pen-dev.desktop"
    install -Dm644 "$srcdir/pen-dev.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pen-dev.png"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
