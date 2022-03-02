# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=python-tagpy
pkgver=2018.1.1
pkgrel=2
pkgdesc='Python bindings for TagLib'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='http://pypi.python.org/pypi/tagpy'
license=('MIT')
depends=('python' 'taglib' 'boost-libs')
makedepends=('python-setuptools' 'boost')
source=("https://pypi.python.org/packages/source/t/tagpy/tagpy-$pkgver.tar.gz"
        'compile_fix.patch')
sha256sums=('5d406305d1e777f12a53899eb5a559d60189874aa30a03aaf5c891c12231aa4d'
            '51a5a77a8ffcb079c99d024a83f77bb4a5bba6552c8372c19ae99e71d4220968')

prepare() {
  cd "tagpy-$pkgver"
  patch -uNp2 -r- -i ../compile_fix.patch
}

build() {
  cd "tagpy-$pkgver"

  ./configure.py \
    --taglib-lib-dir=/usr/lib/ \
    --taglib-inc-dir=/usr/include/taglib/ \
    --boost-inc-dir=/usr/include/boost/ \
    --boost-lib-dir=/usr/lib/ \
    --boost-python-libname=boost_python3
  python setup.py build
}

package(){
  cd "tagpy-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
