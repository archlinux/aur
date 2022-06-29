# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname='python2-lockfile'
_name=${pkgname#python2-}
pkgver=0.12.2
pkgrel=9
pkgdesc='Platform-independent file locking module (Python 2 package)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('MIT')
depends=('python2')
makedepends=(
  'python2-pbr'
  'python2-setuptools'
)
checkdepends=('python2-nose')
_tarname="${_name}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_tarname}.tar.gz")
sha256sums=('6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  LC_ALL=C.UTF-8 nosetests2 -v
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
