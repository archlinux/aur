# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

_base=setuptools_scm_git_archive
pkgname=python-${_base//_/-}
pkgver=1.4
pkgrel=2
pkgdesc="setuptools_scm plugin for git archives"
arch=('any')
url="https://github.com/Changaco/${_base}"
license=('MIT')
depends=('python' 'python-setuptools-scm')
makedepends=('python-setuptools' 'git')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_base}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_base}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
