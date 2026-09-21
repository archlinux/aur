# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
pkgname=python-pybricksdev
_name=pybricksdev
pkgver=2.3.2
pkgrel=1
pkgdesc="Pybricks developer tools: compile, run and flash firmware on LEGO hubs"
arch=('any')
url="https://github.com/pybricks/pybricksdev"
license=('MIT')
depends=('python' 'python-argcomplete' 'python-bleak' 'python-mpy-cross-v5' 'python-mpy-cross-v6'
         'python-tqdm' 'python-pyusb' 'python-semver' 'python-appdirs' 'python-prompt_toolkit'
         'python-packaging' 'python-typing_extensions' 'python-reactivex' 'python-hidapi'
         'python-pybricks' 'python-questionary')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7c060ce60dbdde96fb6544dfbcd8cd51dcb2d4d7d5cd5796dd79c40f0287e765')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
