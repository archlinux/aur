# Maintainer: Andreas Tennert <mail at andreas-tennert dot de>
pkgname='lcarsde-status-bar'
pkgver=20.1
pkgrel=1
pkgdesc="Menu for lcarsde to display and run installed software"
arch=('any')
url="https://lcarsde.github.io"
license=('GPL2')
groups=('lcarsde')
depends=('python>=3.8' 'python-gobject' 'gtk3' 'python-cairo' 'python-numpy' 'python-pyalsaaudio')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lcarsde/status-bar/archive/$pkgver.tar.gz")
md5sums=('f1189398fdc0f1779547389131f4a94c')

build() {
    cd "status-bar-$pkgver/src"

    python setup.py build
    cd ..
}

package() {
  cd "status-bar-$pkgver"

  mkdir -p "$pkgdir/usr/bin/"
  cp src/lcarsde-status-bar.py "$pkgdir/usr/bin/"
  cp -r resources/* "$pkgdir/"

  cd src
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  cd ..
}
