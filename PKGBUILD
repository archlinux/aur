# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgbase=python-pylsl
pkgname=(python-pylsl python2-pylsl)
_name=${pkgname#python-}
pkgver=1.10.3
pkgrel=1
pkgdesc='Python interface to the Lab Streaming Layer'
url='https://github.com/labstreaminglayer/liblsl-Python'
arch=('any')
license=('MIT')
conflicts=($pkgname)
depends=('liblsl')
source=('https://files.pythonhosted.org/packages/62/42/fe6fba758bfa9301a56e87ec16933a8b6e2860c1aab0719f0aa431a35310/pylsl-1.10.3.zip'
        'nolibs.patch')
sha384sums=('b31bb2560812dc066a63508f751d716679246c03fcda4b3f5e060248091980bd94df17e05e822acf2aab3009923ff24f'
            'c6030d5f0d97e9a04604cd1e9ba6b163fa1e9a77d821177cb2b17b80e2eb78cf0cbbcc1d718f528e9dbe9f4016d51c53')

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
