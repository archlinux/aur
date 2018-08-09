# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=poetry
pkgbase='python-poetry'
pkgname=('python-poetry' 'python2-poetry')
pkgver=0.11.4
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
sha256sums=('78d0514fb91fa0ed90f9d7228c2fd0aa3d94fe7961f7dd00013c691fc47164d1')

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
    'python2-requests'
    'python2-requests-toolbelt'
    'python2-shellingham'
    'python2-tomlkit'
)

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
    'python-requests'
    'python-requests-toolbelt'
    'python-shellingham'
    'python-tomlkit'
)

  cd "${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
