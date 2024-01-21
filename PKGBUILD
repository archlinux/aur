# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=portfolio-file-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('any')
url="https://github.com/tchx84/Portfolio"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib' 'python-black' 'python-pyflakes' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9f884c17eccd53fce1e3eb6fdd189dbdb148ba7b4a767be0731cbee5567ce9be')

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
