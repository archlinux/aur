# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Yardena Cohen <yardenack@gmail.com>

pkgname=python-simple-crypt
_name="${pkgname#python-}"
_commit='ae19ce570b285474cacf0acaaea514b08111501d'
pkgver=5.0.0.r7.gae19ce5
pkgrel=1
pkgdesc='[Deprecated] Simple encryption and decryption for Python'
arch=('any')
url="https://github.com/KyleKing/${_name}"
license=('custom:Unlicense')
makedepends=('python-setuptools')
_tarname="${_name}-${_commit}"
source=("${_tarname}.tar.gz::${url}/archive/${_commit}.tar.gz"
        'LICENSE')
b2sums=('38baab8302223902e7118af63b422f679583bfcc6ffd5ad19323947352f7501c2542ad6c8e0016134ba650ccae27cf2937964e252418fea5540fdcd94843ee75'
        '63f2d1930ce3975256b45aceef15f7c5693007873fe5419b8cf8e61b1c3975cc1be8cda038d8fc2ed80e9f4445956a47b8e9ea2b1d06e0c260cfacab6b7e2abc')

build() {
  cd "${_tarname}"
  python setup.py build
}

package() {
  depends=('python-pycryptodome')

  cd "${_tarname}"
  python setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build

  install --verbose -Dm 644 '../LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -Dm 644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
