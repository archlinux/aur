# Maintainer: Joshua Cold <joshzcold@gmail.com>
# riptide-browser-bin: the Linux release tarball (the binary and the CEF runtime).
# The version and checksum are updated at each release.
pkgname=riptide-browser-bin
pkgver=0.11.0
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
sha256sums=('6a052c7cb9741f642de5d5063086e6c02b87b9375795bfad738e66549c3f5d1b')

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
    install -Dm644 LICENSE-EXCEPTION "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EXCEPTION"
}
