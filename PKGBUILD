# Maintainer: James Clarke <james@jamesdavidclarke.com>
# Maintainer: gf <guyxfreeman at gmail dot com>

pkgname=pearai-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Open-source AI-powered code editor"
arch=('x86_64')
url="https://trypear.ai"
license=('MIT')
depends=(
    'dbus' 'glib2' 'krb5' 'hicolor-icon-theme' 'libxfixes'
    'gtk3' 'nss' 'libxdamage' 'atk' 'libxext'
    'cairo' 'mesa' 'libxcb' 'at-spi2-atk' 'cups'
    'libx11' 'nspr' 'libxcomposite' 'glibc' 'alsa-lib'
    'libxrandr' 'libdrm' 'libxkbfile' 'pango'
    'at-spi2-core' 'libxkbcommon'
)
source=("https://pearai-app.nyc3.digitaloceanspaces.com/PearAI-latest/linux/PearAI-avx2.tar.gz")
sha256sums=('33de7acaae3627e63686802896ae8cdd0a501bdc82dc22531954a8dc9446a964')
install=$pkgname.install

package() {
    install -dm755 "$pkgdir/opt/PearAI"
    tar -xzf "$srcdir/PearAI/source/PearAI.tar.gz" -C "$pkgdir/opt/PearAI/"

    install -Dm644 "$srcdir/PearAI/utils/PearAI.desktop" "$pkgdir/usr/share/applications/PearAI.desktop"
    install -Dm644 "$srcdir/PearAI/utils/PearAI-url-handler.desktop" "$pkgdir/usr/share/applications/PearAI-url-handler.desktop"
    install -Dm644 "$srcdir/PearAI/utils/pearAI.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/pearAI.png"

    # Create symlink in /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "/opt/PearAI/bin/PearAI" "$pkgdir/usr/bin/PearAI"

    # Set permissions for chrome-sandbox
    if [ -f "$pkgdir/opt/PearAI/chrome-sandbox" ]; then
        chmod 4755 "$pkgdir/opt/PearAI/chrome-sandbox"
    fi

    # Copy additional resources
    if [ -d "$pkgdir/opt/PearAI/resources" ]; then
        cp -r "$pkgdir/opt/PearAI/resources/"* "$pkgdir/opt/PearAI/"
    fi
}
