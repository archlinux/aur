# Maintainer: yuzujr <15568103056@163.com>

pkgname=coomer
pkgver=1.2.1
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
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('286a8e223943beaaac8a93253ef4ff0422e3dfe6d192e27f31136f7b8e1ee743')

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
