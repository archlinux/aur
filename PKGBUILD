# Maintainer: Novaturiente
pkgname=novabrowser-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="AVX2-optimized keyboard-driven web browser on Chromium (CEF), configured in TypeScript (prebuilt)"
arch=(x86_64)
url="https://github.com/Novaturiente/nova-browser"
license=(GPL-3.0-or-later)
depends=(sqlite gtk3 nss alsa-lib libxss libxkbcommon libdrm mesa libcups at-spi2-core)
optdepends=('wl-clipboard: primary selection and paste on Wayland'
            'xclip: primary selection and paste on X11'
            'xdg-utils: download-open and default-browser setup'
            'aria2: faster downloads (8 connections), resume after restart, magnet links and torrents'
            'rbw: Bitwarden passwords'
            'pass: password-store passwords')
provides=(novabrowser)
conflicts=(novabrowser novabrowser-git)
options=(!strip !debug)
# The /usr tree of the `novabrowser` package, built by packaging/release.sh
source=("novabrowser-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/novabrowser-$pkgver-x86_64.tar.zst")
sha256sums=('55282a78966bcb8f1d7c903ecbf1e197a77113918c395ceda13ec8e363d9f832')

prepare() {
  /lib/ld-linux-x86-64.so.2 --help 2>/dev/null | grep -q 'x86-64-v3 (supported' || {
    error "novabrowser needs an x86-64-v3 CPU (AVX2: Intel Haswell / AMD Excavator or newer)"
    return 1
  }
}

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
