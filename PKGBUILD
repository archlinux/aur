# Maintainer: VisiOffice
# Binary package of the published VisiCasts release tarball.
# Update with packaging/aur/update.sh (rewrites pkgver and sha256sums).
pkgname=visicasts-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Native podcast player with a local library and offline listening'
arch=('x86_64')
url='https://visicasts.com'
# Closed source: see LICENSE in the upstream repository.
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
sha256sums=('fc99067af8e47c56bd63ae4927f83df974c56ddbe4dca45260093c2d476275ac')

package() {
    local bundle="$srcdir/visicasts-$pkgver-linux-x86_64"
    install -Dm755 "$bundle/visicasts" "$pkgdir/usr/bin/visicasts"
    # The terminal interface ships in the tarball from 0.2.0.
    install -Dm755 "$bundle/visicasts-tui" "$pkgdir/usr/bin/visicasts-tui"
    install -Dm644 "$bundle/visicasts.desktop" "$pkgdir/usr/share/applications/visicasts.desktop"
    install -Dm644 "$bundle/visicasts.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/visicasts.svg"
    install -Dm644 "$bundle/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
