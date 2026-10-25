# Maintainer: yuzujr <15568103056@163.com>

pkgname=coomer
pkgver=1.3.0
pkgrel=1
pkgdesc="Zoomer application for everyone on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/yuzujr/coomer"
license=('MIT')

depends=(
  'glibc'
  'libglvnd'
  'libx11'
  'libxrandr'
  'wayland'
  'libxkbcommon'
  'dbus'
)
optdepends=(
  'xdg-desktop-portal: portal screenshot backend'
)
makedepends=(
  'pkgconf'
  'make'
  'gcc'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c2c0b1eb5320bcf6a9a41d3f1f282728c99fd76413003a1e180a4d577574c2cd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make X11=1 WAYLAND=1 PORTAL=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    X11=1 WAYLAND=1 PORTAL=1 \
    install

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
