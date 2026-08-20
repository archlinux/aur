# Maintainer: willker <wz dot willker at gmail dot com>

pkgname=qt-kurarin
_pkgname=qt_kurarin
pkgver=0.2.4
pkgrel=1
pkgdesc='> 🖥️ Qt-powered Kyuukurarin (きゅうくらりん) on your desktop — animated sprites in sync with the music 🎵 '
arch=('any')
url='https://github.com/VincentZyuApps/Qt-Kurarin'
license=('LicenseRef-unknown')
depends=('python>=3.12'
         'python-pyqt6'
         'python-textual')
optdepends=('python-pillow: for logo conversion scripts')
makedepends=('uv'
             'python-installer')

source=("https://pypi.python.org/packages/source/q/$pkgname/$_pkgname-$pkgver.tar.gz"
        "qt-kurarin.desktop")
sha256sums=('f0c670861b0b8f040b28bb891bbb7b547ce6f4859e54174231d7bd8e4303ac88'
            '0c3eb2d411be433f5017894a7bb6d956161f164e8276c05101ae430e950e49f6')

build() {
  cd "$_pkgname-$pkgver"
  uv build --wheel
}

package() {
  python -m installer --destdir="$pkgdir" "$_pkgname-$pkgver/dist/$_pkgname-$pkgver-py3-none-any.whl"
  install -vDm644 "$_pkgname-$pkgver/src/$_pkgname/resources/logo/logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -vDm644 -t "$pkgdir/usr/share/applications" qt-kurarin.desktop
}
