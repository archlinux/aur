# Maintainer: Michal Skorupka <michal@skorupka.me>
pkgname=c64uv
pkgver=0.4.0
pkgrel=1
pkgdesc="Viewer for the C64 Ultimate / Ultimate 64: video and audio streaming, remote keyboard, gamepad, mouse and menu"
arch=('x86_64' 'aarch64')
url="https://github.com/crustovsky/C64UV"
license=('MIT')
depends=('sdl3' 'curl' 'iputils' 'hicolor-icon-theme')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ead06b12ceaec4c39ecef6188ee7df8c028daa862681291722cf95b4f94353d4')

build() {
  cd "C64UV-$pkgver"
  make
}

check() {
  cd "C64UV-$pkgver"
  make test
}

package() {
  cd "C64UV-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
