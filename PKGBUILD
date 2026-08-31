# Maintainer: Wael Amrani Zerrifi <waelaz1983@gmail.com>

pkgname=pacterm
pkgver=1.3.9
pkgrel=2
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
sha256sums=('613e0615545f6f5773ff43e18f9068aced493a935dd92d81d2713496f9dcaad7'
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
