# Maintainer: Gerard Ribugent <ribugent at gmail dot com>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=python-databricks-cli
_pkgname=databricks-cli
pkgver=0.17.7
pkgrel=4
pkgdesc='Command Line Interface for Databricks'
arch=('any')
url='https://github.com/databricks/databricks-cli'
license=('Apache')
depends=(
  'python>3.6'
  'python-click>=7.0'
  'python-pyjwt>=1.7.0'
  'python-oauthlib>=3.1.0'
  "python-requests>=2.17.3" "python-requests<2.30.0" # https://github.com/databricks/databricks-cli/issues/636
  'python-tabulate>=0.7.7'
  'python-six>=1.10.0'
  'python-urllib3>=1.26.7' 'python-urllib3<2.0.0'
)
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/databricks/databricks-cli/archive/$pkgver.tar.gz")
sha512sums=('18719493b3c42cd0bab5a98c372134e74a89a3522ab42d15822f11ab7d500558fd6dfd36717d21477d7e3a1eda789ede5c943387110d446a96f304a3845ae0ee')


build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
