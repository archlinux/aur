# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=portfolio-file-manager
pkgver=0.9.13
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('x86_64' 'aarch64')
url="https://github.com/tchx84/Portfolio"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8f20ffbbfbec0a59e10e36d70ad97ba963ed4a3634358c495d9b13c297747197')

build() {
  arch-meson "Portfolio-$pkgver" build -Drun_service_tests=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s /usr/bin/dev.tchx84.Portfolio "$pkgdir/usr/bin/portfolio"
}
