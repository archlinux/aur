# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=zapzap
_pkgname=com.rtosta.zapzap
pkgver=4.4.6
pkgrel=1
pkgdesc='WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine'
arch=(x86_64)
url="https://github.com/rafatosta/$pkgname" 
license=(GPL3)
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python' 'qt6-wayland')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('hunspell: spell check')
source=($url/archive/refs/tags/$pkgver.tar.gz)
b2sums=('3d651c3c5dc78433f2d2947939b7ea654bd611b5fa948c623e2598b7c7e5491d3efdea072b503887ea5e2c17293bcb4a9431c8b5a8ef6a7f2a299b0c4b06b030')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 share/icons/$_pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  install -Dm664 share/applications/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm664 share/metainfo/$_pkgname.appdata.xml "$pkgdir"/usr/share/metainfo/$_pkgname.appdata.xml
}
