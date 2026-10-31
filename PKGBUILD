# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=prospero-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Native GUI for running and supervising AI coding agents (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/skeeto/prospero'
license=('Unlicense')
depends=('glibc>=2.34' 'ca-certificates' 'libglvnd' 'libxkbcommon' 'wayland'
         'hicolor-icon-theme')
optdepends=('libxtst: X11 desktop control'
            'libei: Wayland desktop input'
            'libpipewire: Wayland desktop screenshots'
            'xdg-desktop-portal: Wayland desktop control'
            'openssh: remote engines over SSH')
provides=("prospero=$pkgver")
conflicts=('prospero')
options=(!strip !debug)
source_x86_64=("$url/releases/download/v$pkgver/prospero-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/prospero-$pkgver-linux-aarch64.tar.gz")
sha256sums_x86_64=('2cc5171d62f4eb0fbd9c394afaf3d9e098da033d602b7b94e669e152eaa23086')
sha256sums_aarch64=('68ed62c6c94857f288d3e0c9ff5fa1d6c45288a17afa0d2ccb48ee23087a1704')

package() {
  cd "$srcdir/prospero-$pkgver-linux-$CARCH"
  install -Dm755 prospero "$pkgdir/usr/bin/prospero"
  install -Dm644 prospero.desktop "$pkgdir/usr/share/applications/prospero.desktop"
  install -Dm644 prospero.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/prospero.png"
  install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSES/*.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
