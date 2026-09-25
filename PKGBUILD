# Maintainer: Douglas de Moura <douglasdemoura@users.noreply.github.com>
pkgname=disktree-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A treemap for finding and removing what fills your disk, for Omarchy. Rust + GPUI (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/tobi/disktree"
license=('MIT')
depends=('gcc-libs' 'wayland' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb'
         'libglvnd')
optdepends=('mesa: GL driver for rendering (or your GPU vendor driver)'
            'trash-cli: move marked files to the trash with trash-put'
            'glib2: move marked files to the trash with gio trash')
provides=("disktree=$pkgver")
conflicts=('disktree')
source_x86_64=("$pkgname-$pkgver-x86_64-linux.tar.gz::https://github.com/tobi/disktree/releases/download/v$pkgver/disktree-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64-linux.tar.gz::https://github.com/tobi/disktree/releases/download/v$pkgver/disktree-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('d3055705b4c9d9aee5b54fa3fb774bf5d54dbbfddb6f6850f077a4634936a6e9')
sha256sums_aarch64=('bd7e2bce950c1d3e33e73ef640e950cac88998b540f326cccb6be87436bc47e8')

package() {
  cd "disktree-$pkgver-$CARCH-linux"
  install -Dm755 disktree "$pkgdir/usr/bin/disktree"
  install -Dm644 disktree.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/disktree.svg"
  sed -e 's|@BINDIR@|/usr/bin|g' -e "s|@VERSION@|$pkgver|g" \
    disktree.desktop.in > "disktree.desktop"
  install -Dm644 "disktree.desktop" \
    "$pkgdir/usr/share/applications/disktree.desktop"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
