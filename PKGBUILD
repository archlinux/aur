# Maintainer: seppovic <markus at da-weber dot de>

pkgname=python-micropy-cli
_pkgname=${pkgname#python-}
pkgver=3.6.0
pkgrel=1
pkgdesc="A project management/generation tool for writing Micropython code in modern IDEs."
arch=('any')
url="https://github.com/BradenM/micropy-cli"
license=('MIT')
depends=('python' 'python-setuptools' 'python-boltons' 'python-click' 'python-colorama' 'python-jsonschema' 'python-dpath' 'python-gitpython' 'python-packaging' 'python-questionary' 'python-requests' 'python-requirements-parser' 'python-tqdm')
# missing - jinja2, cachier
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha512sums=('566645e2e102cce4e14f79c5f73cf2dbad30589369d4416c1b2f9de4196b6ca3fba17b420c138ffc854c5598ae5b858976d537a3bbea06e1ceb33b8f2d46b247')
sha256sums=('d1bef285eead19da9798ab0f308fd0295fc0d423c53d2fc1fe39001e5c11d2c2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
