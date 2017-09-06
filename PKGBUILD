# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Based on the python-pillow package (Maintainer: Kyle Keen <keenerd@gmail.com>, Contributor: minder)

pkgname=python-pillow-simd
pkgver=4.2.1.post0
pkgrel=1
_appname=Pillow-SIMD
_py3basever=3.6m
pkgdesc="Python Imaging Library (PIL) fork. Pillow fork for better image processing performance."
arch=('x86_64')
url="https://github.com/uploadcare/pillow-simd"
license=('custom')
depends=('python' 'lcms2' 'libwebp' 'openjpeg2' 'python-olefile')
optdepends=('tk: for the ImageTK module'
            'python-pyqt4: for the ImageQt module')
makedepends=('python-setuptools' 'lcms2' 'libwebp' 'openjpeg2' 'tk')
source=("https://files.pythonhosted.org/packages/source/P/$_appname/$_appname-$pkgver.tar.gz")
conflicts=('python-pillow')
provides=('python-pillow')

package() {
  cd "$srcdir/$_appname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=0
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/include/python$_py3basever/"
  install -m644 -t "$pkgdir/usr/include/python$_py3basever/" libImaging/*.h

  # clean up bins
  cd "$pkgdir/usr/bin"
  for f in *.py; do
    mv "$f" "${f%.py}"
  done
}

sha1sums=('0da27c7919d9180c2b3a9184bc809a5cd62eeeab')
sha256sums=('9d443cc04979794f21ec5afb16df4ddd287679b99f7225ee299daa150a8e2737')
