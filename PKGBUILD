# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Based on the python-pillow package (Maintainer: Kyle Keen <keenerd@gmail.com>, Contributor: minder)

pkgname=python-pillow-simd
pkgver=5.0.0
pkgrel=1
_appname=pillow-simd
_py3basever=3.6m
pkgdesc="Python Imaging Library (PIL) fork. Pillow fork for better image processing performance."
arch=('x86_64')
url="https://github.com/uploadcare/pillow-simd"
license=('custom')
depends=('python' 'lcms2' 'libtiff' 'openjpeg2')
optdepends=('freetype2: for the ImageFont module'
            'libraqm: for complex text scripts'
            'libwebp: for webp images'
            'tk: for the ImageTK module')
makedepends=('python-setuptools' 'freetype2' 'libraqm' 'libwebp' 'tk')
checkdepends=('python-pytest')
source=("https://github.com/uploadcare/$_appname/archive/$pkgver.tar.gz")
conflicts=('python-pillow')
provides=('python-pillow')

build() {
  cd "$srcdir/$_appname-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_appname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/include/python$_py3basever/"
  install -m644 -t "$pkgdir/usr/include/python$_py3basever/" src/libImaging/*.h
}

sha1sums=('9590d2cae1c3488c513e5a8c1fd4ad00f6af6cbe')
sha256sums=('9bd80979846d3a8cae878096d1b2d12600542bbc23f1c3c7e5f4445796a09fb0')
