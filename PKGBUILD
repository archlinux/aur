# Maintainer: Enzo Einhorn <enzo.einh@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-extensions-cli
pkgver=0.10.1
pkgrel=1
pkgdesc="Command line tool to manage your GNOME Shell extensions"
arch=('any')
url="https://github.com/essembeh/gnome-extensions-cli"
license=('Apache-2.0')
depends=(
  'python-colorama'
  'python-gobject'
  'python-packaging'
  'python-pydantic'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
optdepends=(
  'python-dbus: communicate with GNOME Shell directly'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0695ce3e88713a8c96fe8399ed069bd39b5264b97d92ae29fdaed4cd652e29d2')

build() {
  cd "$pkgname-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
