# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
#
# Prospero: a new coding harness for a more civilized age
# https://nullprogram.com/blog/2026/10/31/
pkgname=prospero-bin
pkgver=0.21.0
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
sha256sums_x86_64=('a2505a8c4584b4181e0d7e0f1177bd488861f2058cff4163bcd866160798e684')
sha256sums_aarch64=('d9c57bfff1096f24f1de96541bf8c9097a4e4bf52942ed81bab747a948b56318')

package() {
  cd "$srcdir/prospero-$pkgver-linux-$CARCH"
  install -Dm755 prospero "$pkgdir/usr/bin/prospero"
  install -Dm644 prospero.desktop "$pkgdir/usr/share/applications/prospero.desktop"
  install -Dm644 prospero.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/prospero.png"
  install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSES/*.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
