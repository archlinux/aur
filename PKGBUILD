# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: lxsycht <lux@systemli.org>
pkgname=metadata-cleaner
pkgver=2.0.0
pkgrel=1
pkgdesc="Python GTK application to view and clean metadata in files, using mat2"
arch=('x86_64')
url="https://metadatacleaner.romainvigier.fr"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'mat2' 'python-gobject')
makedepends=('itstool' 'meson')
checkdepends=('appstream' 'mypy' 'python-pycodestyle' 'python-pydocstyle' 'reuse')
source=("https://gitlab.com/rmnvgr/metadata-cleaner/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('035604849bf1d7a1b2e6315a0f643c4c45e3221546e24f97b28d38960ed79c18')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
