# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=poetry
pkgbase='python-poetry'
pkgname=('python-poetry' 'python2-poetry')
pkgver=0.10.3
pkgrel=1
pkgdesc="Python dependency management and packaging made easy"
arch=('any')
url=https://github.com/sdispater/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('ba2ecd69f2ac3d3b35322bb8620365e2beb49adbd5381613f6994b8c684475a2')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-poetry() {
  depends=(
    'python2'
    'python2-cachecontrol'
    'python2-lockfile'
    'python2-cachy'
    'python2-cleo'
    'python2-html5lib'
    'python2-jsonschema'
    'python2-pkginfo'
    'python2-pyparsing'
    'python2-pyrsistent'
    'python2-requests-toolbelt'
    'python2-requests'
    'python2-toml')

  cd "${_name}"-"${pkgver}"-py2
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-poetry() {
  depends=(
    'python'
    'python-cachecontrol'
    'python-lockfile'
    'python-cachy'
    'python-cleo'
    'python-html5lib'
    'python-jsonschema'
    'python-pkginfo'
    'python-pyparsing'
    'python-pyrsistent'
    'python-requests-toolbelt'
    'python-requests'
    'python-toml')

  cd "${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
