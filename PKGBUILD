# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: lxsycht <lux@systemli.org>

pkgname=metadata-cleaner
pkgver=2.5.6
pkgrel=1
pkgdesc="Python GTK application to view and clean metadata in files, using mat2"
arch=('x86_64')
url="https://gitlab.com/rmnvgr/metadata-cleaner"
license=(' GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'mat2' 'python-gobject')
makedepends=('itstool' 'meson')
checkdepends=('appstream' 'mypy' 'python-pycodestyle' 'python-pydocstyle' 'reuse' 'python-tomli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c74f28f212278f6c5db9ae76c6624580ffe70f7e0cb055087e1ceef16b9d391a')

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
