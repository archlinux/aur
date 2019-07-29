# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgbase=python-pylsl
pkgname=(python-pylsl python2-pylsl)
_name=${pkgname#python-}
pkgver=1.12.2
pkgrel=1
pkgdesc='Python interface to the Lab Streaming Layer'
url='https://github.com/labstreaminglayer/liblsl-Python'
arch=('any')
license=('MIT')
conflicts=($pkgname)
depends=('liblsl')
source=('https://files.pythonhosted.org/packages/5b/1e/71fb9b89c713fcddb63304ee52ae14bc2ba9b20cd7e019e0fe1c92df32af/pylsl-1.12.2.tar.gz'
        'nolibs.patch')
sha384sums=('86125411f50812bb40aed30af171a9764bf1a5c4af479a5d276806e3fa40919c6548827b850fc900325095c4b7bdb133'
            '5aef54d81924ea8dedfc7f80f73dfd2cd6913f8d2a9085a596c657a816c7bd69bf001e137ca3933651e381efda6bfb80')

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
