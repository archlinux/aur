# Maintainer: Andrej Radović <aur@andrejradovic.com>

pkgname=python-poetry-plugin-migrate
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc="Poetry plugin to migrate pyproject.toml from Poetry v1 to v2 (PEP-621 compliant)"
arch=('any')
url="https://github.com/zyf722/poetry-plugin-migrate"
license=('MIT')
depends=('python>=3.9' 'python<4.0' 'python-poetry>=2.0.0')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('c645a4755982afa6d19be1e2f7bef94377157151ce259d14057fa4061221b81c')

build() {
  cd "poetry_plugin_migrate-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "poetry_plugin_migrate-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
