# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgbase=python-pylsl
pkgname=(python-pylsl python2-pylsl)
_name=${pkgname#python-}
pkgver=1.13.1
pkgrel=1
pkgdesc='Python interface to the Lab Streaming Layer'
url='https://github.com/labstreaminglayer/liblsl-Python'
arch=('any')
license=('MIT')
conflicts=($pkgname)
depends=('liblsl')
source=('https://github.com/labstreaminglayer/liblsl-Python/archive/v1.13.1.tar.gz'
        'posixlibs.patch')
sha384sums=('bd66c7b77103c338d5d81d10f03d70724326edec02117445a624f0240c7a04718107b238a728a44d27197cb586b577f9'
            '4fff43c98b8b96714479a3f2fde65eecaa53693bd9b73a8502e939d8f365cfec1b4c6e8c2cdc256b618d03afb520a16a')

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
