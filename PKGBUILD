# Maintainer: Manuel Kauschinger <admin a bruzzzla dot de>
# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=tomlkit
pkgbase='python-tomlkit'
pkgname=('python-tomlkit' 'python2-tomlkit')
pkgver=0.5.3
pkgrel=1
pkgdesc="Style-preserving TOML library for Python"
arch=('any')
url=https://github.com/sdispater/"${_name}"
license=('MIT')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
optdepends=('python2-typing')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.io/packages/source/"${_name:0:1}"/"${_name}"/"${_name}"-"${pkgver}".tar.gz)
sha256sums=('d6506342615d051bc961f70bfcfa3d29b6616cc08a3ddfd4bc24196f16fd4ec2')

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

package_python2-tomlkit() {
  depends=(
    'python2'
    'python2-enum34'
  )

  cd "${_name}"-"${pkgver}"-py2
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-tomlkit() {
  depends=(
    'python'
  )


  cd "${_name}"-"${pkgver}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
