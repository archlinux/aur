# Maintainer: Dashon Wells <me@me.me>

# Contributor: yochananmarqos <aur commenter>

pkgname='catt-qt'
pkgver=4.0
pkgrel=4
pkgdesc='A control GUI for Chromecasts written using python3, catt api, pychromecast and PyQt5.'
arch=('any')
url=https://github.com/soreau/catt-qt
license=('GPLv3')

depends=(
  'python'
  'python-pyqt5'
  'python-brotli'
  'python-pycryptodomex'
  'python-websockets'
  'xdg-desktop-portal'
  'catt'
  'python-pychromecast>=7.5.0')

makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
  'python-wheel')

source=(
"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
"catt-qt.desktop"
)
sha256sums=(
'c5f0b39b0b33ffa1ff2aa9db884da9dbfd0ad36611eb295b1b9296fb3814b46f'
'9a9250499e75d2d21fc493d738f89da1e94b03021ebdc70b8a209be1cc2dfa99'
)

build() {
  cd "$pkgname-$pkgver"

  # This package requires itself to build and can't find itself,
  # thus --skip-dependency-check and set PYTHONPATH
  PYTHONPATH=./ python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 cattqt/chromecast.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}
