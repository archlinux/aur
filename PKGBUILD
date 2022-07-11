# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >

pkgname='android2po'
pkgver=1.6.0
pkgrel=2
pkgdesc='Convert Android string resources to gettext, and back'
arch=('any')
url="https://pypi.org/project/${pkgname}/${pkgver}"
license=('BSD')
makedepends=('python-setuptools')
_repo_owner='jaragunde'                                   # created patch for Python 3.10 fix
_repo_commit='5571b63c0bbc04743b3963e739a19a42c947b25d'   # patch for Python 3.10 fix
_repo_url_api="https://api.github.com/repos/${_repo_owner}/${pkgname}"
_tarname="${_repo_owner}-${pkgname}-${_repo_commit::7}"
source=("${_tarname}.tar.gz::${_repo_url_api}/tarball/${_repo_commit}")
b2sums=('48047fdd11c024a8a0442ff6d364afaafb52c3ae54079d5dbc48e96ff0d8dbd7c9e7c6869eb1426b8211d6426d53d29b60c5bf4f9cf2122e8d8211c270b83869')

build() {
  cd "${_tarname}"
  python setup.py build
}

package() {
  depends=(
    'python'
    'python-argparse'
    'python-babel'
    'python-colorama'
    'python-lxml'
    'python-termcolor'
  )

  cd "${_tarname}"
  python setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build

  install --verbose -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -Dm 644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
}
