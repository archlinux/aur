# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-declxml
pkgver=1.1.3
pkgrel=1
pkgdesc="Declarative XML processing for Python."
arch=('any')
url="https://github.com/gatkin/declxml"
license=('MIT')
makedepends=('python' 'python-setuptools' 'git')
options=(!emptydirs)
source=("git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  _pythonver=3.8
  
  cd "${srcdir}/declxml"
  sed -e "/data_files/s|''|'/usr/lib/python${_pythonver}/site-packages'|" -i setup.py
}

build() {
  cd "${srcdir}/declxml"
  python setup.py build
}

package() {
  cd "${srcdir}/declxml"
  python setup.py install --root="${pkgdir}"/ --optimize=1
  
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
