# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
#
# Prospero: a new coding harness for a more civilized age
# https://nullprogram.com/blog/2026/10/31/
pkgname=prospero-bin
pkgver=0.16.1
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
sha256sums_x86_64=('8a71640eb2fede4935c53133476c9734079adc80b4a4bcf5567e47d9e22cc0a6')
sha256sums_aarch64=('b8f888263bec76d110e26fd4964f92ed6f8e5ab8b3f279076f5d98a2383fcd10')

package() {
  cd "$srcdir/prospero-$pkgver-linux-$CARCH"
  install -Dm755 prospero "$pkgdir/usr/bin/prospero"
  install -Dm644 prospero.desktop "$pkgdir/usr/share/applications/prospero.desktop"
  install -Dm644 prospero.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/prospero.png"
  install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSES/*.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
