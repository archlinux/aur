# Maintainer: Christian Pfeiffer <cpfeiffer@rev-crew.info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=python-a2s
pkgver=1.4.2
pkgrel=1
pkgdesc="Python package for querying Source and GoldSource servers"
arch=('any')
url="https://pypi.org/project/python-a2s"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
_upstream_name="${pkgname//-/_}"
source=("https://files.pythonhosted.org/packages/source/${_upstream_name::1}/${_upstream_name}/${_upstream_name}-$pkgver.tar.gz")
sha512sums=('a505e8b9bb7accbd40aa93eaa24f712da2f42e3c5578d6f06ec13b3207d3e23619c9a108252d1aed58bd6961c9ca9e6bb6e56b245f4ecef555621d9b4a1138ab')
b2sums=('668521fb3b35520f12654b3e3f5956064cb28f8c363bb8222ad6139a20031330248bfa2fe1236ed879a34a6ad1be28b86859d66da5bf6376285d097671041fa6')

build() {
  cd "${_upstream_name}-${pkgver}" || exit

  python -m build --wheel --no-isolation
}

package() {
  cd "${_upstream_name}-${pkgver}" || exit

  python -m installer --destdir "$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
