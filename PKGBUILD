# Maintainer: twa022 <twa022 at gmail dot com>

pkgname=python-tagpy
pkgver=2013.1
pkgrel=1
pkgdesc='Python bindings for TagLib'
arch=('x86_64')
url='http://pypi.python.org/pypi/tagpy'
license=('MIT')
depends=('python' 'taglib' 'boost-libs')
makedepends=('python-setuptools' 'boost')
source=("https://pypi.python.org/packages/source/t/tagpy/tagpy-$pkgver.tar.gz"
        'disable_setuptools_distribute_hack.patch')
sha256sums=('80481c78ce34878e7a1f3231acd781a3bf1b0b569c70ce0e8d63af58061152f4'
            '9d5675b2acfe01399faed31e9213234b29992e387a62fa9d6528e0eae395dd52')

prepare() {
  cd "tagpy-$pkgver"
  patch -uNp2 -r- -i ../disable_setuptools_distribute_hack.patch
}

build() {
  cd "tagpy-$pkgver"

  ./configure.py \
    --taglib-lib-dir=/usr/lib/ \
    --taglib-inc-dir=/usr/include/taglib/ \
    --boost-inc-dir=/usr/include/boost/ \
    --boost-lib-dir=/usr/lib/ \
    --boost-python-libname=boost_python
  python setup.py build
}

package(){
  cd "tagpy-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
