# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgbase=python-pylsl
pkgname=(python-pylsl python2-pylsl)
_name=${pkgname#python-}
pkgver=1.10.4
pkgrel=1
pkgdesc='Python interface to the Lab Streaming Layer'
url='https://github.com/labstreaminglayer/liblsl-Python'
arch=('any')
license=('MIT')
conflicts=($pkgname)
depends=('liblsl')
source=('https://files.pythonhosted.org/packages/77/ab/00c451e140d9c333c3e251fdf81560e5b296bf7f9cc411e1b000031db674/pylsl-1.10.4.zip'
        'nolibs.patch')
sha384sums=('c522ad997f9db2dd02ab6d666eeb9f847a894a2b6cc070220358514ac1a907a2a98e44d2f62bdf61a3239ece6979aafe'
            '1dc1c6df4802b5dde4755c95c0a8350c58b141fc761ddac949d3f13485205a01e161b481e5d23ff3b57a715bcad62deb')

prepare(){
  cd "$srcdir/$_name-${pkgver}"
  patch --strip=1 --input=../nolibs.patch
}

build(){
  cd "$srcdir/$_name-${pkgver}"
  python setup.py build
  python2 setup.py build
}

check(){
  cd "$srcdir/$_name-${pkgver}"
  python setup.py check -m -s
  python2 setup.py check -m -s
}

package_python-pylsl() {
  makedepends=('python-setuptools')
  cd "$srcdir/$_name-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pylsl() {
  makedepends=('python2-setuptools')
  cd "$srcdir/$_name-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
