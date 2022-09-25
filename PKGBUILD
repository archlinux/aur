# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=zapzap
_pkgname=com.rtosta.zapzap
pkgver=4.4
pkgrel=1
pkgdesc="WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine"
arch=('x86_64')
url="https://github.com/rafatosta/$pkgname" 
license=('GPL3')
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=($url/archive/v$pkgver.tar.gz)
sha256sums=('2fdb9ee666f92ce2f28bc40ac0dd50da158897a7f268abc8b01a7343632d6ffd')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 share/icons/$_pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  install -Dm664 share/applications/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm664 share/metainfo/$_pkgname.appdata.xml "$pkgdir"/share/metainfo/$_pkgname.appdata.xml
}
