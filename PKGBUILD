# Maintainer: Enzo Einhorn <enzo.einh@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-extensions-cli
pkgver=0.10.5
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
sha256sums=('2522bc31878e6a5174ec1c803b600290995bb794b9b74a62d2bc9001b7ae1662')

build() {
  cd "$pkgname-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
