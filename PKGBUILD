# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=trimage
pkgver=1.0.5
pkgrel=1
pkgdesc="A GUI based lossless image compressor."
url="http://trimage.org"
arch=('any')
license=('MIT')
depends=("python2-pyqt" "optipng" "advancecomp" "jpegoptim" "pngcrush")
source=("https://github.com/Kilian/Trimage/archive/${pkgver}.zip")
md5sums=('5d596c19c36773d6c94c3633763f603c')

build() {
  cd "$srcdir/Trimage-$pkgver"

  find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python|/usr/bin/env python2|'
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' trimage

  python2 setup.py build
}

package() {
  cd "$srcdir/Trimage-$pkgver"
  python2 setup.py install --root="${pkgdir}"  --optimize=1
}
