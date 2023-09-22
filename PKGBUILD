# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=zapzap
_pkgname=com.rtosta.zapzap
pkgver=4.5.1
pkgrel=1
pkgdesc='WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine'
arch=(x86_64)
url="https://github.com/rafatosta/$pkgname" 
license=(GPL3)
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python' 'qt6-wayland')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'desktop-file-utils')
optdepends=('hunspell: spell check')
source=(git+$url#tag=v$pkgver)
b2sums=('SKIP')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python3 setup.py install --root "$pkgdir"
  install -Dm644 share/icons/$_pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  install -Dm664 share/applications/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm664 share/metainfo/$_pkgname.appdata.xml "$pkgdir"/usr/share/metainfo/$_pkgname.appdata.xml
}
