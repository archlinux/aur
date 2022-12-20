# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vdu_controls
pkgver=1.8.3
pkgrel=1
pkgdesc="Visual Display Unit virtual control panel - a GUI front end to ddcutil"
arch=('any')
url="https://github.com/digitaltrails/vdu_controls"
license=('GPL3')
depends=('ddcutil' 'noto-fonts' 'python' 'python-pyqt5' 'qt5-svg')
#makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('51599c88017368563f227d8fd43e04ab2e2d0cd7162ffd98b8f3d1d31eeee8ce'
            '726a55c150f3cc77d483e5a484ab252b2ddf3b3919d05042975e82e659f979fc')

build() {
  cd "$pkgname-$pkgver"
#  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
#  python -m installer --destdir="$pkgdir" dist/*.whl

#  mv "$pkgdir/usr/bin/$pkgname.py" "$pkgdir/usr/bin/$pkgname"

  install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 translations/*.ts -t "$pkgdir/usr/share/$pkgname/translations/"

  install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
