# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >

pkgbase=pyhamcrest-git
pkgname=python-pyhamcrest-git
pkgver=2.0.2.r23.g00bd42e
pkgrel=1
pkgdesc='Hamcrest framework for matcher objects'
arch=('any')
license=('BSD')
url="https://github.com/hamcrest/PyHamcrest"
provides=('python-pyhamcrest')
conflicts=('python-pyhamcrest')
depends=('python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-pytest-cov' 'python-mock' 'python-numpy')
              
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd PyHamcrest
    git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^V//'
}

build() {
  cd "$srcdir"/PyHamcrest
  python setup.py build
}

check() {
  cd "$srcdir"/PyHamcrest
  python setup.py pytest
}

package() {
  cd "$srcdir"/PyHamcrest
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
