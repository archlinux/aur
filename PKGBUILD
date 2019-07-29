# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgbase=python-pylsl
pkgname=(python-pylsl python2-pylsl)
_name=${pkgname#python-}
pkgver=1.10.5
pkgrel=1
pkgdesc='Python interface to the Lab Streaming Layer'
url='https://github.com/labstreaminglayer/liblsl-Python'
arch=('any')
license=('MIT')
conflicts=($pkgname)
depends=('liblsl')
source=('https://files.pythonhosted.org/packages/8b/9e/96d8e32a716dfa8071c344742f8acf9942e7bb26cc060a8a71e1385703e8/pylsl-1.10.5.zip'
        'nolibs.patch')
sha384sums=('84945e65a75d6a1e95a91648f2b2e70198eb8407ca83160bef7f1984a001983c62a7922919a675c7c6d30ecfb7cb5d7b'
            'c01b6ef98127a79364f26f15f62d53928fb43b7d1db3da2a3d8ded30e64c754e19f0f02148db74bd96335e6975f2ff2b')

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
