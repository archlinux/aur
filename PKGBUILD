# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyrsistent
pkgver=0.17.3
pkgrel=3
pkgdesc="Persistent/Functional/Immutable data structures"
arch=('x86_64')
license=('MIT')
url="https://github.com/tobgu/pyrsistent"
depends=('python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://pypi.io/packages/source/p/pyrsistent/pyrsistent-$pkgver.tar.gz"
        LICENCE.mit)
sha512sums=('2d18e1d4cfe9a0a576fd363f466ba920094af0b1cbbb49aec11b32df6c23e59f6552235a496838dab00928cc7f6dad2a4a8aaa0b52cb6a38eba6faedd12846c8'
            '036bd5cc2a62b004576ecc50a84dc7d187d8108f52cb886f7e32bed324327af2dc132100e1c8f1dd2ce35b774f74898020f04a315e5137319deda18a449e791a')

prepare() {
  sed -i 's/<5//g' pyrsistent-$pkgver/setup.py
}

build() {
  cd pyrsistent-$pkgver
  python setup.py build
}

check() {
  cd pyrsistent-$pkgver
  python -m pytest
}

package() {
  cd pyrsistent-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 ../LICENCE.mit "$pkgdir"/usr/share/licenses/$pkgname/LICENCE.mit
}
