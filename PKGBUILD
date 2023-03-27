# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=portfolio-file-manager
pkgver=0.9.15
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('x86_64' 'aarch64')
url="https://github.com/tchx84/Portfolio"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b05d9cf5f2c92abdc45e81045c77313a457af6e73eefe5d253d2571e71970c35')

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
