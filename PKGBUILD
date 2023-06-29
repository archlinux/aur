# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
pkgname=hyprpicker
pkgver=0.1.1
pkgrel=2
pkgdesc="A wlroots-compatible Wayland color picker that does not suck."
arch=(x86_64)
url="https://github.com/hyprwm/hyprpicker"
license=('BSD')
depends=('cairo' 'wayland')
optdepends=('wl-clipboard: Allows --autocopy to automatically copy the output to the clipboard.')
makedepends=('cmake'
             'gdb'
             'git'
             'libglvnd'
             'libjpeg-turbo'
             'meson'
             'ninja'
             'pango'
             'wayland-protocols'
             'xorgproto'
             )
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f6a5e57dc69e3b0499a34f4533583bd7d7770f5a1a9834f521b532f0d1ec26e0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/hyprpicker "$pkgdir/usr/bin/hyprpicker"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 doc/hyprpicker.1 "$pkgdir/usr/share/man/man1/hyprpicker.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
