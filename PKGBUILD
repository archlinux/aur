# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=poetry
pkgbase='python-poetry'
pkgname=('python-poetry' 'python2-poetry')
pkgver=0.11.5
pkgrel=2
pkgdesc="Python dependency management and packaging made easy"
arch=('any')
url=https://github.com/sdispater/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz
  poetry.sh
  poetry2.sh
)
sha256sums=(
  '6bb73a26117575cbf5533070045ed378b07b4e18cfcf20ca8cd33d94b10ab0b1'
  '2d86ca07e5cc944c717c7ef8f38332d6d3a3feb0a99bb7dabe0e9deff11e994e'
  'b890851b5cb53d1c437a051f79a024857e12b5e6ec0089dddb07a94d09d45af8'
)

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
    'python2-pathlib'
    'python2-pkginfo'
    'python2-pyparsing'
    'python2-pyrsistent'
    'python2-requests'
    'python2-requests-toolbelt'
    'python2-shellingham'
    'python2-tomlkit'
    'python2-typing'
    'python2-virtualenv'
)

  cd "${_name}"-"${pkgver}"-py2
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm755 "${srcdir}"/poetry2.sh "${pkgdir}"/usr/bin/poetry2
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
  install -Dm755 "${srcdir}"/poetry.sh "${pkgdir}"/usr/bin/poetry
}
