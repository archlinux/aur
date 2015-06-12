# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=python2-eureqa-git
pkgver=33.dec8991
pkgrel=1
pkgdesc="Python bindings for the Eureqa API"
arch=('i686' 'x86_64')
url="https://github.com/marcin-franc/eureqa_python"
license=('LGPL')
depends=('eureqa-api')
makedepends=('git')
source=($pkgname::git+https://github.com/marcin-franc/eureqa_python.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$srcdir/$pkgname"

    make BOOST_INC=/usr/include/boost BOOST_LIB=. \
        PYTHON_INC=/usr/include/python2.7 \
        EUREQA_INC=/usr/include/eureqa eureqa_python.so
}

package() {
    cd "$srcdir/$pkgname"
    pydir=`python2 -c "from distutils.sysconfig import get_python_lib; \
        print get_python_lib()"`

    install -Dm644 eureqa_python.so "$pkgdir/$pydir/eureqa_python.so"
}

