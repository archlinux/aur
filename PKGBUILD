# Maintainer: VisiOffice
# Binary package of the published VisiCasts release tarball.
# Update with packaging/aur/update.sh (rewrites pkgver and sha256sums).
pkgname=visicasts-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Native podcast player with a local library and offline listening'
arch=('x86_64')
url='https://visicasts.com'
# Upstream has not selected a distribution license yet.
license=('LicenseRef-Proprietary')
# Runtime dependencies, checked with ldd against the published binary
# (direct NEEDED: libxcb, libxkbcommon, libxkbcommon-x11, libmpv;
# the rest are the libraries GPUI and libmpv load at runtime).
depends=('mpv>=1:0.38' 'glibc' 'gcc-libs' 'fontconfig' 'freetype2'
         'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcb'
         'vulkan-icd-loader' 'openssl' 'alsa-lib' 'glib2' 'zlib' 'zstd')
optdepends=('vulkan-driver: GPU driver for the GPUI renderer')
provides=('visicasts')
conflicts=('visicasts')
options=('!strip' '!debug')
source=("https://downloads.visicasts.com/releases/$pkgver/visicasts-$pkgver-linux-x86_64.tar.gz")
sha256sums=('7a244d73d335e1f837818b18b3e8a8af660a66afd844e77b5a795eba3b89175e')

package() {
    local bundle="$srcdir/visicasts-$pkgver-linux-x86_64"
    install -Dm755 "$bundle/visicasts" "$pkgdir/usr/bin/visicasts"
    install -Dm644 "$bundle/visicasts.desktop" "$pkgdir/usr/share/applications/visicasts.desktop"
    install -Dm644 "$bundle/visicasts.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/visicasts.svg"
    install -Dm644 "$bundle/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
