# Maintaner: willker <wz dot willker at gmail dot com>

pkgname=qt-kurarin
_pkgname=qt_kurarin
pkgver=0.2.3
pkgrel=1
pkgdesc='> 🖥️ Qt-powered Kyuukurarin (きゅうくらりん) on your desktop — animated sprites in sync with the music 🎵 '
arch=('any')
url='https://github.com/VincentZyuApps/Qt-Kurarin'
license=('unknown')
depends=('python>=3.12'
         'python-pyqt6'
         'python-pyqt6-sip'
         'python-textual')
makedepends=('uv'
             'python-installer')
install=
source=(https://pypi.python.org//packages/source/q/$pkgname/$_pkgname-$pkgver.tar.gz
        qt-kurarin.desktop)
sha256sums=('266c5c2791cf6ca45b5ee97a422a2c5bad70e9b77d4ab21511286af04cbf1e7f'
            '0c3eb2d411be433f5017894a7bb6d956161f164e8276c05101ae430e950e49f6')

build() {
  cd $_pkgname-$pkgver
  uv build --wheel
}

package() {
  python -m installer --destdir=$pkgdir $_pkgname-$pkgver/dist/qt_kurarin-0.2.3-py3-none-any.whl
  install -vDm644 $_pkgname-$pkgver/src/$_pkgname/resources/logo/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -vDm644 -t "$pkgdir//usr/share/applications" qt-kurarin.desktop
}
