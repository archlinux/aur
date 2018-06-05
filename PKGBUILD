# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=cleo
pkgbase='python-cleo'
pkgname=('python-cleo' 'python2-cleo')
pkgver=0.6.6
pkgrel=1
pkgdesc="Cleo allows you to create beautiful and testable command-line interfaces"
arch=('any')
url=https://github.com/sdispater/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=(
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz
  https://raw.githubusercontent.com/sdispater/cleo/0.6.6/LICENSE
)
sha256sums=(
  '1a848f6c56d143a3c4d46653522b559ebcd86b92af535418a1cb3e78ff5a8c4e'
  'a2b9e0f3a35c5549b0b82edabcc0e229721437994d265cca96185e9f99f3a698'
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

package_python2-cleo() {
  depends=('python2' 'python2-pastel' 'python2-pylev')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-cleo() {
  depends=('python' 'python-pastel' 'python-pylev')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
