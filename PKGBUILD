# Maintainer: Julien Virey <julien.virey@gmail.com>
pkgname=xdgctl
pkgdesc='TUI for managing XDG default applications'
pkgver=1.1
pkgrel=1
url=https://github.com/mitjafelicijan/xdgctl
license=(BSD-2-Clause)
depends=(glib2)
makedepends=(gcc)
arch=(x86_64)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('7c26adbff881ca15bf0801fce9016a02d52b331ebf40d57c677a1c054242648e')
build() {
  cd "$pkgname-$pkgver"
  gcc $CFLAGS $(pkg-config --cflags gio-2.0 gio-unix-2.0) -o xdgctl main.c $(pkg-config --libs gio-2.0 gio-unix-2.0) $LDFLAGS
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 xdgctl "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
