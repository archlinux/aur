# Maintainer: Lubosz Sarnecki <lubosz ! gmail ! com>

pkgname=minigbs-git
pkgver=1.4.2+0+gd880bfc
pkgrel=1
pkgdesc="Small .gbs chiptune player for Linux."
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/baines/MiniGBS"
depends=('alsa-lib' 'ncurses')
makedepends=('git' 'make' 'libx11')
optdepends=('libx11: Oscilloscope')
provides=("minigbs="$pkgver)
replaces=("minigbs")
conflicts=("minigbs")
source=('git+https://github.com/baines/MiniGBS.git')
sha256sums=('SKIP')

pkgver() {
  cd MiniGBS
  git describe --tags --long | sed 's/-/+/g'
}

prepare() {
  cd MiniGBS

  # Install to /usr
  sed -i 's|/usr/local|/usr|' Makefile
}

build() {
  cd MiniGBS
  make
}

package() {
  cd MiniGBS
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
