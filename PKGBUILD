# Maintainer: Enzo Einhorn <enzo.einh@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-extensions-cli
pkgver=0.10.8
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
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
optdepends=('python-dbus: communicate with GNOME Shell directly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cbc357548deb8449ade6edf2ab724cd64ef2682b4191ecb25f2abd357fcf5410')

build() {
  cd "$pkgname-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
