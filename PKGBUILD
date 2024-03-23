# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=portfolio-file-manager
pkgver=1.0.1
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('any')
url="https://github.com/tchx84/Portfolio"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib' 'python-black' 'python-pyflakes' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7568afbdfae9a0508e2a4ab1aaf732f3458b5f83231be0cbe03c2d68d3db561b')

build() {
  arch-meson "Portfolio-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s /usr/bin/dev.tchx84.Portfolio "$pkgdir/usr/bin/portfolio"
}
