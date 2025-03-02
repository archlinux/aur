# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=zapzap
_pkgname=com.rtosta.zapzap
pkgver=6.0.1.6
pkgrel=1
pkgdesc='WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine'
arch=(x86_64)
url="https://github.com/rafatosta/$pkgname"
license=(GPL3)
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python' 'qt6-wayland' 'python-jaraco.text' 'python-inflect' 'python-pydantic>=1.9.1' 'python-typing_extensions>=4.6.1')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools>=40.8.0' 'python-wheel' 'desktop-file-utils')
optdepends=('hunspell: spell check')
source=(git+$url#tag=$pkgver)
b2sums=('f70da84b4b8000dc7517ae44e205fe0f6a707a8de64c5366e152ee267c93f4a429678e908cb85034383cf40d8c4605ca51656c8f0e3165121cc84f6ae71a2fba')

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 share/icons/$_pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  install -Dm664 share/applications/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm664 share/metainfo/$_pkgname.appdata.xml "$pkgdir"/usr/share/metainfo/$_pkgname.appdata.xml
}
