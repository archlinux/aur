# Maintainer: AscendLiu <ascendliu@qq.com>

pkgname=cul-kde
pkgver=1.0.0
pkgrel=1
pkgdesc="KDE Plasma Wayland desktop control MCP server"
arch=('x86_64')
url="https://github.com/AscendLiu/cul-kde"
license=('MIT')
depends=(
  'kwin'
  'plasma-workspace'
  'at-spi2-core'
  'xdg-desktop-portal-kde'
  'libei'
)
makedepends=('rust' 'pkgconf')
install=cul-kde.install
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AscendLiu/cul-kde/archive/v$pkgver.tar.gz"
        "99-uinput.rules"
        "cul-kde.1")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/cul-kde "$pkgdir/usr/bin/cul-kde"

  install -Dm644 "$srcdir/99-uinput.rules" \
    "$pkgdir/etc/udev/rules.d/99-uinput.rules"

  install -Dm644 "$srcdir/cul-kde.1" \
    "$pkgdir/usr/share/man/man1/cul-kde.1"
}
