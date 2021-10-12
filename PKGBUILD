# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: lxsycht <lux@systemli.org>

pkgname=metadata-cleaner
pkgver=2.0.1
pkgrel=1
pkgdesc="Python GTK application to view and clean metadata in files, using mat2"
arch=('x86_64')
url="https://gitlab.com/rmnvgr/metadata-cleaner"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'mat2' 'python-gobject')
makedepends=('itstool' 'meson')
checkdepends=('appstream' 'mypy' 'python-pycodestyle' 'python-pydocstyle' 'reuse')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('9a52c06680729cfc4de4a7bc24e9c2ae19930892b4130a57c4fa7db1d496709c')

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
