# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=qtqr
pkgver=2.1
_pkgver=2.1-0~47~ubuntu24.04.1
pkgrel=9
pkgdesc='Qt GUI that makes easy creating and decoding QR codes'
arch=('any')
url='https://launchpad.net/qr-tools'
license=('GPL3')
depends=('python-pillow' 'python-pyqt5' 'qrencode' 'qt5-multimedia' 'zbar')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://launchpad.net/qr-tools/2.0/2.1/+download/qtqr_${_pkgver}.tar.gz"
        'qtqr.desktop'
        'qtqr.appdata.xml')
sha256sums=('bcad4aa7b677c3cce34381f2acb3fc0de33216f8380af3c0365424f4cfdf6d44'
            '67ea09222b0ad8875e4253f74c02cd88bdd796ac2609a7e594148aefd0f8f565'
            '1a4739e4c61077e17fdc63b10b329c377b40080b8afd8ae9a2e269d3f5c094b0')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 qtqr.py "$pkgdir/usr/bin/qtqr"
  install -Dm644 -t "$pkgdir/usr/share/qt/translations" *.qm
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/qtqr.png"
  install -Dm644 ../qtqr.desktop "$pkgdir/usr/share/applications/qtqr.desktop"
  install -Dm644 ../qtqr.appdata.xml "$pkgdir/usr/share/metainfo/qtqr.appdata.xml"
}
