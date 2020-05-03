# Maintainer: Clint Valentine <valentine.clint@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgbase='python-lzstring'
pkgname=('python-lzstring' 'python2-lzstring')
pkgver=1.0.4
pkgrel=1
pkgdesc="LZ-string compression for Python"
arch=('any')
url="https://pypi.python.org/pypi/lzstring"
license=('MIT')
makedepends=('python' 'python-setuptools' 'git'
	     'python2' 'python2-setuptools')
options=(!emptydirs)
_commit=0b2773ede157fb69f0c837b853ccc5ab9c236c58
source=("git+https://github.com/gkovacs/lz-string-python#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cp -a "lz-string-python"{,-py2}
}

build(){
  cd "${srcdir}/lz-string-python"
  python setup.py build

  cd "${srcdir}/lz-string-python-py2"
  python2 setup.py build
}

package_python2-lzstring() {
  depends=('python2' 'python2-future')

  cd "${srcdir}/lz-string-python"
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  
  install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

package_python-lzstring() {
  depends=('python' 'python-future')

  cd "${srcdir}/lz-string-python"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  
install -Dm644 LICENSE.md "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
