# Maintainer: windstone <notwindstone@gmail.com>
pkgname=kaede
pkgver=0.0.1
pkgrel=1
pkgdesc="A Minecraft Launcher with plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/kaede-basement/kaede"
license=('GPL-3.0-only')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/${pkgver}/kaede_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/${pkgver}/kaede_aarch64.app.tar.gz")
sha256sums_x86_64=('0a8bb66e79d1a24922dc480c1ebc2b3fedd3bc804581df014d16446bc2b66918')
sha256sums_aarch64=('5b95e58a8f0cfc43654d5d8226885b6490194b998811e84251112b69bb1a52c4')

package() {
    cd "$srcdir"
    case "$CARCH" in
        x86_64)
            cd "$srcdir"
            ar x "kaede_${pkgver}_amd64.deb"
            tar -xzf data.tar.gz -C "$pkgdir"
            rm -f control.tar.gz data.tar.gz debian-binary
            ;;
        aarch64)
            tar -xzf "kaede_aarch64.app.tar.gz" -C "$pkgdir"
            ;;
    esac
}
