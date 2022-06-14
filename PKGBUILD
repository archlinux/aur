# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=cmos
pkgver=1.1
pkgrel=2
pkgdesc='Small markdown renderer based on CommonMark libcmark'
arch=(x86_64)
url='https://sr.ht/~bitfehler/cmos'
license=(MIT)
depends=(
  'libunistring'
  'cmark'
  'source-highlight'
)
makedepends=(git meson ninja)
provides=('cmos')
conflicts=('cmos-git')

source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/cmos/archive/v${pkgver}.tar.gz")
sha256sums=('580cf955bd63f676f25d1c6d4bbfdd25fe69d9788bc5b514d5f02e8579d06cd6')

build() {
  mkdir -p build
  arch-meson build "${pkgname}-v${pkgver}"
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  cd "${pkgname}-v${pkgver}"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et
