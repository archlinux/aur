# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Based on the python-pillow package (Maintainer: Kyle Keen <keenerd@gmail.com>, Contributor: minder)

pkgname=python-pillow-simd
pkgver=5.3.0.post1
pkgrel=2
epoch=1
_appname=Pillow-SIMD
_py3basever=3.7m
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
source=("https://files.pythonhosted.org/packages/source/P/$_appname/$_appname-$pkgver.tar.gz")
conflicts=('python-pillow')
provides=('python-pillow=5.3.0')

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

sha256sums=('903dd895c9c5b88afa567fe582b5eaf55316b52869ba6aedc5325fbe0c9f05a1')
