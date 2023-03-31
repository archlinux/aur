# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: lxsycht <lux@systemli.org>

pkgname=metadata-cleaner
pkgver=2.5.1
pkgrel=1
pkgdesc="Python GTK application to view and clean metadata in files, using mat2"
arch=('x86_64')
url="https://gitlab.com/rmnvgr/metadata-cleaner"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'mat2' 'python-gobject')
makedepends=('itstool' 'meson')
checkdepends=('appstream' 'mypy' 'python-pycodestyle' 'python-pydocstyle' 'reuse' 'python-tomli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('9057e0bcf90f5a9a2e646adde806d0375867b7bf23f97787f2573974447f5d2a')

build() {
  arch-meson "$pkgname-v$pkgver" "$pkgname-$pkgver"
  meson compile -C "$pkgname-$pkgver"
}

check() {
  meson test -C "$pkgname-$pkgver" --print-errorlogs
}

package() {
  meson install -C "$pkgname-$pkgver" --destdir "$pkgdir"
}
