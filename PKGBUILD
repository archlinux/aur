# Maintainer: Junjie <junjie@omni-stream.ai>
pkgname=omni-code-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Flutter desktop client for managing Omni Code bridge sessions"
arch=('x86_64')
url="https://github.com/omni-stream-ai/omni-code"
license=('MIT')
depends=('gcc-libs' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'gtk3')
provides=('omni-code')
conflicts=('omni-code')
source=("omni-code.desktop"
        "omni-code.png"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/omni-stream-ai/omni-code/v${pkgver}/LICENSE")
source_x86_64=("omni-code-$pkgver-linux-x86_64.tar.gz::https://github.com/omni-stream-ai/omni-code/releases/download/v${pkgver}/omni-code-linux-x86_64.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            'ed59c1da82265d3d408c7c47ebdfd1af041ab847e68692387189487dc60a9713')
sha256sums_x86_64=('a93f48d565777c1ce7ac3d325fec03316414cb4b8e417319fbc0b94edf021439')

package() {
    install -d "$pkgdir/opt/omni-code"
    cp -a "$srcdir/omni-code-linux-x86_64/." "$pkgdir/opt/omni-code/"

    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/omni-code.desktop" "$pkgdir/usr/share/applications/omni-code.desktop"
    install -Dm644 "$srcdir/omni-code.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/omni-code.png"

    install -d "$pkgdir/usr/bin"
    ln -sf "/opt/omni-code/omni_code" "$pkgdir/usr/bin/omni-code"
}
