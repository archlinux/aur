# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgbase=python-pylsl
pkgname=(python-pylsl python2-pylsl)
_name=${pkgname#python-}
pkgver=1.13.0
pkgrel=1
pkgdesc='Python interface to the Lab Streaming Layer'
url='https://github.com/labstreaminglayer/liblsl-Python'
arch=('any')
license=('MIT')
conflicts=($pkgname)
depends=('liblsl')
source=('https://github.com/labstreaminglayer/liblsl-Python/archive/v1.13.0.tar.gz'
        'posixlibs.patch')
sha384sums=('adabd2396461667365df4d314875f267787244dce2406e16644555dd4d983f196cfbdccbef00fa4d408a54716c1c3c05'
            '7e71482a33178f7d452e0783967ca90dfe83f4dbac07230697a888a156d0af2657697c40d9fd9ec6c504dc6999895793')

prepare(){
  cd "$srcdir/liblsl-Python-${pkgver}"
  patch --strip=1 --input=../posixlibs.patch
}

build(){
  cd "$srcdir/liblsl-Python-${pkgver}"
  python setup.py build
  python2 setup.py build
}

check(){
  cd "$srcdir/liblsl-Python-${pkgver}"
  python setup.py check -m -s
  python2 setup.py check -m -s
}

package_python-pylsl() {
  makedepends=('python-setuptools')
  cd "$srcdir/liblsl-Python-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pylsl() {
  makedepends=('python2-setuptools')
  cd "$srcdir/liblsl-Python-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
