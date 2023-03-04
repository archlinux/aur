# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=python-marisa-trie
_pyname=marisa-trie
pkgver=0.7.8
pkgrel=1
pkgdesc='Static memory-efficient & fast Trie-like structures for Python (based on marisa-trie C++ library)'
arch=('any')
url='https://github.com/pytries/marisa-trie'
license=('MIT')
depends=('python')
makedepends=('cython' 'python-pip' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/m/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('aee3de5f2836074cfd803f1caf16f68390f262ef09cd7dc7d0e8aee9b6878643')

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
