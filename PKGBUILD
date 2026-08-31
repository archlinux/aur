# Maintainer: Wael Amrani Zerrifi <waelaz1983@gmail.com>

pkgname=pacterm
pkgver=1.4.0
pkgrel=1
pkgdesc="A terminal-based Pac-Man game written in C++23"
arch=('x86_64' 'aarch64')
url="https://github.com/Wael-MA/pacterm"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('gcc' 'make')
provides=('pacterm')
conflicts=('pacterm-bin' 'pacterm-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "pacterm.desktop"
        "PacTermIcon.png::$url/raw/main/img/PacTermIcon.png")
sha256sums=('b27b0f86a189ffd504809771a6068647ca56037bff49408ea833ef31fbc10864'
            '8aba3bab75da0890862cfcefc0742cb27ffca4673a6fe812c72cd13dd79f136e'
            '7bbb0a52c7080a125036a2e4c09733f0dda578dda91a19a1afc95e5262add195')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 "$srcdir/pacterm.desktop" "$pkgdir/usr/share/applications/pacterm.desktop"
  install -Dm644 "$srcdir/PacTermIcon.png" "$pkgdir/usr/share/pixmaps/pacterm.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
