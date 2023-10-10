# Maintainer: Gerard Ribugent <ribugent at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=python-databricks-cli
_pkgname=databricks-cli
pkgver=0.18.0
pkgrel=1
pkgdesc='Command Line Interface for Databricks'
arch=('any')
url='https://github.com/databricks/databricks-cli'
license=('Apache')
depends=(
  'python>3.7'
  'python-click>=7.0'
  'python-pyjwt>=1.7.0'
  'python-oauthlib>=3.1.0'
  "python-requests>=2.17.3"
  'python-tabulate>=0.7.7'
  'python-six>=1.10.0'
  'python-urllib3>=1.26.7' 'python-urllib3<3'
)
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/databricks/databricks-cli/archive/$pkgver.tar.gz")
sha512sums=('dcd67de2716dfd9d744bf2375fd69c74469084ab009ea90f62d1b8546ccde0a4f1db6a600caeca34e1dc22b9fae1ea89d6a7936fa54b7cd3ce002c4b4a60c63d')
install="${pkgname}.install"


build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
