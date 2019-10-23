# Maintainer: alienzj <alienchuj@gmail.com>

pkgname=python-datrie
pkgver=0.8
pkgrel=1
pkgdesc="Fast, efficiently stored Trie for Python. Uses libdatrie"
arch=('x86_64')
url="https://github.com/pytries/datrie"
license=('LGPL')
depends=('libdatrie')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest-runner' 'python-hypothesis')
options=(!emptydirs)
source=("https://github.com/pytries/datrie/archive/0.8.tar.gz")
sha512sums=('8f05958fbac53a1932f80d00b3f0cf72bf4e1784b8cddc715664410893f82d5b21393c71a409d4e5db67a43c4a876ff17f16caaa44fb88ba2d8d55c3287ccca2')

prepare() {
  cd $srcdir/datrie-0.8
  sed -i 's|../libdatrie/||g' src/cdatrie.pxd
  sed -i 's|../libdatrie/||g' src/cdatrie.c
  sed -i 's|../libdatrie/||g' src/datrie.c
}

build() {
  cd $srcdir/datrie-0.8
  ./update_c.sh
  python setup.py build
}

#check() {
#  msg2 "Running tests on python-datrie 0.8"
#  cd $srcdir/datrie-0.8
#  python setup.py pytest
#}

package() {
  cd $srcdir/datrie-0.8
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
