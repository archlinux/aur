# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: lxsycht <lux@systemli.org>

pkgname=metadata-cleaner
pkgver=2.5.2
pkgrel=1
pkgdesc="Python GTK application to view and clean metadata in files, using mat2"
arch=('x86_64')
url="https://gitlab.com/rmnvgr/metadata-cleaner"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'mat2' 'python-gobject')
makedepends=('itstool' 'meson')
checkdepends=('appstream' 'mypy' 'python-pycodestyle' 'python-pydocstyle' 'reuse' 'python-tomli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('8b00b3552d51b1475a1e6a14031deb8f761df009fe7cb72b913a07b31cec3d84')

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
