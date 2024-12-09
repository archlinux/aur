# Maintainer: envolution
# Contributor: mdaniels5757 <arch at mdaniels dot me>
# Contributor: jskier <jay @jskier.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-secrets-manager-core
pkgver=16.6.6
pkgrel=1
_pypifilestem=${pkgname//-/_}
pkgdesc="Python SDK for Keeper Secrets Manager"
arch=('any')
url="https://pypi.org/project/keeper-secrets-manager-core/"
license=('MIT')
depends=('python'
  'python-requests>=2.28.2'
  'python-cryptography>=39.0.1'
  'python-importlib-metadata>=6.0.0'
)
makedepends=('python-setuptools')
source=("$_pypifilestem-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/$_pypifilestem/$_pypifilestem-$pkgver.tar.gz")
sha256sums=('bda9e733908b34edbac956825fc062e6934894f210d49b0bba1679d167d7be80')

build() {
  cd "$_pypifilestem-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$_pypifilestem-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
