# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=zapzap
_pkgname=com.rtosta.zapzap
pkgver=5.3.1
pkgrel=1
pkgdesc='WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine'
arch=(x86_64)
url="https://github.com/$pkgname-linux/$pkgname" 
license=(GPL3)
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python' 'qt6-wayland' 'python-jaraco.text' 'python-inflect' 'python-pydantic>=1.9.1' 'python-typing_extensions>=4.6.1')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools>=40.8.0' 'python-wheel' 'desktop-file-utils')
optdepends=('hunspell: spell check')
source=(git+$url#tag=$pkgver)
b2sums=('5549042fbc6ec591ac69903bedc2a35cd26ffb22d90f7024ce1ea6cf9c4aeecce31a3793aed5b8288da84df6352b157483c6fc30d27c0618a8e3e652494bdef4')

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
