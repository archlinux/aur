# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=vdu_controls
pkgver=2.0.0
pkgrel=1
pkgdesc="Visual Display Unit virtual control panel - a GUI front end to ddcutil"
arch=('any')
url="https://github.com/digitaltrails/vdu_controls"
license=('GPL-3.0-or-later')
depends=(
  'ddcutil'
  'hicolor-icon-theme'
  'noto-fonts'
  'python-pyqt5'
  'python-pyserial'
  'qt5-svg'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'ddcutil-service: D-Bus Interface for up to 10x faster response times.'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4567d6605ab900f54038c664373887dc58f5c94316d319baba5d93c261f29a7')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  mv "$pkgdir/usr/bin/$pkgname.py" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 translations/*.{ts,txt} -t "$pkgdir/usr/share/$pkgname/translations/"
  install -Dm755 sample-scripts/* -t "$pkgdir/usr/share/$pkgname/sample-scripts/"
  install -Dm644 icons/* -t "$pkgdir/usr/share/$pkgname/icons/"
  install -Dm644 "docs/_build/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "$pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
  install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
