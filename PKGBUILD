# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=yarl
pkgname=python-"$_pkgname"-gns3
pkgver=1.4.2
pkgrel=1
pkgdesc="Yet another URL library (GNS3)"
url="https://github.com/aio-libs/yarl/"
arch=('x86_64')
license=('Apache')
groups=('gns3')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")
depends=('glibc' 'python' 'python-multidict' 'python-idna')
makedepends=('cython' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aio-libs/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a400eb3f54f7596eeaba8100a8fa3d72135195423c52808dc54a43c6b100b192')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed 's| .install-cython ||g' -i Makefile
}

build() {
  cd ${_pkgname}-${pkgver}
  make cythonize
  LANG=en_US.UTF-8 python setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  python setup.py test
}

package() {
  cd ${_pkgname}-${pkgver}
  LANG=en_US.UTF-8 python setup.py install --root="${pkgdir}" -O1 --skip-build
}
