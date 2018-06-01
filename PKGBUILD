# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=mygene
pkgbase='python-mygene'
pkgname=('python-mygene' 'python2-mygene')
pkgver=3.0.0
pkgrel=1
pkgdesc="An easy-to-use Python wrapper to access MyGene.Info services."
arch=('any')
url=https://github.com/meowklaski/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz
  https://raw.githubusercontent.com/biothings/"${_name}".py/ver_"${pkgver}"/LICENSE.txt
)
sha256sums=(
  '36e5e42e05ade82141b7a82e5f9249546fabe5e9f47fe18c1535e6cedc603314'
  '18539fdbf9b2e53473f2245529be890192c7b9ead40b4168c1f64fb972d66f87'
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

package_python2-mygene() {
  depends=('python2' 'python2-requests')

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-mygene() {
  depends=('python' 'python-requests')

  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
