# Maintainer: Joshua Cold <joshzcold@gmail.com>
# riptide-browser-bin: the Linux release tarball (the binary and the CEF runtime).
# The version and checksum are updated at each release.
pkgname=riptide-browser-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Keyboard-driven web browser with vim-like bindings, built on CEF"
arch=('x86_64')
url="https://joshzcold.github.io/riptide/"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'gtk3' 'hicolor-icon-theme'
         'libcups' 'libdrm' 'libxcomposite' 'libxdamage' 'libxkbcommon' 'libxrandr' 'mesa'
         'nspr' 'nss' 'pango' 'systemd-libs')
provides=('riptide-browser')
conflicts=('riptide-browser' 'riptide' 'riptide-bin')
options=('!strip' '!debug')
source=("https://github.com/joshzcold/riptide/releases/download/v${pkgver}/riptide-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('a19c8d43154c906be23f94c895e0f79280c03590ee5af09179b6e724d9133e4e')

package() {
    cd "riptide-${pkgver}-linux-x86_64" || return 1
    install -d "$pkgdir/opt/riptide" "$pkgdir/usr/bin"
    cp -a . "$pkgdir/opt/riptide/"
    # The sandbox helper must be setuid root when the kernel doesn't allow
    # unprivileged user namespaces; Arch allows them, so this is a fallback.
    chmod 4755 "$pkgdir/opt/riptide/chrome-sandbox"
    ln -s /opt/riptide/riptide "$pkgdir/usr/bin/riptide"
    install -Dm644 riptide.desktop "$pkgdir/usr/share/applications/riptide.desktop"
    install -Dm644 riptide.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/riptide.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
