# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=python-marisa-trie
_pyname=marisa-trie
pkgver=0.7.7
pkgrel=1
pkgdesc='Static memory-efficient & fast Trie-like structures for Python (based on marisa-trie C++ library)'
arch=('any')
url='https://github.com/pytries/marisa-trie'
license=('MIT')
depends=('python')
makedepends=('cython' 'python-pip' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/m/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('bbeafb7d92839dc221365340e79d012cb50ee48a1f3f30dd916eb35a8b93db00')

build() {
  cd "${_pyname}-${pkgver}"

  ./update_cpp.sh

  python setup.py build
}

package() {
  cd "${_pyname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
