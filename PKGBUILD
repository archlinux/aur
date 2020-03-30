# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>

pkgbase=python-codereef
pkgname=('python-codereef' 'python2-codereef')
_pkgname=codereef
pkgver=0.7.25
pkgrel=2
pkgdesc='CodeReef client to deal with portable workflows'
arch=('any')
url='https://codereef.ai/portal'
license=('BSD 3-clause')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://files.pythonhosted.org/packages/0b/71/ae0d7116c65f141b9b2dda69bc74e59129348410197909334e9b467c75b8/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('36a5db3b383f962d4f0357e06ab3296844e30c194a1c77ce0a612b6a196c1708')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup codereef-$pkgver py2codereef-$pkgver
}

build() {
  # build for python 3
  cd codereef-$pkgver
  python setup.py build

  # build for python 2
  cd ../py2codereef-$pkgver
  python2 setup.py build
}

package_python-codereef() {
	depends=('python-click>=7.0' 'python-ck' 'python-virtualenv' 'python-requests')
  pkgdesc+=' for Python 3'

  cd codereef-$pkgver
	python setup.py install --root=${pkgdir}/ --optimize=1
}

package_python2-codereef() {
	depends=('python2-click>=7.0' 'python2-ck' 'python2-virtualenv' 'python2-requests') 
  pkgdesc+=' for Python 2'

  cd py2codereef-$pkgver
	python2 setup.py install --root=${pkgdir}/ --optimize=1
}
