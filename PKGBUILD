# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>

pkgname=python-marisa-trie
_pyname=marisa-trie
pkgver=1.0.0
pkgrel=1
pkgdesc='Static memory-efficient & fast Trie-like structures for Python (based on marisa-trie C++ library)'
arch=('any')
url="https://github.com/pytries/${_pyname}"
license=('MIT')
depends=('python')
makedepends=('cython' 'python-pip' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/m/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('d8a68301f023a724eb379aaa1b10f88a9e1a458cc8a41b527c62507859b4a4d2')

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
