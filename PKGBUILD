# Maintainer: Arkaprabha Chakraborty <arkorty@gmail.com>

pkgname='zapzap-linux'
_pkgname='com.rtosta.zapzap'
pkgver='5.1.3'
pkgrel='1'
pkgdesc='WhatsApp desktop application for Linux'
arch=('x86_64')
url="https://github.com/$pkgname/${pkgname%-linux}" 
license=('GPL-3.0-or-later')
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python' 'qt6-wayland' 'python-jaraco.text' 'python-inflect' 'python-pydantic>=1.9.1' 'python-typing_extensions>=4.6.1')
makedepends=('git' 'python3' 'python-setuptools>=40.8.0' 'desktop-file-utils')
conflicts=('zapzap' 'zapzap-git')
optdepends=('hunspell: spell check')
source=("git+$url#tag=$pkgver")
b2sums=('SKIP')

build() {
  cd ${pkgname%-linux}
  python setup.py build
}

package() {
  cd ${pkgname%-linux}
  python setup.py install --skip-build --root="$pkgdir"
  install -Dm644 share/icons/$_pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  install -Dm664 share/applications/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm664 share/metainfo/$_pkgname.appdata.xml "$pkgdir"/usr/share/metainfo/$_pkgname.appdata.xml
}
