# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=python-nltk
pkgname=$_pkgname-git
pkgver=3.5+137+gd0f54c29b
pkgrel=1
pkgdesc='Natural language processing in Python'
arch=('any')
url='https://www.nltk.org/'
license=('APACHE')
depends=('python-regex' 'python-yaml')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'nltk-data' 'python-requests' 'python-regex')
optdepends=('nltk-data: test data'
	    'python-numpy: used for calculations'
	    'python-matplotlib: used for plotting')
source=($_pkgname::"git+https://github.com/nltk/nltk")
conflicts=(_pkgname)
provides=(_pkgname)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  export PYTHONHASHSEED=0
  python setup.py build
}

# Need to fix the nltk-data split
#check(){
#  cd $_pkgname
#  python ./nltk/test/runtests.py
#}

package() {
  cd $_pkgname
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
